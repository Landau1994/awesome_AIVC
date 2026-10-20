---
title: Dimensionality Reduction
aliases: [Dimension Reduction, Low-dimensional Representations]
tags:
  - concept
  - AIVC
date_created: 2026-10-20
last_updated: 2026-10-20
status: reviewed
---

# Dimensionality Reduction

## Definition

Dimensionality reduction maps high-dimensional measurements to a smaller representation, $f:\mathbb{R}^G\to\mathbb{R}^d$ with $d<G$. The preserved information depends on the objective; no low-dimensional plot preserves every relationship.

## Common Choices

| Method | Main role | Interpretation limit |
|---|---|---|
| [[Principal Component Analysis\|PCA]] | Linear variance/reconstruction baseline | High variance may be technical |
| UMAP or t-SNE | Neighborhood-oriented visualization | Plot gaps and distances are not calibrated biological distances |
| Diffusion maps | Graph-based representation of continuous structure | Depends on graph and kernel construction |
| [[Variational Autoencoders\|VAE]] | Probabilistic latent modeling | Depends on likelihood and model assumptions |

Feature selection such as [[Highly Variable Genes]] selects measured dimensions; embedding constructs new coordinates. Evaluate the representation in the space actually used by the downstream method, not just by visual cluster separation.

## Related Concepts

- [[Single-Cell Embeddings]]
- [[Trajectory Inference]]
- [[02_Concepts/Batch Correction|Batch Correction]]

## Sources

- [scikit-learn decomposition documentation](https://scikit-learn.org/stable/modules/decomposition.html)
- [UMAP original paper](https://arxiv.org/abs/1802.03426)
- [t-SNE original paper](https://jmlr.org/papers/v9/vandermaaten08a.html)
