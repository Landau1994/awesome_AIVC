---
title: "veloVI: Probabilistic RNA velocity using variational inference"
aliases: [veloVI]
authors: []
year: 2023
journal: bioRxiv
tags:
  - paper
  - RNA-velocity
  - variational-inference
  - probabilistic
  - single-cell
status: unread
date_added: 2026-03-25
---

# veloVI: Probabilistic RNA velocity using variational inference

## Quick Summary

veloVI introduces a probabilistic framework for RNA velocity inference using variational inference. This method achieves the highest directional accuracy in benchmarking studies while providing uncertainty estimates for predictions.

## Key Innovation

- **Variational Inference**: Probabilistic approach to velocity
- **Uncertainty Quantification**: Provides confidence scores for predictions
- **Highest Accuracy**: 28% directional correctness (best among 14 methods)
- **Principled Framework**: Bayesian approach to biological inference

## Performance Highlights

[[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|2025 benchmarking results]]:
- **Accuracy**: 0.28 CBDir score (HIGHEST among all methods)
- **Speed**: ~15-30 minutes per dataset
- **Memory**: 2-10 GB (moderate)
- **Stability**: Good consistency across down-sampling
- **Uncertainty**: Provides credible intervals

## Advantages

✅ Highest directional accuracy
✅ Probabilistic framework (interpretable)
✅ Uncertainty quantification
✅ Handles noise explicitly
✅ Theoretically grounded

## Approach

- Variational Autoencoder architecture
- Probabilistic model of splicing dynamics
- Amortized inference for efficiency
- Integration with scVI ecosystem

## Limitations

⚠️ Slower than DeepVelo (2-20x longer)
⚠️ Higher memory requirements
⚠️ Complex model (less immediately interpretable than ODE)
⚠️ Requires careful parameter tuning

## Trade-offs

- **vs velocyto/scvelo**: Better accuracy, slower
- **vs DeepVelo**: Better accuracy, slower, higher memory
- **vs latentVelo**: Best accuracy, less stable
- **Best for**: Accuracy-critical applications

## Related Methods

- [[scvelo]] - ODE baseline for comparison
- [[latentVelo]] - Alternative deep learning approach
- [[DeepVelo]] - Faster alternative
- [[Dynamo]] - Extended framework

## Applications

- High-confidence trajectory inference
- Publication-quality velocity analysis
- Biological validation studies

## See Also

- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|Comprehensive benchmarking]]
- [[veloVAE]], [[latentVelo]] - Alternative VI/DL methods

---

**Status**: Note skeleton - expand with detailed information when paper is read

**Last Updated**: 2026-03-25
