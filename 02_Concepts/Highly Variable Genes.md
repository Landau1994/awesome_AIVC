---
title: Highly Variable Genes
aliases: [HVGs, Variable genes, Feature selection]
tags:
  - concept
  - preprocessing
  - feature-selection
  - single-cell
date_created: 2026-03-25
status: draft
---

# Highly Variable Genes (HVGs)

## Overview

**Highly Variable Genes (HVGs)** are genes whose expression varies significantly across cells in a population. By selecting only HVGs, researchers reduce dimensionality from ~20,000 genes to 1,000-5,000 genes while aiming to retain useful variation. This is common but not mandatory, and rare-cell markers can be lost.

## Key Concepts

### What Are HVGs?

Genes in a dataset can be categorized by their expression patterns:
- **Housekeeping genes**: Low variance (expressed consistently in all cells)
- **Highly variable genes**: High variance (expressed in some cell types but not others)
- **Lowly expressed genes**: Mostly zeros (noise or rare populations)

HVGs are disproportionately enriched for **cell-type marker genes** and genes involved in **biological differentiation**.

### Why Select HVGs?

✅ **Signal vs Noise**: High-variance genes more likely to reflect biology
✅ **Dimensionality Reduction**: 2,000 genes vs 20,000 reduces computation 10x
✅ **Robustness**: Removes noisy, uninformative genes
✅ **Better Clustering**: HVGs improve cell type separation
✅ **Interpretability**: Inspect selected genes; known markers are not guaranteed to be selected

## Methods for HVG Selection

### 1. Mean-Variance Relationship (Most Common)
**Idea**: For each gene, compute mean and variance across cells, then select outliers above expected variance for their mean.

```
Expected variance ~ f(mean)
HVG = genes with variance >> expected_variance(mean)
```

**Tools**: Seurat, Scanpy (default), Scran

### 2. Count-model statistics
Deviance or Pearson residuals can rank genes under a specified count model. This is distinct from `scran::modelGeneVar()`, which decomposes variance of log-expression around a mean–variance trend.

### 3. Coefficient of Variation (CV)
**Simple approach**: Select genes with high CV = std/mean.

**Limitation**: Biased toward lowly expressed genes

### 4. PCA-based
**Idea**: Use loadings from PCA—genes with high loadings in top PCs are variable.

**Limitation**: Requires PCA first, circular logic

## Standard Workflow

```python
import scanpy as sc

# Load and normalize
adata = sc.read_h5ad('data.h5ad')
sc.pp.normalize_total(adata, target_sum=1e4)
sc.pp.log1p(adata)

# Identify HVGs
sc.pp.highly_variable_genes(adata, n_top_genes=2000)

# Subset to HVGs
adata = adata[:, adata.var['highly_variable']]

# Continue with PCA, clustering, etc.
sc.tl.pca(adata, n_comps=50)
```

## Key Parameters

| Parameter | Effect | Default | Notes |
|-----------|--------|---------|-------|
| `n_top_genes` | Number of HVGs to select | None | 2000 is a common explicit choice, not the API default |
| `flavor` | Selection method | 'seurat' | Standard API supports seurat, cell_ranger, seurat_v3 and seurat_v3_paper; scran is a separate R package |
| `batch_key` | Select HVGs within batches | None | Does not itself correct expression values or integrate batches |
| `min_mean` | Minimum mean expression | - | Filter out lowly expressed |
| `max_mean` | Maximum mean expression | - | Filter out ubiquitous genes |

## Applications in Single-Cell Biology

### 1. Cell Type Annotation
- HVGs include marker genes for cell types
- Enables robust clustering and assignment

### 2. Trajectory Inference
- Variable genes along trajectory
- Capture differentiation-related genes

### 3. Batch Correction
- Can select HVGs *per-batch* before correction
- Ensures biological signal prioritized

### 4. Integration
- Multi-dataset integration starts with HVG selection
- Reduces dataset-specific noise

## Critical Insights

### HVGs Are Biology-Driven
Research shows HVGs are enriched for:
- **Transcription factors**: Gene regulation
- **Signaling molecules**: Cell-cell communication
- **Metabolic enzymes**: Functional diversity

### HVGs Vary by Condition
- Different cell types have different HVGs
- HVGs in immune cells ≠ HVGs in neurons
- Solution: Condition-aware HVG selection

### Over-selection is Risky
- More genes increase computation but can recover additional signal.
- Choose the feature count using the task and dataset; 2,000 is not a universal optimum.

## Advantages

✅ **Fast**: Single-pass computation
✅ **Biological**: Enriched for real markers
✅ **Robust**: Works across datasets
✅ **Interpretable**: Can examine which genes selected

## Limitations

⚠️ **Batch Effects**: HVGs may reflect batch, not biology
⚠️ **Condition-Dependent**: Different in different contexts
⚠️ **Rare Cells**: May miss rare cell type markers
⚠️ **Discrete Data**: Less reliable with very sparse data

## Relationship to Modern Approaches

HVG selection chooses input features. Foundation models and scVI/scArches learn or transfer representations and may themselves use selected genes. These are not interchangeable methods with a meaningful universal speed/quality ranking.

## Related Concepts

- [[02_Concepts/Single-Cell Embeddings|Single-Cell Embeddings]] - Uses HVGs as input
- [[02_Concepts/Principal Component Analysis|PCA]] - Often applied to HVGs
- Feature Selection - Broader statistical concept

## Tools

- **Scanpy**: `sc.pp.highly_variable_genes()`
- **Seurat**: `FindVariableFeatures()`
- **Bioconductor**: `scran::modelGeneVar()`

---

**Last Updated**: 2026-10-20

## Verification (2026-10-20)

[Scanpy HVG documentation](https://scanpy.readthedocs.io/en/stable/generated/scanpy.pp.highly_variable_genes.html). Input requirements differ: dispersion flavors expect log-normalized expression, whereas Seurat v3 flavors expect counts. Former speed/quality star ratings are qualitative and should not be treated as benchmark results.
