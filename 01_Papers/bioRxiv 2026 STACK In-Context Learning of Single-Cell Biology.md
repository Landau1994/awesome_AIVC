---
title: "STACK: In-Context Learning of Single-Cell Biology"
aliases: []
authors:
  - Mingze Dong
  - Abhinav Adduri
  - Dhruv Gautam
  - Christopher Carpenter
  - Rohan Shah
  - Chiara Ricci-Tam
  - Yuval Kluger
  - Dave P. Burke
  - Yusuf H. Roohani
year: 2026
journal: bioRxiv
doi: https://doi.org/10.64898/2026.01.09.698608
url: https://doi.org/10.64898/2026.01.09.698608
tags:
  - paper
  - AIVC
  - single-cell
  - foundation-models
  - in-context-learning
status: unread
rating:
date_added: 2026-01-09
date_read:
---

# STACK: In-Context Learning of Single-Cell Biology

## Quick Summary
STACK is a large-scale foundation model for single-cell biology trained on 149 million human cells. Unlike previous models that process cells independently, STACK utilizes a novel tabular attention architecture that processes sets of cells, allowing it to leverage the cellular context (e.g., other cells in the same batch or donor) to refine representations. This architecture enables "cell prompting," where the model performs in-context learning to predict perturbation effects or generate counterfactual cell states (e.g., predicting how a specific donor's cells would react to a drug) without gradient updates. The authors demonstrate superior zero-shot performance and use the model to generate *Perturb Sapiens*, a virtual atlas of perturbation effects across 28 tissues.

## Key Points
- **Context-Aware Architecture**: Processes cells as sets (contexts) rather than independent instances, using inter-cellular attention to improve signal-to-noise ratios and capture population-level shifts.
- **Massive Scale**: Pre-trained on [[scBaseCount]], comprising 149 million uniformly preprocessed human single cells.
- **In-Context Learning (ICL)**: Enables "cell prompting"—using a set of "prompt" cells (e.g., perturbed cells) to guide predictions on "query" cells (e.g., control cells from a new donor) without fine-tuning.
- **Trainable Tokenization**: Projects gene expression vectors into "gene module tokens" rather than tokenizing individual genes, improving scalability and capturing gene dependencies.
- **Perturb Sapiens**: Application of STACK to generate a whole-organism atlas spanning 28 tissues, 40 cell classes, and 201 perturbations.
- **Zero-Shot Performance**: Outperforms existing foundation models ([[scGPT]], [[Geneformer]], [[UCE]]) and baselines ([[scVI]]) in zero-shot classification and integration tasks.

## Methods
### Data
- **Pre-training**: [[scBaseCount]] dataset containing 149 million human cells from 19,978 SRX samples.
- **Post-training**: A curated collection of ~55 million cells, including large datasets from [[CELLxGENE]] and the [[Parse PBMC]] dataset (90 cytokine perturbations).
- **Evaluation**: Diverse datasets including [[Tabular Sapiens]], [[OpenProblems]] drug perturbation, and specific organ atlases (Kidney, Lung, etc.).

### Model Architecture
- **Input**: A collection of cells (cell set).
- **Tokenization**: A learnable linear projection maps gene expression vectors to $n=100$ "gene module tokens" per cell.
- **Transformer**: Uses a **Tabular Transformer** block consisting of:
    - **Intra-cellular Attention**: Multi-head attention (MHA) across gene tokens within a single cell.
    - **Inter-cellular Attention**: MHA across the different cells in the input set (context).
- **Decoder**: A cell-wise [[MLP]] that maps embeddings back to gene expression space (Negative Binomial distribution parameters).

### Training Strategy
- **Pre-training Objective**:
    - **Masked Gene Reconstruction**: Random subsets of genes are masked; the model reconstructs expression distributions.
    - **Distributional Regularization**: Enforces embeddings to decompose into a per-cell-set constant plus standard normal samples (Sliced Wasserstein distance) to ensure [[Linear Identifiability]].
- **Post-training (Alignment)**:
    - **Self-Distillation**: A teacher-student framework where the model learns to reconstruct held-out "target" cells from "query" cells, conditioned on "prompt" cells.
    - **Inference**: Operates as a conditional generative model (analogous to masked diffusion) to iteratively predict counterfactual cell states.

## Results
| Metric | Task | Value (STACK) | Baseline (Best Alt.) | Note |
|--------|------|---------------|----------------------|------|
| Balanced Accuracy | Zero-shot Classification | **Top Rank** | scVI / State | Top performer in 28/31 cases |
| Pearson Delta | Cytokine Prediction (Dong et al.) | **High** | Lower | +11.1% improvement over scratch |
| Pearson Delta | Drug Prediction (OpenProblems) | **High** | Lower | +45.8% improvement over scratch |
| scIB Total Score | Batch Integration | **High** | State (SE) | +1.8% improvement on observational data |
| DE Overlap Acc | Perturbation Prediction | **Top Rank** | State / scVI | Consistent superiority across datasets |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of STACK: Inputting cell sets, tabular attention architecture (intra- and inter-cellular), and inference modes (embedding vs. in-context learning). |
| Fig 2  | Benchmarking embeddings: Zero-shot classification (disease/cell type) and integration on observational datasets. Shows STACK outperforming baselines like [[scGPT]] and [[scVI]]. |
| Fig 3  | Post-training for In-Context Learning: Schematic of "cell prompting" (Prompt + Query) and results on perturbation tasks (cytokine/drug response prediction). |
| Fig 4  | *Perturb Sapiens*: Generation of a virtual whole-organism perturbation atlas. Validations against in vitro stimulation profiles (e.g., IFN-$\beta$ effects in airway epithelium). |

## Critical Analysis
### Strengths
- **Paradigm Shift**: Moving from single-row inference to set-based inference allows the model to implicitly perform denoising and batch correction using the context of the input batch.
- **In-Context Learning**: Successfully adapts the "prompting" capability of LLMs to biological data, allowing flexible query generation (e.g., "apply this drug effect to this new donor").
- **Scale**: Training on 149M cells is significantly larger than prior efforts, likely contributing to robustness.
- **Efficiency**: The "gene module" tokenization is more computationally efficient than gene-level tokenization used in [[scGPT]].

### Weaknesses
- **Complexity**: The requirement to pass "sets" of cells at inference time changes the standard workflow and might require careful construction of prompt/query sets by users.
- **Species Limitation**: Currently trained only on human data; multi-species generalization is future work.
- **Rare Cells**: The authors note that calibration for rare cell types and weak perturbation effects remains a challenge.

### Questions
- How sensitive is the model to the selection/quality of the "prompt" cells during inference? (e.g., if the prompt batch has strong technical noise).
- Can the "gene module tokens" be interpreted biologically to reveal gene regulatory networks?

## Connections
### Related Papers
- [[scGPT]]: Comparison baseline; STACK uses gene modules instead of gene tokens and adds inter-cellular attention.
- [[Geneformer]]: Comparison baseline; transformer-based embedding model.
- [[scVI]]: Variational autoencoder baseline; STACK uses a similar generative noise model (Negative Binomial) but replaces the VAE with a Transformer encoder.
- [[State]]: Specifically mentioned as a baseline for perturbation prediction; STACK outperforms it in low-data regimes.

### Related Concepts
- [[Foundation Models]]
- [[In-Context Learning]]
- [[Single-cell RNA-seq]]
- [[Tabular Deep Learning]]
- [[Perturbation Analysis]]

### Potential Applications
- **Virtual Clinical Trials**: Predicting patient-specific drug responses by using patient control cells as query and drug-perturbed reference cells as prompts.
- **Atlas Generation**: Creating reference maps for conditions that are difficult to perturb experimentally (e.g., specific human tissues).
- **Data Integration**: Zero-shot harmonization of datasets from different donors or technologies.

## Notes
- The "cell prompting" mechanism is conceptually very similar to "in-context learning" in LLMs, but applied to continuous biological vectors rather than discrete text tokens.
- The use of Sliced Wasserstein distance for latent regularization is an interesting choice to enforce linear identifiability, linking deep learning with causal identification theory.