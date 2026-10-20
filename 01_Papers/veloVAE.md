---
title: "Variational Mixtures of ODEs for Inferring Cellular Gene Expression Dynamics"
aliases:
  - VeloVAE
authors: ["Yichen Gu", "David T. Blaauw", "Joshua D. Welch"]
year: 2022
journal: "ICML 2022"
doi: null
url: "https://proceedings.mlr.press/v162/gu22a.html"
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2026-03-25
date_read:
doi_status: "Article DOI not listed in the official proceedings page; use the proceedings URL"
---

# Variational Mixtures of ODEs for Inferring Cellular Gene Expression Dynamics

## Quick Summary

VeloVAE combines a deep generative model with biochemical ODE constraints to infer latent cell time, cell state and expression dynamics.

## Methods and Evidence

The generative model is a variational mixture of ODEs whose parameters vary across latent cell states. This is not the same method as veloVI. Comparisons require an identified version and dataset; generic reversed-transition or superiority claims are not retained without the corresponding figure and metric.

## Results and Limitations

The source supports the method description above. Specific effect sizes, figure numbers and computational costs should be added only with a dataset, metric and source location; generic template rankings are not evidence.

## Connections

- [[01_Papers/veloVI|veloVI]]
- [[01_Papers/veloVI|veloVI]]
- [[01_Papers/DeepVelo|DeepVelo]]
- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[02_Concepts/scRNA-seq|scRNA-seq]]

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://proceedings.mlr.press/v162/gu22a.html). This record identifies the ICML 2022 VeloVAE paper. The same project also has the expanded preprint Bayesian Inference of RNA Velocity from Multi-Lineage Single-Cell Data; do not combine its title with the conference citation.
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
