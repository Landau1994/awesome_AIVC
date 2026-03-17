---
title: "scVI: Single-cell Variational Inference"
aliases:
  - scVI
  - single-cell Variational Inference
authors:
  - Romain Lopez
  - Jeffrey Regier
  - Michael B. Cole
  - Michael I. Jordan
  - Nir Yosef
year: 2018
journal: Nature Methods
doi: 10.1038/s41592-018-0229-2
tags:
  - paper
  - AIVC
  - scRNA-seq
  - VAE
  - single-cell
status: unread
rating:
date_added: 2026-03-17
date_read:
---

# scVI: Single-cell Variational Inference

## Quick Summary
> **scVI** is a foundational deep generative model for single-cell RNA-seq analysis. It uses a VAE with a negative binomial likelihood to model gene expression, handling batch effects, dropout, and library size variation. Widely used as a baseline and building block for downstream tools (scANVI, totalVI, CellAssign, etc.).

## Key Points
- Negative binomial observation model accounts for overdispersion in count data
- Latent space captures biological variation while removing technical noise
- Scalable to millions of cells
- Serves as the standard VAE baseline in single-cell benchmarks

## Related Papers
- [[CPA]] — builds on scVI's latent space for perturbation modeling
- [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]] — uses scVI as baseline
