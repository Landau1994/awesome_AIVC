---
title: "cellDancer"
aliases:
  - CellDancer
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

# cellDancer

## Quick Summary
> `cellDancer` is a deep-learning RNA velocity method designed to infer transcriptional dynamics and directional transitions from single-cell expression states.

## Key Points
- Learns nonlinear velocity functions from cell states.
- Often shows strong benchmark performance in complex systems.
- Useful for differentiation processes with nonlinear trajectories.

## Methods
### Data
- Single-cell spliced/unspliced expression matrices.

### Model Architecture
- Deep neural framework for nonlinear velocity dynamics.

### Training Strategy
- Fits velocity function to reconstruct directional cell transitions.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Benchmark competitiveness | High in many settings | Often stronger than classical baselines |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | cellDancer architecture and workflow |
| Fig2   | Nonlinear velocity field examples |

## Critical Analysis
### Strengths
- Captures nonlinear dynamics beyond simple parametric assumptions.

### Weaknesses
- Compute requirements and reproducibility may vary by setup.

### Questions
- Which training settings most improve cross-dataset stability?

## Connections
### Related Papers
- [[01_Papers/DeepVelo|DeepVelo]]
- [[01_Papers/veloVI|veloVI]]

### Related Concepts
- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[02_Concepts/Trajectory Inference|Trajectory Inference]]

### Potential Applications
- Complex lineage and branch-structure dynamics modeling.

## Notes
- Template-aligned draft; complete metadata after source confirmation.
