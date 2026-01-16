---
title: "scGen: Predicts Single-Cell Perturbation Responses"
aliases: [scGen]
authors:
  - Mohammad Lotfollahi
  - F. Alexander Wolf
  - Fabian J. Theis
year: 2019
journal: Nature Methods
doi: 10.1038/s41592-019-0494-8
url: https://github.com/theislab/scgen
tags:
  - paper
  - AIVC
  - perturbation
  - VAE
  - latent-arithmetic
  - single-cell
  - foundational
  - learning-path
status: unread
rating:
priority: P2
date_added: 2026-01-16
date_read:
---

# scGen: Predicts Single-Cell Perturbation Responses

## Quick Summary
> scGen is a foundational method combining variational autoencoders with latent space vector arithmetic to predict how cells respond to perturbations. It can generalize across cell types, studies, and species by learning transferable perturbation vectors in latent space.

## Key Points
- **Pioneer work**: One of first deep learning perturbation predictors
- **Latent arithmetic**: Uses vector math in VAE latent space
- **Cross-domain transfer**: Generalizes across cell types and species
- **Simple yet effective**: Elegant approach that inspired many follow-ups
- **Theis lab**: Foundation for CPA and other methods

## The Problem

### Out-of-Sample Prediction Challenge
- Want to predict perturbation response in unseen cell types
- Training data limited to certain conditions
- Need to transfer knowledge across domains

### Previous Limitations
- Statistical models: Limited to in-sample prediction
- Mechanistic models: Require detailed prior knowledge
- No generalization to out-of-sample settings demonstrated

## Methods

### Core Idea: Latent Arithmetic
Inspired by word2vec arithmetic (king - man + woman = queen):
```
perturbed_cell = unperturbed_cell + δ

where δ = mean(perturbed_cells) - mean(unperturbed_cells)
         in latent space
```

### Architecture
```
Gene Expression (cell)
↓
VAE Encoder
↓
Latent Space z
↓
Vector Arithmetic:
  z_predicted = z_unperturbed + δ
↓
VAE Decoder
↓
Predicted Perturbed Expression
```

### How It Works

#### Step 1: Learn Latent Space
- Train VAE on all available single-cell data
- Cells mapped to latent space z

#### Step 2: Compute Perturbation Vector
- From training cell type with perturbation data:
- δ = E[z_perturbed] - E[z_control]

#### Step 3: Apply to New Cell Type
- For cell type without perturbation data:
- z_predicted = z_control + δ
- Decode to get predicted expression

### Key Insight
> The perturbation vector δ captures the "direction" of perturbation effect in latent space, which transfers across cell types

## Results

### Validated Applications
| Application | Dataset |
|-------------|---------|
| Stimulation response | PBMC + IFN-β |
| Drug response | Cancer cell lines |
| Cross-species | Human ↔ Mouse |
| Disease response | Lupus patients |

### Performance
- Accurately predicts responding vs non-responding genes
- Captures cell-type specific responses
- Transfers across species (human ↔ mouse)

### Key Finding
> scGen learns features that distinguish responding from non-responding genes and cells

## Evaluation
- Correlation with held-out data
- Differentially expressed gene prediction
- Visual inspection of predictions

## Critical Analysis
### Strengths
- Elegant and interpretable approach
- First demonstration of OOD perturbation prediction
- Simple implementation
- Strong empirical results
- Foundational influence on field

### Weaknesses
- Linear assumption in latent space
- Requires perturbation data in at least one cell type
- Single perturbation vector (not combinatorial)
- May not capture complex interactions

### Historical Significance
- **Foundational paper** for perturbation prediction field
- Inspired CPA, CellOT, and many others
- Established latent space arithmetic paradigm
- Demonstrated feasibility of out-of-distribution prediction

## Connections
### Related Papers
- [[01_Papers/CPA|CPA]] (direct successor, compositional)
- [[01_Papers/CellOT|CellOT]] (optimal transport alternative)
- [[01_Papers/GEARS|GEARS]] (GNN-based approach)

### Related Concepts
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]
- [[02_Concepts/Variational Autoencoders|Variational Autoencoders]]
- [[02_Concepts/Transfer Learning Biology|Transfer Learning]]

## Tools & Code
- GitHub: https://github.com/theislab/scgen
- Implemented in scvi-tools
- Reproducibility repo: https://github.com/theislab/scgen-reproducibility

## Citation
```bibtex
@article{lotfollahi2019scgen,
  title={scGen predicts single-cell perturbation responses},
  author={Lotfollahi, Mohammad and Wolf, F Alexander and Theis, Fabian J},
  journal={Nature Methods},
  volume={16},
  pages={715--721},
  year={2019}
}
```
