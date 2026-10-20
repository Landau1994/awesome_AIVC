---
title: Single-Cell Analysis
aliases: [Single Cell Analysis]
tags:
  - concept
  - AIVC
date_created: 2026-10-20
last_updated: 2026-10-20
status: reviewed
---

# Single-Cell Analysis

## Definition

Single-cell analysis measures or models variation among individual cells. This note focuses on computational analysis of single-cell omics rather than implying that a sequencing assay observes every molecule in a cell.

## Typical Workflow

1. Record assay, sample, donor and experimental-condition metadata.
2. Quantify molecules/features and check cell quality, ambient signal and doublets.
3. Apply normalization and feature selection suitable for the selected model.
4. Build representations and, where needed, integrate batches.
5. Annotate populations using multiple markers and reference evidence.
6. Test the biological question using independent biological replicates and an explicit analysis design.

Different tasks need different inputs: log-normalized data are common for PCA, whereas count likelihoods such as scVI expect untransformed counts. Keep raw data and preprocessing provenance.

## Related Concepts

- [[scRNA-seq]]
- [[ATAC-seq]]
- [[Multi-modal Integration]]
- [[Highly Variable Genes]]
- [[02_Concepts/Batch Correction|Batch Correction]]
- [[02_Concepts/Differential Expression|Differential Expression]]

## Sources

- [Scanpy preprocessing and clustering tutorial](https://scanpy.readthedocs.io/en/stable/tutorials/basics/clustering.html)
- [scVI model/input documentation](https://docs.scvi-tools.org/en/stable/user_guide/models/scvi.html)
