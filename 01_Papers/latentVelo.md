---
title: "Inferring single-cell transcriptomic dynamics with structured latent gene expression dynamics"
aliases: [latentVelo]
authors: ["Spencer Farrell", "Madhav Mani", "Sidhartha Goyal"]
year: 2023
journal: "Cell Reports Methods"
tags:
  - paper
  - RNA-velocity
  - deep-learning
  - latent-space
  - single-cell
status: unread
date_added: 2026-03-25
doi: "10.1016/j.crmeth.2023.100581"
url: "https://doi.org/10.1016/j.crmeth.2023.100581"
---

# Inferring single-cell transcriptomic dynamics with structured latent gene expression dynamics

## Quick Summary

LatentVelo combines a variational autoencoder with structured latent dynamics to infer developmental trajectories from single-cell transcriptomes.

## Methods and Evidence

The model represents spliced and unspliced measurements in a learned latent space and constrains their dynamics. High intra-cluster coherence measures agreement among nearby vectors, not correctness, noise robustness or superiority to all other methods. Disagreement between methods does not demonstrate which trajectory is biologically correct.

## Results and Limitations

The source supports the method description above. Specific effect sizes, figure numbers and computational costs should be added only with a dataset, metric and source location; generic template rankings are not evidence.

## Connections

- [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|2025 benchmarking results]]
- [[DeepVelo]]
- [[veloVI]]
- [[scvelo]]
- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|Comprehensive benchmarking study]]

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://doi.org/10.1016/j.crmeth.2023.100581).
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
