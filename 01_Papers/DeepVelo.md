---
title: "DeepVelo: deep learning extends RNA velocity to multi-lineage systems with cell-specific kinetics"
aliases: [DeepVelo]
authors: ["Haotian Cui", "Hassaan Maan", "Maria C. Vladoiu", "Jiao Zhang", "Michael D. Taylor", "Bo Wang"]
year: 2024
journal: "Genome Biology"
tags:
  - paper
  - RNA-velocity
  - deep-learning
  - neural-networks
  - single-cell
status: unread
date_added: 2026-03-25
doi: "10.1186/s13059-023-03148-9"
url: "https://doi.org/10.1186/s13059-023-03148-9"
---

# DeepVelo: deep learning extends RNA velocity to multi-lineage systems with cell-specific kinetics

## Quick Summary

DeepVelo uses graph convolutional networks to estimate cell-specific transcription, splicing and degradation kinetics from neighboring single-cell expression profiles.

## Methods and Evidence

Its continuity-based training compares extrapolated expression with observed neighboring states. It is not supervised training on known true velocity labels, and it does not remove the need for preprocessing. The original study evaluates multi-lineage development and disease settings. Claims of being universally fastest or most accurate are unsupported here.

## Results and Limitations

The source supports the method description above. Specific effect sizes, figure numbers and computational costs should be added only with a dataset, metric and source location; generic template rankings are not evidence.

## Connections

- [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|2025 benchmarking results]]
- [[velocyto]]
- [[scvelo]]
- [[veloVI]]
- [[latentVelo]]
- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|Comprehensive benchmarking study]]

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://doi.org/10.1186/s13059-023-03148-9). This is the Cui et al. graph convolution method. A different 2022 method is also named DeepVelo: Single-cell transcriptomic deep velocity field learning with neural ordinary differential equations. Benchmark claims must identify the implementation.
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
