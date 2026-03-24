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
- Measured by unspliced RNA accumulation
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
High unspliced, low spliced
→ Cell is transcribing rapidly
→ Expression will INCREASE
→ Velocity = POSITIVE

Low unspliced, high spliced
→ Old transcription
→ Expression will DECREASE
→ Velocity = NEGATIVE

Balanced unspliced/spliced
→ Steady-state expression
→ Velocity = ZERO
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
  - Steady-state (center region)

## Gene-Specific Variation

Different genes have different kinetics:
- **Fast-splicing genes**: β >> α (spliced quickly)
- **Stable transcripts**: γ small (long half-life)
- **Unstable transcripts**: γ large (short half-life)

Example:
- Housekeeping genes: Steady state, slow kinetics
- Response genes: Rapid kinetics, fast transcription changes
- Short-lived regulatory RNAs: High degradation rate

## Single-Cell Measurement

### RNA-seq Captures
- Spliced reads: Mature mRNA
- Unspliced reads: Pre-mRNA
- Both can be quantified genome-wide

### Quantification
```
Splicing index = Unspliced / (Unspliced + Spliced)
- 0 = All mature (old transcription)
- 0.5 = Balanced (steady-state or transition)
- 1.0 = All unspliced (active transcription)
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
- **Metabolic labeling**: Directly measure transcription rate
- **scNT-seq**: Single-cell nascent transcript sequencing
- **Single-molecule FISH**: Visualize transcription

---

**Last Updated**: 2026-03-25
