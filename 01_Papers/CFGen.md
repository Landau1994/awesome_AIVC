---
title: "CFGen: Conditional Flow Generation for Single-Cell Data"
aliases:
  - CFGen
authors: []
year: 2024
journal: arXiv
tags:
  - paper
  - AIVC
  - scRNA-seq
  - GenerativeModels
  - FlowMatching
status: unread
rating:
date_added: 2026-03-17
date_read:
---

# CFGen

## Quick Summary
> **CFGen** is a Flow Matching-based generative model for single-cell gene expression data. It operates in the latent space of a pre-trained scVI model, using conditional flow matching to generate realistic gene expression profiles.

## Key Points
- Flow Matching in scVI latent space
- Conditional generation for cell types
- Outperformed by [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]] which uses a Transformer VAE + joint conditioning

## Related Papers
- [[01_Papers/scVI|scVI]] — provides the latent space
- [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]]
- [[Flow Matching]]
