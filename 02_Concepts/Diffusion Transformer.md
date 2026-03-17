---
title: Diffusion Transformer
aliases:
  - DiT
  - Diffusion Transformers
tags:
  - concept
  - AIVC
  - GenerativeModels
category:
  - Deep Learning
  - Diffusion model
importance: Medium
date_created: 2026-03-17
last_updated: 2026-03-17
---

# Diffusion Transformer (DiT)

## Definition
> **Diffusion Transformer (DiT)** replaces the U-Net backbone in diffusion models with a Transformer architecture. It processes noisy latent patches as token sequences, using adaptive layer norm (adaLN-Zero) for timestep and class conditioning.

## Key Ideas
- Scalable: performance improves predictably with model size and compute (Gflops)
- adaLN-Zero conditioning outperforms cross-attention and in-context conditioning
- Achieves state-of-the-art FID on ImageNet class-conditional generation

## In Single-Cell Biology
- Used as the diffusion backbone in [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]]

## Related Concepts
- [[Latent Diffusion Models]]
- [[Flow Matching]]
- [[Transformers for Biology]]
