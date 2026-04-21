---
title: "A multi-modal diffusion model with dual-cross-attention for multi-omics data generation and translation"
aliases: [scDiffusion-X]
authors:
  - Erpai Luo
  - Lei Wei
  - Minsheng Hao
  - Xuegong Zhang
  - Qiao Liu
year: 2026
journal: Nature Communications
doi: 10.1038/s41467-026-71744-x
url: https://doi.org/10.1038/s41467-026-71744-x
tags:
  - paper
  - AIVC
  - multi-omics
  - diffusion-models
  - single-cell
status: unread
rating:
date_added: 2024-05-22
date_read:
---

# A multi-modal diffusion model with dual-cross-attention for multi-omics data generation and translation

## Quick Summary
The paper introduces **scDiffusion-X**, a deep generative latent diffusion model specifically designed for single-cell multi-omics data integration, generation, and translation. Its core innovation is a **Dual-Cross-Attention (DCA)** module that adaptively captures dependencies between molecular modalities (e.g., scRNA-seq and scATAC-seq), allowing the model to generate high-fidelity synthetic data, perform accurate cross-modality translation with uncertainty quantification, and infer cell-type-specific gene regulatory networks (GRNs) using a gradient-based interpretation framework.

## Key Points
- **Architecture:** Employs a latent diffusion framework combined with a novel DCA module for flexible, non-linear modality integration.
- **Multimodal Capabilities:** Supports joint data generation, modality translation (predicting one omic from another), and *in silico* perturbation simulation.
- **Interpretability:** Features a gradient-based framework to transform attention matrices into heterogeneous GRNs, linking genes, peaks, and latent elements.
- **Scalability:** Demonstrates superior performance on large-scale datasets like MiniAtlas (>130,000 cells), outperforming VAE-based and flow-based models.
- **Uncertainty Quantification:** Provides probabilistic characterization of translated data through prediction intervals, matching real data variance.

## Methods
### Data
- **OpenProblem:** 69,249 cells with 22 cell types (scRNA-seq and scATAC-seq).
- **PBMC10k:** 10,000 cells from 10X Genomics.
- **BABEL Dataset:** ~40,000 paired cells from multiple sources (DM, HSR, PBMC).
- **MiniAtlas:** >133,000 paired cells across 56 cell types and 19 tissues.

### Model Architecture
- **Multimodal Autoencoder:** Uses MLPs to project high-dimensional omics data into a shared low-dimensional latent space. RNA uses a Negative Binomial (NB) distribution; ATAC uses a Bernoulli distribution.
- **Multimodal Denoising Network:** A U-Net-like structure that operates in the latent space.
- **Dual-Cross-Attention (DCA):** A specialized module integrated into the denoising blocks to facilitate information exchange between modalities without simple concatenation.

### Training Strategy
- **Two-Stage Training:** 
  1. Train the multimodal autoencoder to reconstruct the input.
  2. Train the diffusion denoising network in the fixed latent space using conditional labels (cell type, etc.) and time-step embeddings.

## Results
| Metric | Value (scDiffusion-X) | Baseline (Best) |
|--------|-------|----------|
| **scRNA MMD** | Improved by 33.3% | MultiVI/CFGen |
| **scRNA LISI** | Improved by 15.5% | MultiVI/CFGen |
| **scATAC AUC** | 0.575 (lower is better) | 0.846 (MultiVI) |
| **Modality Translation MMD** | 0.18 - 0.26 | 0.31 - 0.55 (BABEL) |
| **GRN Precision** | 0.64 | 0.52 (SCENIC+) |

## Figures
| Figure | Description |
| ------ | ----------- |
| Fig 1  | **Model Overview:** Shows the latent diffusion architecture, DCA module, and downstream tasks like GRN construction. |
| Fig 2  | **Realistic Data Generation:** Benchmarking against MultiVI and CFGen; demonstrates scalability and cellular heterogeneity preservation. |
| Fig 3  | **Modality Translation:** Visualizes accuracy in predicting ATAC from RNA and vice versa, including uncertainty and perturbation results. |
| Fig 4  | **GRN Discovery:** Illustrates how gradient-based interpretation of DCA uncovers regulatory links between genes and chromatin peaks. |
| Fig 5  | **Ablation Study:** Evaluates the impact of the number of DCA modules and information richness across time steps. |

## Critical Analysis
### Strengths
- **Flexibility:** Unlike VAEs, diffusion models handle complex, multi-modal distributions without over-smoothing.
- **Novel Integration:** DCA avoids the limitations of early/late concatenation by learning adaptive interactions.
- **Practical Utility:** The model is pre-trained on MiniAtlas, making it useful as a foundation model for fine-tuning.
- **Robust Uncertainty:** First to provide well-calibrated prediction intervals for multi-omics translation.

### Weaknesses
- **Computational Cost:** Diffusion processes are iteratively slower than single-pass VAE inference (though GPU memory usage is noted as comparable).
- **Preliminary GRNs:** The regulatory network inference is described as "preliminary" and requires further large-scale validation.
- **Hyperparameter Sensitivity:** Lacks an explicit parameter for controlling the sparsity of the regulatory links.

### Questions
- How does the model perform on truly unpaired datasets where "diagonal" integration is required?
- Could the DCA module be extended to more than two modalities (e.g., proteomics + transcriptomics + epigenomics) simultaneously?

## Connections
### Related Papers
- **MultiVI (2023):** Standard VAE baseline for multi-omics.
- **BABEL (2021):** Modality translation baseline.
- **scDesign3 (2024):** Statistical simulator for single-cell data.
- **CFGen (2024):** Flow-matching based generative model.

### Related Concepts
- [[Latent Diffusion Models]]
- [[Multi-omics Integration]]
- [[Cross-Attention Mechanisms]]
- [[Gene Regulatory Networks (GRN)]]
- [[In silico Perturbation]]

### Potential Applications
- **Data Augmentation:** Increasing the representation of rare cell types to improve classifier performance.
- **Virtual Staining:** Predicting missing modalities to save sequencing costs.
- **Hypothesis Generation:** Identifying candidate enhancers and promoters for experimental validation.

## Notes
- The model successfully increased the F1 score for rare cell type identification (cDC2 and plasma cells) from 0% to over 80% through synthetic data augmentation.
- Code is available on GitHub (EperLuo/scDiffusion-X).