---
title: "scGPT: toward building a foundation model for single-cell multi-omics using generative AI"
aliases: [scGPT]
authors: ["Haotian Cui", "Chloe Wang", "Hassaan Maan", "Kuan Pang", "Fengning Luo", "Nan Duan", "Bo Wang"]
year: 2024
journal: "Nature Methods"
doi: "10.1038/s41592-024-02201-0"
url: "https://doi.org/10.1038/s41592-024-02201-0"
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
- **Masking**: Task-specific gene-expression masking; consult the relevant pretraining or fine-tuning configuration.

### Fine-tuning Tasks
1. Cell type annotation
2. Perturbation prediction
3. Batch integration
4. Multi-omic integration
5. Gene network inference

## Results

The paper evaluates annotation, perturbation response and integration. The former generic “90%+” and “state-of-art” table lacked dataset-specific evidence and is not retained as a verified result.

## Key Innovations
- Gene-centric tokenization scheme
- Flexible attention masking
- Unified framework for multiple tasks
- Zero-shot generalization capabilities

## Usage

Use the [official tutorials](https://github.com/bowang-lab/scGPT/tree/main/tutorials) for the installed version. The previous `scGPT.from_pretrained` example was not a verified public API and has been removed.

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
  author={Cui, Haotian and Wang, Chloe and Maan, Hassaan and Pang, Kuan and Luo, Fengning and Duan, Nan and Wang, Bo},
  journal={Nature Methods},
  year={2024}
}
```

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://doi.org/10.1038/s41592-024-02201-0).
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
