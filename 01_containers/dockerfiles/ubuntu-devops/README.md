# Ubuntu DevOps Base Image

This Dockerfile builds a minimal **Ubuntu 24.04** base image extended with essential **DevOps tools**, ready to be used in **Jenkins pipelines** or other CI/CD workflows.

## Purpose

- Provide a reproducible, lightweight environment for CI/CD pipelines.
- Include key DevOps tooling:
  - **kubectl** – Kubernetes CLI
  - **Helm** – Kubernetes package manager
  - **Syft** – SBOM generation for container images
- Designed to be reusable across multiple pipelines or projects.

> ⚠️ Optional tools such as AWS CLI can be added later if needed. Current focus is on Helm, kubectl, and SBOM generation.

## Build & Push

```bash
docker build -t your-dockerhub-username/ubuntu-devops:24.04 .
docker push your-dockerhub-username/ubuntu-devops:24.04
```
---

## Usage Example
Run a container interactively:
```bash
docker run --rm -it your-dockerhub-username/ubuntu-devops:24.04 bash
```

Generate an SBOM for an image using Syft:
```bash
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
  your-dockerhub-username/ubuntu-devops:24.04 \
  syft <image-name>
```
