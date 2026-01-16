---
title: Zero-shot Learning
aliases: [Zero-shot, ZSL]
tags:
  - concept
  - AIVC
  - machine-learning
  - transfer-learning
  - learning-path
category: Core Technique
importance: high
date_created: 2026-01-16
last_updated: 2026-01-16
---

# Zero-shot Learning

## Definition
> Zero-shot learning enables models to perform tasks on data or categories not seen during training. In AIVC, foundation models can annotate unseen cell types, embed new datasets, and predict perturbation effects without task-specific fine-tuning.

## Key Ideas
- **No task-specific training**: Apply directly to new tasks
- **Pre-trained representations**: Leverage learned knowledge
- **Generalization**: Transfer to unseen conditions
- **Foundation model capability**: Key benefit of large-scale pre-training

## Zero-shot in Cell Foundation Models

| Model | Zero-shot Capability |
|-------|---------------------|
| **UCE** | Best zero-shot embeddings, cross-species |
| **Geneformer** | Cell type annotation |
| **scPRINT** | Embedding, denoising, GRN inference |
| **CellPLM** | Cell embeddings |

## Why It Works
- Pre-training captures universal cellular patterns
- Large-scale data covers diverse cell states
- Transferable representations generalize

## Related Concepts
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Transfer Learning Biology|Transfer Learning Biology]]
- [[02_Concepts/Single-Cell Embeddings|Single-Cell Embeddings]]

## Key Papers
- [[01_Papers/UCE|UCE]] - Best zero-shot performance
- [[01_Papers/scPRINT|scPRINT]] - Zero-shot GRN
