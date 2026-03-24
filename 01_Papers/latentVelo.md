---
title: "latentVelo: Latent space RNA velocity inference"
aliases: [latentVelo]
authors: []
year: 2024
journal: bioRxiv
tags:
  - paper
  - RNA-velocity
  - deep-learning
  - latent-space
  - single-cell
status: unread
date_added: 2026-03-25
---

# latentVelo: Latent space RNA velocity inference

## Quick Summary

latentVelo performs RNA velocity inference in learned latent spaces, achieving the highest stability and coherence metrics while maintaining competitive accuracy. This method is ideal for applications requiring robust, noise-resistant predictions.

## Key Features

- **Latent Space Inference**: Learns velocity in lower-dimensional space
- **Highest Stability**: ICCoh = 0.99 (best stability metric)
- **Robust Predictions**: Consistent across down-sampling tests
- **Intra-cluster Coherence**: Cell predictions well-aligned with neighbors

## Performance Highlights

[[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|2025 benchmarking results]]:
- **Stability**: 0.99 ICCoh score (HIGHEST - best intra-cluster coherence)
- **Accuracy**: Competitive directional correctness (~20%)
- **Down-sampling Robustness**: Excellent stability at 0.4-0.8 rates
- **Memory**: 2-5 GB (moderate)
- **Speed**: 5-15 minutes per dataset

## Advantages

✅ Highest stability/robustness
✅ Excellent neighbor coherence
✅ Resistant to technical noise
✅ Good accuracy
✅ Learned representations useful for downstream tasks

## Approach

- Learns latent space representation
- Velocity inference in latent dimension
- Latent space may capture biological structure
- Integration with VAE/autoencoder frameworks

## Limitations

⚠️ Moderate-to-low inter-method agreement
- Only 0.2-0.3 correlation with other methods
- Suggests learning somewhat different representation
⚠️ Slower than DeepVelo
⚠️ Moderate memory requirements

## Method Disagreement Insight

Important finding: Despite high internal coherence, latentVelo agrees poorly with other methods
- Suggests learning cell-type-specific dynamics
- May capture biological reality other methods miss
- Could be incorporated into ensemble approaches

## Related Methods

- [[DeepVelo]] - Faster, less stable
- [[veloVI]] - Better accuracy, less stable
- [[scvelo]] - ODE baseline
- Ensemble methods leveraging latentVelo stability

## Applications

- **Noise-resistant trajectory inference**
- **Paired with other methods in ensembles**
- **Learning representations for downstream tasks**
- **Studying developmental dynamics in noisy data**

## See Also

- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|Comprehensive benchmarking study]]
- [[veloVI]], [[DeepVelo]] - Alternative methods with different strengths

---

**Status**: Note skeleton - expand with detailed information when paper is read

**Last Updated**: 2026-03-25
