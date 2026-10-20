---
title: "Generalizing RNA velocity to transient cell states through dynamical modeling"
aliases: [scvelo, Bergen 2020]
authors: ["Volker Bergen", "Marius Lange", "Stefan Peidli", "F. Alexander Wolf", "Fabian J. Theis"]
year: 2020
journal: "Nature Biotechnology"
tags:
  - paper
  - RNA-velocity
  - ODE-based
  - single-cell
  - trajectory-inference
status: unread
date_added: 2026-03-25
doi: "10.1038/s41587-020-0591-3"
url: "https://doi.org/10.1038/s41587-020-0591-3"
---

# Generalizing RNA velocity to transient cell states through dynamical modeling

## Quick Summary

scVelo extends RNA velocity beyond the steady-state approximation by fitting a likelihood-based model of transcription, splicing and degradation.

## Methods and Evidence

The dynamical model estimates gene-specific kinetic rates and latent time. Its standard formulation does not infer arbitrarily time-varying splicing and degradation rates for each cell. Biological direction still requires validation; neither a universal accuracy percentage nor a universal runtime follows from this paper.

## Results and Limitations

The source supports the method description above. Specific effect sizes, figure numbers and computational costs should be added only with a dataset, metric and source location; generic template rankings are not evidence.

## Connections

- [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|2025 benchmarking study]]
- [[velocyto]]
- [[DeepVelo]]
- [[veloVI]]
- [[Dynamo]]
- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[02_Concepts/Trajectory Inference|Trajectory Inference]]
- [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|Comprehensive benchmarking]]

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://doi.org/10.1038/s41587-020-0591-3).
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
