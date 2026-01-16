---
title: "CPA: Predicting Cellular Responses to Complex Perturbations in High-throughput Screens"
aliases: [CPA, Compositional Perturbation Autoencoder]
authors:
  - Mohammad Lotfollahi
  - Anna Klimovskaia Susmelj
  - Carlo De Donno
  - et al.
year: 2023
journal: Molecular Systems Biology
doi: 10.15252/msb.202211517
url: https://github.com/facebookresearch/CPA
tags:
  - paper
  - AIVC
  - perturbation
  - VAE
  - compositional
  - drug-response
  - single-cell
  - learning-path
status: unread
rating:
priority: P1
date_added: 2026-01-16
date_read:
---

# CPA: Compositional Perturbation Autoencoder

## Quick Summary
> CPA is a deep generative framework combining the interpretability of linear models with the flexibility of deep learning. It learns disentangled representations of perturbations, enabling out-of-distribution predictions for unseen drug combinations, dose-response curves, and transfer across cell types.

## Key Points
- **Compositional**: Combines perturbation effects linearly in latent space
- **Disentangled**: Separates cell state, perturbation, and covariates
- **OOD prediction**: Unseen drug combinations and doses
- **Dose-response**: Estimates continuous dose effects
- **Facebook AI + Theis lab**: Collaboration

## The Problem

### Drug Combination Challenge
- Exponential combinations: 100 drugs → 5,000 pairs
- Cannot screen all combinations experimentally
- Need computational prediction of combinations

### What CPA Solves
1. Predict effects of unseen drug combinations
2. Estimate dose-response curves
3. Transfer effects across cell types
4. Remove batch effects

## Methods

### Architecture
```
Single-cell Gene Expression
↓
Encoder (VAE)
↓
Disentangled Latent Space:
  ├── Basal state (z_basal)
  ├── Perturbation effect (z_pert)
  └── Covariates (z_cov)
↓
Compositional Combination:
  z = z_basal + z_pert1 + z_pert2 + ...
↓
Decoder
↓
Predicted Expression
```

### Key Innovation: Compositional Disentanglement

#### Latent Space Structure
| Component | Represents |
|-----------|------------|
| z_basal | Unperturbed cell state |
| z_pert | Perturbation-specific effect |
| z_cov | Covariates (batch, donor, etc.) |

#### Compositionality
- Perturbation effects add linearly in latent space
- Combination = sum of individual effects
- Enables extrapolation to unseen combinations

### Dose-Response Modeling
- Learns continuous dose-response curves
- Interpolates between doses
- Extrapolates to untested doses (with caution)

## Results

### Drug Combination Prediction
| Metric | Performance |
|--------|-------------|
| Combination prediction | State-of-the-art |
| Dose interpolation | Strong |
| Cell type transfer | Works |

### Genetic Perturbation (Perturb-seq)
- Imputed 5,329 missing combinations (97.6% of all)
- Validated on Norman et al. dataset
- Captures genetic interactions

### Key Datasets
- **sci-Plex**: 188 drugs, 3 cancer cell lines
- **Norman Perturb-seq**: CRISPRa combinations
- **Lupus IFN-β**: Patient response data

## Capabilities

### Out-of-Distribution Predictions
1. **Unseen combinations**: Predict untested drug pairs
2. **Unseen doses**: Interpolate/extrapolate dose effects
3. **Unseen cell types**: Transfer perturbation effects
4. **Unseen batches**: Remove batch effects

### Interpretable Embeddings
- Visualize drug similarity in latent space
- Identify drug clusters by mechanism
- Compare perturbation effects quantitatively

## Critical Analysis
### Strengths
- Elegant compositional framework
- Disentanglement enables interpretation
- Continuous dose modeling
- Strong empirical results
- Well-maintained code (Facebook + Theis lab)

### Weaknesses
- Linearity assumption may not always hold
- Limited to perturbations seen during training
- Requires balanced training data
- Sensitive to hyperparameters

### Questions
- When does compositionality break down?
- How to handle synergistic interactions?
- Optimal training data requirements?

## Connections
### Related Papers
- [[01_Papers/scGen|scGen]] (predecessor, latent arithmetic)
- [[01_Papers/GEARS|GEARS]] (GNN-based, knowledge graph)
- [[01_Papers/CellOT|CellOT]] (optimal transport)
- [[01_Papers/chemCPA|chemCPA]] (extension for novel drugs)

### Related Concepts
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]
- [[02_Concepts/Variational Autoencoders|Variational Autoencoders]]
- [[02_Concepts/Disentangled Representations|Disentangled Representations]]

## Tools & Code
- GitHub (Facebook): https://github.com/facebookresearch/CPA
- GitHub (Theis lab): https://github.com/theislab/cpa
- Tutorial notebooks available
- Colab demo available

## Citation
```bibtex
@article{lotfollahi2023cpa,
  title={Predicting cellular responses to complex perturbations in high-throughput screens},
  author={Lotfollahi, Mohammad and Susmelj, Anna Klimovskaia and De Donno, Carlo and others},
  journal={Molecular Systems Biology},
  volume={19},
  pages={e11517},
  year={2023}
}
```
