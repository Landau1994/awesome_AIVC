---
title: "Dynverse: Trajectory Inference Benchmarks"
aliases: [Dynverse, Dynamic verse]
tags:
  - dataset
  - benchmark
  - trajectory-inference
  - single-cell
date_created: 2026-03-25
status: draft
---

# Dynverse: Trajectory Inference Benchmarks

## Overview

**Dynverse** is a comprehensive benchmark collection and evaluation framework for trajectory inference methods in single-cell analysis. It provides standardized datasets and metrics for comparing algorithms that reconstruct cellular trajectories and developmental pathways.

## What It Is

Dynverse contains:
- **Simulated Datasets**: Synthetic trajectories with known ground truth
- **Real Datasets**: Curated single-cell datasets with known biology
- **Gold Standard Trajectories**: Expert-curated reference trajectories
- **Evaluation Metrics**: Standardized comparison methods

## Key Components

### Datasets Provided

1. **Linear Trajectories**
   - Simple cell differentiation paths
   - Single lineage progression

2. **Branching Trajectories**
   - Bifurcation points (cell fate decisions)
   - Multiple differentiation pathways

3. **Tree-Structured Trajectories**
   - Complex multi-lineage differentiation
   - Realistic developmental scenarios

### Benchmark Metrics

- **Correlation of distances**: Do inferred and true distances match?
- **Neighborhood preservation**: Are local neighborhoods preserved?
- **Bifurcation detection**: Are branch points correctly identified?
- **Overall trajectory similarity**: Global structure accuracy

## Applications in Single-Cell Analysis

### 1. Method Evaluation
- Compare new trajectory inference algorithms
- Fair, standardized comparison
- Identify strengths/weaknesses

### 2. Benchmarking Studies
- Foundation model trajectory quality
- PCA vs deep learning comparison
- Assess embedding methods

### 3. Integration with AIVC

[[bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models|Comprehensive scFM benchmarks]] use Dynverse to:
- Evaluate 13 foundation models on trajectories
- Compare to classical methods (PCA)
- Show PCA preserves continuity better than some transformers

## Data Format

- **AnnData objects** (standard single-cell format)
- Metadata fields:
  - `dpt_pseudotime`: Pseudotime along trajectory
  - `branch_id`: Branch assignment
  - `milestone_id`: Trajectory milestone

## Available Datasets

Examples include:
- Fibroblast to myofibroblast differentiation
- Hematopoietic stem cell differentiation
- T cell activation and differentiation
- Simulated branching scenarios

## Using Dynverse

```python
import dynverse as dyn
from anndata import read_h5ad

# Load dataset
adata = read_h5ad('trajectory_dataset.h5ad')

# Run trajectory method
trajectory = dyn.infer_trajectory(adata, method='slingshot')

# Evaluate against gold standard
metrics = dyn.evaluate_trajectory(
    trajectory, 
    gold_standard=adata.obs['true_trajectory']
)
print(metrics)
```

## Key Findings

Recent benchmarking reveals:
- **PCA Strength**: Often preserves trajectory continuity better than transformers
- **Method Variation**: Large differences between trajectory methods
- **Dataset-Dependent**: No universal winner; context matters

## Advantages

✅ **Standardized Evaluation**: Fair comparison framework
✅ **Comprehensive Datasets**: Diverse trajectory types
✅ **Reproducibility**: Published benchmarks
✅ **Active Development**: Regularly updated with new methods

## Limitations

⚠️ **Synthetic Bias**: Simulated data may not match real biology
⚠️ **Limited Real Data**: Relatively few real datasets with ground truth
⚠️ **Metric Limitations**: No single perfect metric

## Related Resources

- [[02_Concepts/Trajectory Inference|Trajectory Inference]]
- [[02_Concepts/Principal Component Analysis|PCA]]
- Foundation model evaluations

## Tools Using Dynverse

- scVelo: Velocity-based trajectory inference
- Slingshot: Curve-based trajectories
- Pseudotime algorithms

## See Also

- Trajectory inference methods
- Single-cell analysis benchmarks
- Developmental biology applications

---

**Last Updated**: 2026-03-25
