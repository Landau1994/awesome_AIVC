---
title: "cell2fate"
aliases:
  - Cell2fate
authors:
  -
year:
journal:
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

# cell2fate

## Quick Summary
> `cell2fate` is a probabilistic model for transcriptomic dynamics and cell fate analysis, often used with spliced/unspliced single-cell data to infer directional transitions.

## Key Points
- Models latent dynamics with probabilistic inference.
- Emphasizes interpretability of fate-related transitions.
- May require substantial compute/memory on larger datasets.

## Methods
### Data
- Spliced/unspliced single-cell RNA count matrices.

### Model Architecture
- Probabilistic latent dynamics model for velocity and fate tendencies.

### Training Strategy
- Bayesian-style inference over latent dynamic variables.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| GPU memory footprint | High in large-data benchmarks | Higher than efficient methods such as DeepVelo |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Model components and latent state flow |
| Fig2   | Velocity/fate estimates across cell populations |

## Critical Analysis
### Strengths
- Uncertainty-aware and interpretable dynamics modeling.

### Weaknesses
- Resource consumption can limit large-scale use.

### Questions
- What are the best settings for balancing robustness and compute cost?

## Connections
### Related Papers
- [[01_Papers/Pyro-Velocity|Pyro-Velocity]]
- [[01_Papers/veloVI|veloVI]]

### Related Concepts
- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[02_Concepts/Trajectory Inference|Trajectory Inference]]

### Potential Applications
- Cell fate analysis in developmental and disease contexts.

## Notes
- Template-aligned draft; enrich with DOI/journal details later.
