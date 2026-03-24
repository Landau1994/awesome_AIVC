---
title: Docker Containerization
aliases: [Docker, Container, Image]
tags:
  - tool
  - infrastructure
  - reproducibility
  - deployment
date_created: 2026-03-25
status: draft
---

# Docker Containerization

## Overview

**Docker** is a containerization platform that packages software, dependencies, and environment into isolated, portable units called **containers**. In bioinformatics and computational biology, Docker ensures reproducible pipelines by eliminating "works on my machine" problems.

## Core Concepts

### Container vs Image

**Image**: Blueprint or template
- Contains OS, libraries, code, data
- Read-only, immutable
- Example: `scgpt:v1.0`

**Container**: Running instance of an image
- Executable version of an image
- Isolated from host system
- Can start/stop/delete freely

### Why Containers for Bioinformatics?

✅ **Reproducibility**: Same environment everywhere (laptop, HPC, cloud)
✅ **Dependency Management**: All libraries bundled, no conflicts
✅ **Version Control**: Pin exact versions of tools
✅ **Portability**: Run on Mac/Linux/Windows identically
✅ **Scalability**: Easy to deploy 1000 containers in parallel

## Key Components

### Dockerfile
Instructions to build an image:
```dockerfile
FROM python:3.10
RUN pip install scanpy anndata
COPY script.py /app/
WORKDIR /app
ENTRYPOINT ["python", "script.py"]
```

### Docker Hub
Central repository for sharing images:
- Pull public images: `docker pull tensorflow/tensorflow:latest`
- Push to share: `docker push myusername/myimage:v1.0`

### Docker Compose
Define multi-container applications:
- Start database + application together
- Network them automatically
- Manage dependencies

## Single-Cell Example Workflow

### Traditional (No Docker)
```
1. Install Python 3.10
2. Install scanpy, pandas, numpy
3. Handle version conflicts
4. Colleague uses Python 3.9 → breaks
5. Spend 2 hours debugging
```

### With Docker
```
1. Write Dockerfile
2. docker build -t scanalysis:v1 .
3. docker run -v /data:/data scanalysis:v1
4. Works identically on colleague's machine
5. Success! ✅
```

## Applications in AIVC Research

### 1. Foundation Model Deployment
- Package scGPT + dependencies
- One command to run inference
- Same environment every time

### 2. Benchmarking Frameworks
- Each model gets own Docker image
- Run multiple models with `docker-compose`
- Fair comparison, no dependency hell
- Example: [[bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models|scFM benchmarking paper]]

### 3. Pipeline Reproducibility
- Single-cell QC pipeline in Docker
- Version all components
- Publish alongside paper
- Others can reproduce exactly

### 4. HPC Integration
- Singularity (see below) reads Docker images
- Run on high-performance computing clusters
- No admin permissions needed

## Advantages

✅ **Reproducibility**: Environment is code
✅ **Speed**: No installation on deployment
✅ **Isolation**: Can't break host system
✅ **Sharing**: Easy to distribute reproducible code
✅ **Versioning**: Tag images with version numbers

## Limitations

⚠️ **Learning Curve**: Requires understanding of containers
⚠️ **Storage**: Images can be large (1-5 GB each)
⚠️ **Performance**: Slight overhead vs native execution
⚠️ **HPC**: Some clusters don't allow Docker (use Singularity instead)

## Comparison with Singularity

| Feature | Docker | Singularity |
|---------|--------|-------------|
| Requires root | ✅ Yes | ❌ No |
| HPC-friendly | ⚠️ Limited | ✅ Yes |
| Image size | Large | Medium |
| Community | Large | Growing |
| Learning curve | Medium | Steeper |

**Use Docker**: Local development, cloud
**Use Singularity**: HPC clusters

## Best Practices

1. **Use specific versions**:
   - ❌ `pip install scanpy`
   - ✅ `pip install scanpy==1.9.3`

2. **Multi-stage builds**: Keep images small
   ```dockerfile
   FROM python:3.10 as builder
   RUN pip install packages
   FROM python:3.10
   COPY --from=builder /packages /packages
   ```

3. **Document environment**:
   ```dockerfile
   # Based on ubuntu:22.04
   # Contains: scanpy 1.9.3, anndata 0.8.0
   # Last updated: 2026-03-25
   ```

4. **Test locally first**:
   ```bash
   docker build -t myimage:v1 .
   docker run myimage:v1 python -c "import scanpy; print(scanpy.__version__)"
   ```

## Related Tools

- **Singularity**: Container format for HPC (Docker-compatible)
- **Podman**: Docker alternative (more secure)
- **Nextflow**: Workflow manager that uses Docker/Singularity
- **GitHub Actions**: CI/CD with Docker containers

## See Also

- [[Singularity Containerization|Singularity]] - HPC-focused alternative
- Nextflow pipelines - Orchestration tool
- Container registries (Docker Hub, Quay.io)

## Resources

- Docker documentation: https://docs.docker.com/
- Bioconda Docker images: BioContainers
- Reproducible research with Docker

---

**Last Updated**: 2026-03-25
