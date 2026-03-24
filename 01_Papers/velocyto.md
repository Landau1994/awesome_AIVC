---
title: "velocyto: RNA velocity of single cells"
aliases: [velocyto, La Manno 2018]
authors:
  - Gioele La Manno
  - Ruslan Nematzadeh
  - Yun Yao
year: 2018
journal: Nature Methods
tags:
  - paper
  - RNA-velocity
  - foundational
  - single-cell
  - trajectory-inference
status: unread
date_added: 2026-03-25
---

# velocyto: RNA velocity of single cells

## Quick Summary

The foundational paper introducing **RNA velocity** analysis. La Manno et al. present the first method to infer transcriptomic dynamics from single-cell RNA-seq by analyzing unspliced vs spliced mRNA ratios. This seminal work enables prediction of cell fate transitions without explicit time series data.

## Key Contribution

- **First RNA Velocity Method**: Original mathematical framework
- **Unspliced/Spliced Ratio**: Novel biological insight for temporal dynamics
- **Cell Fate Prediction**: Enables trajectory inference from snapshots
- **Mathematical Model**: Simple but powerful ODE-based approach

## Impact

- Foundational for the field (~10K+ citations)
- Inspired 14+ follow-up methods
- Enables new understanding of development without time-series data
- Opens computational investigation of cell state transitions

## Key Concepts

- Splicing kinetics as transcriptional momentum
- Phase portrait analysis (spliced vs unspliced)
- Velocity vectors in transcriptomic space

## Performance Characteristics

- Accuracy: Baseline for comparison (~14% in modern benchmarks)
- Stability: Variable across datasets
- Speed: Fast (minutes)
- Interpretability: High (clear ODE model)

## Related Methods

- [[scvelo]] (Bergen et al. 2020) - Improved dynamical model
- [[DeepVelo]] - Deep learning approach
- [[Dynamo]] - Advanced dynamics

## Benchmark Comparison

[[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|Recent benchmarking (2025)]] shows:
- velocyto: ODE-based baseline
- Accuracy: ~14% average directional correctness
- Useful for initial trajectory exploration

## See Also

- [[02_Concepts/RNA Velocity|RNA Velocity]] - Concept overview
- [[02_Concepts/Trajectory Inference|Trajectory Inference]]
- [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|Comprehensive benchmarking study]]

---

**Status**: Note skeleton - expand with detailed information when paper is read

**Last Updated**: 2026-03-25
