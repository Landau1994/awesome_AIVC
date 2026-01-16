---
title: "Geneformer: Transfer Learning Enables Predictions in Network Biology"
aliases: [Geneformer]
authors:
  - Christina Theodoris
  - et al.
year: 2023
journal: Nature
doi: 10.1038/s41586-023-06139-9
url: https://huggingface.co/ctheodoris/Geneformer
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

# Geneformer: Transfer Learning for Network Biology

## Quick Summary
> Geneformer is a context-aware, attention-based deep learning model pre-trained on 30 million single-cell transcriptomes. It uses rank-value encoding and enables transfer learning for diverse tasks including disease modeling and therapeutic target identification.

## Key Points
- Pre-trained on 30M cells from Genecorpus-30M
- Novel rank-value encoding for gene expression
- Strong zero-shot and fine-tuned performance
- Enables in-silico perturbation experiments

## Methods

### Key Innovation: Rank-Value Encoding
Instead of using raw expression values:
1. Rank genes by expression within each cell
2. Use rank as position in "sentence"
3. Highly expressed genes = early in sequence

### Architecture
- Standard transformer encoder
- Gene tokens with learned embeddings
- Attention captures gene-gene relationships
- 6 layers, 256 dimensions

### Pre-training
- **Objective**: Masked gene prediction
- **Data**: 30M cells (Genecorpus-30M)
- **Masking**: 15% of genes

## Results
| Task | Performance |
|------|-------------|
| Dosage sensitivity prediction | AUC 0.89 |
| Chromatin dynamics | Strong correlation |
| Disease gene prediction | Outperforms baselines |
| In-silico perturbation | Validated experimentally |

## Critical Analysis
### Strengths
- Elegant rank-value encoding
- Strong biological interpretability
- Extensive validation
- Publicly available

### Weaknesses
- Rank encoding loses magnitude information
- Fixed vocabulary (all human genes)
- Computational cost for fine-tuning

## Connections
### Related Papers
- [[01_Papers/scGPT|scGPT]]
- [[01_Papers/scFoundation|scFoundation]]
- [[01_Papers/Bunne 2024 - How to Build Virtual Cell|AIVC Blueprint]]

### Related Concepts
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Transformers for Biology|Transformers for Biology]]
- [[02_Concepts/Gene Regulatory Networks|Gene Regulatory Networks]]

## Citation
```bibtex
@article{theodoris2023geneformer,
  title={Transfer learning enables predictions in network biology},
  author={Theodoris, Christina V and others},
  journal={Nature},
  year={2023}
}
```
