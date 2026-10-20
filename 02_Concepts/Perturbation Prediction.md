---
title: Perturbation Prediction
aliases: [Perturbation Modeling, In-silico Perturbation]
tags:
  - concept
  - AIVC
  - perturbation
  - learning-path
category: Core Concept
importance: critical
date_created: 2026-01-16
last_updated: 2026-10-20
---

# Perturbation Prediction

## Definition
> Perturbation prediction is the task of forecasting how cells will respond to genetic, chemical, or environmental interventions using computational models trained on experimental perturbation data.

## Key Ideas
- Predict gene expression changes after intervention
- Enable in-silico screening of perturbations
- Identify therapeutic targets
- Understand gene function and regulation

## Types of Perturbations

### Genetic Perturbations
- **CRISPR knockout**: Nuclease-mediated DNA editing that can disrupt gene function
- **CRISPR interference (CRISPRi)**: dCas9-based transcriptional repression; typically knockdown rather than DNA knockout
- **CRISPR activation (CRISPRa)**: Gene overexpression
- **RNAi**: Gene knockdown
- **Combinatorial**: Multiple genes simultaneously

### Chemical Perturbations
- Drug treatments
- Small molecule screens
- Dose-response studies

### Environmental
- Cytokine stimulation
- Stress conditions
- Microenvironment changes

## Mathematical Formulation

### Problem Setup
Given:
- Cell state before perturbation: $\mathbf{x} \in \mathbb{R}^{G}$
- Perturbation: $p$ (e.g., gene knockout)

Predict:
- Cell state after perturbation: $\mathbf{x}' = f(\mathbf{x}, p; \theta)$

### Common Objectives
$$\mathcal{L} = \|\mathbf{x}' - \hat{\mathbf{x}}'\|_2^2 + \lambda \cdot \text{regularization}$$

This is a schematic supervised objective. Destructive scRNA-seq generally provides unpaired before/after cells, so individual counterfactual targets are not observed; training and evaluation may use population summaries or distributional objectives.

## Key Methods

| Method | Type | Key Idea |
|--------|------|----------|
| [[01_Papers/GEARS\|GEARS]] | GNN | Gene interaction graph |
| [[01_Papers/CPA\|CPA]] | Adversarial autoencoder | Compositional disentanglement |
| scGPT | Transformer | Foundation model fine-tuning |
| CellOT | Optimal transport | Cell state transitions |

## Data Sources

### [[02_Concepts/Perturb-seq|Perturb-seq]] Datasets
- **Norman 2019**: CRISPRa, K562 cells
- **Replogle 2022**: Genome-wide CRISPRi, K562
- **Dixit 2016**: Original [[02_Concepts/Perturb-seq|Perturb-seq]]

### Benchmarks
- Virtual Cell Challenge (Arc Institute)
- GEARS benchmark
- Open Problems in Single-Cell

## Evaluation Metrics
- MSE/MAE on held-out perturbations
- Pearson correlation
- Top-20 DE gene prediction
- Perturbation direction accuracy

## Applications in AIVC
- Drug target identification
- Combination therapy design
- Gene function annotation
- Disease mechanism understanding
- Cell reprogramming

## Challenges
1. **Distribution shift**: Unseen perturbations
2. **Combinatorial explosion**: Multi-gene perturbations
3. **Context dependence**: Cell type specificity
4. **Temporal dynamics**: Time-course responses
5. **Off-target effects**: Unintended consequences

## Related Concepts
- [[02_Concepts/Gene Regulatory Networks|Gene Regulatory Networks]]
- [[02_Concepts/Causal Inference|Causal Inference in Biology]]
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]

## Key Papers
- [[01_Papers/GEARS|GEARS]]
- [[01_Papers/CPA|CPA]]
- [[01_Papers/scGPT|scGPT perturbation fine-tuning]]

## Tools & Implementations
- [GEARS](https://github.com/snap-stanford/GEARS)
- [CPA](https://github.com/facebookresearch/CPA)
- [Pertpy](https://github.com/theislab/pertpy)

## Verification (2026-10-20)

Corrected the distinction between CRISPR knockout and transcriptional repression. CPA uses a compositional perturbation autoencoder; a latent representation alone does not make a method a VAE. [CRISPRi original study](https://doi.org/10.1016/j.cell.2013.02.022); [CPA original study](https://doi.org/10.15252/msb.202211517).

## Leave-one-context-out evaluation

LOCO means leave-one-context-out in the cited benchmarking context. A context can be a cell type, cell line or another grouping defined by the study. Hold out the whole specified context, and report which perturbations and other covariates remain seen during training. LOCO is distinct from holding out perturbation identities or entire studies.
