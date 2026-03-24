---
title: "MultiVelo"
aliases:
  - multi-velo
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

# MultiVelo

## Quick Summary
> `MultiVelo` extends RNA velocity modeling to multi-omics settings (especially RNA + chromatin accessibility), improving trajectory inference with regulatory context.

## Key Points
- Integrates transcriptomic and epigenomic signals.
- Better suited for paired multi-omics data than RNA-only methods.
- Useful when regulatory context is essential for direction inference.

## Methods
### Data
- Paired single-cell multi-omics data (e.g., RNA + ATAC).

### Model Architecture
- Joint modeling of expression and chromatin dynamics for velocity.

### Training Strategy
- Learns coordinated dynamics across modalities to infer transition direction.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Multi-omics compatibility | Strong | Better fit than RNA-only methods on paired data |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Multi-omics velocity workflow |
| Fig2   | Comparison against RNA-only baselines |

## Critical Analysis
### Strengths
- Leverages regulatory signals beyond RNA alone.

### Weaknesses
- Requires paired data, which is less common and often noisier.

### Questions
- How robust is performance on sparse ATAC features?

## Connections
### Related Papers
- [[01_Papers/scvelo|scvelo]]
- [[01_Papers/veloVI|veloVI]]

### Related Concepts
- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[02_Concepts/scRNA-seq|scRNA-seq]]

### Potential Applications
- Multi-omics developmental lineage reconstruction.

## Notes
- Template-aligned draft; add canonical citation when confirmed.
