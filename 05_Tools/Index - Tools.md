---
title: Index - Tools
aliases: [Tools Overview, Software]
tags:
  - index
  - MOC
  - tools
date_created: 2026-01-16
---

# AI Virtual Cell Tools Index

## Single-Cell Analysis Frameworks

### Python Ecosystem

| Tool | Purpose | Links |
|------|---------|-------|
| **Scanpy** | Core analysis | [Docs](https://scanpy.readthedocs.io/) |
| **AnnData** | Data structure | [Docs](https://anndata.readthedocs.io/) |
| **scvi-tools** | Deep learning | [Docs](https://scvi-tools.org/) |
| **Squidpy** | Spatial analysis | [Docs](https://squidpy.readthedocs.io/) |
| **Pertpy** | Perturbation analysis | [GitHub](https://github.com/theislab/pertpy) |

### R Ecosystem

| Tool | Purpose |
|------|---------|
| **Seurat** | Comprehensive analysis |
| **SingleCellExperiment** | Data structure |
| **Monocle3** | Trajectory analysis |
| **SCENIC** | GRN inference |

## Foundation Model Libraries

| Library | Models | Framework |
|---------|--------|-----------|
| **scGPT** | scGPT | PyTorch |
| **Geneformer** | Geneformer | HuggingFace |
| **scFoundation** | scFoundation | PyTorch |
| **torchdrug** | Molecular models | PyTorch |
| **ESM** | Protein models | PyTorch |

## Perturbation Tools

| Tool | Task |
|------|------|
| **GEARS** | Perturbation prediction |
| **CPA** | Compositional perturbation |
| **Pertpy** | Perturbation analysis suite |
| **Augur** | Perturbation prioritization |

## Data Access

| Tool | Data Source |
|------|-------------|
| **cellxgene-census** | CELLxGENE |
| **GEOparse** | GEO database |
| **biomart** | Ensembl annotations |

## Visualization

| Tool | Type |
|------|------|
| **Cellxgene** | Interactive explorer |
| **Vitessce** | Multi-modal viewer |
| **TissUUmaps** | Spatial visualization |
| **Matplotlib/Seaborn** | Static plots |

## Machine Learning

| Library | Use Case |
|---------|----------|
| **PyTorch** | Deep learning |
| **PyTorch Geometric** | GNNs |
| **HuggingFace** | Transformers |
| **scikit-learn** | Traditional ML |
| **Lightning** | Training framework |

## Environment Setup

### Recommended Stack
```bash
# Create conda environment
conda create -n aivc python=3.10
conda activate aivc

# Core packages
pip install scanpy anndata scvi-tools
pip install torch torchvision
pip install transformers datasets

# Visualization
pip install matplotlib seaborn plotly

# Jupyter
pip install jupyterlab
```

### GPU Setup
```bash
# Check CUDA
nvidia-smi

# PyTorch with CUDA
pip install torch --extra-index-url https://download.pytorch.org/whl/cu118
```

## Useful Notebooks

### Tutorials
- [Scanpy tutorials](https://scanpy-tutorials.readthedocs.io/)
- [scvi-tools tutorials](https://docs.scvi-tools.org/en/stable/tutorials/index.html)
- [scGPT tutorials](https://github.com/bowang-lab/scGPT/tree/main/tutorials)

### Competitions
- Virtual Cell Challenge notebooks
- Open Problems starter kits

## Cloud Platforms

| Platform | Use Case |
|----------|----------|
| **Google Colab** | Free GPU |
| **Kaggle Notebooks** | Free GPU + datasets |
| **AWS SageMaker** | Scalable training |
| **Terra/AnVIL** | Biomedical cloud |
