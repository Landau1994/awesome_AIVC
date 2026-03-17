---
title: "Perceiver: General Perception with Iterative Attention"
aliases:
  - Perceiver
  - Perceiver IO
authors:
  - Andrew Jaegle
  - Felix Gimeno
  - Andrew Brock
  - et al.
year: 2021
journal: ICML
tags:
  - paper
  - AIVC
  - attention
  - permutation-invariant
  - multimodal
status: unread
rating:
date_added: 2026-03-17
date_read:
---

# Perceiver

## Quick Summary
> **Perceiver** uses cross-attention to map arbitrary-size inputs to a fixed-size latent array, then processes the latent array with self-attention. This decouples compute from input size, enabling scalable processing of high-dimensional and multimodal data.

## Key Points
- Cross-attention bottleneck: large input → small latent array
- Iterative refinement via repeated cross-attention
- Perceiver IO extends to arbitrary output structures
- Inspires the MCAB pooling/unpooling in [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]]

## Related Concepts
- [[Exchangeability]]
- [[SetTransformer]]
