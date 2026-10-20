---
title: "GeneCompass: deciphering universal gene regulatory mechanisms with a knowledge-informed cross-species foundation model"
aliases: [GeneCompass]
authors:
  - Xiaodong Yang
  - et al.
year: 2024
journal: "Cell Research"
doi: "10.1038/s41422-024-01034-y"
url: "https://doi.org/10.1038/s41422-024-01034-y"
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
> GeneCompass is a knowledge-informed cross-species foundation model using a corpus of over 100 million human and mouse cells. It integrates promoter sequences, gene regulatory networks, gene families and co-expression information for cross-species investigations. The paper's corpus descriptions contain differing cell counts, detailed below.

## Key Points
- **Large corpus**: scCompass-126M; reported counts differ between the overview and Methods
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
- **scCompass-126M**: The paper describes a corpus of over 120M cells and names it scCompass-126M
- **Methods enumeration**: 53,568,337 human cells and 48,200,083 mouse cells, totaling 101,768,420
- These descriptions are inconsistent within the source; the overview count and the enumerated total should not be treated as interchangeable verified training counts
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

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://doi.org/10.1038/s41422-024-01034-y). Its overview/discussion describes scCompass-126M, whereas Methods enumerates 101,768,420 human and mouse cells. The discrepancy remains unresolved; this note retains both descriptions and avoids a current "largest corpus" claim.
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
