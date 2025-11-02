# Artifactory and Xray

## Description
This folder contains scripts and resources to manage **Artifactory** repositories and perform security scanning with **Xray** using **Bash** and **JFrog CLI**. These tools automate tasks such as package retention, deletion, retrieval, and security validation. The scripts can be integrated into CI/CD pipelines for efficient DevOps workflows.

---

## Contents

- **Artifactory Scripts:** Manage repository packages, retention policies, and cleanup tasks using **AQL (Artifactory Query Language)** and **JFrog CLI**. JSON configuration files in the `files/` folder define repository parameters and package management rules.  
- **Xray Scripts:** Automate security scans, vulnerability checks, and policy enforcement for repository packages.  
- **Bash + JFrog CLI:** Scripts provide command-line options for flexible operations and can be integrated into GitLab or other CI/CD pipelines.

---

## Dependencies

- [JFrog CLI v2](https://www.jfrog.com/getcli/) must be installed and configured  
- `jq` for parsing JSON responses  
- Bash 4+ (for associative arrays and process substitution)  
- Python 3 (for future Xray scripts)

---

## Script Overview

### Initialization
Variables initialized at script start:

- `API_PATH` – API path for managing packages or Xray queries  
- `REPO_NAME` – Repository name (required)  
- `REPO_SUBPATH` – Subpath within repository  
- `PACKAGES_TO_HOLD` – Number of packages to retain (default: 3)  
- `DELETE_PACKAGES` – Flag to delete packages (default: false)  
- `VIEW_PACKAGES` – Flag to list packages (default: true)  

### Command-Line Options
Scripts use `getopts` to allow flexible usage:

- `-R` – Repository name  
- `-s` – Repository subpath  
- `-n` – Number of packages to retain  
- `-d` – Enable package deletion  
- `-v` – Enable package viewing  

### Validation
- `REPO_NAME` is mandatory; missing it will exit the script with an error.

### Package Retrieval and Sorting
- `jf rt curl` fetches a list of package URIs from the specified repository.  
- Packages are sorted by creation date (descending), retaining the last `PACKAGES_TO_HOLD` packages.

### Viewing Packages
- Default behavior (`-v`) lists the retained packages.

### Deleting Packages
- If enabled (`-d`), the script deletes packages not in the retained list and shows which packages are removed.  
- Deletion lines can be commented/uncommented to control actual removal.

### Xray Integration
- Scripts can trigger **Xray scans** to detect vulnerabilities in packages.  
- Policies can be enforced automatically via scripts or pipelines to ensure only compliant packages are retained or promoted.

---

## Integration
- Scripts can be scheduled or triggered via **CI/CD pipelines** (GitLab, Jenkins, etc.) for automated package management and security validation.  
- JSON configuration files allow dynamic management per repository.

---

## Support
For questions, issues, or assistance, please open an issue in this repository.

---

## Contributing
Suggestions and contributions are welcome. Please open a pull request or issue to propose changes.

---

## Authors and Acknowledgments
**Author:** [cb0n3y](https://github.com/cb0n3y)  
**Contributors:** Your valuable contributions go here.

---

## License
This project is licensed under **Apache License 2.0**. See [LICENSE](LICENSE) for details.
