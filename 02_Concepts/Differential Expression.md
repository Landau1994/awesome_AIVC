---
title: Differential Expression
aliases: [DE, Differential Gene Expression, DEGs]
tags:
  - concept
  - AIVC
date_created: 2026-10-20
last_updated: 2026-10-20
status: reviewed
---

# Differential Expression

## Definition

Differential expression tests whether gene-expression distributions or model parameters differ between specified groups. A result should include the contrast, effect size, uncertainty and multiplicity adjustment; statistical significance is not the same as biological importance.

## In Single-Cell Studies

Cells from one donor or sample are generally correlated. For condition-level inference, treating every cell as an independent replicate can inflate significance. Pseudobulk analysis aggregates counts within sample and cell type; mixed models are another option when their assumptions and computation are appropriate.

## Practical Interpretation

- Separate cell-type marker discovery from comparisons of conditions within a cell type.
- Specify biological replicates and covariates, and distinguish abundance changes from within-cell-type expression changes.
- Control the false discovery rate across tested genes.
- Do not interpret a nonsignificant result as proof of equal expression.
- Gene sets selected using test outcomes can leak information into predictive evaluations.

## Related Concepts

- [[Single-Cell Analysis]]
- [[Perturbation Prediction]]
- [[02_Concepts/Batch Correction|Batch Correction]]

## Sources

- [Squair et al., Confronting false discoveries in single-cell differential expression (2021)](https://doi.org/10.1038/s41467-021-25960-2)
- [Zimmerman et al., Pseudoreplication bias in single-cell studies (2021)](https://doi.org/10.1038/s41467-021-21038-1)
