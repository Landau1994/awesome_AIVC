---
title: "Deep generative modeling of transcriptional dynamics for RNA velocity analysis in single cells"
aliases: [veloVI]
authors: ["Adam Gayoso", "Philipp Weiler", "Mohammad Lotfollahi", "Dominik Klein", "Justin Hong", "Aaron Streets", "Fabian J. Theis", "Nir Yosef"]
year: 2024
journal: "Nature Methods"
tags:
  - paper
  - RNA-velocity
  - variational-inference
  - probabilistic
  - single-cell
status: unread
date_added: 2026-03-25
doi: "10.1038/s41592-023-01994-w"
url: "https://doi.org/10.1038/s41592-023-01994-w"
---

# Deep generative modeling of transcriptional dynamics for RNA velocity analysis in single cells

## Quick Summary

veloVI is a deep generative framework for RNA velocity that models transcriptional dynamics and provides posterior estimates of velocity uncertainty.

## Methods and Evidence

It uses variational inference and a probabilistic formulation of splicing dynamics. Intrinsic and extrinsic uncertainty help assess predictions under the model. A CBDir cosine score of 0.28, if reproduced in a particular benchmark, is not 28% directional correctness and does not establish universal superiority.

## Results and Limitations

The source supports the method description above. Specific effect sizes, figure numbers and computational costs should be added only with a dataset, metric and source location; generic template rankings are not evidence.

## Connections

- [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|2025 benchmarking results]]
- [[scvelo]]
- [[latentVelo]]
- [[DeepVelo]]
- [[Dynamo]]
- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|Comprehensive benchmarking]]
- [[veloVAE]]

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://doi.org/10.1038/s41592-023-01994-w). Published online 21 September 2023; the journal issue is dated 2024.
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
