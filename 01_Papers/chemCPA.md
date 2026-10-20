---
title: "Predicting Cellular Responses to Novel Drug Perturbations at a Single-Cell Resolution"
aliases: [chemCPA]
authors:
  - Leon Hetzel
  - Simon Boehm
  - Niki Kilbertus
  - Stephan Günnemann
  - Mohammad Lotfollahi
  - Fabian J. Theis
year: 2022
journal: "NeurIPS 2022"
doi: "10.52202/068431-1937"
url: "https://papers.neurips.cc/paper_files/paper/2022/hash/aa933b5abc1be30baece1d230ec575a7-Abstract-Conference.html"
tags:
  - paper
  - AIVC
  - perturbation
  - autoencoder
  - drug-discovery
  - chemical-structure
  - single-cell
  - learning-path
status: unread
rating:
priority: P2
date_added: 2026-01-16
date_read:
---

# chemCPA: Predicting Unseen Drug Perturbations with Chemical Structure

## Quick Summary
> chemCPA extends CPA by replacing the perturbation dictionary with a neural network that encodes chemical structures, enabling prediction of cellular responses to entirely novel drugs not seen during training based on their molecular structure.

## Key Points
- **Novel drug prediction**: Predicts response to unseen compounds
- **Chemical encoding**: Uses molecular structure information
- **Extends CPA**: Builds on compositional framework
- **Transfer learning**: Pre-trained molecule encoders
- **Drug discovery application**: Screen virtual compound libraries

## The Problem

### CPA Limitation
- CPA uses a perturbation embedding dictionary
- Dictionary only contains drugs seen during training
- Cannot predict response to novel drugs

### chemCPA Solution
> Replace perturbation dictionary with a neural network that maps chemical structure → perturbation embedding

## Methods

### Architecture
```
Novel Drug (SMILES/structure)
↓
Pre-trained Molecule Encoder G
  - (e.g., CDDD, MolBERT)
↓
Perturbation Encoder M
  - Maps molecular features to perturbation latent
↓
Dose Scaler S (amortized)
  - Scales perturbation by dose
↓
CPA Framework
  - Compositional latent space
  - Cell state + perturbation
↓
Predicted Gene Expression
```

### Key Components

#### Pre-trained Molecule Encoder (G)
- Uses pre-trained chemical embeddings
- Options: CDDD, MolBERT, molecular fingerprints
- Captures chemical structure information

#### Perturbation Encoder (M)
- Neural network: chemical embedding → perturbation latent
- Learns structure-activity relationships
- Trained end-to-end with expression prediction

#### Amortized Dose Scaler (S)
- Models dose-response relationship
- Continuous dose representation
- Enables interpolation/extrapolation

### Training
1. Train on drugs WITH single-cell response data
2. Learn mapping: structure → expression effect
3. Apply to novel drugs with known structure

## Results

### Performance on Unseen Drugs
| Comparison | Result |
|------------|--------|
| chemCPA vs CPA | **Better** on unseen drugs |
| chemCPA vs scGen | **Better** |
| Pre-training helps | Yes, significantly |

### Key Dataset
- **sci-Plex3**: 188 drugs, 3 cancer cell lines
- Train on subset, test on held-out drugs
- Demonstrates novel drug prediction

### Ablation Studies
- Pre-trained molecule encoder > random init
- Perturbation network > dictionary (for unseen)
- Extra regularization improves generalization

## Applications

### Drug Discovery
1. Screen virtual compound libraries in silico
2. Prioritize candidates for experimental validation
3. Predict off-target effects

### Lead Optimization
1. Predict effect of structural modifications
2. Guide medicinal chemistry
3. Reduce experimental costs

## Comparison with Related Methods

| Method | Novel Drugs | Combinations | Architecture |
|--------|-------------|--------------|--------------|
| scGen | No | No | VAE + arithmetic |
| CPA | No | Yes | Autoencoder + disentanglement |
| **chemCPA** | **Yes** | Yes | CPA + mol encoder |
| GEARS | No | Yes | GNN |

## Critical Analysis
### Strengths
- Enables novel drug prediction (key capability)
- Builds on proven CPA framework
- Uses transfer learning from chemistry
- Practical drug discovery application

### Weaknesses
- Requires quality molecule embeddings
- Limited by structure-activity assumptions
- Generalization bounds unclear
- Smaller validation than CPA

### Questions
- How different can novel drugs be from training?
- Optimal molecule encoder choice?
- Integration with GEARS for genetic perturbations?

## Successors and Related Work

> [!note] Source correction (2026-10-20)
> Removed an unverified PerturbNet comparison. The previously associated Song et al. paper, [Decoding heterogeneous single-cell perturbation responses](https://doi.org/10.1038/s41556-025-01626-9), introduces a perturbation-response score (PS); it does not support the claimed PerturbNet architecture or superiority over chemCPA.

### PRnet (2024)
- Perturbation-conditioned generative model
- Works at bulk and single-cell levels
- Novel chemical perturbation prediction

## Connections
### Related Papers
- [[01_Papers/CPA|CPA]] (base framework)
- [[01_Papers/scGen|scGen]] (predecessor)
- [[01_Papers/GEARS|GEARS]] (genetic perturbations)

### Related Concepts
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]
- [[02_Concepts/Drug Discovery|Drug Discovery]]
- [[02_Concepts/Molecular Representations|Molecular Representations]]

## Tools & Code
- GitHub: https://github.com/theislab/chemCPA
- Follow the official repository for implementation and reproduction instructions.

## Citation
```bibtex
@inproceedings{hetzel2022chemcpa,
  title={Predicting Cellular Responses to Novel Drug Perturbations at a Single-Cell Resolution},
  author={Hetzel, Leon and others},
  booktitle={Advances in Neural Information Processing Systems},
  year={2022},
  doi={10.52202/068431-1937}
}
```

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://papers.neurips.cc/paper_files/paper/2022/hash/aa933b5abc1be30baece1d230ec575a7-Abstract-Conference.html). This is a NeurIPS 2022 main conference paper, not a workshop-only publication. Official code: [theislab/chemCPA](https://github.com/theislab/chemCPA).
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
