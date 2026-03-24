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

**RNA Velocity** is a computational method that predicts the future transcriptomic state of individual cells by analyzing the ratio of unspliced (nascent) to spliced (mature) mRNA. High RNA velocity in a gene indicates the cell is rapidly transcribing it and will increase expression; low velocity indicates expression will decrease. This enables inference of cellular trajectories and developmental dynamics without explicit time series data.

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

**Key Insight**: The unspliced/spliced ratio reveals transcriptional momentum
- High unspliced: Cell is transcribing → expression will increase
- Low unspliced, high spliced: Old transcription, expression will decrease
- Ratio change = velocity vector

## Historical Development

| Year | Method | Innovation |
|------|--------|-----------|
| 2018 | [[velocyto]] | First RNA velocity tool (foundational) |
| 2020 | [[scvelo]] | Dynamical model (major improvement) |
| 2023-2024 | Deep Learning methods | [[DeepVelo]], [[veloVI]], [[latentVelo]] |
| 2025 | Benchmarking | This paper: comprehensive evaluation |

## Velocity Inference Methods

### Categories

**1. ODE-Based Methods**
- Model gene expression as ODE system
- Examples: [[velocyto]], [[scvelo]] (dynamical)
- Interpret: Physics-based gene regulatory dynamics

**2. Machine Learning Methods**
- Use statistical models for velocity
- Examples: [[Dynamo]], [[UniTVelo]], [[Pyro-Velocity]]
- Flexible but interpretability challenges

**3. Deep Learning Methods**
- Neural networks learn velocity patterns
- Examples: [[DeepVelo]], [[veloVI]], [[veloVAE]], [[latentVelo]]
- High performance but expensive computationally

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

$$\text{Velocity}_{i,g} = \alpha_{g} - \beta_{g} \cdot M_{i,g}$$

Where:
- $\alpha_{g}$: Transcription rate (unspliced)
- $\beta_{g}$: Degradation rate (spliced)
- $M_{i,g}$: Current spliced mRNA level

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

From [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|comprehensive benchmarking]]:

| Metric | Finding |
|--------|---------|
| **Accuracy** | Best methods (veloVI) reach only 28% directional correctness |
| **Agreement** | Methods agree <30% on velocity direction |
| **Stability** | Some methods (latentVelo) very stable; others (veloVAE) inconsistent |
| **Speed** | Range: 16s (DeepVelo) to hours (complex methods) |

**Key Finding**: No universally best method; choice depends on trade-offs

## Practical Considerations

### Computational Requirements
```
Method          Memory    Time        Accuracy
DeepVelo        543 MB    16s         Medium
scvelo          1-5 GB    1-10 min    Good
veloVI          2-10 GB   5-30 min    Best
cell2fate       >22 GB    >1 hour     Medium
```

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

⚠️ **Low Accuracy**: Best methods only ~28% correct directions
⚠️ **Method Disagreement**: Different tools give conflicting results
⚠️ **Splicing Assumptions**: Relies on unspliced/spliced ratio being informative
⚠️ **Cell Type Dependent**: Works better in some cell types than others
⚠️ **Computational Cost**: Modern methods require significant resources

## Recent Developments (2025)

[[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|Benchmarking study]] shows:

### Best for Different Needs
- **Accuracy**: veloVI (directional correctness = 0.28)
- **Stability**: latentVelo (coherence = 0.99)
- **Speed**: DeepVelo (16s, minimal memory)
- **Interpretability**: scvelo (clear mathematical model)

### Future Directions
- Ensemble methods combining multiple approaches
- Better ground truth for validation
- Handling of complex cell fate decisions
- Integration with protein abundance data

## Related Concepts

- [[02_Concepts/Trajectory Inference|Trajectory Inference]] - Broader field
- [[Splicing Kinetics]] - Underlying biology
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

**Last Updated**: 2026-03-25
