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
last_updated: 2026-10-20
---

# Diffusion Transformer (DiT)

## Definition
> **Diffusion Transformer (DiT)** replaces the U-Net backbone in diffusion models with a Transformer architecture. It processes noisy latent patches as token sequences, using adaptive layer norm (adaLN-Zero) for timestep and class conditioning.

## Key Ideas
- In the original ImageNet experiments, larger forward-pass Gflops correlated with lower FID
- adaLN-Zero performed best among the conditioning variants in the original paper’s controlled comparison
- Reported state-of-the-art class-conditional ImageNet FID at the time of the 2023 paper; this is not a current leaderboard claim

## In Single-Cell Biology
- Used as the diffusion backbone in [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]]

## Related Concepts
- [[Latent Diffusion Models]]
- [[Flow Matching]]
- [[Transformers for Biology]]

## Verification (2026-10-20)

Historical ImageNet results refer to the original experiment, not current universal rankings. [DiT, ICCV 2023](https://openaccess.thecvf.com/content/ICCV2023/html/Peebles_Scalable_Diffusion_Models_with_Transformers_ICCV_2023_paper.html).
