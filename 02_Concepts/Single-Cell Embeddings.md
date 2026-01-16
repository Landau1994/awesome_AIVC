---
title: Single-Cell Embeddings
aliases: [Cell Embeddings, scRNA-seq Embeddings]
tags:
  - concept
  - AIVC
  - embeddings
  - representation-learning
  - learning-path
category: Core Concept
importance: high
date_created: 2026-01-16
last_updated: 2026-01-16
---

# Single-Cell Embeddings

## Definition
> Single-cell embeddings are low-dimensional vector representations of individual cells that capture their biological state, enabling downstream tasks like clustering, visualization, and perturbation prediction.

## Key Ideas
- **Dimensionality reduction**: ~20,000 genes → ~64-512 dimensions
- **Preserve biology**: Similar cells → similar embeddings
- **Enable computation**: Efficient distance calculations, clustering
- **Transfer learning**: Pre-trained embeddings generalize across datasets

## Types of Embeddings

### Traditional Methods
| Method | Approach | Use Case |
|--------|----------|----------|
| PCA | Linear projection | Initial reduction |
| UMAP | Manifold learning | Visualization |
| t-SNE | Probability matching | Visualization |
| Diffusion maps | Graph-based | Trajectory |

### Deep Learning Methods
| Method | Architecture | Key Feature |
|--------|--------------|-------------|
| scVI | VAE | Batch correction |
| scGPT | Transformer | Pre-trained |
| Geneformer | Transformer | Rank encoding |
| UCE | Transformer + ESM2 | Cross-species |

## Mathematical Formulation

### Cell Embedding Function
Given cell $c$ with gene expression $\mathbf{x} \in \mathbb{R}^{G}$ (G ≈ 20,000):

$$\mathbf{z} = f_\theta(\mathbf{x}) \in \mathbb{R}^{d}$$

where $d \ll G$ (typically 64-512)

### Desired Properties
1. **Biological similarity**: $sim(c_1, c_2) \propto sim(\mathbf{z}_1, \mathbf{z}_2)$
2. **Batch invariance**: Same cell type → same region regardless of batch
3. **Smoothness**: Gradual state changes → smooth trajectories

## Embedding Quality Metrics

### Biological Conservation
- **Cell type clustering**: ARI, NMI scores
- **Marker gene correlation**: Biology preserved
- **Trajectory coherence**: Developmental paths

### Batch Correction
- **iLISI**: Integration of batches
- **cLISI**: Conservation of cell types
- **kBET**: Batch effect removal

## Applications in AIVC

### Cell Type Annotation
```
Cell → Embedding → kNN classifier → Cell type
```

### Batch Integration
```
Multiple batches → Shared embedding space → Unified analysis
```

### Perturbation Prediction
```
Control cell embedding + δ_perturbation → Predicted embedding
```

### Visualization
```
High-dim embedding → UMAP/t-SNE → 2D plot
```

## Foundation Model Embeddings

### Why Foundation Model Embeddings?
- Pre-trained on millions of cells
- Capture universal cellular patterns
- Transfer to new datasets/conditions
- Zero-shot capabilities

### Comparison
| Source | Training | Quality | Speed |
|--------|----------|---------|-------|
| PCA | Per-dataset | Basic | Fast |
| scVI | Per-dataset | Good | Medium |
| scGPT | 33M cells | Excellent | Slow |
| UCE | 36M cells | Excellent | Medium |

## Code Example

```python
import scanpy as sc
from scgpt import scGPT

# Traditional: PCA + UMAP
adata = sc.read_h5ad("data.h5ad")
sc.pp.pca(adata, n_comps=50)
sc.pp.neighbors(adata)
sc.tl.umap(adata)

# Foundation model: scGPT
model = scGPT.from_pretrained("scgpt_human")
embeddings = model.encode(adata)  # (n_cells, 512)
adata.obsm["X_scgpt"] = embeddings
```

## Related Concepts
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Dimensionality Reduction|Dimensionality Reduction]]
- [[02_Concepts/Batch Correction|Batch Correction]]

## Key Papers
- [[01_Papers/scGPT|scGPT]]
- [[01_Papers/UCE|UCE]]
- [[01_Papers/scVI|scVI]]

## Tools & Implementations
- [Scanpy](https://scanpy.readthedocs.io/) - PCA, neighbors, UMAP
- [scvi-tools](https://scvi-tools.org/) - VAE embeddings
- [scGPT](https://github.com/bowang-lab/scGPT) - Foundation model

## Learning Resources
- [Single Cell Best Practices: Dimensionality Reduction](https://www.sc-best-practices.org/)
- Scanpy tutorials
