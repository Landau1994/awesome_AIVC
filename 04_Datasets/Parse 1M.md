---
title: Parse 1M
aliases:
  - Parse Biosciences 1M
tags:
  - dataset
  - AIVC
  - scRNA-seq
  - perturbation
date_created: 2026-03-17
last_updated: 2026-03-17
---

# Parse 1M

## Overview
> In the linked scLDM paper, “Parse1M” denotes a curated single-donor subset of Parse’s 10-million-cell cytokine PBMC dataset. It is distinct from Parse’s separate 1-million-cell healthy/type-1-diabetes PBMC release.

## Usage
- Perturbational benchmark in [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]]
- Tests conditional generation with cytokine treatments

## Sources and version scope

- [scLDM Appendix G](https://arxiv.org/html/2511.02986v1#A7): 18 cell types, 90 cytokines plus control; the experiment retains 2,000 highly variable genes.
- [Original 10M cytokine data](https://www.parsebiosciences.com/datasets/10-million-human-pbmcs-in-a-single-experiment/): 12 donors in the full source dataset.
- [Separate 1M healthy/diabetes data tutorial](https://resources.parsebiosciences.com/support-suite/hc/en-us/articles/7704577188500-how-to-analyze-a-1-million-cell-data-set-using-scanpy-and-harmony).

Checked 2026-10-20. Specify the source release, donor subset and held-out conditions when reproducing a benchmark.
