---
title: "Pyro-Velocity"
aliases:
  - pyro-velocity
  - pyrovelocity
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

# Pyro-Velocity

## Quick Summary
> `Pyro-Velocity` is a probabilistic RNA velocity framework implemented with Bayesian modeling tools, aiming to quantify uncertainty in inferred velocity fields.

## Key Points
- Emphasizes uncertainty-aware inference.
- Uses flexible probabilistic modeling for gene-level dynamics.
- In benchmarks, resource usage can be high on large datasets.

## Methods
### Data
- Single-cell spliced/unspliced RNA counts.

### Model Architecture
- Bayesian/probabilistic velocity model in the Pyro ecosystem.

### Training Strategy
- Posterior inference to estimate dynamics and uncertainty.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Memory usage | High on large datasets | Higher than many lightweight baselines |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Probabilistic model schematic |
| Fig2   | Uncertainty-aware velocity outputs |

## Critical Analysis
### Strengths
- Provides uncertainty estimates that can improve interpretability.

### Weaknesses
- Computational cost is often high.

### Questions
- How much accuracy gain comes from uncertainty modeling in practice?

## Connections
### Related Papers
- [[01_Papers/cell2fate|cell2fate]]
- [[01_Papers/veloVI|veloVI]]

### Related Concepts
- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[02_Concepts/scRNA-seq|scRNA-seq]]

### Potential Applications
- High-confidence trajectory analysis where uncertainty is critical.

## Notes
- Template-aligned draft; metadata can be completed after literature check.
