---
title: "Scaling Large Language Models for Next-Generation Single-Cell Analysis"
aliases: [Cell2Sentence, C2S, C2S-Scale]
authors:
  - Syed Asad Rizvi
  - Daniel Levine
  - Aakash Patel
  - Shiyang Zhang
  - Eric Wang
  - Curtis Jamison Perry
  - Ivan Vrkic
  - Nicole Mayerli Constante
  - Zirui Fu
  - Sizhuang He
  - David Zhang
  - Cerise Tang
  - Zhuoyang Lyu
  - Rayyan Darji
  - Chang Li
  - Emily Sun
  - David Jeong
  - Lawrence Zhao
  - Jennifer Kwan
  - David Braun
  - Brian Hafler
  - Hattie Chung
  - Rahul M. Dhodapkar
  - Paul Jaeger
  - Bryan Perozzi
  - Jeffrey Ishizuka
  - Shekoofeh Azizi
  - David van Dijk
year: 2026
journal: "bioRxiv"
doi: "10.1101/2025.04.14.648850"
url: "https://www.biorxiv.org/content/10.1101/2025.04.14.648850v4"
tags:
  - paper
  - AIVC
  - Foundation-Models
  - Single-cell
  - LLM
status: unread
rating:
date_added: 2025-12-31
date_read:
---

# C2S-Scale: Scaling Large Language Models for Next-Generation Single-Cell Analysis

## Quick Summary

C2S-Scale adapts decoder language models to single-cell biology by representing a cell as gene names ordered by expression. The selected preprint revision evaluates model scaling, text-based analysis and generation, and experimentally follows up a context-dependent antigen-presentation hypothesis. This is a research model, and generated explanations are not independently validated mechanisms.

## Methods

- Converts expression profiles into ranked gene-name sequences, with associated biological text and metadata.
- Studies models ranging from 410 million to 27 billion parameters, including Pythia and Gemma-2 variants, using a corpus of more than 50 million transcriptomes.
- Uses continued pretraining and task-specific instruction training; the later revision also describes reinforcement learning for selected tasks.
- Evaluates annotation, captioning, question answering, spatial-context tasks and perturbation-response generation. Training and test conditions differ across these tasks.

See the [selected preprint revision](https://www.biorxiv.org/content/10.1101/2025.04.14.648850v4) and the [authors' publication page](https://research.google/pubs/scaling-large-language-models-for-next-generation-single-cell-analysis/).

## Results and Limits

The study reports gains from scale within the evaluated settings. Its virtual-screening case identified silmitasertib as a context-dependent candidate for enhancing antigen presentation, followed by experiments. This does not establish clinical efficacy or that the model was the first AI system to generate an experimentally tested biological hypothesis.

The inherited approximate accuracy and spatial-score table has been removed because it lacked exact panel, split and metric provenance. Comparisons should be cited from the relevant source experiment. Expression ranking loses absolute abundance, long gene sequences incur computational cost, and fluent natural-language output can contain errors.

## Publication Identity

This note concerns **C2S-Scale**, using preprint v4 dated 1 January 2026; its DOI was first posted in 2025. The original **Cell2Sentence: Teaching Large Language Models the Language of Biology** is a separate earlier publication. They should not share an interchangeable citation.

## Tools and Code

- [Official Cell2Sentence repository](https://github.com/vandijklab/cell2sentence)
- [C2S-Scale 27B model card](https://huggingface.co/vandijklab/C2S-Scale-Gemma-2-27B)
- [Author explanation and experimental context](https://research.google/blog/teaching-machines-the-language-of-biology-scaling-large-language-models-for-next-generation-single-cell-analysis/)

Use the model card's prompt and loading instructions for the selected checkpoint; a generic chat prompt is not a verified reproduction of the experiments.

## Connections

- [[01_Papers/scGPT|scGPT]]
- [[01_Papers/Geneformer|Geneformer]]
- [[02_Concepts/Group Relative Policy Optimization|Group Relative Policy Optimization]]
- [[02_Concepts/Transformers for Biology|Transformer]]
- [[01_Papers/chemCPA|ChemCPA]]
- [[02_Concepts/Cell Foundation Models|Foundation Models]]
- [[02_Concepts/scRNA-seq|Single-cell RNA sequencing]]
- [[02_Concepts/Spatial Transcriptomics|Spatial Transcriptomics]]
- [[02_Concepts/Group Relative Policy Optimization|GRPO]]
- [[01_Papers/UCE|UCE]]
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Transformers for Biology|Transformers for Biology]]
- [[02_Concepts/Single-Cell Embeddings|Single-Cell Embeddings]]

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://www.biorxiv.org/content/10.1101/2025.04.14.648850v4). This note uses preprint v4, dated 1 January 2026 (first posted in 2025). C2S-Scale and the original Cell2Sentence paper are different publications.
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
