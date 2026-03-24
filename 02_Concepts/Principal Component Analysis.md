---
title: Principal Component Analysis
aliases: [PCA, Principal Components]
tags:
  - concept
  - dimensionality-reduction
  - statistics
  - single-cell
date_created: 2026-03-25
status: draft
---

# Principal Component Analysis (PCA)

## Overview

**Principal Component Analysis (PCA)** is a classical, unsupervised dimensionality reduction technique that identifies the directions of maximum variance in high-dimensional data. For single-cell genomics, PCA reduces gene expression matrices from thousands of dimensions (genes) to a small number of principal components (typically 10-50), capturing the biological signal while removing noise.

## Key Concepts

### Core Idea
1. Center the data (subtract mean)
2. Compute covariance matrix
3. Find eigenvectors (principal components) ranked by eigenvalues
4. Project data onto top K eigenvectors
5. Result: Lower-dimensional representation preserving variance

### Why PCA for Single-Cell Data?

✅ **Fast & Scalable**: O(n·p·k) complexity, works with millions of cells
✅ **Interpretable**: Each PC is a linear combination of genes
✅ **Noise Reduction**: Later PCs capture noise; early PCs capture signal
✅ **Preserves Structure**: Linear projections preserve relative distances well
✅ **Baseline**: Serves as gold-standard comparison for modern methods

## Applications in Single-Cell Biology

### 1. Quality Control & Batch Correction
- Detect batch effects (PCA plots colored by batch)
- Identify technical artifacts
- Evaluate batch correction methods

### 2. Clustering & Cell Type Identification
- Use PCA + K-means or graph clustering
- Still widely used baseline for cell type annotation
- Fast enough for exploratory analysis

### 3. Trajectory Inference
- PCA embeddings preserve local cell neighborhoods
- Better than some deep learning methods for trajectory continuity
- Computationally efficient for large datasets

### 4. Downstream Analysis
- Input for UMAP/t-SNE (often uses PCA space first)
- Input for trajectory inference tools
- Feature selection (genes with high loadings)

## Advantages

✅ **Speed**: Extremely fast compared to deep learning
✅ **Deterministic**: Same result every time (no randomness)
✅ **Interpretable**: Clear connection between genes and components
✅ **Robust**: Works well across diverse datasets
✅ **No hyperparameters**: Just choose number of components
✅ **Linear**: Simple model, easy to understand

## Limitations

⚠️ **Linear Only**: Cannot capture non-linear relationships
⚠️ **Global Structure**: May miss local manifold structure
⚠️ **Variance ≠ Biology**: High-variance genes may not be biologically important
⚠️ **Noise Sensitivity**: Affected by sequencing depth variation

## Comparison with Modern Methods

| Method | Speed | Interpretability | Non-linearity | Recent Finds |
|--------|-------|------------------|---------------|--------------|
| **PCA** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ❌ | Underrated |
| UMAP | ⭐⭐⭐⭐ | ⭐⭐ | ✅ | Visualization |
| t-SNE | ⭐⭐⭐ | ⭐⭐ | ✅ | Visualization |
| scGPT | ⭐⭐ | ⭐⭐ | ✅ | Foundation model |
| Geneformer | ⭐⭐ | ⭐⭐ | ✅ | Foundation model |

## Implementation Notes

### Standard Workflow

```python
import scanpy as sc
import numpy as np

# Load data
adata = sc.read_h5ad('data.h5ad')

# QC & normalization
sc.pp.normalize_total(adata, target_sum=1e4)
sc.pp.log1p(adata)

# Feature selection
sc.pp.highly_variable_genes(adata, n_top_genes=2000)

# PCA
sc.tl.pca(adata, n_comps=50)

# Downstream
sc.pp.neighbors(adata, n_pcs=50)
sc.tl.umap(adata)
```

### Key Parameters
- **n_comps**: Number of components (typically 10-100)
  - Too few: lose signal
  - Too many: include noise, slow downstream steps
- **zero_center**: Center data before PCA (usually True)
- **use_highly_variable**: Use only HVGs (often improves speed)

## Recent Insights

Recent benchmarking studies (e.g., [[bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models|comprehensive scFM benchmarks]]) have revealed:

- PCA remains competitive in **zero-shot** embedding quality
- PCA better preserves **trajectory continuity** than transformers
- PCA stronger in **batch correction** evaluation than foundation models
- Simple PCA + classical baselines often match or exceed foundation models for basic tasks

This suggests PCA should not be dismissed despite new foundation models.

## Related Concepts
- [[02_Concepts/Dimensionality Reduction|Dimensionality Reduction]] - Broader category
- [[02_Concepts/Single-Cell Embeddings|Cell Embeddings]] - General embedding approaches
- [[02_Concepts/Trajectory Inference|Trajectory Inference]] - Where PCA excels

## Tools & Implementation
- **Scanpy**: `sc.tl.pca()`
- **scikit-learn**: `sklearn.decomposition.PCA`
- **R**: `stats::prcomp()` or `irlba::prcomp_irlba()`

## See Also
- UMAP: Non-linear dimensionality reduction for visualization
- Diffusion Maps: Spectral method for manifold learning
- Feature Selection: Related concept (HVGs, gene selection)

---

**Last Updated**: 2026-03-25
