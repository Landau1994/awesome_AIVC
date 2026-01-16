---
title: Cell-Cell Communication
aliases: [Cell Communication, Intercellular Signaling]
tags:
  - concept
  - AIVC
  - spatial
  - signaling
  - learning-path
category: Core Concept
importance: medium
date_created: 2026-01-16
last_updated: 2026-01-16
---

# Cell-Cell Communication

## Definition
> Cell-cell communication describes how cells exchange signals through ligand-receptor interactions, affecting each other's states and behaviors. In AIVC, modeling these interactions enables understanding tissue-level organization and multicellular responses.

## Key Ideas
- **Ligand-receptor pairs**: Molecular basis of communication
- **Spatial context**: Physical proximity matters
- **Signaling networks**: Complex interaction patterns
- **Tissue microenvironment**: Collective cell behavior

## Analysis Methods

| Method | Approach |
|--------|----------|
| **CellPhoneDB** | L-R pair database |
| **CellChat** | Network analysis |
| **NicheNet** | Downstream effects |
| **Spatial methods** | Use physical coordinates |

## Relevance to AIVC

### CellPLM Approach
- Treats cells as tokens, tissues as sentences
- Models cell-cell relationships via attention
- [[01_Papers/CellPLM|CellPLM]]

### Spatial Transcriptomics
- Physical coordinates enable direct modeling
- Graph-based approaches with spatial edges

## Related Concepts
- [[02_Concepts/Spatial Transcriptomics|Spatial Transcriptomics]]
- [[02_Concepts/Graph Neural Networks|Graph Neural Networks]]

## Key Papers
- [[01_Papers/CellPLM|CellPLM]] - Cell-cell relations
