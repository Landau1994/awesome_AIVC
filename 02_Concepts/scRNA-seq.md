---
title: scRNA-seq
aliases: [Single-cell RNA sequencing, Single-cell Transcriptomics, Single-cell RNA-seq, scRNAseq]
tags:
  - concept
  - AIVC
  - single-cell
  - genomics
  - transcriptomics
  - technology
category: Core Technology
importance: high
date_created: 2026-03-25
last_updated: 2026-03-25
status: complete
---

# scRNA-seq (Single-Cell RNA Sequencing)

## Overview

**Single-cell RNA sequencing (scRNA-seq)** is a high-throughput genomics technology that profiles the transcriptome (all expressed RNA) of individual cells simultaneously. Unlike bulk RNA-seq, which averages expression across thousands to millions of cells, scRNA-seq preserves cell-to-cell heterogeneity — enabling the discovery of rare cell types, cell states, and developmental trajectories.

## How It Works

### Workflow
```
Tissue/Sample
    ↓ (dissociation)
Single-cell suspension
    ↓ (cell capture)
Individual cells isolated
    ↓ (lysis + RT)
mRNA → cDNA (with cell barcode + UMI)
    ↓ (PCR amplification)
Library preparation
    ↓ (sequencing)
Reads → Count matrix (cells × genes)
```

### Key Components

| Component | Purpose |
|-----------|---------|
| **Cell Barcode** | Unique sequence per cell, identifies origin |
| **UMI (Unique Molecular Identifier)** | Corrects PCR amplification bias |
| **Read alignment** | Map reads to genome/transcriptome |
| **Count matrix** | Final output: cells × genes expression counts |

## Major Platforms

| Platform | Technology | Scale | Depth |
|----------|-----------|-------|-------|
| **10x Genomics Chromium** | Droplet-based | 10k-100k cells | ~2,000 genes/cell |
| **Drop-seq** | Droplet-based | 10k+ cells | ~2,000 genes/cell |
| **Smart-seq2** | Plate-based | 96-384 cells | ~5,000-8,000 genes/cell |
| **sci-RNA-seq3** | Combinatorial indexing | >1M cells | ~1,000-2,000 genes/cell |

- **Droplet-based** (10x): High throughput, lower sensitivity — standard for most studies
- **Plate-based** (Smart-seq): Lower throughput, higher sensitivity, full-length coverage

## Output Data

### Count Matrix
- **Rows**: Cells (barcodes)
- **Columns**: Genes (~20,000-33,000)
- **Values**: UMI counts (integers, sparse)
- **Typical sparsity**: ~90% zeros (dropout)

### Spliced/Unspliced Counts
Some tools (e.g., velocyto, STARsolo) also quantify:
- **Spliced counts**: Mature mRNA reads
- **Unspliced counts**: Pre-mRNA reads (intron-spanning reads)
- Used for [[02_Concepts/RNA Velocity|RNA velocity]] inference

## Preprocessing Pipeline

### Standard Steps
```
Raw reads (FASTQ)
    ↓ STARsolo / CellRanger / Kallisto
Count matrix (h5ad/loom)
    ↓ Quality control (filter dead cells, doublets)
    ↓ Normalization (log1p + scran)
    ↓ Feature selection (Highly Variable Genes)
    ↓ Dimensionality reduction (PCA → UMAP)
    ↓ Clustering (Leiden / Louvain)
Cell type annotation
```

### Quality Control Metrics
- **n_genes_per_cell**: Number of detected genes (filter low-quality cells)
- **total_counts**: Total UMI counts per cell
- **pct_counts_mt**: % mitochondrial reads (high → dying cell)
- **Doublet score**: Two cells captured together

## Key Concepts in scRNA-seq Analysis

### Batch Effects
- Technical variation between samples/experiments
- Removed using Harmony, scVI, BBKNN, scANVI

### Dropout
- Zero counts may be technical (gene not captured) or biological
- Sparsity challenges downstream analysis

### Highly Variable Genes (HVGs)
- Select ~2,000-5,000 genes most informative across cells
- Reduces noise and computation
- See [[02_Concepts/Highly Variable Genes|Highly Variable Genes]]

### Dimensionality Reduction
- PCA → 50 PCs → UMAP/t-SNE for visualization
- See [[02_Concepts/Principal Component Analysis|PCA]]

## Applications

