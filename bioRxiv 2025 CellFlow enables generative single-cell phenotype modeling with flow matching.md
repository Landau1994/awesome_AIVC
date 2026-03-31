---
title: CellFlow enables generative single-cell phenotype modeling with flow matching
aliases:
  - CellFlow
authors:
  - Dominik Klein
  - Jonas Simon Fleck
  - Daniil Bobrovskiy
  - Fabian J. Theis
  - J. Gray Camp
year: 2025
journal: bioRxiv
doi: 10.1101/2025.04.11.648220
url: https://doi.org/10.1101/2025.04.11.648220
tags:
  - paper
  - AIVC
  - single-cell
  - flow-matching
  - generative-modeling
status: unread
rating:
date_added: 2025-05-22
date_read:
---

# CellFlow enables generative single-cell phenotype modeling with flow matching

## Quick Summary
CellFlow is a flexible generative framework based on flow matching and optimal transport designed to model and predict single-cell transcriptomic phenotypes induced by complex, combinatorial perturbations. By leveraging a neural ordinary differential equation (ODE) and a permutation-invariant condition encoder, CellFlow accurately extrapolates to unseen biological contexts—including cytokine stimulations, drug treatments, and gene knockouts—across diverse systems ranging from peripheral blood cells to developing zebrafish embryos and brain organoids.

## Key Points
- **Generative Framework:** Uses flow matching to learn a conditional vector field that transforms a source distribution (e.g., control cells) into a perturbed target distribution.
- **Optimal Transport (OT) Integration:** Pairs unperturbed and perturbed cells during training to minimize displacement cost, which helps the model distinguish inherent cellular heterogeneity from perturbation-induced changes.
- **Scalability:** Demonstrated on a massive dataset of 10 million PBMCs, showing a clear scaling law where performance improves with the number of training conditions.
- **Flexibility:** Handles various classes of interventions (drugs, genetics, morphogens) and covariates (dosage, timing) using pre-trained embeddings like ESM2 for proteins and molecular fingerprints for drugs.
- **Biological Discovery:** Successfully performed a "virtual organoid protocol screen," identifying previously untested treatment regimens with strong effects on development.

## Methods
### Data
- **10M PBMCs:** Cytokine screen across 12 donors and 90 cytokines.
- **ZSCAPE:** Zebrafish single-cell atlas of 23 gene knockouts across 5 developmental time points.
- **sciPlex3 & combosciplex:** Large-scale drug screening datasets (A549 and MCF7 cell lines).
- **iNeurons & Brain Organoids:** Combinatorial morphogen screens for cell fate engineering.

### Model Architecture
- **Condition Encoder:** Encodes perturbations (ESM2 for genes/proteins, fingerprints for drugs), perturbation covariates (dosage/timing), and sample covariates (cell line/batch).
- **Aggregator:** Uses Multi-head Attention or DeepSets for permutation-invariant combination of multiple interventions.
- **Flow Matching Module:** A neural vector field (parameterized as an MLP) that guides the transformation of cell states in a latent space (PCA or VAE).

### Training Strategy
- **Simulation-free Training:** Leverages flow matching for stable and fast optimization of the neural ODE.
- **Minibatch OT:** Approximates optimal transport couplings within training batches to "straighten" the flow paths.
- **Unbalanced OT (UOT):** Implemented to handle mass variations, such as cell depletion or proliferation caused by perturbations.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Mean DEG R-squared (PBMC) | ~0.76 | 0.60 (Best Baseline) |
| Energy Distance (Zebrafish) | ~2x improvement | Identity/Mean models |
| Energy Distance (iNeurons) | ≥2.5x improvement | CPA / biolord |
| Median R-squared (Gene Overexpression) | Highest overall | GEARS / scGPT |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of CellFlow architecture: condition encoding, aggregator, and flow matching module. |
| Fig 2  | Validation on 10M PBMCs; shows scaling laws and donor-specific cytokine response predictions. |
| Fig 3  | Application to zebrafish development; predicting knockout effects across developmental stages. |
| Fig 4  | Benchmarking on drug screens (sciPlex3) and gene overexpression (GEARS dataset). |
| Fig 5  | Combinatorial morphogen treatment modeling in human iNeurons and interaction scores. |
| Fig 6  | Virtual organoid protocol screen; integrating multiple datasets to predict 23k new protocols. |

## Critical Analysis
### Strengths
- **Distributional Modeling:** Unlike models that only predict mean shifts (e.g., CPA), CellFlow captures the full heterogeneous distribution of cell states.
- **High Scalability:** Handles millions of cells and hundreds of conditions efficiently.
- **Modular Design:** Can easily incorporate different cell embeddings (PCA vs. VAE) and perturbation encoders.

### Weaknesses
- **Embedding Reliance:** Prediction of entirely unseen individual perturbations (out-of-distribution) depends heavily on the quality of pre-trained biological embeddings (ESM2, fingerprints).
- **Subtle Effects:** Like many deep learning models, it struggles with predicting very subtle expression shifts compared to high-magnitude changes.

### Questions
- How would the model perform with multi-modal readouts (e.g., CITE-seq or ATAC-seq)?
- Can the learned latent condition space be used to discover fundamentally new biological "principles" of perturbation?

## Connections
### Related Papers
- **CPA (Lotfollahi et al., 2023):** Compositional Perturbation Autoencoder (baseline).
- **GEARS (Roohani et al., 2023):** Predicting transcriptional outcomes of multigene perturbations.
- **Flow Matching (Lipman et al., 2023):** The underlying generative modeling technique.

### Related Concepts
- [[Optimal Transport]]
- [[Neural Ordinary Differential Equations]]
- [[Flow Matching]]
- [[Single-cell Perturbational Proteomics]]

### Potential Applications
- **Drug Discovery:** Prioritizing drug combinations for specific patient backgrounds.
- **Regenerative Medicine:** Optimizing multi-step differentiation protocols for organoid engineering.
- **Functional Genomics:** Predicting the impact of rare genetic variants.

## Notes
- The "virtual screen" in Fig 6 generated over 70 million "cells," showcasing the model's utility as a high-throughput simulator for experimental design.