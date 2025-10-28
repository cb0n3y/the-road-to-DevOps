# Learning Roadmap 🧭

This document outlines my personal **DevOps learning journey** — the sequence of technologies, tools, and concepts I'm mastering as I transition from a **System Administrator** to a **DevOps/Cloud Engineer**.

Each section lists key topics, learning goals, and certifications I aim to achieve, along with progress indicators.

> **Legend:**  
> ✅ Completed 🔄 In Progress ⏳ Planned 🚀 Starting 🧠 Learning


---

## 🏗️ Phase 0 — Foundation (Linux, Scripting, Networking)

**Goal:** Strengthen the core IT fundamentals that power all DevOps work.

**Topics:**
- [x] Linux internals, permissions, and process management  
- [x] Bash scripting for automation  
- [x] Python basics for scripting and DevOps tasks  
- [x] Git fundamentals (branches, merges, pull requests)  
- [x] Networking essentials (TCP/IP, DNS, HTTP, routing, firewalls)

**Resources:**

- Udemy:
    - *Linux Shell Scripting*
    - *Python Mega Course*
    - *Master Python by Coding*
    - *Automate Everything with Python*
    - *Master Python Programming in 2025*
    - *The Git & Github Bootcamp*
    - *Computer-Netzwerke (CompTIA Network+)*
    - *Python and Flask Bootcamp*
    - *Python Network Programming*

**Progress:** ✅ Completed (solid foundation as System Administrator)

---

## 🐳 Phase 1 — Containers & Docker

**Goal:** Learn to build, run, and manage applications in containers.

**Topics:**
- [ ] Docker basics: images, containers, volumes, networks  
- [ ] Writing custom Dockerfiles  
- [ ] Multi-stage builds  
- [ ] Docker Compose  
- [ ] Image management and tagging  
- [ ] Security best practices

**Resources:**

- Udemy: 
    - *Docker Mastery*  
    - *Docker for the Absolute Beginner*
- Play-with-Docker Labs  

**Progress:** 🔄 Ongoing

---

## ☸️ Phase 2 — Kubernetes & Helm

**Goal:** Orchestrate containerized applications in clusters.

**Topics:**
- [ ] Kubernetes architecture (nodes, API server, scheduler, etcd)  
- [ ] Deployments, Services, Ingress, and ConfigMaps  
- [ ] RBAC, Secrets, Namespaces  
- [ ] Helm basics and templating  
- [ ] Managing environments (VAL, PERF, PROD)  
- [ ] Troubleshooting pods and controllers

**Resources:**

- Udemy:
    - *Certified Kubernetes Administrator (CKA)*
    - *Helm Kubernetes Packaging Manager*
    - *Helm Masterclass*

**Certifications:**  
- [ ] CKA — Certified Kubernetes Administrator  
- [ ] CKS — Certified Kubernetes Security Specialist  

**Progress:** 🔄 In Progress

---

## 🧱 Phase 3 — Infrastructure as Code (IaC)

**Goal:** Automate provisioning and configuration of infrastructure.

**Topics:**
- [ ] Terraform fundamentals: providers, state, modules  
- [ ] Variables, outputs, and workspaces  
- [ ] Infrastructure lifecycle (plan, apply, destroy)  
- [ ] Ansible basics for configuration management  
- [ ] Managing infrastructure across environments  

**Resources:**

- Udemy: 
    - *Dive Into Ansible*
    - *Ansible Advanced*
    - *Terraform for the Absolute Beginners with Labs*
    - *HashiCorp Certified*

**Certifications:**  
- [ ] Terraform Associate  
- [ ] Red Hat Certified Engineer (revalidation later)

**Progress:** ⏳ Planned (coming after Kubernetes)

---

## 🔄 Phase 4 — CI/CD & GitOps

**Goal:** Automate build, test, and deployment workflows using pipelines and GitOps.

**Topics:**
- [x] Jenkins installation and Pipeline-as-Code (Declarative & Scripted)(../04_gitops/jenkins/00_installation/01_installation-server.md)
- [ ] GitHub Actions  
- [ ] ArgoCD & FluxCD setup for continuous delivery  
- [ ] Webhooks and triggers  
- [ ] Branch strategies and versioning (VAL → PERF → PROD)  
- [x] Artifact management (Docker Hub, Harbor, etc.)

**Resources:**
- Udemy:
    - *Jenkins from Zero to Hero*
    - *Jenkins*
    - *Argo CD Essential Guide*
    - *GitLab CI/CD*
    - *DevOps, CI/CD(Continuous Integration/Delivery)*
    - *GitLab*