### Cell Type Discovery
```
Unknown tissue → scRNA-seq → Cluster → Annotate → Cell atlas
```
Landmark example: Human Cell Atlas (HCA)

### Developmental Trajectory
- Map differentiation from stem cells to mature cells
- Combined with [[02_Concepts/RNA Velocity|RNA velocity]] or pseudotime methods
- See [[02_Concepts/Trajectory Inference|Trajectory Inference]]

### Disease Studies
- Tumor heterogeneity in cancer
- Immune cell states in infection/autoimmunity
- Neurodegenerative disease cell types

### Drug Response
- Single-cell perturbation profiling ([[02_Concepts/Perturb-seq|Perturb-seq]])
- Understand which cells respond to treatment

## Standard Tools

| Category | Tool | Language |
|----------|------|----------|
| Alignment | CellRanger, STARsolo, Kallisto | - |
| Analysis | Scanpy, Seurat | Python, R |
| Integration | Harmony, scVI | Python |
| Visualization | UMAP, t-SNE | Python, R |
| Velocity | scVelo, velocyto | Python |
| Trajectory | Monocle3, PAGA | R, Python |

```python
import scanpy as sc

# Load data
adata = sc.read_10x_h5("filtered_feature_bc_matrix.h5")

# QC
sc.pp.calculate_qc_metrics(adata, inplace=True)
adata = adata[adata.obs.pct_counts_mt < 20]

# Normalize
sc.pp.normalize_total(adata, target_sum=1e4)
sc.pp.log1p(adata)

# HVGs, PCA, UMAP
sc.pp.highly_variable_genes(adata, n_top_genes=2000)
sc.pp.pca(adata)
sc.pp.neighbors(adata)
sc.tl.umap(adata)
sc.tl.leiden(adata)
```

## Comparison: scRNA-seq vs Bulk RNA-seq

| Feature | scRNA-seq | Bulk RNA-seq |
|---------|-----------|--------------|
| Resolution | Single cell | Population average |
| Throughput | 10k-1M cells | Any |
| Cost | Higher | Lower |
| Sensitivity | ~2,000 genes/cell | Full transcriptome |
| Applications | Heterogeneity, trajectory | Differential expression |

## Recent Extensions

| Technology | Innovation |
|-----------|-----------|
| **Spatial transcriptomics** | Adds tissue location to expression |
| **CITE-seq** | Simultaneous RNA + protein (ADT) |
| [[02_Concepts/Perturb-seq|**Perturb-seq**]] | scRNA-seq + CRISPR perturbations |
| **snRNA-seq** | Nuclear RNA (frozen/hard-to-dissociate tissue) |
| **Multiome** | RNA + ATAC in same cell |

## Datasets Used in RNA Velocity Benchmarking

The [[01_Papers/bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|2025 velocity benchmark]] used 17 scRNA-seq datasets including:
- Pancreatic endocrinogenesis (mouse)
- Dentate gyrus neurogenesis (mouse)
- Erythrocyte maturation
- Human bone marrow (hematopoiesis)

## Related Concepts

- [[02_Concepts/RNA Velocity|RNA Velocity]] — Dynamics from unspliced/spliced ratio
- [[02_Concepts/Trajectory Inference|Trajectory Inference]] — Cell fate from scRNA-seq
- [[02_Concepts/Single-Cell Embeddings|Single-Cell Embeddings]] — Low-dim representations
- [[02_Concepts/Highly Variable Genes|Highly Variable Genes]] — Feature selection
- [[02_Concepts/Principal Component Analysis|PCA]] — Dimensionality reduction
- [[02_Concepts/Splicing_Kinetics|Splicing Kinetics]] — Biological basis for velocity

## Key Papers

- [[01_Papers/scvelo|scVelo]] — Bergen et al. 2020 (dynamical model)
- [[01_Papers/velocyto|velocyto]] — La Manno et al. 2018 (foundational velocity)
- [[01_Papers/veloVI|veloVI]] — Best accuracy in 2025 benchmark

## Learning Resources

- [Scanpy tutorials](https://scanpy-tutorials.readthedocs.io/)
- [Single Cell Best Practices](https://www.sc-best-practices.org/)
- [OSCA book](https://bioconductor.org/books/release/OSCA/) (Bioconductor/R)
- [10x Genomics documentation](https://support.10xgenomics.com/)
