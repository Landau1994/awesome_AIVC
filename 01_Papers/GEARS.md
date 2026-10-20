---
title: "Predicting transcriptional outcomes of novel multigene perturbations with GEARS"
aliases: [GEARS]
authors:
  - Yusuf Roohani
  - Kexin Huang
  - Jure Leskovec
year: 2024
journal: "Nature Biotechnology"
doi: "10.1038/s41587-023-01905-6"
url: "https://doi.org/10.1038/s41587-023-01905-6"
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
> GEARS (Graph-Enhanced Gene Activation and Repression Simulator) predicts transcriptional responses to single- and multi-gene perturbations using gene relationships as prior information. Held-out-combination prediction was evaluated within the study's perturbation datasets; the official implementation requires some combination data for reliable combinatorial prediction.

## Key Points
- **Multi-gene perturbations**: Predicts unseen gene combinations
- **Knowledge graph**: Uses gene-gene relationships as inductive bias
- **Graph neural network**: Propagates perturbation effects through network
- **Evaluation**: Improvements over the paper's selected baselines depend on the dataset, split and metric
- **Stanford + Leskovec lab**: Same team as UCE

## The Problem

### Why Multi-gene Perturbation is Hard
- Combinatorial explosion: n genes → n² pairs, n³ triples
- Cannot experimentally test all combinations
- Need to generalize to unseen combinations

### Previous Limitations
- Existing methods differ in their ability to transfer across genes and combinations.
- Predicting a held-out combination is different from predicting an entirely unseen perturbed gene.
- Generalization depends on the coverage of training perturbations and prior gene relationships.

## Methods

### Architecture
```
Perturbation (gene set to perturb)
↓
Gene-Gene Knowledge Graph
  - GO annotations
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
| Single-gene | Evaluated against baseline predictors in the paper |
| Two-gene (seen genes) | Evaluated on held-out combinations |
| Two-gene (unseen genes) | More demanding generalization split; not a guarantee for arbitrary genes |

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
- Models gene relationships when predicting single- and multi-gene perturbations
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
  year={2024},
  doi={10.1038/s41587-023-01905-6}
}
```

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://doi.org/10.1038/s41587-023-01905-6). Published online 17 August 2023; the journal issue is dated 2024. The [official implementation](https://github.com/snap-stanford/GEARS) does not support cross-cell-type transfer, and training on single-gene perturbations alone does not support reliable combinatorial prediction.
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
