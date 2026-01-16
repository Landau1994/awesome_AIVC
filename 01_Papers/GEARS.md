---
title: "GEARS: Predicting Transcriptional Outcomes of Novel Multi-gene Perturbations"
aliases: [GEARS]
authors:
  - Yusuf Roohani
  - Kexin Huang
  - Jure Leskovec
year: 2023
journal: Nature Biotechnology
doi: 10.1038/s41587-023-01905-6
url: https://github.com/snap-stanford/GEARS
tags:
  - paper
  - AIVC
  - perturbation
  - GNN
  - graph-neural-network
  - single-cell
  - learning-path
status: unread
rating:
priority: P1
date_added: 2026-01-16
date_read:
---

# GEARS: Predicting Transcriptional Outcomes of Novel Multi-gene Perturbations

## Quick Summary
> GEARS (Graph-Enhanced Gene Activation and Repression Simulator) is a geometric deep learning model that predicts outcomes of novel single and multi-gene perturbations by leveraging gene-gene relationships from knowledge graphs. It is the first method to predict combinatorial genetic perturbations not seen during training.

## Key Points
- **Multi-gene perturbations**: Predicts unseen gene combinations
- **Knowledge graph**: Uses gene-gene relationships as inductive bias
- **Graph neural network**: Propagates perturbation effects through network
- **State-of-the-art**: Best performance on perturbation prediction benchmarks
- **Stanford + Leskovec lab**: Same team as UCE

## The Problem

### Why Multi-gene Perturbation is Hard
- Combinatorial explosion: n genes → n² pairs, n³ triples
- Cannot experimentally test all combinations
- Need to generalize to unseen combinations

### Previous Limitations
- Existing methods only predict single-gene perturbations
- Cannot generalize to novel combinations
- Don't leverage biological knowledge

## Methods

### Architecture
```
Perturbation (gene set to perturb)
↓
Gene-Gene Knowledge Graph
  - GO annotations
  - Protein-protein interactions
  - Co-expression networks
↓
Graph Neural Network
  - Message passing on knowledge graph
  - Perturbation signal propagation
↓
Gene Expression Prediction
  - Post-perturbation expression
  - Differentially expressed genes
```

### Key Innovation: Knowledge Graph Integration

#### Knowledge Sources
| Source | Information |
|--------|-------------|
| Gene Ontology | Functional relationships |
| STRING | Protein interactions |
| Co-expression | Expression correlation |

#### How It Works
1. Encode perturbation as node features
2. Propagate through knowledge graph via GNN
3. Learn how perturbation effects spread
4. Predict downstream expression changes

### Model Components
- **Perturbation encoder**: Embeds perturbed genes
- **Cross-gene module**: GNN on knowledge graph
- **Expression decoder**: Predicts expression changes

## Results

### Benchmark Performance
| Setting | GEARS vs Baselines |
|---------|-------------------|
| Single-gene | State-of-the-art |
| Two-gene (seen genes) | State-of-the-art |
| Two-gene (unseen genes) | **First to work** |

### Key Datasets
- **Norman et al. 2019**: CRISPRa, K562 cells
- **Replogle et al. 2022**: Genome-wide CRISPRi

### Ablation Studies
- Knowledge graph is critical for generalization
- GNN architecture matters for multi-gene
- Gene embeddings improve single-gene prediction

## Evaluation Metrics
- MSE on expression changes
- Pearson correlation
- Top-20 differentially expressed gene prediction
- Direction of change accuracy

## Critical Analysis
### Strengths
- First method for multi-gene perturbation prediction
- Principled use of biological knowledge
- Strong empirical performance
- Well-designed experiments and ablations
- Open-source implementation

### Weaknesses
- Requires high-quality knowledge graphs
- Limited to genetic perturbations (not drugs)
- Computational cost for large gene sets
- Knowledge graph quality varies

### Questions
- How to extend to chemical perturbations?
- Can it predict higher-order interactions (3+ genes)?
- Sensitivity to knowledge graph completeness?

## Connections
### Related Papers
- [[01_Papers/CPA|CPA]] (VAE-based, compositional)
- [[01_Papers/scGen|scGen]] (VAE-based, latent arithmetic)
- [[01_Papers/scGPT|scGPT]] (foundation model fine-tuning)
- [[01_Papers/UCE|UCE]] (same lab, foundation model)

### Related Concepts
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]
- [[02_Concepts/Graph Neural Networks|Graph Neural Networks]]
- [[02_Concepts/Gene Regulatory Networks|Gene Regulatory Networks]]

## Tools & Code
- GitHub: https://github.com/snap-stanford/GEARS
- PyPI: `pip install cell-gears`
- Tutorial notebooks included

## Citation
```bibtex
@article{roohani2023gears,
  title={Predicting transcriptional outcomes of novel multigene perturbations with GEARS},
  author={Roohani, Yusuf and Huang, Kexin and Leskovec, Jure},
  journal={Nature Biotechnology},
  volume={42},
  pages={927--935},
  year={2023}
}
```
