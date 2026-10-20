---
title: Replogle
aliases:
  - Replogle Perturb-seq
tags:
  - dataset
  - AIVC
  - scRNA-seq
  - perturbation
  - CRISPR
date_created: 2026-03-17
last_updated: 2026-03-17
---

# Replogle

## Overview
> A genome-scale [[02_Concepts/Perturb-seq|Perturb-seq]] dataset (Replogle et al., 2022) profiling CRISPR interference (CRISPRi) knockdown, including genome-wide K562 and essential-gene K562/RPE1 screens. CRISPRi represses transcription; it is not a DNA knockout.

## Usage
- Perturbational benchmark in [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]], [[GEARS]], [[CPA]]
- Standard testbed for perturbation prediction models

## Sources and version scope

- [Original Cell paper (2022)](https://doi.org/10.1016/j.cell.2022.05.013)
- [Author data portal](https://gwps.wi.mit.edu/)
- A benchmark labeled “Replogle-Nadig” may combine screens; record the exact source files and split rather than treating it as identical to the 2022 release.

Checked 2026-10-20: perturbation mechanism and dataset identity.
