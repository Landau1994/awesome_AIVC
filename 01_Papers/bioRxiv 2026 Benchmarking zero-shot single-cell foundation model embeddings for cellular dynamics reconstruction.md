---
title: Benchmarking zero-shot single-cell foundation model embeddings for cellular dynamics reconstruction
aliases:
  - cellLFM_dynamics_benchmark
authors:
  - Xueya Zhou
  - Zihan Wang
  - Yue Ling
  - Qinxue Tian
  - Zhenyi Zhang
  - Yongge Li
  - Luonan Chen
  - Peijie Zhou
year: 2026
journal: bioRxiv
doi: 10.64898/2026.03.10.710748
url: https://doi.org/10.64898/2026.03.10.710748
tags:
  - paper
  - AIVC
  - single-cell
  - foundation-models
  - optimal-transport
  - trajectory-inference
status: unread
rating:
date_added: 2023-10-24
date_read:
---

# Benchmarking zero-shot single-cell foundation model embeddings for cellular dynamics reconstruction

## Quick Summary
> This paper systematically benchmarks zero-shot embeddings from five large single-cell foundation models (scFMs) against a traditional highly variable gene (HVG) PCA baseline for reconstructing cellular dynamics using dynamic optimal transport. Surprisingly, the study reveals that the simple HVG baseline consistently outperforms zero-shot scFM embeddings across diverse biological datasets and dynamical tasks (backtracking, interpolation, and extrapolation). Mechanistic analyses show that scFMs tend to over-compress subtle temporal signals and linearize branched biological structures—treating temporal variation as batch-like noise—highlighting a fundamental "temporal-compression" bottleneck in current representation learning for single-cell biology.

## Key Points
- Evaluated five zero-shot scFMs ([[Geneformer]], [[Genecompass]], [[scGPT]], [[UCE]], and [[scFoundation]]) alongside an [[HVG-PCA]] baseline.
- Assessed performance across three dynamical reconstruction scenarios: backtracking (inferring progenitors), interpolation (recovering intermediates), and extrapolation (predicting future states).
- Employed multiple [[Optimal Transport]] (OT) methods: DOT, UOT, Dynamical Schrödinger Bridge, and RUOT.
- Used a shared, aligned consensus space (via Generalized Procrustes Analysis) to ensure fair comparisons between heterogeneous embedding spaces.
- Discovered that scFMs generally underperform the HVG baseline across distributional recovery, pseudotime correlation, and local velocity coherence.
- Identified that current scFM pretraining objectives inherently prioritize stable cell identity representations, thereby suppressing transient, process-specific temporal signals.

## Methods
### Data
- Five published time-series [[scRNA-seq]] snapshot datasets encompassing diverse biological processes (e.g., development, differentiation, and pathological transitions).
- Datasets include: EMT (epithelial-to-mesenchymal transition), Mouse HSPC, Veres (human pancreatic differentiation), EBdata (embryoid bodies), and HSPC (inflammatory response).
- Dataset sizes range from approximately 3,000 to 49,000 cells. Minimal QC applied to prevent processing-dependent artifacts.

### Model Architecture
- **scFMs**: Pretrained Transformer-based models including Geneformer (104M), Genecompass (126M), UCE (650M), scFoundation (100M), and scGPT (33M). [CLS] token embeddings or equivalent were extracted.
- **Baseline**: Top 2,000 highly variable genes (HVGs) reduced via Principal Component Analysis (PCA).
- **Trajectory Inference**: Dynamic Optimal Transport (DOT), Unbalanced DOT (UOT), Dynamical Schrödinger Bridge, and Regularized Unbalanced Optimal Transport (RUOT) using the `DeepROUT` package.

