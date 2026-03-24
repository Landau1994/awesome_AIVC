---
title: "Dynamo"
aliases:
  - dynamo
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

# Dynamo

## Quick Summary
> `Dynamo` is a framework for modeling vector-field dynamics in single-cell data, supporting RNA velocity analysis and continuous trajectory reconstruction.

## Key Points
- Learns vector fields in transcriptomic state space.
- Supports downstream tasks such as fate prediction and fixed-point analysis.
- Bridges RNA velocity and dynamical systems analysis.

## Methods
### Data
- Single-cell expression data with optional spliced/unspliced counts.

### Model Architecture
- Vector-field learning over reduced-dimensional cell-state manifolds.

### Training Strategy
- Estimates local directions, then reconstructs global dynamics.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Dynamics interpretability | High | Strong advantage over purely black-box approaches |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Vector field learning pipeline |
| Fig2   | Attractor/trajectory visualization |

## Critical Analysis
### Strengths
- Rich downstream dynamical interpretation.

### Weaknesses
- Can be sensitive to embedding and preprocessing choices.

### Questions
- How stable are inferred vector fields across random seeds and batches?

## Connections
### Related Papers
- [[01_Papers/scvelo|scvelo]]
- [[01_Papers/veloVI|veloVI]]

### Related Concepts
- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[02_Concepts/Dynamical Systems|Dynamical Systems]]

### Potential Applications
- Developmental landscape reconstruction and fate attractor analysis.

## Notes
- Template-aligned draft; enrich with official citation details later.
