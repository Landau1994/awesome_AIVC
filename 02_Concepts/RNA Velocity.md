---
title: RNA Velocity
aliases: [Velocity, RNA velocity inference, Directional dynamics]
tags:
  - concept
  - trajectory-inference
  - single-cell
  - RNA-seq
  - AIVC
date_created: 2026-03-25
status: draft
---

# RNA Velocity

## Overview

**RNA Velocity** is a computational method that predicts the future transcriptomic state of individual cells by analyzing the ratio of unspliced (nascent) to spliced (mature) mRNA. Positive estimated velocity predicts increasing mature-RNA abundance and negative velocity predicts decreasing abundance; a small positive velocity is still an increase. These are local, model-dependent estimates, not direct measurements of a cell’s future. This enables inference of cellular trajectories and developmental dynamics without explicit time series data.

## Core Concept

### Splicing Dynamics
Gene expression transition:
```
DNA → (transcription) → Unspliced RNA (pre-mRNA)
                            ↓ (splicing)
                       Spliced RNA (mRNA)
                            ↓ (degradation)
                          Lost
```

**Key Insight**: Velocity depends on the balance of splicing and degradation.
- Positive mature-RNA velocity when $\beta u > \gamma s$
- Negative mature-RNA velocity when $\beta u < \gamma s$
- The threshold depends on gene-specific kinetics; a raw ratio alone is insufficient.

## Historical Development

| Year | Method | Innovation |
|------|--------|-----------|
| 2018 | [[velocyto]] | First RNA velocity tool (foundational) |
| 2020 | [[scvelo]] | Dynamical model (major improvement) |
| 2022-2024 | Deep Learning methods | [[DeepVelo]], [[veloVI]], [[latentVelo]] |
| 2025–2026 | Benchmarking | Study of 15 methods on 17 datasets; consult the linked version |

## Velocity Inference Methods

### Categories

These are overlapping descriptions, not mutually exclusive classes: Bayesian and neural methods may also use splicing ODEs.

**1. ODE-Based Methods**
- Model gene expression as ODE system
- Examples: [[velocyto]], [[scvelo]] (dynamical)
- Interpret: Mechanistic transcription–splicing–degradation dynamics; this is not by itself a gene regulatory network

**2. Machine Learning Methods**
- Use statistical models for velocity
- Examples: [[Dynamo]], [[01_Papers/uniTvelo|UniTVelo]], [[Pyro-Velocity]]
- Flexible but interpretability challenges

**3. Deep Learning Methods**
- Neural networks learn velocity patterns
- Examples: [[DeepVelo]], [[veloVI]], [[veloVAE]], [[latentVelo]]
- Performance and computational cost depend on the method and dataset

## Biological Applications

### 1. Trajectory Inference
- Without time-series data, infer cell fate decision trees
- Predict which cells become which cell types
- Discover branching points

### 2. Cell Fate Prediction
- For individual cell, predict future transcriptomic state
- "This CD34+ cell will become neutrophil"
- Probabilistic predictions

### 3. Developmental Biology
- Map cell state transitions during development
- Identify key regulatory moments
- Link transcription to phenotype changes

## Mathematical Framework

### Basic Equation

For gene $g$ in cell $i$:

$$\frac{du_{i,g}}{dt}=\alpha_g(t)-\beta_g u_{i,g}, \qquad v_{i,g}=\frac{ds_{i,g}}{dt}=\beta_g u_{i,g}-\gamma_g s_{i,g}.$$

