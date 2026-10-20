---
title: Exchangeability
aliases:
  - Exchangeable Random Variables
tags:
  - concept
  - AIVC
  - statistics
category:
  - Statistics
  - Machine Learning
importance: Medium
date_created: 2026-03-17
last_updated: 2026-10-20
---

# Exchangeability

## Definition
> A sequence of random variables is **exchangeable** if their joint distribution is invariant to permutation. For model inputs represented as a set of (gene identity, expression) pairs, their serialization order can be arbitrary. This does not mean expression variables of distinct named genes are identically distributed or statistically exchangeable.

## Key Ideas
- Distinguish statistical exchangeability from a model’s permutation invariance/equivariance
- Set encoders can produce permutation-invariant outputs when their attention, pooling and position handling preserve this property
- A fixed feature vector with a consistent gene-to-column mapping is valid; permuting values without their gene identities changes the biological input

## In Single-Cell Biology
- [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]] explicitly respects exchangeability via its MCAB architecture

## Related Concepts
- [[Transformers for Biology]]

## Verification (2026-10-20)

Input-order invariance is distinct from statistical exchangeability of different named genes. [Deep Sets](https://arxiv.org/abs/1703.06114); [Set Transformer](https://proceedings.mlr.press/v97/lee19d.html).
