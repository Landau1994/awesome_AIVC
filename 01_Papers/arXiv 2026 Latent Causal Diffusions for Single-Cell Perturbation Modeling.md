---
title: "Latent Causal Diffusions for Single-Cell Perturbation Modeling"
aliases: []
authors:
  - Lars Lorch
  - Jiaqi Zhang
  - Charlotte Bunne
  - Andreas Krause
  - Bernhard Schölkopf
  - Caroline Uhler
year: 2026
journal: arXiv
doi: 10.48550/arXiv.2601.15341
url: https://arxiv.org/abs/2601.15341
tags:
  - paper
  - AIVC
  - single-cell
  - causal-inference
  - generative-models
  - perturb-seq
status: unread
rating:
date_added: 2026-01-20
date_read:
---

# Latent Causal Diffusions for Single-Cell Perturbation Modeling

## Quick Summary
This paper introduces **Latent Causal Diffusion (LCD)**, a generative framework that models single-cell gene expression as a stationary stochastic process governed by stochastic differential equations (SDEs), observed under measurement noise. To make the learned nonlinear dynamics interpretable, the authors propose **CLIPR (Causal Linearization via Perturbation Responses)**, a method to approximate direct causal effects between genes. The framework outperforms existing deep learning and additive baselines in predicting transcriptomic responses to unseen combinatorial perturbations and successfully recovers causal gene regulatory networks in both simulations and genome-wide screens.

## Key Points
- **Generative Model (LCD):** Frames gene expression as a latent stationary diffusion process, explicitly separating biological stochasticity (diffusion) from technical measurement noise (Zero-Inflated Poisson).
- **Causal Interpretation (CLIPR):** A linearization technique that estimates a causal effect matrix $\mathbf{A}$ by analyzing how the learned drift function responds to perturbations (initial response vs. limit/steady-state response).
- **Performance:** LCD outperforms state-of-the-art methods ([[GEARS]], [[CPA]]) and additive baselines ([[SALT]], [[PEPER]]) in predicting distributional shifts (MMD) for unseen gene perturbation combinations.
- **Theoretical Guarantee:** CLIPR is provably identifiable for linear systems given sufficient perturbation diversity.
- **Biological Insight:** Applied to large-scale [[02_Concepts/Perturb-seq|Perturb-seq]] data, CLIPR identifies functional gene modules and causal links that align with known biology, disentangling direct causal effects from downstream differential expression.

## Methods
### Data
- **Type:** Single-cell CRISPR perturbation screens ([[02_Concepts/Perturb-seq|Perturb-seq]]).
- **Datasets:**
  - [[Norman et al. (2019)]]: [[K562]] cells, bi-allelic CRISPRa (gain-of-function).
  - [[Wessels et al. (2023)]]: [[THP-1]] cells, CRISPR-Cas13 (loss-of-function).
  - [[Replogle et al. (2022)]]: [[K562]] cells, genome-wide CRISPRi (loss-of-function).
- **Preprocessing:** Selection of 1,000 highly variable genes; outliers filtered based on mitochondrial RNA and total counts.

### Model Architecture
- **Latent Causal Diffusion (LCD):**
  - Models the state $\mathbf{x}(t)$ via an [[Stochastic Differential Equation]] (SDE): $dx_g(t) = [f(\mathbf{x}(t))]_g dt + \sigma dW_g(t)$.
  - **Drift Function ($f$):** Parameterized by a Neural Network ([[MLP]]) with shared hidden states to capture regulatory circuitry. Perturbations are modeled as embeddings $\mathbf{e}_q$ that shift the hidden state.
  - **Measurement Model:** Observed counts $\mathbf{y}$ follow a [[Zero-Inflated Poisson]] (ZIP) distribution conditioned on the latent state $\mathbf{x}$.
- **CLIPR:**
  - Approximates the nonlinear drift $f$ with a linear system $\tilde{f}_q(\mathbf{x}) = \mathbf{A}\mathbf{x} + \mathbf{b} + \mathbf{c}_q$.
  - Uses the **Initial Perturbation Response** ($\mathbf{v}_{f_q} = f_q(\mathbf{0})$) and **Limit Perturbation Response** ($\mathbf{l}_{f_q} = \text{steady state}$) to solve for the causal matrix $\mathbf{A}$ via regularized least squares ($\mathbf{A} \approx -\mathbf{V}\mathbf{L}^+$).

### Training Strategy
- **Two-Step Inference:**
  1.  **Empirical Bayes:** Infer likelihood parameters $\pi$ and latent state densities $p(\mathbf{x})$ by maximizing the evidence of observed readouts $\mathbf{Y}_q$.
  2.  **Score Matching:** Train the drift $f$ and perturbation embeddings $\mathbf{e}_q$ to fit the inferred densities $p(\mathbf{x})$ using denoising score matching principles.
- **Optimization:** [[Adam]] optimizer; distinct losses for the implicit prior ($\mathcal{L}_{\text{IP}}$) and the diffusion drift ($\mathcal{L}_{\text{D}}$).

