---
title: "Cell2fate infers RNA velocity modules to improve cell fate prediction"
aliases:
  - Cell2fate
authors: ["Alexander Aivazidis", "Fani Memi", "Vitalii Kleshchevnikov", "Sezgin Er", "Brian Clarke", "Oliver Stegle", "Omer Ali Bayraktar"]
year: 2025
journal: "Nature Methods"
doi: "10.1038/s41592-025-02608-3"
url: "https://doi.org/10.1038/s41592-025-02608-3"
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2026-03-25
date_read:
---

# Cell2fate infers RNA velocity modules to improve cell fate prediction

## Quick Summary

Cell2fate is a Bayesian RNA velocity model that decomposes transcriptional dynamics into interpretable modules.

## Methods and Evidence

It linearizes components of the velocity ODE and fits raw spliced/unspliced counts with stochastic variational inference in Pyro. The model accounts for technical variation and supports spatial mapping of velocity modules. Constant degradation and other simplifying assumptions remain; no universal memory ranking is established here.

## Results and Limitations

The source supports the method description above. Specific effect sizes, figure numbers and computational costs should be added only with a dataset, metric and source location; generic template rankings are not evidence.

## Connections

- [[01_Papers/Pyro-Velocity|Pyro-Velocity]]
- [[01_Papers/veloVI|veloVI]]
- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[02_Concepts/Trajectory Inference|Trajectory Inference]]

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://doi.org/10.1038/s41592-025-02608-3).
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
