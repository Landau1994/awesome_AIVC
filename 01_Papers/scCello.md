---
title: "Cell ontology guided transcriptome foundation model"
aliases: [scCello]
authors: ["Xinyu Yuan", "Zhihao Zhan", "Zuobai Zhang", "Manqi Zhou", "Jianan Zhao", "Boyu Han", "Yue Li", "Jian Tang"]
year: 2024
journal: "NeurIPS 2024"
tags:
  - paper
  - AIVC
  - Foundation-Models
  - Single-cell
  - Transformers
status: unread
rating:
date_added: 2026-03-25
date_read:
doi: "10.52202/079017-0204"
url: "https://papers.nips.cc/paper/2024/file/0be40478ab6ee0006ee3b38b158bbc8f-Paper-Conference.pdf"
---

# Cell ontology guided transcriptome foundation model

## Quick Summary

scCello is a transcriptome foundation model that uses Cell Ontology relationships during pretraining to structure cell representations.

## Methods and Evidence

It combines masked gene-expression prediction with cell-type coherence and ontology alignment objectives, using 22 million CellxGene cells. The model is not merely an unspecified contrastive cell encoder. Its evaluations include unseen cell types, marker genes and drug response.

## Results and Limitations

The source supports the method description above. Specific effect sizes, figure numbers and computational costs should be added only with a dataset, metric and source location; generic template rankings are not evidence.

## Connections

- [[01_Papers/Geneformer|Geneformer]]
- [[01_Papers/scGPT|scGPT]]
- [[01_Papers/UCE|UCE]]
- [[02_Concepts/Single-Cell Embeddings|Single-Cell Embeddings]]
- [[02_Concepts/Cell Foundation Models|Foundation Models]]
- [[bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models|Comprehensive benchmarking paper]]

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://papers.nips.cc/paper/2024/file/0be40478ab6ee0006ee3b38b158bbc8f-Paper-Conference.pdf).
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