## Results
**Comparison on combinatorial perturbation prediction (Norman et al. & Wessels et al. datasets):**

| Metric | LCD (Ours) | SALT (Additive) | CPA (DL) | GEARS (DL) | Wessels et al. Win Rate* |
|--------|-------|----------|-----|-------|--------------------------|
| **MMD** (Distributional Fit) | **Lowest** | Higher | Higher | Higher | **83.3%** vs Wessels |
| **RMSE** (Mean Expression) | **Lowest** | Competitive | Higher | Higher | N/A |
| **Win Rate (vs Baselines)** | N/A | N/A | N/A | N/A | **100%** vs CPA |

*\*Win Rate indicates the percentage of perturbations where LCD achieved lower error than the baseline.*

**Causal Discovery (Simulated Linear Systems):**
- **AUROC:** > 0.9 for Erdős-Rényi structures when observing $d$ perturbations.
- **Accuracy:** Performance improves monotonically with the number of perturbations observed.

## Figures

| Figure    | Description                                                                                                                                                                                                                                                                               |
| --------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Fig 1** | **Overview of LCD and CLIPR.** (A) Generative model structure (Latent SDE + ZIP observation). (B) Neural network architecture for drift $f$. (C) Logic of CLIPR: Linearizing dynamics via initial and limit perturbation responses.                                                       |
| **Fig 2** | **Predictive Performance.** Comparisons against baselines (SALT, PEPER, CPA, GEARS) on unseen combinatorial perturbations. LCD shows superior MMD (distributional accuracy) and RMSE. Stratification by genetic interaction type (Synergy, Suppression, etc.).                            |
| **Fig 3** | **Causal Recovery in Simulations.** Validation of CLIPR on linear systems. Heatmaps showing recovery of ground-truth causal matrices ($\mathbf{A}$) and shift vectors vs. learned estimates.                                                                                              |
| **Fig 4** | **Genome-wide Application.** LCD-CLIPR applied to Replogle et al. data. (A) Gene clusters enriched for GO terms. (B) Inferred causal adjacency matrix. (E-F) Validation: predicted causal links strongly correlate with downstream differential expression (high lift/conviction scores). |

## Critical Analysis
### Strengths
- **Principled Noise Separation:** Distinctly models technical noise (ZIP) versus biological variability (diffusion), addressing a common limitation in scRNA-seq modeling.
- **Interpretable Dynamics:** Unlike black-box DL models, LCD learns an explicit dynamical system, and CLIPR provides a mathematically grounded way to extract a causal graph from it.
- **Generalization:** Demonstrates strong ability to predict distributional shifts for unseen perturbation combinations (out-of-distribution generalization).
- **Theoretical Rigor:** Provides theorems for the identifiability of causal effects in linear systems using CLIPR.

### Weaknesses
- **Computational Cost:** Inference is computationally intensive. Step 1 (inferring implicit priors) took ~9 hours, compared to ~1 hour for training the drift (on the tested hardware).
- **Linear Approximation:** CLIPR linearizes the drift to extract causal effects. While effective, it may simplify complex nonlinear regulatory mechanisms, although the authors argue it captures the "average" effect well.
- **Scale:** Experiments focused on 1,000 highly variable genes. Scaling to full transcriptomes (20k+ genes) might be computationally prohibitive due to the $\mathcal{O}(d^2)$ or $\mathcal{O}(d^3)$ complexity of some operations.

### Questions
- How does the stationarity assumption hold up for transient cellular states (e.g., differentiation trajectories) versus the equilibrium states modeled here?
- Can CLIPR be extended to handle higher-order nonlinear causal effects without full linearization?

## Connections
### Related Papers
- [[GEARS]] (Roohani et al., 2024): Graph neural network for perturbation prediction.
- [[CPA]] (Lotfollahi et al., 2023): Compositional Perturbation Autoencoder.
- [[scDiffEq]] (Vinyard et al., 2023): Neural ODE/SDE approaches for single-cell dynamics.
- [[Norman et al. (2019)]] & [[Replogle et al. (2022)]]: Source papers for the [[02_Concepts/Perturb-seq|Perturb-seq]] datasets.

### Related Concepts
- [[Stochastic Differential Equations]]
- [[Causal Inference]] (Structural Causal Models)
- [[Score Matching]]
- [[Gene Regulatory Networks]] (GRN)
- [[02_Concepts/Perturb-seq|Perturb-seq]]

### Potential Applications
- **In Silico Screening:** Predicting the effects of novel drug combinations or genetic knockouts to reduce experimental costs.
- **GRN Mapping:** Inferring direct causal regulatory networks from snapshot data to understand disease mechanisms.
- **Off-Target Identification:** Distinguishing between direct perturbation targets and downstream regulatory cascades.

## Notes
- The paper notably distinguishes between "Differential Expression" (total effect, downstream correlation) and "Causal Effect" (direct regulation). CLIPR specifically targets the latter.
- The date of the paper is listed as Jan 2026, suggesting this is a future-dated preprint or dataset transcription.