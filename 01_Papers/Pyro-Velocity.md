---
title: "Pyro-Velocity: Probabilistic RNA Velocity inference from single-cell data"
aliases:
  - pyro-velocity
  - pyrovelocity
authors: ["Qian Qin", "Eli Bingham", "Gioele La Manno", "David M. Langenau", "Luca Pinello"]
year: 2022
journal: "bioRxiv"
doi: "10.1101/2022.09.12.507691"
url: "https://doi.org/10.1101/2022.09.12.507691"
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2026-03-25
date_read:
---

# Pyro-Velocity: Probabilistic RNA Velocity inference from single-cell data

## Quick Summary

Pyro-Velocity uses a Bayesian generative model of spliced and unspliced RNA counts to estimate cell dynamics and uncertainty.

## Methods and Evidence

The model infers a shared latent time and posterior velocity distributions using Pyro. Uncertainty reflects the specified model and inference procedure; it is not a guarantee of biological correctness. Memory and runtime comparisons require the same dataset, hardware and settings.

## Results and Limitations

The source supports the method description above. Specific effect sizes, figure numbers and computational costs should be added only with a dataset, metric and source location; generic template rankings are not evidence.

## Connections

- [[01_Papers/cell2fate|cell2fate]]
- [[01_Papers/veloVI|veloVI]]
- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[02_Concepts/scRNA-seq|scRNA-seq]]

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://doi.org/10.1101/2022.09.12.507691). This record identifies the verified 2022 preprint; it does not imply journal publication.
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
