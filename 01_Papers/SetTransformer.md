---
title: "Set Transformer: A Framework for Attention-based Permutation-Invariant Neural Networks"
aliases:
  - SetTransformer
  - Set Transformer
authors: ["Juho Lee", "Yoonho Lee", "Jungtaek Kim", "Adam Kosiorek", "Seungjin Choi", "Yee Whye Teh"]
year: 2019
journal: "ICML 2019"
tags:
  - paper
  - AIVC
  - attention
  - permutation-invariant
status: unread
rating:
date_added: 2026-03-17
date_read:
doi: null
url: "https://proceedings.mlr.press/v97/lee19d.html"
doi_status: "Article DOI not listed in the official proceedings page; use the proceedings URL"
---

# Set Transformer

## Quick Summary
> **Set Transformer** introduces attention-based architectures for processing set-structured data. It proposes Induced Set Attention Blocks (ISAB) that reduce self-attention cost from quadratic to linear in set size when the number of inducing points is fixed, enabling scalable permutation-invariant set processing.

## Key Points
- Multihead Attention Block (MAB) and Induced Set Attention Block (ISAB)
- Pooling by Multihead Attention (PMA) for set-level aggregation
- Inspires the MCAB architecture in [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]]

## Related Concepts
- [[Exchangeability]]
- [[Perceiver]]

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://proceedings.mlr.press/v97/lee19d.html).
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
