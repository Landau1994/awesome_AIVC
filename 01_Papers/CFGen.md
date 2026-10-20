---
title: "Multi-Modal and Multi-Attribute Generation of Single Cells with CFGen"
aliases:
  - CFGen
authors: ["Alessandro Palma", "Till Richter", "Hanyi Zhang", "Manuel Lubetzki", "Alexander Tong", "Andrea Dittadi", "Fabian J. Theis"]
year: 2025
journal: "ICLR 2025"
tags:
  - paper
  - AIVC
  - scRNA-seq
  - GenerativeModels
  - FlowMatching
status: unread
rating:
date_added: 2026-03-17
date_read:
doi: null
url: "https://openreview.net/forum?id=3MnMGLctKb"
doi_status: "Article DOI not listed in the official proceedings page; use the proceedings URL"
---

# Multi-Modal and Multi-Attribute Generation of Single Cells with CFGen

## Quick Summary

CFGen generates single-cell RNA and multi-modal RNA/ATAC count profiles using latent flow matching with modality-specific discrete likelihood decoders.

## Methods and Evidence

The model supports conditional and compositional guidance using multiple attributes such as cell type and batch. Its encoder/decoder design should not be reduced to an off-the-shelf pretrained scVI model. The ICLR study evaluates generation, data augmentation and batch correction; comparisons with scLDM require that separate benchmark.

## Results and Limitations

The source supports the method description above. Specific effect sizes, figure numbers and computational costs should be added only with a dataset, metric and source location; generic template rankings are not evidence.

## Connections

- [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]]
- [[01_Papers/scVI|scVI]]
- [[Flow Matching]]

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://openreview.net/forum?id=3MnMGLctKb). The 2024 arXiv preprint is titled Generating Multi-Modal and Multi-Attribute Single-Cell Counts with CFGen; this record uses the 2025 conference version.
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
