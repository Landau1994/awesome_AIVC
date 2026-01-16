---
title: Cell Foundation Models
aliases: [CFM, Foundation Models for Cells]
tags:
  - concept
  - AIVC
  - foundation-model
  - learning-path
category: Core Concept
importance: critical
date_created: 2026-01-16
last_updated: 2026-01-16
---

# Cell Foundation Models

## Definition
> Cell Foundation Models (CFMs) are large-scale neural networks pre-trained on massive single-cell datasets that learn generalizable representations of cellular states, enabling transfer learning to diverse downstream tasks.

## Key Ideas
- **Pre-training**: Learn from millions of cells without task-specific labels
- **Transfer learning**: Fine-tune for specific tasks with small datasets
- **Universal representations**: Capture cell states across tissues and conditions
- **Multi-task capability**: Single model serves multiple applications

## Mathematical Formulation

### Cell Representation
Given a cell $c$ with gene expression vector $\mathbf{x} \in \mathbb{R}^{G}$:

$$\mathbf{h} = f_\theta(\mathbf{x})$$

where $\mathbf{h} \in \mathbb{R}^{d}$ is the learned cell embedding.

### Pre-training Objective (Masked Language Modeling)
$$\mathcal{L} = -\sum_{i \in \mathcal{M}} \log p(x_i | \mathbf{x}_{\backslash \mathcal{M}}; \theta)$$

where $\mathcal{M}$ is the set of masked gene indices.

## Key Models

| Model | Pre-training Data | Architecture | Key Innovation |
|-------|-------------------|--------------|----------------|
| [[01_Papers/scGPT\|scGPT]] | 33M cells | Transformer | Gene tokenization |
| [[01_Papers/Geneformer\|Geneformer]] | 30M cells | Transformer | Rank-value encoding |
| scFoundation | 50M cells | Transformer | Read depth aware |
| scBERT | 1M cells | BERT | Early pioneer |
| UCE | Multiple species | Cross-species | Universal embeddings |

## Applications in AIVC

1. **Cell type annotation**: Classify cells into types/states
2. **Batch integration**: Remove technical artifacts
3. **Perturbation prediction**: Forecast response to interventions
4. **Gene network inference**: Discover regulatory relationships
5. **Multi-omic integration**: Combine different data modalities

## Comparison with NLP Foundation Models

| Aspect | NLP (GPT/BERT) | Cell Models |
|--------|----------------|-------------|
| Token | Word/subword | Gene |
| Sequence | Sentence | Cell |
| Vocabulary | ~50K words | ~20K genes |
| Order | Meaningful | Less clear |
| Context | Surrounding words | Co-expressed genes |

## Related Concepts
- [[02_Concepts/Cell Embeddings|Cell Embeddings]]
- [[02_Concepts/Transformers for Biology|Transformers for Biology]]
- [[02_Concepts/Transfer Learning Biology|Transfer Learning in Biology]]
- [[02_Concepts/Single-Cell Analysis|Single-Cell Analysis]]

## Key Papers
- [[01_Papers/Bunne 2024 - How to Build Virtual Cell|How to Build the Virtual Cell with AI]]
- [[01_Papers/scGPT|scGPT]]
- [[01_Papers/Geneformer|Geneformer]]

## Tools & Implementations
- [scGPT GitHub](https://github.com/bowang-lab/scGPT)
- [Geneformer HuggingFace](https://huggingface.co/ctheodoris/Geneformer)
- [scFoundation](https://github.com/biomap-research/scFoundation)

## Learning Resources
- Original papers (see above)
- [Single Cell Best Practices](https://www.sc-best-practices.org/)
- Tutorial notebooks in model repositories

## Open Questions
- What is the optimal tokenization strategy?
- How to handle batch effects in pre-training?
- Can models generalize across species?
- What biological knowledge is captured vs. missed?
