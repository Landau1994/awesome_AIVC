---
title: Latent Diffusion Models
aliases:
  - LDM
  - Latent Diffusion Model
  - Latent Diffusion
tags:
  - concept
  - AIVC
  - GenerativeModels
category:
  - Deep Learning
  - Diffusion model
importance: High
date_created: 2026-03-17
last_updated: 2026-03-17
---

# Latent Diffusion Models

## Definition
> **Latent Diffusion Models (LDMs)** perform the diffusion process in a learned latent space rather than pixel/feature space. A VAE first compresses data into a compact latent representation, then a diffusion model (often a U-Net or Transformer) learns to denoise in that space. This dramatically reduces computational cost while preserving generation quality.

## Key Ideas
- Two-stage training: (1) train an autoencoder, (2) train diffusion in latent space
- Enables high-resolution generation at tractable compute
- Cross-attention conditioning for flexible guidance (text, class labels, etc.)

## In Single-Cell Biology
- [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]] applies LDM to gene expression generation using a Transformer-based VAE + DiT backbone

## Related Concepts
- [[Flow Matching]]
- [[Diffusion Transformer]]
- [[Variational Autoencoders]]
- [[Classifier-Free Guidance]]