### Training Strategy
- The scFMs were strictly used in a **zero-shot** manner (no fine-tuning) to extract time-series cell embeddings.
- Data for each dataset was partitioned temporally to create training and held-out test sets for the three dynamical tasks. 
- OT-based models were fit on the training time points in the respective low-dimensional embedding spaces, and the inferred target states were projected into a consensus latent space using Generalized Procrustes Analysis (GPA) to compute unbiased metrics.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Distributional Recovery (Wasserstein-1 Distance) | Geneformer & scGPT performed best among scFMs, but overall higher (worse) than HVG. | HVG-PCA consistently achieved the lowest W1 distances. |
| Pseudotime Correlation (Spearman's ρ) | Variable, often artificially inflated by branch linearization. | HVG-PCA achieved the highest correlations (e.g., ρ = 0.892 in EMT interpolation). |
| Local Velocity Coherence | scFoundation showed competitive coherence in some settings, but overall lower than HVG. | HVG-PCA generally maintained the smoothest and most self-consistent dynamical flows. |
| Temporal Variance Ratio (TVR) | Significantly reduced in scFMs, indicating temporal compression. | HVG-PCA preserved higher temporal separability. |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of the benchmark workflow and evaluation pipeline, detailing embedding models, trajectory inference methods, task scenarios, and evaluation metrics (W1, Velocity Coherence, Pseudotime). |
| Fig 2  | Quantitative results showing that the zero-shot HVG baseline underperforms scFMs across Wasserstein-1 distance, pseudotime correlation, and local velocity coherence. Includes qualitative trajectory reconstructions on the EMT dataset. |
| Fig 3  | Sensitivity analyses demonstrating that the findings are robust to alignment strategies, choice of reference space, and embedding dimensionality. |
| Fig 4  | Analysis of temporal compression and impaired branch resolution. Shows that large-model embeddings artificially compress time points (low TVR) and blur distinct lineage branches (e.g., SC-β vs SC-EC cells). |
| Fig 5  | A global rank-based summary heatmap synthesizing the relative performance of all embeddings across all datasets, inference methods, and dynamical tasks. |
| Fig 6  | Conceptual diagram illustrating the "temporal-compression" bottleneck, where scFM inductive biases favor stable, general signals (identity) over transient, specific signals (dynamics). |

## Critical Analysis
### Strengths
- **Rigorous Evaluation Framework**: The use of Generalized Procrustes Analysis (GPA) to align varied embedding spaces into a consensus space prevents metric biases caused by scale and orientation differences.
- **Comprehensive Benchmarking**: Covers multiple state-of-the-art scFMs, diverse OT inference methodologies, and multiple complex biological datasets.
- **Insightful Mechanistic Explanation**: Goes beyond simply reporting performance by defining the Temporal Variance Ratio (TVR) to explain *why* scFMs fail (over-correction of dynamic signals akin to batch effect removal).

### Weaknesses
- **Zero-Shot Limitation**: The study explicitly tests zero-shot capabilities. It remains an open question whether fine-tuning these scFMs on trajectory-specific contrastive tasks would resolve the temporal compression bottleneck.
- **Inference Method Bias**: OT and diffusion-based trajectory inference tools were originally developed and tuned for PCA/HVG spaces, which might confer an inherent advantage to the baseline.

### Questions
- How would lightweight fine-tuning (e.g., via adapters or LoRA) targeting temporal contrastive objectives alter the capability of scFMs to reconstruct trajectories?
- Can we design novel pretraining objectives for scFMs that explicitly balance identity invariance (to technical noise) with sensitivity to transient state changes?

## Connections
### Related Papers
- *Optimal-Transport Analysis of Single-Cell Gene Expression Identifies Developmental Trajectories in Reprogramming* (Schiebinger et al., 2019) – Foundations of the Waddington-OT approach utilized here.
- Papers introducing the evaluated scFMs: Geneformer (Theodoris et al., 2023), scGPT (Cui et al., 2024), UCE (Rosen et al., 2023).
- Recent evaluations showing similar limitations in zero-shot scFMs for perturbation prediction (e.g., Kedzierska et al., 2025).

### Related Concepts
- [[Optimal Transport]]
- [[Single-cell Foundation Models]]
- [[Trajectory Inference]]
- [[Batch Effect Correction]] vs. Biological Variation
- [[Pseudotime]]

### Potential Applications
- Informing the development of the next generation of "dynamics-aware" foundational models in bioinformatics.
- Providing a robust pipeline (DeepROUT + GPA alignment) for comparing future dimensionality reduction and embedding techniques in time-series single-cell datasets.

## Notes
-