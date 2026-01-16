---
title: "CellOT: Learning Single-Cell Perturbation Responses using Neural Optimal Transport"
aliases: [CellOT, Cell Optimal Transport]
authors:
  - Charlotte Bunne
  - Stefan G. Stark
  - Gabriele Gut
  - et al.
year: 2023
journal: Nature Methods
doi: 10.1038/s41592-023-01969-x
url: https://github.com/bunnech/cellot
tags:
  - paper
  - AIVC
  - perturbation
  - optimal-transport
  - single-cell
  - learning-path
status: unread
rating:
priority: P1
date_added: 2026-01-16
date_read:
---

# CellOT: Learning Single-Cell Perturbation Responses using Neural Optimal Transport

## Quick Summary
> CellOT uses optimal transport theory with input convex neural networks to learn mappings between unpaired cell distributions before and after perturbation. It outperforms existing methods on drug response prediction and can generalize to unseen patients and conditions.

## Key Points
- **Optimal transport**: Maps unpaired distributions with minimal effort
- **Neural OT**: Uses input convex neural networks (ICNNs)
- **Distribution-level**: Models population shifts, not single cells
- **Patient generalization**: Works on unseen patients
- **Charlotte Bunne**: Author of AIVC vision paper

## The Problem

### Unpaired Observations
- Single-cell measurements destroy cells
- Cannot measure same cell before AND after perturbation
- Only have unpaired distributions: P(control) and P(treated)

### Previous Approaches
- scGen: Latent space arithmetic
- CPA: Compositional disentanglement
- Both make strong assumptions about perturbation structure

### CellOT Solution
> Learn a transport map T that transforms control distribution to treated distribution using the principle of minimal effort (optimal transport)

## Methods

### Optimal Transport Framework
```
Control cells distribution: P_control
Treated cells distribution: P_treated

Goal: Learn T such that T(P_control) ≈ P_treated
Principle: Minimize total "effort" to transform
```

### Architecture
```
Control Cell Expression
↓
Input Convex Neural Network (ICNN)
  - Ensures T is valid transport map
  - Learns optimal transport potential
↓
Gradient of Potential = Transport Map
↓
Predicted Treated Expression
```

### Key Innovation: Neural Optimal Transport

#### Why ICNNs?
- Optimal transport map = gradient of convex function
- ICNNs guarantee convexity by construction
- Enables learning OT maps with neural networks

#### Monge Map Estimation
$$T(x) = \nabla f_\theta(x)$$
where $f_\theta$ is an ICNN

### Training Objective
Minimize Wasserstein distance between:
- Pushed control distribution: T#P_control
- Actual treated distribution: P_treated

## Results

### Drug Response Prediction
| Dataset | CellOT vs Baselines |
|---------|---------------------|
| sci-Plex (scRNA-seq) | **Best** |
| 4i (protein imaging) | **Best** |

### Generalization Tests
| Test | Result |
|------|--------|
| Holdout patients (lupus) | Strong |
| Holdout patients (glioblastoma) | Strong |
| Cross-species (LPS response) | Works |
| Developmental trajectories | Works |

### Comparison with Baselines
- Outperforms scGen
- Outperforms CPA
- Especially strong on patient generalization

## Limitations
> OOD predictions are only feasible if:
> 1. Similar samples observed in unperturbed setting
> 2. Training set contains similar perturbation responses

## Critical Analysis
### Strengths
- Principled mathematical foundation
- No assumptions about latent structure
- Strong patient generalization
- Multi-modal (scRNA-seq + protein imaging)
- Same author as AIVC vision paper

### Weaknesses
- Distribution-level (not single-cell trajectories)
- Requires sufficient training examples
- Computational cost of OT
- Cannot handle unseen perturbations directly

### Questions
- How to combine with compositional approaches?
- Scaling to larger datasets?
- Integration with foundation models?

## Connections
### Related Papers
- [[01_Papers/scGen|scGen]] (latent arithmetic baseline)
- [[01_Papers/CPA|CPA]] (compositional baseline)
- [[01_Papers/Bunne 2024 - How to Build Virtual Cell|AIVC Vision]] (same author)
- [[01_Papers/GEARS|GEARS]] (GNN approach)

### Related Concepts
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]
- [[02_Concepts/Optimal Transport|Optimal Transport]]
- [[02_Concepts/Cell State Transitions|Cell State Transitions]]

## Tools & Code
- GitHub: https://github.com/bunnech/cellot
- Paper: https://www.nature.com/articles/s41592-023-01969-x

## Citation
```bibtex
@article{bunne2023cellot,
  title={Learning single-cell perturbation responses using neural optimal transport},
  author={Bunne, Charlotte and Stark, Stefan G and Gut, Gabriele and others},
  journal={Nature Methods},
  volume={20},
  pages={1759--1768},
  year={2023}
}
```
