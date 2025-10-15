# The Road to DevOps

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![GitHub Repo Size](https://img.shields.io/github/repo-size/cb0n3y/the-road-to-DevOps)
![Last Commit](https://img.shields.io/github/last-commit/cb0n3y/the-road-to-DevOps)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/cb0n3y/the-road-to-DevOps/ci.yml?label=CI%2FCD)
<!--
![DevOps Journey](https://img.shields.io/badge/devops-journey-blueviolet)
![Goal: CKA](https://img.shields.io/badge/goal-cka-orange)
![Goal: AZ-104](https://img.shields.io/badge/goal-az104-blue)
-->


Welcome to the **Ops to DevOps** repository! This project documents my journey transitioning from a System Administrator to a DevOps Engineer, showcasing the skills, tools, and projects I've developed along the way.

---

## 🧩 Current Focus

- Deepening Kubernetes & Helm deployment workflows  
- Building Jenkins pipelines (CI/CD) and GitOps automation  
- Expanding monitoring with Prometheus & Grafana  
- Introducing Terraform and Ansible for IaC  
- Preparing for CKA, CKS, and Azure certifications  

---

## 🏁 Long-Term Goals

- Build a clean, reproducible DevOps lab environment  
- Prepare for certifications (CKA, AZ-104)  
- Showcase end-to-end CI/CD, monitoring, and IaC solutions  
- Follow open-source and GitHub community standards

---

## 📌 Topics Covered

- 🧱 Infrastructure as Code (Vagrant → Ansible → Terraform)  
- 🔍 Monitoring & Observability (Prometheus, Grafana)  
- ⚙️ Automation & Configuration  
- 🚀 CI/CD Pipelines (GitHub Actions, Jenkins)  
- 📦 Containerization & Kubernetes  
- 🔐 Security, Documentation, and Collaboration

> ⚠️ This repo is a living lab — expect work-in-progress, breaking changes, and ongoing refinements as learning evolves.

---

## 📑 Table of Contents

- [Repository Structure](#repository-structure)
- [Deployment Strategy](#deployment-strategy)
- [Getting Started](#getting-started)
- [Learning Roadmap](#learning roadmap)
- [Contributing](#contributing)
- [License](#license)

---

## Repository Structure

The repository is organized into two main sections:

This repository is organized into modular learning stages that reflect the DevOps journey — from foundational skills to advanced GitOps and monitoring setups.

| Directory | Description |
|------------|--------------|
| `00_foundation/` | Linux, Bash, Python, Git, and networking fundamentals. |
| `01_containers/` | Docker basics, images, and Compose examples. |
| `02_kubernetes/` | Core Kubernetes resources, Helm charts, and troubleshooting. |
| `03_infrastructure-as-code/` | Terraform modules and examples for AWS/Azure. |
| `04_gitops/` | GitOps workflows using ArgoCD, FluxCD, and Jenkins pipelines. |
| `05_monitoring-observability/` | Prometheus, Grafana, dashboards, and alerting setups. |
| `06_security/` | RBAC, network policies, secrets management, and CKS prep notes. |
| `07_environments/` | Configs for VAL, PERF, and PROD-like environments. |
| `docs/` | Study plans, learning roadmaps, and certification notes. |

---

## Deployment Strategy

Deployments are managed using Git tags:

- **`vX.Y.Z`**: Deploys to production.
- **`vX.Y.Z-beta`**: Deploys to staging.

Automated pipelines ensure smooth and consistent deployments across environments.

---

## 🧭 Learning Roadmap

You can follow my ongoing progress and study plan in  
[`docs/learning-roadmap.md`](docs/learning-roadmap.md)

---

## Getting Started

To explore this repository:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/cb0n3y/ops-to-devops.git
   cd ops-to-devops

2. **Navigate through the directories** to explore various tools, configurations, and projects
3. **Refer to individual** README.md files within each folder for detailed instructions and information.

## Contributing
This repository is primarily a personal portfolio, but community contributions and feedback are welcome.
Feel free to open an issue or submit a pull request for improvements or fixes.

## License
This project is licensed under the MIT License.