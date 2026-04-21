---
title: "Uncertainty Quantification for Distribution-to-Distribution Flow Matching in Scientific Imaging"
aliases: []
authors:
  - Dongxia Wu
  - Yuhui Zhang
  - Serena Yeung-Levy
  - Emma Lundberg
  - Emily B. Fox
year: 2026
journal: arXiv Preprint
doi: 
url: "https://arxiv.org/abs/2603.21717v3"
tags:
  - paper
  - AIVC
  - generative-models
  - flow-matching
  - uncertainty-quantification
  - scientific-imaging
status: unread
rating:
date_added: 2025-05-23
date_read:
---

# Uncertainty Quantification for Distribution-to-Distribution Flow Matching in Scientific Imaging

## Quick Summary
The paper introduces **Bayesian Stochastic Flow Matching (BSFM)**, a unified framework for uncertainty quantification (UQ) in distribution-to-distribution generative models, which are critical for scientific imaging tasks like predicting cellular perturbation responses. The framework disentangles **aleatoric uncertainty** (data variability) via Stochastic Flow Matching (SFM) and **epistemic uncertainty** (model uncertainty) via a scalable Bayesian method called **MCD-Antithetic**. Experimental results across cellular imaging (BBBC021, JUMP) and brain fMRI datasets demonstrate that SFM enhances model reliability (generalization), while MCD-Antithetic improves accountability by effectively detecting out-of-distribution (OOD) scenarios.

## Key Points
- **Unified Framework**: First to explore UQ specifically for distribution-to-distribution generative flow models.
- **Disentanglement**: Principled decomposition of total predictive variance into aleatoric and epistemic components using the law of total variance.
- **Reliability via SFM**: Augments deterministic flows with a learnable diffusion term to improve generalization to unseen experimental conditions.
- **Accountability via MCD-Antithetic**: Combines Monte Carlo Dropout with sample-efficient antithetic sampling to generate robust anomaly scores for OOD detection.
- **Scientific Validation**: Demonstrates superior performance in high-dimensional imaging domains (biology and neuroscience) compared to deterministic baselines like CellFlux and UNSB.

## Methods
### Data
- **BBBC021**: Chemical perturbations in MCF-7 breast cancer cells (97,504 images). Scenarios include "Unseen Perturbations" and "Intensity Shifts."
- **JUMP**: Large-scale dataset of genetic and chemical perturbations. Scenarios include "Unseen Cell Lines" and "Unseen Plates."
- **fMRI (Theory of Mind)**: Transforming resting-state brain scans to task-activated states, evaluating generalization from high-performing to low-performing subjects.

### Model Architecture
- **Velocity Network**: U-Net based architecture parameterized to learn the time-dependent velocity field.
- **Score Network**: Learns the score function $\nabla_{x_t} \log p_t(x_t|c)$ to enable the marginal-preserving SDE.
- **Conditioning**: Perturbation conditions are encoded using IMPA (Image-based Mode-of-Action).

### Training Strategy
- **Stochastic Flow Matching (SFM)**: Jointly minimizes flow matching and score matching objectives to learn a marginal-preserving SDE.
- **MCD-Antithetic**: At inference, MC-Dropout is used to sample the posterior. For each dropout mask, antithetic pairs of SDE trajectories are simulated to reduce variance and improve sample efficiency.
- **Classifier-Free Guidance**: Used to enhance conditional generation quality.

## Results
### Generalization (Reliability)
| Metric | SFM (Proposed) | CellFlux (Baseline) | UNSB (Baseline) |
|--------|----------------|---------------------|-----------------|
| FID (BBBC021 Unseen Pert.) | **33.29** | 103.73 | 88.31 |
| KID (BBBC021 Unseen Pert.) | **2.02** | 12.76 | 6.27 |
| FID (fMRI Low ToM) | **25.55** | 34.86 | 75.54 |

### OOD Detection (Accountability)
| Scenario | Metric | MCD-Antithetic (Epistemic) | TransDist (Baseline) |
|----------|--------|---------------------------|----------------------|
| BBBC021 Intensity Shift | AUROC | **0.7698** | 0.621 |
| JUMP Unseen Cell Lines | AUROC | **0.8034** | 0.6193 |
| JUMP Intensity Shift | AUROC | **0.9063** | 0.683 |

## Figures
| Figure | Description |
| ------ | ----------- |
| Fig 1  | Conceptual overview: Source distributions $p_0$ shifting to unseen $p'_0$. BSFM provides SFM for robustness and MCD-Antithetic for OOD detection. |
| Fig 2  | Schematic of the framework: (a) SFM training with noise, (b) MC-Dropout in U-Net, and (c) the Nested Sampling process with Antithetic Sampling. |
| Fig 3  | Qualitative results: Visual comparison of generated images from different methods across five unseen scientific scenarios. |

## Critical Analysis
### Strengths
- **Principled Approach**: Leverages the Fokker-Planck equation to ensure the stochastic diffusion does not degrade the learned marginals of the flow.
- **Efficiency**: Antithetic sampling significantly reduces the computational burden of nested sampling, making Bayesian UQ more practical for high-resolution images.
- **Explainability**: The decomposition allows users to distinguish between "I don't know because the data is noisy" (aleatoric) and "I don't know because I haven't seen this" (epistemic).

### Weaknesses
- **Approximation**: Relies on MC-Dropout as a proxy for the true Bayesian posterior, which may not always capture complex parameter distributions.
- **Anomaly Score Direction**: Notes a "counterintuitive" decrease in epistemic uncertainty for some extreme OOD cases, requiring a sign flip (negative trace) for detection, which suggests potential for more robust anomaly score design.

### Questions
- How would the framework perform with more expressive posterior approximations like Normalizing Flows or Variational Inference?
- Can the SFM diffusion term be dynamically adjusted based on the estimated aleatoric uncertainty during inference?

## Connections
### Related Papers
- **Lipman et al. (2022)**: *Flow Matching for Generative Modeling* (Foundation for the flow matching method).
- **Zhang et al. (2025)**: *CellFlux* (State-of-the-art baseline for cellular imaging).
- **Gal & Ghahramani (2016)**: *Dropout as a Bayesian Approximation*.

### Related Concepts
- [[Flow Matching]]
- [[Stochastic Differential Equations (SDEs)]]
- [[Out-of-Distribution (OOD) Detection]]
- [[Aleatoric vs Epistemic Uncertainty]]

### Potential Applications
- **Drug Discovery**: Flagging novel chemical compounds where the model's morphology predictions are unreliable.
- **Medical Diagnostics**: Detecting when a medical image translation model (e.g., MRI to CT) is being applied to a patient with a rare, unseen pathology.
- **Neuroscience**: Identifying subjects with atypical brain activity patterns that fall outside the training distribution.

## Notes
- The "accountability" property is specifically defined here as the capacity to detect OOD scenarios to inform domain experts.
- SFM employs a noise schedule $\gamma_t = a \sin^2(\pi t)$ to ensure noise is zero at $t=0$ and $t=1$, preserving input-output boundaries.