---
title: Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models
aliases:
  - scLDM
authors:
  - Giovanni Palla
  - Sudarshan Babu
  - Payam Dibaeini
  - James D. Pearce
  - Donghui Li
  - Aly A. Khan
  - Theofanis Karaletsos
  - Jakub M. Tomczak
year: 2025
journal: arXiv:2511.02986v1 [stat.ML]
doi: 10.48550/arXiv.2511.02986
url: https://arxiv.org/abs/2511.02986
tags:
  - paper
  - AIVC
  - scRNA-seq
  - Generative-Models
  - Diffusion-Models
status: unread
rating:
date_added: 2025-11-04
date_read:
---

# Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models

## Quick Summary
The authors propose **scLDM**, a generative model designed for single-cell gene expression data that treats gene profiles as exchangeable sets rather than fixed vectors. The architecture combines a fully transformer-based [[Variational Autoencoders|Variational Autoencoder]] (VAE) with a [[Latent Diffusion Models|Latent Diffusion Model]] (specifically using [[Flow Matching]]). The VAE utilizes a novel Multi-head Cross-Attention Block (MCAB) to compress high-dimensional, sparse gene counts into fixed-size latent tokens. This approach achieves state-of-the-art performance in reconstruction, unconditional generation, and conditional generation on both observational and perturbational datasets, while also providing high-quality embeddings for downstream classification tasks.

## Key Points
- **Exchangeability**: The model respects the biological reality that gene expression profiles are unordered sets (exchangeable), avoiding artificial gene ordering or restriction to highly variable genes (HVGs).
- **Architecture**: A two-stage approach: (1) A Transformer-based VAE learning a permutation-invariant latent space, and (2) A Latent Diffusion Model (using [[Diffusion Transformer]]s) trained via [[Flow Matching]] in that latent space.
- **MCAB**: Introduces the **Multi-head Cross-Attention Block**, serving as a permutation-invariant pooling operator in the encoder and a permutation-equivariant unpooling operator in the decoder.
- **Joint Conditioning**: Demonstrates that "joint conditioning" (learning a single embedding for combined attributes like cell type + perturbation) outperforms additive conditioning strategies.
- **Scalability**: The model scales effectively, with a 270M parameter version trained on 30M+ cells (Human Census Data) showing superior performance on downstream classification tasks compared to existing foundation models like [[scGPT]] and [[Geneformer]].

## Methods
### Data
- **Observational Benchmarks**: [[Dentate Gyrus]], [[Tabula Muris]], and [[Human Lung Cell Atlas]] (HLCA).
- **Perturbational Datasets**: [[Parse 1M]] (cytokine perturbations) and [[Replogle]] (CRISPR gene knockouts).
- **Pre-training**: Human Census Data (CellxGene) containing ~33M cells.
- **Downstream Evaluation**: [[COVID-19]] lung atlas and [[Tabula Sapiens 2.0]].

### Model Architecture
- **Encoder**: A transformer stack using MCAB to pool variable-length gene inputs (counts + IDs) into fixed-size latent tokens ($\mathbf{Z}$). It uses a zero-padding strategy for non-expressed genes to handle sparsity efficiently.
- **Decoder**: A transformer stack using MCAB to unpool latent tokens back to gene-specific parameters (Negative Binomial means/dispersions).
- **Latent Prior**: Replaces the standard Gaussian prior with a [[Latent Diffusion Models|Latent Diffusion Model]] (LDM).
- **Diffusion Backbone**: Uses [[Diffusion Transformer]] (DiT) blocks.
- **Guidance**: Implements Classifier-Free Guidance (CFG) with a joint conditioning strategy.

### Training Strategy
- **Stage 1 (VAE)**: Trained to reconstruct gene expression using a Negative Binomial likelihood and a KL-divergence term (with $\beta$-weighting).
- **Stage 2 (LDM)**: The VAE is frozen. The DiT is trained on the latent tokens using **Linear Interpolants** and **Flow Matching** loss.
- **Optimization**: AdamW optimizer, cosine learning rate scheduler.

## Results
### Reconstruction (Observational)
| Metric | Dataset | scLDM (Ours) | CFGen (SOTA) | scVI (Baseline) |
|--------|---------|--------------|--------------|-----------------|
| MSE ($\downarrow$) | HLCA | **0.069** | 0.117 | 0.238 |
| PCC ($\uparrow$) | Tabula Muris | **0.391** | 0.136 | 0.221 |
| RE ($\downarrow$) | Tabula Muris | **4569.6** | 5547.6 | 5588.2 |

