---
title: "Simple and effective embedding model for single-cell biology built from ChatGPT"
aliases: [GenePT, Gene pretrained]
authors: ["Yiqun Chen", "James Zou"]
year: 2025
journal: "Nature Biomedical Engineering"
tags:
  - paper
  - AIVC
  - Foundation-Models
  - Single-cell
  - Language-models
status: unread
rating:
date_added: 2026-03-25
date_read:
doi: "10.1038/s41551-024-01284-6"
url: "https://doi.org/10.1038/s41551-024-01284-6"
---

# Simple and effective embedding model for single-cell biology built from ChatGPT

## Quick Summary

GenePT builds gene representations from language-model embeddings of gene descriptions and forms cell embeddings using expression-weighted gene embeddings or expression-ranked gene-name sentences.

## Methods and Evidence

The method reuses pretrained language-model embeddings. It does not train a new sequence model on DNA or require large-scale single-cell pretraining. The paper reports gene-property and cell-type classification evaluations; its advantages are task-specific.

## Results and Limitations

The source supports the method description above. Specific effect sizes, figure numbers and computational costs should be added only with a dataset, metric and source location; generic template rankings are not evidence.

## Connections

- [[Cell2Sentence|Cell2Sentence]]
- [[01_Papers/CELLama|CELLama]]
- [[01_Papers/scGPT|scGPT]]
- [[02_Concepts/Cell Foundation Models|Foundation Models]]
- [[02_Concepts/Transformers for Biology|Transformers for Biology]]
- [[bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models|Benchmarking paper]]

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://doi.org/10.1038/s41551-024-01284-6). Published online 6 December 2024; the journal issue is dated 2025. The record now cites the journal article.
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
