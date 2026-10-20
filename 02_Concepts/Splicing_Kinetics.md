---
title: Splicing Kinetics
aliases: [RNA splicing, Pre-mRNA processing, Splicing dynamics]
tags:
  - concept
  - molecular-biology
  - gene-expression
  - RNA-processing
  - single-cell
date_created: 2026-03-25
status: draft
---

# Splicing Kinetics

## Overview

**Splicing kinetics** refers to the rates at which pre-mRNA (unspliced RNA) is processed into mature mRNA through the removal of introns. These kinetic parameters - transcription rate, splicing rate, and degradation rate - form the biological basis for RNA velocity inference.

## Core Process

### Gene Expression Timeline
```
DNA
  ↓ (transcription, rate α)
Unspliced RNA (pre-mRNA)
  ↓ (splicing, rate β)
Spliced RNA (mature mRNA)
  ↓ (degradation, rate γ)
Degraded
```

## Key Parameters

### 1. Transcription Rate (α)
- How fast is RNA polymerase transcribing?
- Inferred jointly with processing/loss rates or estimated with dedicated labeling experiments; unspliced abundance alone does not measure transcription rate
- High α → Cell is actively transcribing

### 2. Splicing Rate (β)
- How fast are introns removed?
- Typically fast (seconds to minutes)
- Affects unspliced/spliced ratio

### 3. Degradation Rate (γ)
- How fast is mRNA degraded?
- Different for different genes
- Typically half-life of hours

## Biological Interpretation

### Unspliced/Spliced Ratio Reveals Momentum

```
β × unspliced > γ × spliced → mature RNA increases
β × unspliced < γ × spliced → mature RNA decreases
β × unspliced = γ × spliced → instantaneous mature-RNA velocity is zero
Full steady state additionally requires α = β × unspliced
```

## Kinetic Models

### Deterministic ODE Model
```
d[unspliced]/dt = α - β[unspliced]
d[spliced]/dt = β[unspliced] - γ[spliced]
```

### Phase Portrait Analysis
- Plot unspliced vs spliced for each gene
- Trajectory shows temporal evolution
- Can identify:
  - Induction (moving right-up)
  - Degradation (moving left-down)
  - Steady-state points, where both derivatives vanish

## Gene-Specific Variation

Different genes have different kinetics:
- **Fast-splicing genes**: Large β gives a short characteristic splicing time 1/β; β and α have different units and should not be directly compared
- **Stable transcripts**: γ small (long half-life)
- **Unstable transcripts**: γ large (short half-life)

Example:
- Housekeeping genes can be near steady state while RNA production and turnover remain rapid
- Response genes: Rapid kinetics, fast transcription changes
- Short-lived regulatory RNAs: High degradation rate

## Single-Cell Measurement

### RNA-seq Captures
- Spliced reads: Mature mRNA
- Unspliced reads: Pre-mRNA
- Both can be quantified genome-wide

### Quantification
```
Unspliced fraction = U / (U + S), defined when U + S > 0
- 0 = No unspliced counts detected
- 0.5 = Equal observed unspliced and spliced counts
- 1 = No spliced counts detected
These values do not independently identify transcriptional state or velocity.
```

## Challenges

⚠️ **Technical Noise**: Hard to accurately measure unspliced reads
⚠️ **Cell-to-Cell Variation**: Kinetics vary between cells
⚠️ **Constant Kinetics Assumption**: Rates may change
⚠️ **Dropout**: Some genes may appear unspliced by chance

## Applications in RNA Velocity

[[02_Concepts/RNA Velocity|RNA velocity]] inference relies on splicing kinetics:

1. **Estimate kinetic parameters** from data
2. **Compute velocity** based on deviation from steady-state
3. **Project future state** by integrating velocity

## Advanced Considerations

### Multiple Kinetic States
- Cells may transition between kinetic regimes
- Some methods (Dynamo) model multiple states
- Impacts velocity accuracy

### Cross-Gene Kinetics
- Some genes temporally coupled
- Co-regulatory kinetics
- Multi-gene velocity models

## Related Concepts

- [[02_Concepts/RNA Velocity|RNA Velocity]] - Application of kinetics
- Gene expression dynamics
- Single-cell transcriptomics

## Measurement Tools

- **RNA-seq**: Quantify spliced/unspliced
- **Metabolic labeling**: Distinguish newly synthesized RNA; kinetic rates require a labeling/turnover model
- **scNT-seq**: Single-cell nascent transcript sequencing
- **Single-molecule FISH**: Visualize transcription

---

**Last Updated**: 2026-10-20

## Verification (2026-10-20)

Rate constants, molecular abundance and measured read counts are different quantities. Splicing times and half-lives vary by gene, cell and experimental context. [scVelo dynamical model](https://scvelo.readthedocs.io/en/stable/about.html).
