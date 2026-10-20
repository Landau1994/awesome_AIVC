---
title: Dentate Gyrus
aliases:
  - DG
tags:
  - dataset
  - AIVC
  - scRNA-seq
  - neurogenesis
date_created: 2026-03-17
last_updated: 2026-03-17
---

# Dentate Gyrus

## Overview
> Single-cell RNA-seq dataset of the mouse dentate gyrus, widely used as a benchmark for generative models and RNA velocity methods. Captures the neurogenesis trajectory from radial glia to granule neurons.

## Usage
- Benchmark for unconditional generation in [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]]
- Common testbed for trajectory inference and RNA velocity algorithms

## Sources and version scope

- [scVelo dataset documentation](https://scvelo.readthedocs.io/en/stable/scvelo.datasets.dentategyrus.html) identifies the Hochgerner et al. (2018) neurogenesis data.
- Different processed dentate-gyrus objects have different cell/gene counts. Record the loader, filtering and release when comparing RNA velocity or generative models.

Checked 2026-10-20: dataset provenance; no single size is assumed for all processed versions.
