---
title: "Perceiver: General Perception with Iterative Attention"
aliases:
  - Perceiver
authors: ["Andrew Jaegle", "Felix Gimeno", "Andy Brock", "Oriol Vinyals", "Andrew Zisserman", "Joao Carreira"]
year: 2021
journal: "ICML 2021"
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
doi: null
url: "https://proceedings.mlr.press/v139/jaegle21a.html"
doi_status: "Article DOI not listed in the official proceedings page; use the proceedings URL"
---

# Perceiver

## Quick Summary
> **Perceiver** uses cross-attention to map arbitrary-size inputs to a fixed-size latent array, then processes the latent array with self-attention. This reduces the cost relative to full input self-attention; cross-attention still depends on input size, enabling scalable processing of high-dimensional and multimodal data.

## Key Points
- Cross-attention bottleneck: large input → small latent array
- Iterative refinement via repeated cross-attention
- Perceiver IO extends to arbitrary output structures
- Inspires the MCAB pooling/unpooling in [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]]

## Related Concepts
- [[Exchangeability]]
- [[SetTransformer]]

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://proceedings.mlr.press/v139/jaegle21a.html). Perceiver IO is a separate follow-up paper, not an alternative title of this paper.
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
