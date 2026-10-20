---
title: COVID-19 Lung Atlas
aliases:
  - COVID-19
tags:
  - dataset
  - AIVC
  - scRNA-seq
  - disease
  - lung
date_created: 2026-03-17
last_updated: 2026-03-17
---

# COVID-19 Lung Atlas

## Overview
> Single-cell atlas of COVID-19 patient lung tissue, capturing immune and epithelial cell responses to SARS-CoV-2 infection. Used as a downstream classification benchmark for foundation models.

## Usage
- Downstream classification benchmark in [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]] (infection-status F1 = 0.820 ± 0.001 for the 270M model in the paper’s protocol)
- Infection-status classification; this result is not a cell-type annotation score

## Source

[scLDM section 4.3 and Appendix G](https://arxiv.org/html/2511.02986v1#S4.SS3). The short label “COVID-19” is not a unique dataset identifier; use the cited source and preprocessing rather than an arbitrary COVID-19 atlas. Checked 2026-10-20.
