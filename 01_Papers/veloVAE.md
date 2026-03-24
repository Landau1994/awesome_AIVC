---
title: "veloVAE"
aliases:
  - VeloVAE
authors:
  -
year: 2022
journal: bioRxiv
doi:
url:
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2026-03-25
date_read:
---

# veloVAE

## Quick Summary
> `veloVAE` is a deep generative RNA velocity method based on variational autoencoders, designed to model transcriptional dynamics from spliced/unspliced counts in single-cell data.

## Key Points
- Uses latent-variable modeling for denoising and dynamic inference.
- Can capture nonlinear cell-state transitions.
- In the 2025 benchmark, it sometimes inferred reversed transitions.

## Methods
### Data
- Single-cell spliced/unspliced RNA count matrices.

### Model Architecture
- Variational autoencoder for latent dynamics and velocity estimation.

### Training Strategy
- Probabilistic training with latent-variable inference for denoising and trajectory dynamics.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Direction quality in benchmark | Variable | Worse stability than [[01_Papers/veloVI\|veloVI]] in some datasets |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Model overview and latent dynamics |
| Fig2   | Velocity field comparison with baselines |

## Critical Analysis
### Strengths
- Captures nonlinear dynamics in a generative framework.

### Weaknesses
- Direction inference can be unstable depending on dataset/preprocessing.

### Questions
- Which preprocessing settings most improve direction robustness?

## Connections
### Related Papers
- [[01_Papers/veloVI|veloVI]]
- [[01_Papers/DeepVelo|DeepVelo]]

### Related Concepts
- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[02_Concepts/scRNA-seq|scRNA-seq]]

### Potential Applications
- Developmental trajectory and cell fate dynamics inference.

## Notes
- Template-aligned draft; can be expanded after full reading.
