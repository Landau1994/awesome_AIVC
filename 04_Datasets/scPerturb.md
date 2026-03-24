---
title: "scPerturb: Single-Cell Perturbation Database"
aliases: [scPerturb, sc-Perturb]
tags:
  - dataset
  - perturbation
  - single-cell
  - AIVC
date_created: 2026-03-25
status: draft
---

# scPerturb: Single-Cell Perturbation Database

## Overview

**scPerturb** is a comprehensive repository of single-cell transcriptomics datasets with experimental perturbations (CRISPR knockouts, drug treatments, etc.). It provides standardized benchmark datasets for evaluating perturbation prediction models.

## What It Contains

### Perturbation Types

1. **CRISPR Gene Knockdowns**
   - Single gene knockouts
   - Multi-gene perturbations
   - Known functional relationships

2. **Drug Treatments**
   - Small molecule compounds
   - Varying concentrations
   - Different cell types

3. **Environmental Perturbations**
   - Temperature changes
   - Media conditions
   - Stress responses

### Dataset Attributes

- **Baseline Cells**: Unperturbed control cells
- **Perturbed Cells**: Cells with applied perturbation
- **Multiple Replicates**: Technical and biological replicates
- **Cell Type Labels**: Annotation of cell types tested

## Key Datasets in scPerturb

- **Norman et al.**: Large-scale CRISPR perturbation screen
- **Replogle et al.**: Systematic gene perturbation in K562 cells
- **Dixit et al.**: Combinatorial CRISPR experiments
- **Drug Response Studies**: Various cell types and compounds

## Applications

### 1. Perturbation Prediction Benchmarking
- Train models to predict transcriptomic response
- Evaluate on unseen perturbations
- Compare methods objectively

### 2. Foundation Model Evaluation
[[bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models|Benchmarking paper]] uses scPerturb to:
- Evaluate 13 foundation models
- Test perturbation prediction accuracy
- Compare to classical baselines (additive models)

### 3. Virtual Cell Research
- Benchmark AIVC models on real perturbations
- Validate computational predictions
- Identify generalizable patterns

## Data Organization

```
Dataset
├── Baseline cells (control)
├── Perturbed cells
│   ├── Perturbation A
│   ├── Perturbation B
│   └── Combination AB
├── Metadata
│   ├── Cell type
│   ├── Perturbation ID
│   └── Treatment concentration
└── Gene information
    └── Target genes
```

## Typical Analysis Workflow

```python
from anndata import read_h5ad

# Load perturbation dataset
adata = read_h5ad('perturbation_data.h5ad')

# Split baseline and perturbed
baseline = adata[adata.obs['condition'] == 'control']
perturbed = adata[adata.obs['condition'] == 'perturbed']

# Train prediction model
model.fit(
    X_baseline=baseline.X,
    perturbations=baseline.obs['perturbation'],
    y_response=perturbed.X
)

# Evaluate on held-out perturbations
predictions = model.predict(new_perturbations)
correlation = evaluate(predictions, held_out_perturbed.X)
```

## Key Benchmarking Metrics

- **Correlation**: Pearson/Spearman correlation with true response
- **Rank Correlation**: How well are top DE genes predicted?
- **Specific Genes**: Prediction accuracy for known targets
- **Generalization**: Performance on unseen combinations

## Foundation Model Performance

Recent benchmarks show:
- **Perturbation Correlation**: >0.90 for good models
- **Foundation Models**: Competitive with classical baselines
- **Best Methods**: GEARS, CPA, and large foundation models

## Related Concepts

- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]
- [[01_Papers/GEARS|GEARS]]
- [[01_Papers/CPA|CPA]]

## Advantages

✅ **Realistic Perturbations**: Real experimental data
✅ **Multiple Scales**: Single genes to combinations
✅ **Multiple Cell Types**: Generalization across contexts
✅ **Benchmarking Standard**: Widely used for comparisons

## Limitations

⚠️ **Limited Depth**: Not all perturbations in depth
⚠️ **Cell Type Bias**: More data for some cell types
⚠️ **Temporal Dynamics**: Mostly snapshot data
⚠️ **Context-Dependence**: Response varies by cell state

## Accessing scPerturb

- Main repository: scperturb.org
- Data format: AnnData H5AD files
- API: Python-based access

## Integration with AIVC

scPerturb is essential for:
- Validating virtual cell predictions
- Benchmarking perturbation models
- Understanding cellular response diversity
- Training foundation models

## See Also

- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]
- [[01_Papers/GEARS|GEARS: Gene Expression Perturbation Prediction]]
- [[01_Papers/CPA|CPA: Compositional Perturbation Autoencoder]]
- [[bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models|Comprehensive scFM benchmarks]]

---

**Last Updated**: 2026-03-25
