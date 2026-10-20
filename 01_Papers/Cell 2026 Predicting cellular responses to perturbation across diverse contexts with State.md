---
title: Predicting cellular responses to perturbation across diverse contexts with State
aliases:
  - STATE
authors:
  - Abhinav K. Adduri
  - Dhruv Gautam
  - Beatrice Bevilacqua
  - Mohsen Naghipourfar
  - Alishba Imran
  - Rohan Shah
  - Noam Teyssier
  - Rishi Verma
  - Christopher Carpenter
  - Basak Eraslan
  - Francis Chalissery
  - Rajesh Ilango
  - Vishvak Subramanyam
  - Chiara Ricci-Tam
  - Sanjay Nagaraj
  - Aidan Winters
  - Mingze Dong
  - Stefanie Fellinger
  - Adam Krejci
  - Tilmann Burckstummer
  - Sravya Tirukkovular
  - Jeremy Sullivan
  - Brian S. Plosky
  - Nicholas D. Youngblut
  - Jure Leskovec
  - Luke A. Gilbert
  - Silvana Konermann
  - Patrick D. Hsu
  - Alexander Dobin
  - Dave P. Burke
  - Hani Goodarzi
  - Yusuf H. Roohani
year: 2026
journal: Cell
doi: 10.1016/j.cell.2026.07.052
url: https://doi.org/10.1016/j.cell.2026.07.052
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2025-05-14
date_read:
---
Earlier preprint/model note: [[State]].


# Predicting cellular responses to perturbation across diverse contexts with State

> [!info] Verification scope — 2026-10-20
> [Source record](https://pubmed.ncbi.nlm.nih.gov/42673963/). The 2026 Cell publication and author record are confirmed; [[State]] is the earlier preprint/model note. This pass does not verify every final-version metric or its improvement denominator. Do not interpret held-out-context transfer as evidence of arbitrary unseen-perturbation prediction.

## Quick Summary
> State is a multi-scale machine learning architecture designed to predict transcriptomic responses to cellular perturbations while accounting for biological heterogeneity and technical noise. The framework integrates two complementary modules: a State Transition (ST) model, a transformer-based architecture that utilizes self-attention to learn distributional shifts in gene expression across sets of cells, and a State Embedding (SE) model, which learns generalizable cell representations from massive observational single-cell datasets. State demonstrates superior performance over existing baseline models in generalization tasks, including zero-shot prediction in held-out cellular contexts and cross-dataset transfer, and is complemented by Cell-Eval, a standardized, biologically interpretable framework for benchmarking perturbation prediction models.

## Key Points
- Introduced State, a multi-scale model using [[02_Concepts/Transformers for Biology|Transformer]] architectures to predict perturbation-induced transcriptomic shifts.
- Employs a dual-module system: State Transition (ST) for population-level mapping and State Embedding (SE) for robust cell representations.
- Developed Cell-Eval, a rigorous and comprehensive framework for evaluating perturbation prediction performance using biologically relevant metrics.
- Outperforms traditional baselines (e.g., [[scVI]], [[CPA]], [[GEARS]], [[scGPT]]) on both drug and genetic perturbation datasets.
- Successfully enables context-specific *in silico* experimentation and simulation of complex drug-drug combinatorial effects.

## Methods
### Data
- Tahoe-100M (drug perturbations in 50 cell lines, ~100M cells).
- Parse-PBMC (cytokine signaling perturbations in 18 cell types, 12 donors).
- Replogle-Nadig (genetic/CRISPR perturbations, 2024 perts, 4 cell lines).
- Pre-training SE on ~167 million human cells from various repositories ([[05_Tools/Methods and Data Resources#scBaseCount|scBaseCount]], [[05_Tools/Methods and Data Resources#CELLxGENE|CZ CELLxGENE]]).

### Model Architecture
- [[01_Papers/Cell 2026 Predicting cellular responses to perturbation across diverse contexts with State#Model Architecture|State Transition (ST) model]]: Transformer neural network performing bidirectional self-attention across sets of control and perturbed cells to predict response without explicit distributional assumptions.
- [[01_Papers/Cell 2026 Predicting cellular responses to perturbation across diverse contexts with State#Model Architecture|State Embedding (SE) model]]: A bidirectional transformer encoder-decoder trained on large-scale observational data, using protein language model embeddings (ESM-2) for genes.
- Loss function: Maximum Mean Discrepancy ([[02_Concepts/Maximum Mean Discrepancy|MMD]]) to match probability distributions between predicted and observed perturbed cell sets.

### Training Strategy
- Training on covariate-matched sets of cells to control for batch effects.
- Multi-stage approach: Pre-training the SE model on observational data, followed by ST model training/fine-tuning on perturbation datasets.
- Utilization of [[05_Tools/Methods and Data Resources#PyTorch Lightning|PyTorch Lightning]] with distributed data parallel (DDP) training and mixed precision (AMP/bf16).

## Results
The final [Cell abstract](https://pubmed.ncbi.nlm.nih.gov/42673963/) reports more than 30% improvement in perturbation-effect discrimination on large datasets and improved differential-expression identification relative to the tested baselines. It also specifies 167 million observational cells for embedding training.

The former 66%/91% table lacked a verified comparator, metric normalization and split for the final article and has been removed. These relative gains are not absolute prediction accuracies and must not be generalized to all contexts.

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Schematic of the State model architecture, highlighting the ST and SE modules and the use of cell sets. |
| Fig 2  | Benchmarking results for State across various perturbation datasets and Cell-Eval performance metrics. |
| Fig 3  | Evaluation of State embeddings (SE) and zero-shot generalization capabilities across novel contexts. |
| Fig 4  | Demonstration of State detecting cell-type-specific differential expression and viability predictions. |
| Fig 5  | *In silico* experimentation applications, including gene program response and drug synergy simulation. |

## Critical Analysis
### Strengths
- Excellent generalization to held-out cellular contexts, significantly outperforming linear and standard autoencoder baselines.
- Explicit modeling of cellular heterogeneity through self-attention across cell sets rather than single-cell point estimates.
- Strong theoretical grounding showing State captures the continuous Optimal Transport (OT) map.
- The inclusion of a formal benchmarking framework (Cell-Eval) provides a standard for the field.

### Weaknesses
- Currently limited to predicting responses for a set of highly variable genes rather than the full transcriptome.
- Performance on "subtler" perturbations is more sensitive to dataset quality and size compared to high-magnitude drug effects.
- Model requires substantial pre-training data (167 million cells for SE) which may not be accessible to all research groups.

### Questions
- How does the model perform on extremely rare cell types where cell set construction (target size S=768) might be difficult?
- Can the architecture be adapted to incorporate spatial transcriptomics information?

## Connections
### Related Papers
- [[GEARS]] (Roohani et al., 2023)
- [[scVI]] (Lopez et al., 2018)
- [[CPA]] (Lotfollahi et al., 2023)
- [[scGPT]] (Cui et al., 2024)
- [[scFoundation]] (Hao et al., 2024)

### Related Concepts
- [[Optimal Transport]]
- [[02_Concepts/Transformers for Biology|Self-Attention]]
- [[02_Concepts/scRNA-seq|Transcriptomics]]
- [[Perturb-seq]]

### Potential Applications
- Drug repurposing by predicting perturbation responses in previously unstudied cancer cell lines.
- Designing patient-specific treatment strategies by simulating drug-drug interactions.
- Hypothesis generation for regulatory mechanisms by probing *in silico* model responses.

## Notes
-