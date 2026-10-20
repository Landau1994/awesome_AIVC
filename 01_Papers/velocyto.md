---
title: "RNA velocity of single cells"
aliases: [velocyto, La Manno 2018]
authors: ["Gioele La Manno", "Ruslan Soldatov", "Amit Zeisel", "et al."]
year: 2018
journal: "Nature"
tags:
  - paper
  - RNA-velocity
  - foundational
  - single-cell
  - trajectory-inference
status: unread
date_added: 2026-03-25
doi: "10.1038/s41586-018-0414-6"
url: "https://doi.org/10.1038/s41586-018-0414-6"
---

# RNA velocity of single cells

## Quick Summary

La Manno et al. introduced RNA velocity: estimating a local direction of transcriptomic change from spliced and unspliced RNA in snapshot single-cell data.

## Methods and Evidence

The original steady-state framework uses deviations from expected RNA processing relationships. It does not directly observe future cell fates. Directional results depend on kinetic assumptions, preprocessing and available transitional states. Benchmark cosine scores must not be converted to percentages of correctly predicted cells.

## Results and Limitations

The source supports the method description above. Specific effect sizes, figure numbers and computational costs should be added only with a dataset, metric and source location; generic template rankings are not evidence.

## Connections

- [[scvelo]]
- [[DeepVelo]]
- [[Dynamo]]
- [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|Recent benchmarking (2025)]]
- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[02_Concepts/Trajectory Inference|Trajectory Inference]]
- [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|Comprehensive benchmarking study]]

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://doi.org/10.1038/s41586-018-0414-6).
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
