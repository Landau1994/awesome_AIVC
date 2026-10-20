---
title: Perturb-seq
aliases:
  - Perturb Seq
  - Perturb-Seq
  - CRISPR Perturbation scRNA-seq
tags:
  - concept
  - AIVC
  - single-cell
  - perturbation
  - CRISPR
category: Core Technology
importance: high
date_created: 2026-03-25
last_updated: 2026-03-25
status: complete
---

# Perturb-seq

## Definition
> **Perturb-seq** combines pooled CRISPR perturbation with single-cell RNA sequencing to measure transcriptomic effects of genetic interventions at single-cell resolution.

## Key Ideas
- Uses guide RNA identity to link each cell to a perturbation.
- Reads out downstream gene-expression changes with scRNA-seq.
- Enables large-scale mapping from perturbation to cellular response.
- Supports single-gene and combinatorial perturbation studies.

## Experimental Workflow
1. Design and deliver pooled CRISPR guides.
2. Capture perturbed cells and their guide identities; CRISPRi/CRISPRa alter transcription without requiring DNA cutting.
3. Perform scRNA-seq and build cell-by-gene count matrices.
4. Compare perturbed cells with controls for causal analysis.

## Applications in AIVC
- Training perturbation-response foundation models.
- Building causal priors for gene regulatory network discovery.
- Benchmarking out-of-distribution perturbation prediction.

## Related Concepts
- [[02_Concepts/scRNA-seq|scRNA-seq]]
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]
- [[02_Concepts/Gene Regulatory Networks|Gene Regulatory Networks]]

## Key Papers
- [[01_Papers/CPA|CPA]]
- [[01_Papers/GEARS|GEARS]]
- [[01_Papers/arXiv 2026 Latent Causal Diffusions for Single-Cell Perturbation Modeling|Latent Causal Diffusions]]

## Tools & Implementations
- Perturb-seq pipelines in Scanpy/scvi-tools ecosystems.
- Public resources such as scPerturb and Replogle datasets.

## Learning Resources
- [Dixit et al., Perturb-seq (Cell, 2016)](https://doi.org/10.1016/j.cell.2016.11.038)
- [Replogle et al., genome-scale Perturb-seq (Cell, 2022)](https://doi.org/10.1016/j.cell.2022.05.013)
