---
title: "CELLama: Foundation Model for Single Cell and Spatial Transcriptomics by Cell Embedding Leveraging Language Model Abilities"
aliases: [CELLama]
authors: ["Jeongbin Park", "Sumin Kim", "Jiwon Kim", "Dongjoo Lee", "Sungwoo Bae", "Haenara Shin", "Daeseung Lee", "Hongyoon Choi"]
year: 2026
journal: "Advanced Science"
tags:
  - paper
  - AIVC
  - Foundation-Models
  - Single-cell
  - LLM
status: unread
rating:
date_added: 2026-03-25
date_read:
doi: "10.1002/advs.202513210"
url: "https://doi.org/10.1002/advs.202513210"
---

# CELLama: Foundation Model for Single Cell and Spatial Transcriptomics by Cell Embedding Leveraging Language Model Abilities

## Quick Summary

CELLama converts expression-ranked gene names and optional metadata into cell sentences, then embeds them using pretrained sentence transformers.

## Methods and Evidence

The framework supports cell typing, integration and spatial-context analysis, with optional fine-tuning on cell-derived sentence pairs. Producing embeddings from text does not establish a conversational interface or general biological question-answering capability.

## Results and Limitations

The source supports the method description above. Specific effect sizes, figure numbers and computational costs should be added only with a dataset, metric and source location; generic template rankings are not evidence.

## Connections

- [[Cell2Sentence|Cell2Sentence/C2S-Scale]]
- [[01_Papers/scGPT|scGPT]]
- [[01_Papers/Geneformer|Geneformer]]
- [[02_Concepts/Cell Foundation Models|Foundation Models]]
- [[bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models|Benchmarking paper]]

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://doi.org/10.1002/advs.202513210). Published online 17 November 2025; the journal issue is dated 2026. The earlier preprint is [10.1101/2024.05.08.593094](https://doi.org/10.1101/2024.05.08.593094).
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
