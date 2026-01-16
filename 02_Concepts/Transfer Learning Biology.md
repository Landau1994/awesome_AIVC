---
title: Transfer Learning Biology
aliases: [Transfer Learning, Biological Transfer Learning]
tags:
  - concept
  - AIVC
  - machine-learning
  - foundation-model
  - learning-path
category: Core Technique
importance: high
date_created: 2026-01-16
last_updated: 2026-01-16
---

# Transfer Learning in Biology

## Definition
> Transfer learning leverages knowledge learned from one task/dataset to improve performance on another. In AIVC, foundation models pre-trained on millions of cells transfer to downstream tasks with minimal fine-tuning.

## Key Ideas
- **Pre-training**: Learn general representations from large unlabeled data
- **Fine-tuning**: Adapt to specific tasks with small labeled data
- **Domain adaptation**: Transfer across tissues, conditions, species
- **Few-shot learning**: Effective with limited examples

## Transfer Learning Paradigm

```
Pre-training (millions of cells, self-supervised)
↓
Foundation Model (general cell representations)
↓
Fine-tuning (task-specific, small labeled data)
↓
Downstream Task (annotation, perturbation, etc.)
```

## Applications in AIVC

| Transfer Type | Example |
|--------------|---------|
| **Task transfer** | Pre-train on reconstruction → fine-tune for annotation |
| **Dataset transfer** | Train on atlas → apply to new experiment |
| **Species transfer** | Human model → mouse cells (UCE, GeneCompass) |
| **Condition transfer** | Healthy → disease cells |

## Benefits
- Reduced data requirements for new tasks
- Better generalization
- Faster development cycles
- Leverage community pre-training efforts

## Related Concepts
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Zero-shot Learning|Zero-shot Learning]]
- [[02_Concepts/Single-Cell Embeddings|Single-Cell Embeddings]]

## Key Papers
- [[01_Papers/Geneformer|Geneformer]] - Transfer learning focus
- [[01_Papers/scGPT|scGPT]] - Multi-task transfer
