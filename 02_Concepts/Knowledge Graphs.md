---
title: Knowledge Graphs
aliases: [Knowledge Graphs in Biology, Biological Knowledge Graphs]
tags:
  - concept
  - AIVC
  - knowledge-representation
  - GNN
  - learning-path
category: Core Technique
importance: high
date_created: 2026-01-16
last_updated: 2026-01-16
---

# Knowledge Graphs in Biology

## Definition
> Knowledge graphs represent biological entities and their relationships as structured networks. In AIVC, they provide prior knowledge for GNNs, enable knowledge-informed training, and improve generalization.

## Key Ideas
- **Entities**: Genes, proteins, pathways, diseases
- **Relations**: Regulates, interacts, belongs-to
- **Prior knowledge**: Curated biological information
- **Inductive bias**: Guide model learning

## Common Biological Knowledge Sources

| Source | Content | Used By |
|--------|---------|---------|
| **Gene Ontology (GO)** | Gene functions, processes | GEARS |
| **STRING** | Protein-protein interactions | GEARS, GeneCompass |
| **Reactome** | Biological pathways | Various |
| **KEGG** | Metabolic pathways | Various |
| **ChEMBL** | Drug-target interactions | Drug discovery |

## Applications in AIVC

### GEARS
- Uses GO + STRING as gene-gene graph
- GNN propagates perturbation effects
- Enables multi-gene prediction

### GeneCompass
- Integrates GRNs, promoters, gene families
- Knowledge-informed attention
- Cross-species transfer

## Related Concepts
- [[02_Concepts/Graph Neural Networks|Graph Neural Networks]]
- [[02_Concepts/Gene Regulatory Networks|Gene Regulatory Networks]]
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]

## Key Papers
- [[01_Papers/GEARS|GEARS]]
- [[01_Papers/GeneCompass|GeneCompass]]
