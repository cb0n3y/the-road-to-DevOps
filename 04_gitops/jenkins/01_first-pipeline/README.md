# 01_first-pipeline — Declarative Jenkins Pipeline Example

## 🎯 Objective
This pipeline installs specific versions of **Helm 3** and **Syft** in parallel, preparing the environment for future SBOM (Software Bill of Materials) generation workflows.

## 🧱 Pipeline Overview
- **Type:** Declarative pipeline
- **Agent:** Any available Jenkins worker
- **Parallel stages:**
  - Install Helm
  - Install Syft
- **Parameters:**
  - `HELM_VERSION` — default `3.18.0`
  - `SYFT_VERSION` — default `1.34.2`
- **Environment:**
  - Tools installed locally under `$HOME/bin`
  - Temporary workspace cleaned after execution

## 🪜 Stages
1. **Preparation**
   - Runs parallel stages:
     - Install Helm from official Helm script.
     - Install Syft from Anchore’s release tarball.
2. **(Future) SBOM Generation**
   - Will later include Syft-based scanning and notification logic.

## 🧹 Post Actions
- `cleanWs()` — cleans up workspace.
- Logs completion message upon success or failure.

## 📈 Learning Points
- Declarative syntax
- Parameterization and environment handling
- Parallel execution
- Clean and reproducible pipeline design

## 🚀 Future Improvements
- Add SBOM generation step with Syft.
- Archive SBOM as an artifact.
- Add email notification once an SBOM is created.
- Integrate into Jenkins Shared Library for reuse.
