---
title: "scVelo: RNA velocity analysis with dynamical models"
aliases: [scvelo, Bergen 2020]
authors:
  - Volker Bergen
  - Marius Lange
  - Stefan Peidli
year: 2020
journal: Nature Methods
tags:
  - paper
  - RNA-velocity
  - ODE-based
  - single-cell
  - trajectory-inference
status: unread
date_added: 2026-03-25
---

# scVelo: RNA velocity analysis with dynamical models

## Quick Summary

Bergen et al. present **scVelo**, a major improvement on velocyto introducing dynamical models for RNA velocity inference. The dynamical model better captures gene expression kinetics and provides more accurate velocity estimates than the original constant-velocity model.

## Key Improvements

- **Dynamical Model**: Captures changing transcription/degradation rates
- **Better Accuracy**: Significant improvement over velocyto
- **Scalability**: Efficient implementation for large datasets
- **Interpretability**: Clear biological meaning for parameters

## Innovation

- Gene-specific kinetic parameters (splicing rate, degradation rate)
- Likelihood-based parameter inference
- Phase portrait dynamics for cell state visualization
- Automatic steady-state detection

## Performance in Benchmarking

[[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|2025 benchmarking study]] shows:
- Accuracy: ~15-20% directional correctness (solid baseline)
- Stability: Good stability across down-sampling tests
- Speed: 1-10 minutes per dataset
- Memory: 1-5 GB typical
- Status: Still widely used standard method

## Advantages

✅ ODE-based (interpretable)
✅ Good accuracy/speed tradeoff
✅ Clear biological parameters
✅ Widely adopted

## Limitations

⚠️ Still lower accuracy than modern deep learning methods
⚠️ Assumptions about constant degradation rates
⚠️ Computational cost higher than velocyto

## Related Methods

- [[velocyto]] - Original method (predecessor)
- [[DeepVelo]] - Deep learning improvement
- [[veloVI]] - Variational inference approach
- [[Dynamo]] - Extended dynamics

## See Also

- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[02_Concepts/Trajectory Inference|Trajectory Inference]]
- [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|Comprehensive benchmarking]]

---

**Status**: Note skeleton - expand with detailed information when paper is read

**Last Updated**: 2026-03-25
