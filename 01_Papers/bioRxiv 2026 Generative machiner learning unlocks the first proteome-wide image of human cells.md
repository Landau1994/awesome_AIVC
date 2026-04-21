---
title: "Generative machine learning unlocks the first proteome-wide image of human cells"
aliases: [ProtiCelli]
authors:
  - Huangqingbo Sun
  - Konstantin Kahnert
  - Jan N. Hansen
  - William Leineweber
  - Mingyang Li
  - Wanyue Feng
  - Frederic Ballllosera
  - Ulrika Axelsson
  - Wei Ouyang
  - Emma Lundberg
year: 2026
journal: bioRxiv
doi: 10.64898/2026.03.31.715748
url: https://doi.org/10.64898/2026.03.31.715748
tags:
  - paper
  - AIVC
  - Generative Modeling
  - Spatial Proteomics
  - Diffusion Models
  - Virtual Staining
status: unread
rating:
date_added: 2025-05-22
date_read:
---

# Generative machine learning unlocks the first proteome-wide image of human cells

## Quick Summary
The authors present **ProtiCelli**, a deep generative model that simulates high-resolution microscopy images for 12,800 human proteins (the near-proteome) using only three cellular landmark stains: the nucleus, endoplasmic reticulum (ER), and microtubules. Trained on over 1.2 million images from the Human Protein Atlas, the model overcomes experimental scalability limits to create **Proteome2Cell**, a massive dataset of 30.7 million simulated "virtual cells." The model demonstrates a remarkable ability to predict drug-induced changes in protein localization from morphology alone and provides a computational framework for proteome-scale spatial systems biology.

## Key Points
- **Proteome-Wide Scale:** Generates images for 12,800 proteins, far exceeding the current experimental multiplexing limit of ~37 proteins per cell.
- **Landmark-Conditioned Generation:** Uses only 3 reference channels (Nucleus, ER, MT) to infer the spatial distribution of thousands of other proteins.
- **Superior Performance:** Outperforms existing state-of-the-art models (CellDiff and PUPS) in reconstruction accuracy, textural fidelity, and perceptual quality.
- **Generalization:** Successfully generalizes to unseen cell types and drug-perturbed states (Paclitaxel and Vorinostat) not present in the training data.
- **Biological Insight:** Capable of resolving "moonlighting" proteins (proteins with different functions in different compartments) and recapitulating known protein-protein interaction landscapes.
- **Democratization:** Integration into the Human Protein Atlas (HPA) allows researchers to explore "virtual cells" without specialized imaging infrastructure.

## Methods
### Data
- **HPA-training/testing:** 1.23 million single-cell cropped images from the Human Protein Atlas covering 12,800 proteins across 39 cell lines.
- **CM4AI-testing:** An independent validation dataset of 112,410 cells (MDA-MB-468) treated with anti-cancer drugs.
- **Resolution:** Generated images are high-resolution (512 × 512 pixels).

### Model Architecture
- **Framework:** Conditional denoising diffusion model based on the **Elucidating Diffusion Models (EDM)** framework.
- **Backbone:** **Diffusion Transformer Large (DiT-L)** architecture.
- **Latent Diffusion:** Uses a pretrained Variational Autoencoder (VAE) from Stable Diffusion 3.5 to encode images into 16 x 64 x 64 latent representations.
- **Conditioning:** Models are conditioned on three landmark images, target protein identity, and cell line identity.

### Training Strategy
- **Infrastructure:** Trained for 1 million iterations on 8 NVIDIA H100 GPUs.
- **Optimization:** AdamW optimizer with a linear warm-up schedule.
- **Augmentation:** Includes condition dropout (0.5 probability) for cell line embeddings to enable cell-line-agnostic generation.

## Results
| Metric | ProtiCelli | CellDiff | PUPS |
|--------|-------|----------|----------|
| **FID (Fréchet Inception Distance)** | **6.46** | 36.58 | 134.08 |
| **Pearson R (Nucleus)** | **>0.65** | Lower | Lower |
| **Proteins Modeled** | **12,800** | ~12,000 | ~12,000 |
| **Resolution** | **512x512** | 256x256 | 128x128 |

- **Drug Perturbation:** ProtiCelli accurately predicted 48.4% (Paclitaxel) and 78.3% (Vorinostat) of responsive proteins in a concordant direction from morphology alone.
- **Cell Cycle:** After fine-tuning on 100 images, the model achieved high accuracy in predicting cell cycle stages using FUCCI markers (CDT1/GMNN).

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Study overview: Data (HPA) -> Model (ProtiCelli) -> Downstream Tasks (Virtual staining, drug prediction, etc.). |
| Fig 2  | Benchmarking: Visual comparison and quantitative metrics (FID, Pearson R) showing ProtiCelli's superiority. |
| Fig 3  | Subcellular organization: UMAP projections showing that generated images capture biological variance and hierarchical structure. |
| Fig 4  | Biological applications: Context-dependent protein interactions, drug-induced expression changes, and cell cycle dynamics. |
| Fig 5  | Unsupervised Discovery: Using the model for organelle segmentation and spatial analysis of gene sets (e.g., lipid metabolism). |
| Fig 6  | Virtual Protein Assemblies: Visualizing the spatial layout of multi-protein complexes within individual cells. |

## Critical Analysis
### Strengths
- **Massive Scalability:** Successfully bridges the gap between single-protein imaging and whole-proteome visualization.
- **Texture Fidelity:** Unlike earlier models that produced "over-smoothed" images, ProtiCelli captures fine-grained textural details.
- **Practical Utility:** The model is not just a technical showcase; it is applied to specific biological questions like drug response and protein moonlighting.

### Weaknesses
- **Vesicular Compartments:** All models (including ProtiCelli) performed poorly on vesicles (lysosomes, endosomes) due to weak spatial correlation with the provided landmarks.
- **Novel Relocalization:** The model cannot predict relocalization events that are entirely absent from the HPA training distribution.
- **Landmark Dependence:** Currently requires specific landmarks (ER, MT, Nucleus), which might not be available in all legacy datasets.

### Questions
- How would performance change if different landmarks (e.g., Golgi or Mitochondria) were used as inputs?
- Can the model be adapted to predict temporal dynamics (live-cell imaging) rather than static snapshots?

## Connections
### Related Papers
- **Zheng & Huang (2025):** CellDiff model (Baseline).
- **Zhang et al. (2025):** PUPS model (Baseline).
- **Thul et al. (2017):** The original HPA subcellular map.

### Related Concepts
- [[Diffusion Models]]
- [[Spatial Proteomics]]
- [[Virtual Staining]]
- [[Foundation Models for Biology]]

### Potential Applications
- **Drug Discovery:** High-throughput virtual screening of drug effects on protein localization.
- **Systems Biology:** Building complete 3D digital twins of human cells.
- **Diagnostic Pathology:** Enhancing clinical samples with "virtual" biomarkers.

## Notes
- The project has released **Proteome2Cell**, an unprecedented open-access dataset of 30.7 million simulated images.
- ProtiCelli will be integrated into the Human Protein Atlas (v26) in late 2026.