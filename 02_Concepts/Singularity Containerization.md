---
title: Singularity Containerization
aliases: [Singularity, HPC containers, Apptainer]
tags:
  - tool
  - infrastructure
  - HPC
  - reproducibility
date_created: 2026-03-25
status: draft
---

# Singularity Containerization

## Overview

**Apptainer** and **SingularityCE** are related, separately maintained HPC container projects descended from Singularity. Ordinary execution commonly uses the invoking user’s permissions. Build/setup requirements depend on the site and user-namespace configuration; Docker also supports rootless operation.

## Why Singularity for HPC?

### Problem with Docker on HPC
- A rootful Docker daemon may conflict with a shared cluster’s security policy; rootless installations are also possible
- Can run arbitrary host code → Security risk on multi-user systems
- Scheduler integration, filesystems and site policy affect deployment; Docker is not inherently computationally heavyweight

### Singularity Solution
✅ **No Root Required**: Run with user permissions
✅ **Permission model**: Normally retains user permissions; it is not an absolute security boundary
✅ **Lightweight**: Direct kernel access, minimal overhead
✅ **Docker Compatible**: Reads Docker images natively
✅ **HPC Integration**: Works with job schedulers (SLURM, PBS)

## Container Formats

### SIF (Singularity Image Format)
- Single, immutable image file
- Portable across systems
- Convenient to distribute as one file; relative I/O speed depends on filesystem, image and workload

### From Docker
```bash
# Convert Docker image to Singularity
singularity pull python310.sif docker://python:3.10
# Illustrative base image, not a packaged scGPT environment
# Creates: scgpt_latest.sif
```

## Singularity Recipe

Create `Singularity.def` file:
```singularity
Bootstrap: docker
From: python:3.10

%post
    apt-get update
    apt-get install -y git
    pip install scanpy anndata

%runscript
    exec python "$@"

%labels
    Author myself
    Version v1.0
```

Build:
```bash
singularity build myimage.sif Singularity.def
```

## Single-Cell Workflow Example

### Traditional HPC Workflow
```bash
# 1. SSH into cluster
# 2. Wait for module loads to complete
module load python/3.10
module load scanpy  # Might not be available!
# 3. Fix dependency conflicts (painful)
# 4. Run analysis (finally!)
```

### With Singularity
```bash
# Build once
singularity build scanalysis.sif Singularity.def

# Run on cluster
singularity exec scanalysis.sif python analysis.py

# Requires a compatible host and runtime configuration
```

## Using on HPC Clusters

### SLURM Job Submission
```bash
#!/bin/bash
#SBATCH --job-name=analysis
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

singularity exec scanalysis.sif \
    python analysis.py \
    --input data.h5ad \
    --output results/
```

### Scaling to Multiple Jobs
```bash
for sample in sample1 sample2 sample3; do
    sbatch -J "$sample" --wrap="singularity exec scanalysis.sif python analysis.py --input ${sample}.h5ad"
done
# 3 parallel containers, no conflicts!
```

## Docker to Singularity Migration

### Option 1: Pull from Docker Hub
```bash
singularity pull docker://ubuntu:22.04

# For GPU workloads, choose an existing CUDA image tag compatible with the host driver.
singularity pull python310.sif docker://python:3.10
# Illustrative base image, not a packaged scGPT environment
```

### Option 2: Build from Dockerfile
```bash
# Docker Dockerfile → Singularity
# (concept is similar; syntax differs)
```

## Applications in AIVC

### 1. Foundation Model Inference
Each model in Singularity container:
- scGPT container
- Geneformer container
- Cell2Sentence container
- Run all with same command structure

### 2. Distributed Benchmarking
[[bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models|Benchmarking paper]] uses:
- Launch independent model/dataset jobs; the exact job count depends on the experimental configuration
- Each model in Singularity container
- Run on HPC cluster in parallel
- Record image digest, workflow version and host dependencies

### 3. Multi-GPU Analysis
```bash
singularity exec --nv scgpt.sif \
    python inference.py \
    --gpu 0 1 2 3  # Use 4 GPUs
```

### 4. Cloud-to-HPC Portability
- Develop locally with Docker
- Convert to Singularity
- Run on HPC cluster unchanged
- Verify results; hardware and numerical kernels can change them

## Advantages

✅ **No Root**: User-friendly on shared systems
✅ **Portable**: Same across Linux/Mac/Windows (with WSL)
✅ **Compatible**: Reads Docker images directly
✅ **Lightweight**: Minimal overhead vs bare metal
✅ **Secure**: Can't break system permissions
✅ **HPC Integration**: Native job scheduler support

## Limitations

⚠️ **Learning Curve**: Different from Docker commands
⚠️ **Mac/Windows**: Requires Linux VM or WSL
⚠️ **Community**: Smaller than Docker (growing)
⚠️ **Documentation**: Less extensive than Docker

## Comparison: Docker vs Singularity

| Feature | Docker | Singularity |
|---------|--------|------------|
| Root privileges | Rootful or rootless configuration | User execution; setup/build requirements vary |
| Local development | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ |
| HPC clusters | ⭐ | ⭐⭐⭐⭐⭐ |
| Cloud platforms | ⭐⭐⭐⭐⭐ | ⭐⭐ |
| Image size | Contents/layers dependent | Contents/compression dependent |
| Performance | Slight overhead | Minimal |
| Learning curve | Easy | Medium |

## Best Practices

### 1. Use Docker for Development
```bash
docker build -t myanalysis:v1 .
docker run -v /data:/data myanalysis:v1
# Test locally
```

### 2. Convert to Singularity for HPC
```bash
singularity pull docker://myregistry/myanalysis:v1
# myanalysis_v1.sif ready for cluster
```

### 3. Version Your Containers
```bash
singularity build scgpt_v1.0.sif Singularity.def
singularity build scgpt_v1.1.sif Singularity.def
# Easy to compare versions
```

### 4. Bind Mount Data
```bash
# Don't copy data into container; bind mount
singularity exec \
    -B /data:/data \
    myimage.sif \
    python analysis.py /data/input.h5ad
```

## Related Concepts

- [[02_Concepts/Docker Containerization|Docker]] - Development-focused container
- Nextflow pipelines - Often use Singularity/Docker
- HPC job schedulers - SLURM, PBS, etc.

## Tools & Resources

- **OCI registries**: Pull compatible Docker/OCI images and convert to SIF
- [Apptainer](https://apptainer.org/) and [SingularityCE](https://docs.sylabs.io/guides/latest/user-guide/) have separate releases
- **Conda**: Often used inside containers
- **BioContainers**: Pre-built Singularity images for bioinformatics

## See Also

- Container best practices
- HPC cluster documentation
- Bioinformatics container repositories

## Migration Guide

**Coming from Docker?**
| Docker | Singularity |
|--------|------------|
| `docker build` | `singularity build` |
| `docker run` | `singularity exec` |
| `docker pull` | `singularity pull` |
| Dockerfile | Singularity.def |

---

**Last Updated**: 2026-10-20

## Verification (2026-10-20)

[Apptainer history](https://github.com/apptainer/apptainer#history); [fakeroot prerequisites](https://apptainer.org/docs/user/main/fakeroot.html); [Docker rootless mode](https://docs.docker.com/engine/security/rootless/). The examples retain the singularity command; Apptainer sites normally use apptainer. Placeholder model images are not verified distribution endpoints.
