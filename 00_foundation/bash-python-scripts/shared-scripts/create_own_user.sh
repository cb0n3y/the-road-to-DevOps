#!/bin/bash

set -e

# Use passed-in env vars or default
USER_NAME="${USER_NAME:-}"
COMMENT="${COMMENT:-}"


if [[ -z "$USER_NAME" ]]; then
  echo "ERROR: USER_NAME is not set. Exiting."
  exit 1
fi

create_user() {
    echo -e "\n[+] Creating required user..."

    if id "$USER_NAME" &>/dev/null; then
        echo "User $USER_NAME already exists, skipping creation."
    else
        useradd -m -c "$COMMENT" -s /bin/bash "$USER_NAME"
        usermod -a -G wheel "$USER_NAME"
    fi

    # Ensure USER_PASSWORD env variable is set before running script
    if [ -z "$USER_PASSWORD" ]; then
        echo "ERROR: USER_PASSWORD is not set. Exiting."
        exit 1
    fi

    echo "$USER_NAME:$USER_PASSWORD" | chpasswd
    echo -e "\n[+] Done."
}

create_user