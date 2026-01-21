---
title: Zero-shot evaluation reveals limitations of single-cell foundation models
aliases: []
authors:
  - Kasia Z. Kedzierska
  - Lorin Crawford
  - Ava P. Amini
  - Alex X. Lu
year: 2025
journal: Genome Biology
doi: 10.1186/s13059-025-03574-x
url: https://doi.org/10.1186/s13059-025-03574-x
tags:
  - paper
  - AIVC
  - single-cell
  - foundation-models
  - zero-shot
  - benchmarking
status: unread
rating:
date_added: 2025-05-18
date_read:
---

# Zero-shot evaluation reveals limitations of single-cell foundation models

## Quick Summary
> This paper critically evaluates two prominent single-cell foundation models, [[Geneformer]] and [[scGPT]], in a zero-shot setting, assessing their ability to generate useful cell embeddings and integrate batches without fine-tuning. The authors demonstrate that these complex models frequently underperform compared to simpler baselines like selecting highly variable genes ([[HVG]]), [[scVI]], and [[Harmony]] across diverse datasets. The study suggests that current pretraining objectives (masked language modeling) may not be effectively learning transferable biological representations, as evidenced by poor performance in gene expression reconstruction tasks, underscoring the need for rigorous zero-shot benchmarking in the field.

## Key Points
- Foundation models ([[Geneformer]], [[scGPT]]) were evaluated zero-shot (as feature extractors) against standard baselines ([[HVG]], [[scVI]], [[Harmony]]).
- **Cell Type Clustering**: Both models generally performed worse than HVG and established methods; [[scGPT]] showed some strength on the PBMC 12k dataset but was inconsistent elsewhere.
- **Batch Integration**: [[Geneformer]] failed to correct batch effects. [[scGPT]] outperformed established baselines on complex batches (biological + technical) but overlapped with its training data; it underperformed on purely technical batches.
- **Pretraining Analysis**: Increasing pretraining data size for [[scGPT]] did not consistently improve zero-shot performance.
- **Reconstruction Task**: Both models struggled with their pretraining objective (reconstructing gene expression), with [[scGPT]] often predicting mean values and [[Geneformer]] showing modest rank correlations.
- **Data Leakage**: The authors note that some evaluation datasets were present in the training corpus of the foundation models, yet the models still did not consistently outperform baselines.

## Methods
### Data
- **Datasets**: Five human tissue datasets were used for evaluation:
    - **Pancreas**: 16k cells (5 sources).
    - **PBMC (12k)**: Peripheral blood mononuclear cells.
    - **PBMC (95k)**: Larger PBMC dataset.
    - **Immune**: Cross-tissue immune cell atlas (330k cells).
    - **Tabula Sapiens**: Multi-organ human cell atlas (483k cells).

### Model Architecture
- **[[Geneformer]]**: BERT-inspired architecture with 6 Transformer layers and 4 attention heads (10M parameters). Input is a ranked list of genes.
- **[[scGPT]]**: 12 Transformer layers with 8 attention heads (30M parameters). Input involves binned gene expression values (0-50) and gene tokens.

### Training Strategy
- **Pretraining Objective**: Both utilize Masked Language Modeling ([[MLM]]).
    - [[Geneformer]]: Predicts the identity of masked genes based on ranking.
    - [[scGPT]]: Predicts the expression bin of masked genes and learns a cell embedding.
- **Evaluation Strategy**: Models were applied zero-shot (weights frozen). Baselines ([[scVI]], [[Harmony]]) were trained on the target datasets (reflecting a "resource-constrained" vs. "fine-tuning" trade-off).

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| **AvgBIO Score** (Cell Type) | **Highest** (General) | [[HVG]] (Baselines consistently outperformed models) |
| **Batch Integration Score** | **Highest** (General) | [[HVG]] / [[scVI]] / [[Harmony]] |
| **Gene Rank Correlation** | 0.56 (Median) | [[Geneformer]] (vs True Ranking) |
| **Reconstruction MSE** | High (Mean prediction) | [[scGPT]] (vs Mean Baseline) |

## Figures

| Figure | Description |
| ------ | ----------- |
| **Fig 1** | **Evaluation of cell embedding space.** (A) Overview of tasks. (B) AvgBIO scores showing [[HVG]], [[Harmony]], and [[scVI]] generally outperforming [[scGPT]] and [[Geneformer]]. (C-D) UMAPs of Pancreas dataset showing [[Geneformer]] driven by batch effects. (E) Batch integration scores. |
| **Fig 2** | **Gene expression reconstruction.** (A-B) [[scGPT]] predicts mean bin values; conditioning on cell embeddings improves this slightly. (C) [[Geneformer]] predicted ranking vs true ranking. (D) MSE for [[scGPT]] vs naive mean baseline. (E) Correlation of [[Geneformer]] rankings. |

## Critical Analysis
### Strengths
- **Rigorous Benchmarking**: Addresses a gap in the field by focusing on zero-shot performance, which is crucial for discovery tasks where labels are absent.
- **Appropriate Baselines**: Compares deep learning models against simple but effective heuristics ([[HVG]]) and standard integration tools ([[Harmony]], [[scVI]]).
- **Mechanism Check**: Investigates *why* models fail by evaluating their success at their own pretraining objectives (reconstruction).
- **Transparency**: Openly discusses data leakage (overlap between training and evaluation sets) and its potential impact.

### Weaknesses
- **Baseline Comparison nuance**: The baselines ([[scVI]], [[Harmony]]) are trained on the specific evaluation datasets, whereas the foundation models are zero-shot. While this mimics a "download and use" scenario vs. "train a lightweight model" scenario, it is not a strictly "zero-shot vs zero-shot" comparison.
- **Dataset Overlap**: The scGPT model had seen the Immune and Tabula Sapiens datasets during training, confounding generalization claims (though the paper notes this).
- **Scope**: Limited to transcriptomic data and two specific foundation models.

### Questions
- Would fine-tuning the foundation models with a very small amount of data ("few-shot") bridge the gap significantly compared to training [[scVI]] from scratch?
- Are continuous embeddings (rather than bins/ranks) necessary for better reconstruction and representation learning in single-cell data?
- How much does the specific tokenizer (gene ranking vs. expression binning) contribute to the loss of information compared to raw counts?

## Connections
### Related Papers
- **[[scGPT]]**: Cui et al., 2024 (The model evaluated).
- **[[Geneformer]]**: Theodoris et al., 2023 (The model evaluated).
- **[[scVI]]**: Lopez et al., 2018 (Baseline generative model).
- **[[Harmony]]**: Korsunsky et al., 2019 (Baseline integration method).
- **[[scBERT]]**: Yang et al., 2022 (Another foundation model mentioned).

### Related Concepts
- [[Foundation Models]]
- [[Single-cell RNA-seq]] (scRNA-seq)
- [[Zero-shot Learning]]
- [[Masked Language Modeling]] ([[MLM]])
- [[Batch Effect Correction]]
- [[Embedding Space]]

### Potential Applications
- **Benchmarking Standards**: Establishing a standard suite of "unseen" datasets for evaluating future single-cell foundation models.
- **Model Development**: Moving away from pure NLP-style masking toward pretraining objectives that better capture gene regulatory networks and continuous expression values.

## Notes
-