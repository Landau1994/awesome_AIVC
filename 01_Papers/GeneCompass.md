---
title: "GeneCompass: Knowledge-Informed Cross-Species Foundation Model"
aliases: [GeneCompass]
authors:
  - Xiaodong Yang
  - et al.
year: 2024
journal: Cell Research
doi: 10.1038/s41422-024-01034-y
url:
tags:
  - paper
  - AIVC
  - foundation-model
  - transformer
  - single-cell
  - cross-species
  - knowledge-informed
  - GRN
  - learning-path
status: unread
rating:
priority: P1
date_added: 2026-01-16
date_read:
---

# GeneCompass: Knowledge-Informed Cross-Species Foundation Model

## Quick Summary
> GeneCompass is a knowledge-informed cross-species foundation model trained on 120+ million cells from humans and mice. It uniquely integrates prior biological knowledge including promoter sequences, gene regulatory networks, gene families, and co-expression data to enable cross-species biological investigations.

## Key Points
- **Largest corpus**: 120M+ cells (scCompass-126M)
- **Cross-species**: Human and mouse unified
- **Knowledge-informed**: Integrates GRNs, promoters, gene families
- **Absolute expression**: Quantitative encoding (not just ranks)
- **Cell fate discovery**: In-silico perturbation for regulator discovery

## Methods

### Architecture
```
Gene Expression + Prior Knowledge
↓
Multi-source Knowledge Integration:
  - Promoter sequences
  - Gene regulatory networks (GRNs)
  - Gene family information
  - Co-expression networks
↓
Transformer Encoder
  - Quantitative expression encoding
  - Knowledge-informed attention
↓
Task-specific Fine-tuning
```

### Key Innovation: Knowledge Integration

#### Prior Knowledge Sources
| Source | Information |
|--------|-------------|
| Promoter sequences | Regulatory DNA |
| Gene regulatory networks | TF-target relationships |
| Gene families | Evolutionary groupings |
| Co-expression | Functional modules |

### Training Data
- **scCompass-126M**: Largest single-cell corpus
- ~50M human cells
- ~50M mouse cells
- Multiple tissues and conditions

### Expression Encoding
Unlike Geneformer (rank-based):
- **Quantitative encoding**: Preserves absolute values
- More information retention
- Better for cross-species comparison

## Results
| Task | Performance |
|------|-------------|
| Cross-species annotation | State-of-the-art |
| GRN prediction | Strong |
| Drug dose-response | Competitive |
| Perturbation prediction | Strong |
| Cell fate prediction | Novel capability |

## Applications

### Cross-Species Analysis
- Unified human-mouse cell space
- Transfer annotations between species
- Comparative biology studies

### Cell Fate Discovery
- In-silico gene perturbation
- Identify fate regulators
- Validated: Induced hESC differentiation to gonadal fate

### Gene Regulatory Networks
- Predict TF-target relationships
- Context-specific networks
- Validated against known biology

## Critical Analysis
### Strengths
- Knowledge integration is novel and powerful
- Cross-species capability important
- Quantitative expression encoding
- Strong downstream performance
- Cell fate discovery validated experimentally

### Weaknesses
- Limited to human/mouse
- Complex architecture with many components
- Knowledge sources may introduce biases

### Questions
- Which knowledge source contributes most?
- How to extend to more species?
- Sensitivity to knowledge base quality?

## Connections
### Related Papers
- [[01_Papers/UCE|UCE]] (also cross-species, different approach)
- [[01_Papers/Geneformer|Geneformer]] (rank-based, single species)
- [[01_Papers/scGPT|scGPT]] (comparison baseline)

### Related Concepts
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Gene Regulatory Networks|Gene Regulatory Networks]]
- [[02_Concepts/Knowledge Graphs|Knowledge Graphs in Biology]]

## Tools & Code
- Paper: https://www.nature.com/articles/s41422-024-01034-y

## Citation
```bibtex
@article{yang2024genecompass,
  title={GeneCompass: deciphering universal gene regulatory mechanisms with a knowledge-informed cross-species foundation model},
  author={Yang, Xiaodong and others},
  journal={Cell Research},
  volume={34},
  pages={830--845},
  year={2024}
}
```
