---
title: "scConcept: Contrastive pretraining for technology-agnostic single-cell representations beyond reconstruction"
aliases:
  - scConcept
authors:
  - Mojtaba Bahrami
  - Alejandro Tejada-Lapuerta
  - Sören Becker
  - Fatemeh S. Hashemi G.
  - Fabian J. Theis
year: 2025
journal: bioRxiv
doi: 10.1101/2025.10.14.682419
url: https://doi.org/10.1101/2025.10.14.682419
tags:
  - paper
  - AIVC
  - single-cell
  - contrastive-learning
  - foundation-models
status: unread
rating:
date_added: 2025-05-14
date_read:
---

# scConcept: Contrastive pretraining for technology-agnostic single-cell representations beyond reconstruction

## Quick Summary
> The authors present **scConcept**, a transformer-based contrastive learning framework designed to learn robust, technology-agnostic cell embeddings for single-cell transcriptomics. Moving away from traditional reconstruction-based methods like masked language modeling (which are often poorly aligned with cell-level representation requirements), scConcept employs a cell-level identification task that optimizes embeddings by contrasting multiple views (subsets of genes) of the same cell. The model demonstrates superior performance in downstream tasks including cell-type annotation, spatial transcriptomic label transfer, gene imputation, and integration across diverse sequencing and imaging technologies.

## Key Points
- Criticizes current single-cell foundation models for their reliance on masked language modeling as a proxy for learning useful embeddings.
- Introduces a "cell-level identification" contrastive framework that effectively ignores technical noise and gene panel variability.
- Proposes **scConcept+**, an inference-time adaptation technique that allows the pre-trained model to generalize to unseen datasets without supervised fine-tuning.
- Outperforms state-of-the-art models (scGPT, Geneformer, Nicheformer) in zero-shot tasks and demonstrates robust integration capabilities for spatial datasets (MERFISH, Xenium).
- Provides a new principled framework for gene panel design and optimization using mutual information estimation.

## Methods
### Data
- Pre-trained on over 33 million cell profiles from 241 datasets (CellxGene census collection).
- Evaluated on diverse datasets: Bone marrow (NeurIPS 2021), Alzheimer’s Brain (Allen Brain Map), Skeletal muscle aging atlas, Ovarian cancer (CosMx/Xenium/MERFISH), and Human Lung Cell Atlas (HLCA).

### Model Architecture
- [[Transformer]] encoder-only architecture (8 layers, 512 embedding dimension).
- 16.8 million trainable parameters.
- Uses a [CLS] token for cell-level representation.
- Employs [[Flash Attention]] for efficient sequence processing.

### Training Strategy
- [[Contrastive Learning]] using a modified [[InfoNCE loss]] function.
- Input data encoded via local rank encoding (ordering non-zero genes).
- Trained using a multi-GPU [[Distributed Data Parallel]] (DDP) strategy.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Bone marrow Cell-type (Macro F1) | ~5% improvement | Zero-shot foundation models |
| Spatial label transfer | Superior performance | PCA/Normalized counts |
| Gene imputation (PCC) | Highest performance | [[Tangram]], scVI, PCA |

## Figures


| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of the scConcept model and contrastive training pipeline. |
| Fig 2  | Annotation performance benchmarks on bone marrow, brain, and muscle datasets. |
| Fig 3  | Evaluation of gene panel independence and spatial label transfer capabilities. |
| Fig 4  | Performance on gene imputation tasks using Pearson Correlation Coefficients. |
| Fig 5  | Mutual information estimation for gene panel optimization and design. |
| Fig 6  | Mapping spatial data to integrated atlases like the Human Lung Cell Atlas (HLCA). |
| Fig 7  | Data integration robustness across multiple assays and technologies (scIB metrics). |


## Critical Analysis
### Strengths
- The contrastive objective directly optimizes for cell embeddings, which are the primary output needed for downstream biological analysis, rather than as a byproduct of reconstruction.
- High degree of generalizability to spatial technologies without needing them during pre-training.
- The use of local rank encoding effectively handles count distribution variations between disparate technologies.

### Weaknesses
- Performance is still somewhat sensitive to the diversity of the pre-training corpus, necessitating the "scConcept+" adaptation step for underrepresented tissues.
- Encoder-centric architecture currently lacks a generative decoder for tasks like perturbation response prediction (though the authors suggest this can be added).

### Questions
- How does the model perform on ultra-low-coverage technologies beyond those tested?
- Would multi-modal integration (e.g., ATAC-seq + RNA-seq) significantly improve the "cell views" beyond the current transcriptomics-only approach?

## Connections
### Related Papers
- [[scGPT]]
- [[Geneformer]]
- [[Nicheformer]]
- [[Tangram]]
- [[scArches]]
- [[scVI]]

### Related Concepts
- [[Self-supervised learning]]
- [[Mutual information estimation]]
- [[Foundation models]]
- [[Domain adaptation]]

### Potential Applications
- Designing targeted gene panels for custom spatial transcriptomics experiments.
- Automated annotation of spatial datasets using massive existing scRNA-seq atlases.
- Integrating heterogeneous single-cell data from multiple laboratory sites.

## Notes
-