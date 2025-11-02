#!/bin/bash -
#
# DevOps Solution with Bash
# Scriptname: gather_last_packages.sh
# Author: Angel F. Ortiz Suárez - cb0n3y
# Description: The script expects jfrog-cli version2 to be installed 
#              on your system before it can be executed correctly. 
#              After jfrog-cli has been installed and configured, you 
#              can run the script. This script accepts 5 arguments:
#              -R: repository name
#              -s: sub-path. Please ignore the last /. e.g: gsb10-frontend/arb/test
#              -n: the number of packages we want to retain
#              -v: only view of N packages
#              -vd: view and delete all packages that are not equal to N packages


API_PATH='/api/storage'
REPO_NAME=""
REPO_SUBPATH=""
PACKAGES_TO_HOLD=3
DELETE_PACKAGES=false
VIEW_PACKAGES=true

while getopts ":R:s:n:dv" arg; do
    case $arg in
        R) REPO_NAME="$OPTARG";;
        s) REPO_SUBPATH="$OPTARG";;
        n) PACKAGES_TO_HOLD="$OPTARG";;
        d) DELETE_PACKAGES=true;;
        v) VIEW_PACKAGES=true;;
        \?) echo "Invalid option: -$OPTARG" >&2; exit 1;;
        :) echo "Option -$OPTARG requires an argument." >&2; exit 1;;
    esac
done

if [ -z "$REPO_NAME" ] || [ -z "$REPO_SUBPATH" ]; then
    echo "Repository name and subpath are required."
    exit 1
fi


# Declare two arrays for all items and for the 
# n packages to be kept.
package_names=()
n_package_names=()

# Get all package names withing a repository
for item in $(jf rt curl -s -XGET "$API_PATH/$REPO_NAME/$REPO_SUBPATH" | grep uri | tr -s " " | cut -d ":" -f 2 | grep -v https | tr -d '"' | tr -d '/?,'); do
    package_names+=("$item")
done

# Sort by creation date and save the last -n packages
while IFS= read -r item; do
    n_package_names+=("$item")
done < <(
    for item in "${package_names[@]}"; do
        response=$(jf rt curl -s -XGET "$API_PATH/$REPO_NAME/$REPO_SUBPATH/$item")
        created_date=$(echo "$response" | jq -r '.created')
        echo "$created_date $item"
    done | sort -r | head -n "$PACKAGES_TO_HOLD"
)

# Display the saved -n packages
if [ "$VIEW_PACKAGES" = true ]; then
    echo "Last $PACKAGES_TO_HOLD packages to keep:"
    for item in "${n_package_names[@]}"; do
        echo "$item"
    done
fi

# Delete packages if -d option is used
if [ "$DELETE_PACKAGES" = true ]; then
    echo "Deleting packages:"
    for item in "${package_names[@]}"; do
        if ! [[ " ${n_package_names[@]} " =~ " $item " ]]; then
            echo "Deleting $item"
            # Uncomment the following line to actually delete the packages
            jf rt del --quiet "$REPO_NAME/$REPO_SUBPATH/$item" >/dev/null 2>&1
        fi
    done
fi