### Generation Quality (Observational - Unconditional)
| Metric | Dataset | scLDM (Ours) | CFGen | scDiffusion |
|--------|---------|--------------|-------|-------------|
| Wasserstein-2 ($\downarrow$) | Dentate Gyrus | **10.817** | 12.617 | 17.443 |
| Fréchet Dist ($\downarrow$) | Tabula Muris | **13.130** | 36.373 | 158.977 |

### Conditional Generation (Perturbational - Parse 1M)
| Metric | scLDM ($\omega=1$) | CPA | scGPT |
|--------|--------------------|-----|-------|
| Fréchet Dist ($\downarrow$) | **18.136** | 181.324 | 523.932 |
| MMD$^2$ RBF ($\downarrow$) | **0.027** | 1.117 | 2.203 |

### Downstream Classification (COVID-19)
| Model | F1 Score | Recall | Precision |
|-------|----------|--------|-----------|
| **scLDM (270M)** | **0.820** | **0.836** | **0.806** |
| TranscriptFormer | 0.814 | 0.829 | 0.801 |
| scGPT | 0.779 | 0.793 | 0.766 |
| scVI | 0.675 | 0.680 | 0.680 |

## Figures

| Figure | Description |
| ------ | ----------- |
| **Fig 1** | Architecture overview: (A) Transformer-based VAE with MCAB for pooling/unpooling. (B) Latent Diffusion Model using DiT and Flow Matching. |
| **Fig 2** | Conditional generation distributions for HLCA. Shows scLDM matches ground truth density for markers (ACTA2, COL1A1) better than baselines. |
| **Fig 3** | Qualitative evaluation on perturbational data (Parse 1M/Replogle). scLDM correctly models shifts caused by cytokine and genetic perturbations. |
| **Fig 8** | UMAP visualizations of generated vs. true data across all datasets. scLDM shows high overlap and coverage of the manifold. |
| **Fig 14** | ROC and PR curves for COVID-19 classification. scLDM (270M) achieves the highest Area Under Curve (AUC). |

## Critical Analysis
### Strengths
- **Principled Handling of Sets**: Unlike most models that assume a fixed vector input, this approach natively handles the set-nature of gene expression via attention mechanisms.
- **Performance**: Consistently outperforms strong baselines (including [[CFGen]] and [[scGPT]]) across reconstruction, generation, and perturbation tasks.
- **Unified Architecture**: Eliminates the need for separate architectures for varying set sizes by using the MCAB tokenization strategy.
- **Foundation Model Potential**: The scaling experiments (up to 270M params) suggest this architecture is a viable candidate for large-scale foundation models in biology.

### Weaknesses
- **Complexity**: Training a two-stage model (VAE + Diffusion) is computationally more intensive than a single-stage VAE like [[scVI]].
- **Overestimation of Variance**: In some gene-wise variance plots (Fig 5-7), scLDM shows a slight tendency to overestimate variance compared to the true data, though significantly better than scDiffusion (which underestimates).

### Questions
- How does the inference latency compare to standard VAEs (scVI) given the diffusion sampling steps?
- Can the MCAB architecture be easily adapted to multi-modal data (e.g., [[ATAC-seq]] + RNA) without significant architectural changes?

## Connections
### Related Papers
- **[[scVI]]**: The standard VAE baseline for single-cell analysis.
- **[[CFGen]]**: A recent Flow Matching model operating in scVI latent space; scLDM improves upon this by using a Transformer VAE and joint conditioning.
- **[[SetTransformer]] / [[Perceiver]]**: The MCAB architecture is inspired by these permutation-invariant architectures.
- **[[scGPT]] / [[Geneformer]]**: Transformer-based foundation models used as baselines for classification tasks.

### Related Concepts
- [[Flow Matching]]: The generative training objective used in the second stage.
- [[Latent Diffusion Models]]: The class of generative models used.
- [[Exchangeability]]: The property of the data distribution being invariant to permutation.
- [[Classifier-Free Guidance]]: Used for conditional generation (cell types/perturbations).

### Potential Applications
- **In silico Perturbation Screening**: Predicting cellular responses to drugs or gene edits without running the physical experiment.
- **Data Imputation**: Recovering full gene expression profiles from sparse data.
- **Cell Type Annotation**: Using the learned embeddings for high-accuracy classification.
- **Synthetic Data Augmentation**: Generating realistic single-cell data to train other models or augment rare cell types.

## Notes
- The paper makes a strong case for replacing MLP-based VAEs with Transformer-based VAEs in the single-cell domain.
- The use of "Input Token" and "Latent Token" strategies effectively bridges the gap between set-based biological data and standard transformer inputs.