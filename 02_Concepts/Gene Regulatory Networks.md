---
title: Gene Regulatory Networks
aliases: [GRN, GRNs, Regulatory Networks]
tags:
  - concept
  - AIVC
  - GRN
  - network-biology
  - learning-path
category: Core Concept
importance: critical
date_created: 2026-01-16
last_updated: 2026-01-16
---

# Gene Regulatory Networks

## Definition
> Gene Regulatory Networks (GRNs) describe the complex interactions between transcription factors (TFs) and their target genes that control gene expression. In AIVC, GRN inference and modeling are essential for understanding cellular behavior and predicting perturbation responses.

## Key Ideas
- **Transcription factors**: Proteins that bind DNA and regulate gene expression
- **Target genes**: Genes whose expression is controlled by TFs
- **Network structure**: Directed graph of regulatory relationships
- **Context-specific**: GRNs vary across cell types and conditions

## Network Representation

### Graph Structure
```
TF_A ──→ Gene_1
  │
  └──→ Gene_2 ──→ Gene_3
        ↑
TF_B ──┘
```

### Adjacency Matrix
$$A_{ij} = \begin{cases} 1 & \text{if TF } i \text{ regulates gene } j \\ 0 & \text{otherwise} \end{cases}$$

## GRN Inference Methods

| Method | Type | Approach |
|--------|------|----------|
| **GENIE3** | Tree-based | Random forest regression |
| **GRNBoost2** | Tree-based | Gradient boosting |
| **SCENIC/SCENIC+** | Motif-based | TF binding motifs + co-expression |
| **scPRINT** | Transformer | Attention-based inference |
| **GeneCompass** | Transformer | Knowledge-informed |

## Applications in AIVC

### Perturbation Prediction
- GRNs explain how perturbations propagate
- [[01_Papers/GEARS|GEARS]] uses GRN as knowledge graph
- Predict downstream effects of gene knockouts

### Cell State Understanding
- GRNs define cell identity
- Master regulators control cell types
- Trajectory inference through GRN dynamics

### Drug Target Discovery
- Identify key regulatory nodes
- Predict drug effects on network
- Find therapeutic targets

## Related Concepts
- [[02_Concepts/Graph Neural Networks|Graph Neural Networks]]
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]
- [[02_Concepts/Knowledge Graphs|Knowledge Graphs]]

## Key Papers
- [[01_Papers/GEARS|GEARS]]
- [[01_Papers/scPRINT|scPRINT]]
- [[01_Papers/GeneCompass|GeneCompass]]

## Tools
- [pySCENIC](https://github.com/aertslab/pySCENIC)
- [GRNBoost2](https://arboreto.readthedocs.io/)
- [scPRINT](https://github.com/cantinilab/scPRINT)
