---
title: Batch Correction
aliases: [Batch Integration, Batch Effects]
tags:
  - concept
  - AIVC
date_created: 2026-10-20
last_updated: 2026-10-20
status: reviewed
---

# Batch Correction

## Definition

Batch correction aims to reduce unwanted technical differences between experiments while retaining biological differences. Integration can produce corrected expression, a shared embedding, or a neighbor graph; these outputs are not interchangeable.

## Evaluation

- Assess both mixing of comparable cells across batches and preservation of cell identities, trajectories and condition effects.
- If batch and biological condition are fully confounded, the data alone may not distinguish them.
- Do not require unrelated or batch-specific populations to mix.
- A corrected embedding is not automatically a suitable input for differential-expression testing; use an appropriate replicate-aware expression model.

## Examples

Harmony adjusts a low-dimensional representation; BBKNN constructs a batch-balanced graph; scVI models counts with batch covariates. Select and evaluate methods for the intended analysis rather than assuming one universal winner.

## Related Concepts

- [[Single-Cell Embeddings]]
- [[Multi-modal Integration]]
- [[02_Concepts/Differential Expression|Differential Expression]]

## Sources

- [Luecken et al., Benchmarking atlas-level data integration (2022)](https://doi.org/10.1038/s41592-021-01336-8)
- [scVI model documentation](https://docs.scvi-tools.org/en/stable/user_guide/models/scvi.html)
