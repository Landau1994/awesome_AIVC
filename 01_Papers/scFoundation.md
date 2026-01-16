---
title: "scFoundation: Large-scale Foundation Model on Single-cell Transcriptomics"
aliases: [scFoundation, xTrimoGene]
authors:
  - Minsheng Hao
  - Jing Gong
  - Xin Zeng
  - et al.
year: 2024
journal: Nature Methods
doi: 10.1038/s41592-024-02305-7
url: https://github.com/biomap-research/scFoundation
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

# scFoundation: Large-scale Foundation Model on Single-cell Transcriptomics

## Quick Summary
> scFoundation is a 100-million parameter foundation model pretrained on over 50 million human single-cell transcriptomic profiles, achieving state-of-the-art performance across diverse single-cell analysis tasks including gene expression enhancement, drug response prediction, and perturbation prediction.

## Key Points
- Largest single-cell foundation model (100M parameters, ~20K genes)
- Trained on 50M+ cells from GEO, HCA, Single Cell Portal, EMBL-EBI
- Asymmetric transformer architecture with read-depth awareness
- State-of-the-art on multiple downstream tasks

## Methods

### Architecture
```
Input: Gene expression vector (read-depth aware)
↓
Asymmetric Transformer Encoder
  - Gene embeddings
  - Expression value encoding
  - Read depth normalization
↓
Task-specific decoders
```

### Key Innovation: Read-Depth Awareness
- Accounts for varying sequencing depths across cells
- More robust to technical variation
- Better generalization across datasets

### Pre-training
- **Data**: 50M+ cells from multiple sources
- **Objective**: Masked gene expression prediction
- **Scale**: 100M parameters, ~20K genes

## Results
| Task | Performance |
|------|-------------|
| Gene expression enhancement | State-of-the-art |
| Drug response prediction | State-of-the-art |
| Perturbation prediction | Competitive |
| Cell type annotation | State-of-the-art |
| Gene module inference | Strong |

## Downstream Tasks
1. **Gene expression enhancement**: Impute and denoise expression
2. **Tissue drug response**: Predict tissue-level drug effects
3. **Single-cell drug response**: Classify cell drug responses
4. **Perturbation prediction**: Forecast genetic perturbation outcomes
5. **Cell type annotation**: Classify cell types
6. **Gene module inference**: Discover gene programs

## Critical Analysis
### Strengths
- Large-scale pre-training
- Read-depth awareness innovation
- Comprehensive downstream evaluation
- Multi-task capability

### Weaknesses
- Computational requirements
- Human-only pre-training
- Limited interpretability analysis

### Questions
- How does read-depth awareness compare to other normalization strategies?
- Can the model transfer to non-human species?

## Connections
### Related Papers
- [[01_Papers/scGPT|scGPT]]
- [[01_Papers/Geneformer|Geneformer]]
- [[01_Papers/UCE|UCE]]

### Related Concepts
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]

## Tools & Code
- GitHub: https://github.com/biomap-research/scFoundation
- Pre-trained weights available

## Citation
```bibtex
@article{hao2024scfoundation,
  title={Large-scale foundation model on single-cell transcriptomics},
  author={Hao, Minsheng and Gong, Jing and Zeng, Xin and others},
  journal={Nature Methods},
  volume={21},
  pages={1481--1491},
  year={2024}
}
```
