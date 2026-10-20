---
title: Classifier-Free Guidance
aliases:
  - CFG
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

# Classifier-Free Guidance

## Definition
> **Classifier-Free Guidance (CFG)** is a technique for improving conditional generation quality in diffusion models without a separate classifier. During training, the conditioning signal is randomly dropped (replaced with null). At inference, the model output is extrapolated away from the unconditional prediction toward the conditional prediction, controlled by a guidance scale ω.

## Key Ideas
- Trade-off between sample quality and diversity via guidance scale ω
- No need for a separate classifier network
- Joint versus additive multi-condition guidance is an empirical design choice; neither universally dominates

## In Single-Cell Biology
- [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]] uses CFG with joint conditioning for cell type + perturbation generation

## Related Concepts
- [[Latent Diffusion Models]]
- [[Flow Matching]]

## Verification (2026-10-20)

Higher guidance does not guarantee greater biological validity or diversity. [Classifier-Free Diffusion Guidance](https://arxiv.org/abs/2207.12598); [scLDM](https://arxiv.org/abs/2511.02986).
