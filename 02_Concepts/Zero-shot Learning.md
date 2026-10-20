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
last_updated: 2026-10-20
---

# Zero-shot Learning

## Definition
> Zero-shot learning enables models to perform tasks on data or categories not seen during training. In AIVC, a frozen model can embed new datasets without fine-tuning. Assigning previously unseen class names additionally requires a label-semantic mechanism; using labeled reference cells is supervised transfer, even if the encoder is frozen.

## Key Ideas
- **No task-specific training**: Apply directly to new tasks
- **Pre-trained representations**: Leverage learned knowledge
- **Generalization**: Transfer to unseen conditions
- **Foundation model capability**: Key benefit of large-scale pre-training

## Zero-shot in Cell Foundation Models

| Model | Zero-shot Capability |
|-------|---------------------|
| **UCE** | Frozen cross-species cell embeddings; performance is benchmark-dependent |
| **Geneformer** | Frozen embeddings; annotation usually adds a labeled classifier or reference |
| **scPRINT** | Embedding, denoising, GRN inference |
| **CellPLM** | Cell embeddings |

## Why It Works
- Pretraining may capture reusable cellular patterns; domain shift and data leakage must be assessed
- Large-scale data covers diverse cell states
- Transferable representations generalize

## Related Concepts
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Transfer Learning Biology|Transfer Learning Biology]]
- [[02_Concepts/Single-Cell Embeddings|Single-Cell Embeddings]]

## Key Papers
- [[01_Papers/UCE|UCE]] - Cross-species zero-shot embeddings
- [[01_Papers/scPRINT|scPRINT]] - Zero-shot GRN

## Verification (2026-10-20)

[UCE paper](https://www.nature.com/articles/s41586-026-10689-z); [single-cell benchmark](https://pmc.ncbi.nlm.nih.gov/articles/PMC12803055/). “Zero-shot embedding”, “unseen-class classification” and “unseen-perturbation prediction” are distinct evaluation tasks.