Here $u$ and $s$ denote unspliced and spliced abundance; $\alpha$ is transcription, $\beta$ splicing, and $\gamma$ mature-RNA degradation. The basic model neglects unspliced-RNA degradation. [scVelo model documentation](https://scvelo.readthedocs.io/en/stable/about.html)

### Interpretation
- Positive velocity: Expression increasing
- Negative velocity: Expression decreasing
- Integrating velocity → predicted future state

## Evaluation Challenges

### Ground Truth Problem
⚠️ No perfect ground truth for velocity
- Can't directly measure "future state"
- Use surrogate metrics:
  - Cross-boundary direction correctness (CBDir)
  - Agreement with pseudotime
  - Biological plausibility

### Recent Benchmark Findings

From [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|the benchmark preprint]] and its [2026 journal update](https://doi.org/10.1016/j.crmeth.2026.101367):

| Metric | Finding |
|--------|---------|
| **Directional score** | CBDir is an averaged cosine similarity, not a percentage of correct predictions; 0.28 must not be reported as 28% accuracy |
| **Agreement** | Method agreement varies by dataset and comparison metric; it is not a universal percentage of matching directions |
| **Stability** | Some methods (latentVelo) very stable; others (veloVAE) inconsistent |
| **Speed** | Runtime depends on dataset, hardware, preprocessing and implementation; consult the benchmark configuration |

**Key Finding**: No universally best method; choice depends on trade-offs

## Practical Considerations

### Computational Requirements
Record cell/gene count, CPU/GPU, thread count, software version and whether preprocessing is timed when comparing resources. The former fixed runtime/memory table lacked this context and should not be used for capacity planning.

### Stability
- Methods differ drastically in robustness to noise
- Stability matters for real, noisy single-cell data
- Deep learning methods: variable stability

## Advantages

✅ **No Time Series Needed**: Infer dynamics from snapshots
✅ **Cell-Level Resolution**: Individual cell velocities
✅ **Biological Insight**: Link transcription to fate
✅ **Visualization**: Overlay velocity on UMAP/tSNE

## Limitations

⚠️ **Validation Limits**: Directional cosine scores do not establish the fraction of biologically correct cell-fate predictions
⚠️ **Method Disagreement**: Different tools give conflicting results
⚠️ **Splicing Assumptions**: Relies on unspliced/spliced ratio being informative
⚠️ **Cell Type Dependent**: Works better in some cell types than others
⚠️ **Computational Cost**: Modern methods require significant resources

## Benchmark Context (2025 preprint; 2026 journal update)

[[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|Benchmarking study]] shows:

### Best for Different Needs
- **Directionality**: Compare CBDir and other metrics on the relevant dataset; 0.28 is a cosine-based score, not 28% accuracy.
- **Stability**: Check sensitivity to seeds, subsampling and preprocessing.
- **Speed**: Benchmark the selected implementation on the intended hardware.
- **Interpretability**: Inspect kinetic fits, uncertainty and biological consistency. No overall winner follows from a single score.

### Future Directions
- Ensemble methods combining multiple approaches
- Better ground truth for validation
- Handling of complex cell fate decisions
- Integration with protein abundance data

## Related Concepts

- [[02_Concepts/Trajectory Inference|Trajectory Inference]] - Broader field
- [[Splicing_Kinetics|Splicing Kinetics]] - Underlying biology
- [[02_Concepts/Single-Cell Embeddings|Single-cell Analysis]] - Data source
- Pseudotime vs Velocity - Different approaches

## Key Tools

- **velocyto**: Original implementation (Python/R)
- **scVelo**: Standard method (Python)
- **Dynamo**: Advanced dynamics (Python)
- **DeepVelo**: Fast neural network (Python)
- **cellRank**: Cell fate prediction from velocity (Python)

## Research Benchmarks

Recent papers benchmarking velocity:
- [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|2025 comprehensive benchmark]]
- Various method-specific papers from 2020-2024

## Applications in Virtual Cell Modeling

For AIVC research:
- Predict cell state transitions
- Validate foundation model predictions
- Identify regulatory dynamics
- Support perturbation modeling

---

**Last Updated**: 2026-10-20

## Verification (2026-10-20)

Corrected the mature-RNA ODE and the interpretation of CBDir. Runtime, memory, coherence and rankings require the study setting. The 2026 journal version evaluates 15 methods across 17 datasets; the earlier preprint used 14. [Journal benchmark](https://doi.org/10.1016/j.crmeth.2026.101367); [scVelo original study](https://doi.org/10.1038/s41587-020-0591-3).
