---
title: Conditional Monge Gap enables generalizable single-cell perturbation modelling
aliases: []
authors:
  - Alice Driessen
  - Dhruva Abhijit Rajwade
  - Benedek Harsanyi
  - Marianna Rapsomaniki
  - Jannis Born
year: 2026
journal: Nature Machine Intelligence
doi: 10.1038/s42256-026-01242-8
url: https://doi.org/10.1038/s42256-026-01242-8
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2026-06-22
date_read:
---

# Conditional Monge Gap enables generalizable single-cell perturbation modelling

## Quick Summary
> The paper introduces the Conditional Monge Gap (CMonge), a principled, parameter-efficient neural optimal transport framework designed to model single-cell perturbation responses. Unlike existing methods that require separate models for each condition, CMonge learns a single global transport map conditioned on arbitrary covariates (e.g., drug identity, dose, or combinations). By leveraging shared structure across perturbations, CMonge achieves competitive performance to condition-specific models, enables cross-task learning, and demonstrates strong generalizability to unseen drug treatments using only chemical structure (SMILES) or mode-of-action (MoA) embeddings.

## Key Points
- Existing optimal transport approaches for single-cell perturbation modeling are often unconditional, requiring distinct models for each condition, which is computationally expensive and hinders generalizability to unseen conditions.
- CMonge employs a conditional loss that learns transport maps through a global estimator.
- The model exhibits strong generalizability to out-of-sample (OOS) conditions (unseen drugs and doses).
- CMonge is parameter-efficient compared to single-cell foundation models while successfully capturing underlying cellular heterogeneity.
- The framework performs well across different modalities, including gene expression (SciPlex dataset) and protein imaging (4i dataset).

## Methods
### Data
- **SciPlex:** Single-cell gene expression profiles from three human cancer cell lines exposed to 187 compounds at four different doses.
- **4i:** Iterative indirect immunofluorescence imaging dataset containing 40-plex protein measurements from two melanoma lines treated with 35 cancer therapies (including combinatorial treatments).

### Model Architecture
- **CMonge:** A conditional OT framework leveraging the Monge Gap regularizer for cost optimality with respect to squared Euclidean distance.
- Uses multi-layer perceptrons (MLP) with Gaussian error linear unit (GELU) activations.
- Conditions are encoded using drug structure (RDKit fingerprints) or MoA (data-driven multidimensional-scaling embeddings).
- For combinatorial perturbations, a DeepSets layer with average pooling is used for permutation-invariant encoding.

### Training Strategy
- Optimized via AdamW.
- Trained by minimizing the Sinkhorn divergence alongside the Monge Gap regularizer.
- Uses a batch-sampling approach where each batch corresponds to one context.

## Results
| Metric | Value (e.g., R²) | Baseline |
|--------|-------|----------|
| R² (CMonge-Dose-IS) | ~0.97 (SciPlex @ 10,000nM) | Monge-Dose-IS (~0.69) |
| R² (CMonge-DD-MoA-OOS) | 0.900 (Avg) | chemCPA-DD-OOS (0.760) |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Workflow and concept of CMonge vs. existing local map models. |
| Fig 2  | Comparison of conditional/unconditional models in In-Sample (IS) setting; pathway enrichment. |
| Fig 3  | Performance comparison on 4i dataset. |
| Fig 4  | Out-of-sample (OOS) results for dose and drug-dose contexts on SciPlex. |

## Critical Analysis
### Strengths
- Highly parameter-efficient relative to massive foundation models.
- Demonstrates effective generalization to unseen conditions, a major hurdle in current perturbation modeling.
- Explicitly models cellular heterogeneity, which is crucial for biological applications like drug repurposing and toxicity assessment.

### Weaknesses
- Performance on sparsely sampled drug classes or extremely high doses can be limited as they may induce transcriptional states outside the observed support.
- Current pooling strategy for combinatorial treatments might not fully capture complex higher-order synergistic interactions.

### Questions
- How would CMonge perform on even larger, more diverse datasets that include non-cancerous primary cells or complex patient-derived organoid models?
- Could more sophisticated architectures, such as attention-based pooling, significantly improve the capturing of synergistic combinatorial effects?

## Connections
### Related Papers
- Uscidda & Cuturi (2023): The Monge Gap.
- Lotfollahi et al. (2019): scGen (landmark autoencoder method).
- Bunne et al. (2023): CellOT (OT-based perturbation modeling).

### Related Concepts
- [Optimal Transport (OT)]
- [Neural Optimal Transport]
- [Single-cell perturbation modeling]
- [Zero-shot prediction]

### Potential Applications
- Accelerating drug discovery and repurposing.
- Predicting patient-specific responses to complex therapies.
- Understanding mechanisms of drug resistance at a single-cell level.

## Notes
- The paper highlights that the gap between structure-based (RDKit) and effect-driven (MoA) embeddings narrows as the number of training conditions increases, supporting the value of scaling datasets.