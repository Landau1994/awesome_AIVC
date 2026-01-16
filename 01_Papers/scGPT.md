---
title: "scGPT: Toward Building a Foundation Model for Single-Cell Multi-omics"
aliases: [scGPT]
authors:
  - Haotian Cui
  - Chloe Wang
  - Hassaan Maan
  - Bo Wang
year: 2024
journal: Nature Methods
doi: 10.1038/s41592-024-02201-0
url: https://github.com/bowang-lab/scGPT
tags:
  - paper
  - AIVC
  - foundation-model
  - transformer
  - single-cell
  - learning-path
status: unread
rating:
priority: P1
date_added: 2026-01-16
date_read:
---

# scGPT: Foundation Model for Single-Cell Multi-omics

## Quick Summary
> scGPT is a generative pre-trained transformer for single-cell biology, trained on 33 million cells. It enables cell type annotation, perturbation response prediction, multi-batch integration, and multi-omic integration through transfer learning.

## Key Points
- First GPT-style foundation model for single-cell data
- Pre-trained on 33M cells from CELLxGENE
- Supports multiple downstream tasks via fine-tuning
- Novel attention masking for gene expression data

## Methods

### Architecture
```
Input: Gene expression vector
↓
Gene tokenization (binning)
↓
Transformer encoder with:
  - Gene embeddings
  - Expression value embeddings
  - Condition embeddings
↓
Masked gene prediction (pre-training)
↓
Task-specific heads (fine-tuning)
```

### Pre-training
- **Data**: 33M cells from CELLxGENE
- **Objective**: Masked gene expression prediction
- **Masking**: Random gene masking (15-40%)

### Fine-tuning Tasks
1. Cell type annotation
2. Perturbation prediction
3. Batch integration
4. Multi-omic integration
5. Gene network inference

## Results
| Task | Dataset | Metric | Score |
|------|---------|--------|-------|
| Cell annotation | Multiple | Accuracy | 90%+ |
| Perturbation | Norman 2019 | MSE | State-of-art |
| Integration | Multiple | iLISI/cLISI | Competitive |

## Key Innovations
- Gene-centric tokenization scheme
- Flexible attention masking
- Unified framework for multiple tasks
- Zero-shot generalization capabilities

## Usage
```python
# Installation
pip install scgpt

# Basic usage
from scgpt import scGPT
model = scGPT.from_pretrained("scgpt_human")
embeddings = model.encode(adata)
```

## Critical Analysis
### Strengths
- Large-scale pre-training
- Versatile downstream applications
- Strong transfer learning

### Weaknesses
- Computational requirements
- Gene vocabulary limitations
- Batch effects in pre-training data

## Connections
### Related Papers
- [[01_Papers/Geneformer|Geneformer]]
- [[01_Papers/scFoundation|scFoundation]]
- [[01_Papers/Bunne 2024 - How to Build Virtual Cell|AIVC Blueprint]]

### Related Concepts
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Transformers for Biology|Transformers for Biology]]
- [[02_Concepts/Cell Embeddings|Cell Embeddings]]

## Citation
```bibtex
@article{cui2024scgpt,
  title={scGPT: toward building a foundation model for single-cell multi-omics using generative AI},
  author={Cui, Haotian and Wang, Chloe and Maan, Hassaan and Wang, Bo},
  journal={Nature Methods},
  year={2024}
}
```
