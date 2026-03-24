---
title: "UniTVelo"
aliases:
  - uniTvelo
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

# UniTVelo

## Quick Summary
> `UniTVelo` is an RNA velocity method that learns a unified velocity trend with reduced dependence on strict steady-state assumptions.

## Key Points
- Aims for robust direction inference under diverse dynamics.
- Balances modeling flexibility and computational practicality.
- Commonly evaluated against scVelo/veloVI baselines.

## Methods
### Data
- Spliced and unspliced single-cell RNA counts.

### Model Architecture
- Unified trend modeling of transcriptional progression.

### Training Strategy
- Fits dynamic trends to infer cell-level directional velocity.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Direction robustness | Moderate to good | Typically competitive with classical baselines |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Unified trend formulation |
| Fig2   | Velocity field comparisons |

## Critical Analysis
### Strengths
- Reduced reliance on strict steady-state assumptions.

### Weaknesses
- Performance may vary across highly heterogeneous datasets.

### Questions
- Which gene-selection strategy best supports stable trend fitting?

## Connections
### Related Papers
- [[01_Papers/scvelo|scvelo]]
- [[01_Papers/veloVI|veloVI]]

### Related Concepts
- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[02_Concepts/Trajectory Inference|Trajectory Inference]]

### Potential Applications
- General-purpose velocity analysis in varied differentiation settings.

## Notes
- Template-aligned draft; fill metadata after source verification.
