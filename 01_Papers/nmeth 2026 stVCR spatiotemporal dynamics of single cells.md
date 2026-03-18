---
title: "stVCR: spatiotemporal dynamics of single cells"
aliases:
  - stVCR
authors:
  - Qiangwei Peng
  - Peijie Zhou
  - Tiejun Li
year: 2026
journal: Nature Methods
doi: 10.1038/s41592-026-03010-3
url: https://doi.org/10.1038/s41592-026-03010-3
tags:
  - paper
  - AIVC
status: unread
rating:
date_added:
date_read:
---

# stVCR: spatiotemporal dynamics of single cells

## Quick Summary
> The paper introduces stVCR (spatiotemporal video cassette recorder), a generative deep-learning framework based on dynamical optimal transport that reconstructs continuous spatiotemporal trajectories—including cell differentiation, proliferation, and physical migration—from destructive, unpaired spatial transcriptomic snapshots. By uniquely integrating rigid-body transformation invariant optimal transport, unbalanced population matching, and biological priors, stVCR aligns temporal slices from different coordinate systems and enables interpretable downstream analysis of complex gene-space interactions.

## Key Points
- Uses a unified [[Optimal Transport]] (OT) framework to simultaneously align spatial coordinates and reconstruct cell transition, migration, and growth dynamics.
- Implements rigid-body transformation invariant OT to account for tissue rotation and translation across different biological replicates.
- Models unbalanced distributions to correctly infer cell proliferation (division) and apoptosis over time.
- Permits the integration of known biological priors (e.g., cell-type transitions) and spatial structure-preserving priors for robust inference over sparse time points.
- Enables downstream identification of migration-driver and growth-driver genes by computing directional derivatives of the learned velocity and growth functions.

## Methods
### Data
- **Simulated datasets**: Synthetic gene circuits with toggle switch dynamics, incorporating cell proliferation and spatial migration.
- **Axolotl brain regeneration**: Time-series [[Stereo-seq]] data (2 to 20 days post-injury) to reconstruct wound response and regeneration.
- **3D Drosophila embryo**: [[Stereo-seq]] data spanning E7–9 h to E9–10 h.

### Model Architecture
- **Dimensionality Reduction**: An autoencoder projects the top 2,000 highly variable genes to a 10-dimensional embedded space.
- **Neural ODEs**: Three separate Multilayer Perceptrons (MLPs)—each with 6 layers and 128 neurons per layer—parameterize spatial velocity ($v_t$), gene expression velocity ($p_t$), and cell growth rate ($g_t$).
- **Transformation Parameters**: Explicitly parameterizes rotation angles (or Euler angles in 3D) and translation vectors to align different snapshots.

### Training Strategy
- Optimized via deep learning using the Adam optimizer to minimize a total loss function comprising:
  1. **Dynamics Loss**: Penalizes the kinetic energy of spatial migration, gene expression change, and growth energy.
  2. **Matching Loss**: Penalizes the 2-Wasserstein distance between the normalized learned distribution and the aligned target distribution, plus a mass mismatch penalty for unbalanced OT.
  3. **Prior Loss (Optional)**: Enforces spatial structure preservation and known cell-state transitions.
- Evaluates the loss using Monte Carlo particle simulations (forward and backward in time) solved via torchdiffeq.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| 2-Wasserstein Distance (Interpolation, gene + space) | Lower (better) | Outperforms TIGON, SF2M, and unaligned OT ablations |
| Mean Root Mean Square Error (MRMSE) of spatial velocity | Lower (better) | Outperforms Spateo and Moscot on dynamic tracking |
| Mean Absolute Error (MAE) of inferred growth rate | Lower (better) | Outperforms static OT methods lacking growth models |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of the stVCR framework, illustrating the dynamical OT approach, spatial alignment, neural ODE parameterization, and downstream analysis tasks. |
| Fig 2  | Benchmark of stVCR on simulated data, demonstrating the necessity of spatial alignment and the model's accuracy, scalability, and robustness in recovering ground-truth dynamics. |
| Fig 3  | Application to axolotl brain regeneration, showing spatial alignment of varying slices, inferred migration velocities, growth rates, and reconstructed temporal cell lineages. |
| Fig 4  | Gene-level analysis of axolotl brain regeneration, detailing the identification of migration- and growth-related driver genes (e.g., GFAP, TNC) and dynamic gene regulatory networks. |
| Fig 5  | Analysis of 3D Drosophila embryos and organs, highlighting how biological state-transition priors and spatial-structure-preserving priors improve trajectory inference over static OT methods (Spateo, Moscot). |

## Critical Analysis
### Strengths
- **Holistic Framework**: Elegantly unifies spatial alignment (registration) with trajectory inference, solving a major bottleneck in time-series spatial transcriptomics.
- **Biological Relevance**: Specifically models cell division and death (unbalanced OT), which are critical for developmental and regenerative biology.
- **Interpretability**: Provides clear mathematical definitions (Jacobians, directional derivatives) to extract gene-space interactions and regulatory networks directly from the learned continuous functions.
- **Flexibility**: The ability to inject biological priors makes the tool practically useful for real-world datasets with large temporal gaps.

### Weaknesses
- **Computational Complexity**: Numerical integration of neural ODEs (Feynman-Kac type PDEs) combined with OT matching is computationally demanding and scales non-trivially.
- **2D Limitation Sensitivity**: For 2D spatial slices, the accuracy heavily depends on the precision of slice localization; 3D relationships may be lost or confounded if slices are not perfectly analogous.
- **Cell-Cell Communication**: The current model considers autonomous cell dynamics but lacks explicit incorporation of intercellular signaling or biomechanical forces.

### Questions
- How does the model perform when affine or non-rigid deformations are present in the tissue slices, beyond the currently handled rigid-body transformations?
- Can this framework be adapted to integrate multi-omic spatial data (e.g., spatial ATAC + RNA)?

## Connections
### Related Papers
- *Moscot* (Klein et al., Nature 2025) - Static OT mapping for spatial mapping.
- *Spateo* (Qiu et al., Cell 2024) - Spatiotemporal modeling of molecular holograms.
- *TIGON* (Sha et al., Nat. Mach. Intell. 2024) - Unbalanced OT for trajectory inference with growth.
- *TrajectoryNet* (Tong et al., ICML 2020) - Neural ODE-based optimal transport for cellular dynamics.

### Related Concepts
- [[Spatial Transcriptomics]]
- [[Optimal Transport]]
- [[Neural ODEs]]
- [[Trajectory Inference]]
- [[Gene Regulatory Networks]]

### Potential Applications
- Modeling tumor microenvironment evolution and metastasis over time.
- High-resolution mapping of embryonic development and organogenesis.
- Studying wound healing, tissue regeneration, and spatial immune responses.

## Notes
-