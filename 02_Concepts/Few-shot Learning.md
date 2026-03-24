---
title: Few-Shot Learning
aliases: [Few-shot, Low-shot, K-shot]
tags:
  - concept
  - machine-learning
  - meta-learning
  - transfer-learning
date_created: 2026-03-25
status: draft
---

# Few-Shot Learning

## Overview

**Few-shot learning** is a machine learning paradigm where models learn to generalize from very few labeled examples (typically 1-10) per class. This is critical for real-world applications where large labeled datasets are expensive or impossible to obtain.

## Problem Formulation

### Traditional Learning vs Few-Shot

**Traditional Supervised Learning**:
- Task: Classify cells into 50 cell types
- Data: 10,000 cells per cell type (500,000 total)
- Training: Computationally intensive but straightforward

**Few-Shot Learning**:
- Task: Classify cells into 50 cell types
- Data: 1-5 cells per cell type (50-250 total)
- Goal: Achieve competitive accuracy with minimal labels

## Shots Terminology

- **1-shot**: 1 labeled example per class
- **5-shot**: 5 labeled examples per class
- **10-shot**: 10 labeled examples per class
- **N-way K-shot**: N classes, K examples each

Example: "5-way 1-shot" = 5 cell types with 1 example each

## Approaches to Few-Shot Learning

### 1. Prototypical Networks ⭐ (Most Popular)
- Learn embedding space
- Create class prototypes (mean embeddings)
- Classify by distance to prototypes
- See: [[02_Concepts/Prototypical Learning|Prototypical Learning]]

### 2. Matching Networks
- Learn attention mechanism
- "Match" query to support examples
- Soft assignment based on similarity

### 3. Model-Agnostic Meta-Learning (MAML)
- Learn initialization that adapts quickly
- Few gradient steps on new task
- Computationally expensive but effective

### 4. Fine-Tuning on Pre-trained Models
- Start with large pre-trained model
- Update final layers with few examples
- Practical and often effective

### 5. Zero-Shot / Few-Shot with Foundation Models
- Use large models (scGPT, Geneformer)
- Either zero-shot or adapt with few examples
- Leverage pre-training

## Why Few-Shot Learning Matters for Biology

### Cell Type Annotation Challenge
- **Known**: 200+ defined cell types
- **Problem**: Researcher has new dataset with only 1-5 reference cells for rare type
- **Solution**: Few-shot learning with foundation models
- **Results**: 80-90% accuracy with minimal annotation

### Rare Cell Populations
- Difficult to get many examples
- Few-shot approach more practical
- Can identify diseased/rare variants

### Cross-Species Transfer
- Human cell types as base
- Few mouse cells to adapt
- Learn species-specific variants

### Cost-Effective Annotation
- Annotate 50-100 cells manually
- Use few-shot learning for rest
- 10x-100x speedup in annotation

## Benchmarks in Single-Cell

### Recent Results
From [[bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models|comprehensive single-cell benchmarks]]:

| Setting | Accuracy | Data Required |
|---------|----------|---|
| 1-shot | ~70-85% | 50 cells total |
| 5-shot | ~85-95% | 250 cells total |
| Fine-tuning | ~98% | 1,000-5,000 cells |

**Key Finding**: Diminishing returns after 5-shot; few-shot preferred for efficiency

## Theoretical Foundations

### Why Few-Shot Works

1. **Transfer Learning**: Pre-training captures general patterns
   - Learns "what is a cell type" from large data
   - Applies to new rare types

2. **Metric Learning**: Distances in embedding space
   - Similar cells cluster together
   - Few examples define class center

3. **Inductive Bias**: Architecture constraints
   - Models designed to generalize from few examples
   - Parameter sharing reduces sample complexity

### Sample Complexity Theory
- **Traditional**: Need O(d) samples (d = dimensions)
- **With Meta-Learning**: Can achieve O(log d) or better
- **In practice**: 5-10 examples often sufficient

## Applications in Virtual Cell Modeling

### Perturbation Prediction
- Few cells treated with perturbation
- Predict transcriptomic response in untreated cells
- Few-shot learning bridges the gap

### Disease-Specific Cell States
- Few diseased cells vs many healthy
- Learn disease-specific transcription patterns
- Generalize to other patients

### Drug Response
- Few cell lines tested with drug
- Few-shot predict response in others
- Accelerate drug discovery

## Meta-Learning Connection

Few-shot is closely related to **meta-learning** ("learning to learn"):

```
Traditional: Learn Task A
Meta-Learning: Learn how to learn any Task
Few-Shot: Apply meta-learned capability to new Task with few examples
```

## Advantages

✅ **Practical**: Real-world scenarios have limited labels
✅ **Fast**: Annotation-efficient
✅ **Flexible**: Works with any base encoder
✅ **Scalable**: Can be applied to new tasks quickly

## Limitations

⚠️ **Domain Gap**: If new task very different from pre-training, fails
⚠️ **Class Imbalance**: Hard when classes have very different numbers
⚠️ **Noisy Labels**: Errors in few examples have big impact
⚠️ **Feature Overlap**: If classes indistinguishable, even few examples can't help

## Implementation Considerations

### Base Encoder Quality
- Foundation model (scGPT, Geneformer) >> Random initialization
- Transfer from related domain >> No transfer

### Hyperparameter Tuning
- Distance metric (Euclidean vs Cosine)
- Number of gradient steps (for MAML-style)
- Prototype construction method

### Evaluation Protocol
- Standard: N-way K-shot with random splits
- Realistic: Same split as deployment task

## Related Concepts

- [[02_Concepts/Transfer Learning Biology|Transfer Learning]] - Foundational concept
- [[02_Concepts/Prototypical Learning|Prototypical Networks]] - Specific few-shot method
- [[02_Concepts/Zero-shot Learning|Zero-shot Learning]] - Extreme case (0-shot)
- [[02_Concepts/Cell Foundation Models|Foundation Models]] - Enable few-shot success

## Tools & Frameworks

- **scVI-tools**: Few-shot cell type transfer
- **PyTorch**: torchmeta, learn2learn
- **Hugging Face**: Foundation models with few-shot adapters

## Key Papers

- Prototypical Networks (Snell et al., 2017)
- MAML (Finn et al., 2017)
- Meta-Learning surveys and benchmarks

---

**Last Updated**: 2026-03-25
