---
title: Exchangeability
aliases:
  - Permutation Invariance
tags:
  - concept
  - AIVC
  - statistics
category:
  - Statistics
  - Machine Learning
importance: Medium
date_created: 2026-03-17
last_updated: 2026-03-17
---

# Exchangeability

## Definition
> A sequence of random variables is **exchangeable** if their joint distribution is invariant to permutation. In single-cell biology, gene expression profiles are naturally exchangeable sets — the ordering of genes carries no information.

## Key Ideas
- Models should not impose artificial gene ordering
- Architectures like Set Transformer and Perceiver natively handle exchangeable inputs via attention
- Violating exchangeability (e.g., fixed gene vectors) can introduce spurious inductive biases

## In Single-Cell Biology
- [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]] explicitly respects exchangeability via its MCAB architecture

## Related Concepts
- [[Transformers for Biology]]