- Official ArgoCD & FluxCD docs  

**Progress:** 🧠 Currently Learning (Jenkins focus)

---

## 📈 Phase 5 — Monitoring & Observability

**Goal:** Build visibility and reliability into systems.

**Topics:**
- [x] Prometheus metrics and exporters  
- [x] Grafana dashboards  
- [x] Alertmanager configuration  
- [ ] Log aggregation (Loki, ELK, etc.)  
- [ ] SLOs, SLIs, and SLA design  
- [ ] Incident response automation  

**Progress Summary:** 🔄  `3 / 6` ✅

**Resources:**

- Udemy:
    - *Prometheus*
    - *Grafana*
    - *Elasticsearch 9 and the Elastic Stack*

---

## 🔐 Phase 6 — Security & Hardening

**Goal:** Implement security best practices across the stack.

**Topics:**
- [ ] Kubernetes security (RBAC, NetworkPolicies, PodSecurity)  
- [ ] Secrets management (Vault, K8s secrets, SOPS)  
- [ ] Docker image scanning  
- [ ] Supply chain security (signing, provenance)  
- [ ] Secure CI/CD pipelines  

**Certifications:**  
- [ ] CKS — Certified Kubernetes Security Specialist  

**Progress:** ⏳ Planned after CKA

---

## ☁️ Phase 7 — Cloud Platforms (Azure Focus)

**Goal:** Apply DevOps principles to real cloud infrastructure.

**Topics:**
- [ ] Azure Resource Manager (ARM), Resource Groups, and Networking  
- [ ] AKS (Azure Kubernetes Service)  
- [ ] Azure Monitor & Log Analytics  
- [ ] Azure AD (Entra ID) integration  
- [ ] Terraform on Azure

**Resources:**

- Udemy:
    - *AZ-104 Microsoft Azure Administrator Exam Prep*

**Certifications:**  
- [ ] AZ-104: Microsoft Azure Administrator  
- [ ] AZ-400: Azure DevOps Engineer Expert  

**Progress:** 🚀 Early stages (Entra ID administration started)

---

## 🧩 Phase 8 — Automation & Beyond

**Goal:** Combine all skills into full-stack DevOps solutions.

**Projects:**
- [ ] Multi-environment setup (VAL / PERF / PROD)
- [ ] Automated deployment pipelines (Jenkins + GitOps)
- [ ] End-to-end observability setup  
- [ ] Security hardening and RBAC policies  
- [ ] Terraform + Ansible hybrid IaC setup  

**Long-term goal:**  
🎯 Become a Senior DevOps Engineer with strong Cloud, Kubernetes, and Security expertise.

---

## 🗺️ Summary of Certifications

| Certification | Status | Priority |
|----------------|---------|-----------|
| [CKA](https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka/) | 🔄 In Progress | High |
| [CKS](https://training.linuxfoundation.org/certification/certified-kubernetes-security-specialist-cks/) | ⏳ Planned | High |
| [Terraform Associate](https://developer.hashicorp.com/certifications/terraform-associate) | ⏳ Planned | Medium |
| [AZ-104](https://learn.microsoft.com/en-us/certifications/azure-administrator/) | 🚀 Starting | High |
| [AZ-400](https://learn.microsoft.com/en-us/certifications/devops-engineer/) | ⏳ Planned | Medium |

---

## Next Steps

- Deep dive into Jenkins shared libraries and advanced Groovy scripting  
- Start Helm templating and CKA lab environments  
- Prepare Terraform Associate certification  
- Build a local CI/CD lab connecting Jenkins → ArgoCD → K8s

---

**Other Resources:**

- Udemy: 
    - *Decoding DevOps – From Basics to Advanced Projects with AI*
    - *The Ultimate DevOps Bootcamp*
    - *Administración de Almacenamiento Glusterfs*
    - *Java Masterclass 2025: 130+ Hours of Expert Lessons*
    - **

---

## 📌 Notes

- This roadmap is **iterative** — it will evolve as I learn new technologies and gain hands-on experience.  
- Each phase links to code examples, labs, and documentation in the main repo wherever possible.  
- Feedback, suggestions, and collaboration are welcome — feel free to open an issue or submit a PR.

---

## 🔗 Useful Links

- [Main Repo](https://github.com/cb0n3y/the-road-to-DevOps)   
- [Udemy Courses List](#resources) 

---

## 📜 License

This roadmap and all associated materials are licensed under the [MIT License](../LICENSE).

---

> _"Consistency beats intensity. Learn every day, even if it’s small."_ 💪
