---
title: "How to build the virtual cell with artificial intelligence: Priorities and opportunities"
aliases:
  - Bunne 2024
  - AIVC Blueprint
  - AIVC vision
authors:
  - Charlotte Bunne
  - et al.
year: 2024
journal: "Cell"
doi: "10.1016/j.cell.2024.11.015"
url: "https://doi.org/10.1016/j.cell.2024.11.015"
tags:
  - paper
  - AIVC
  - foundation-model
  - roadmap
  - learning-path
status: unread
rating:
priority: P1
date_added: 2026-01-16
date_read:
---

# How to Build the Virtual Cell with AI

## Quick Summary
> This landmark paper outlines the vision, priorities, and opportunities for building AI-powered Virtual Cells (AIVCs) - comprehensive computational models that can simulate cellular behavior across scales using multi-modal data and modern AI architectures.

## Key Points
- AIVCs integrate multi-omics data with AI to create predictive models of cellular function
- Core AI capabilities highlighted by the paper: predictive, generative, and queryable
- Requires massive multi-modal datasets, novel architectures, and evaluation frameworks
- Potential to revolutionize drug discovery, disease understanding, and synthetic biology

## The AIVC Vision

### What is an AIVC?
- Multi-scale computational model of the cell
- Integrates molecular, cellular, and tissue-level information
- Uses foundation models trained on diverse biological data
- Enables in-silico experimentation

### Three Pillars
1. **Data**: Multi-modal, multi-scale biological data
2. **Models**: Foundation models with biological inductive biases
3. **Evaluation**: Benchmarks and validation frameworks

## Illustrative Applications (note synthesis)

### 1. Simulate
- Predict cellular states under various conditions
- Model dynamic processes (cell cycle, differentiation)
- Capture stochastic biological variation

### 2. Predict
- Gene perturbation outcomes
- Drug responses
- Disease progression

### 3. Generate
- Design novel cell states
- Optimize therapeutic interventions
- Create synthetic biological systems

## Data Requirements
| Data Type | Examples | Scale |
|-----------|----------|-------|
| Transcriptomics | scRNA-seq | Large existing atlases; no fixed minimum established here |
| Proteomics | Mass spec, imaging | Growing |
| Spatial | Spatial transcriptomics | Emerging |
| Perturbations | [[02_Concepts/Perturb-seq\|Perturb-seq]], CRISPR screens | Critical |
| Temporal | Time-series | Limited |

## Architecture Considerations
- **Transformers**: For sequence and set modeling
- **GNNs**: For molecular and interaction networks
- **Diffusion models**: For generative tasks
- **Hybrid approaches**: Combining multiple paradigms

## Critical Analysis
### Strengths
- Comprehensive vision document
- Clear research priorities
- Strong author consortium

### Weaknesses
- Ambitious scope may be challenging to realize
- Data availability remains a bottleneck
- Evaluation metrics not fully defined

### Questions
- How to handle biological stochasticity?
- What level of abstraction is optimal?
- How to validate predictions experimentally?

## Connections
### Related Papers
- [[01_Papers/scGPT|scGPT]]
- [[01_Papers/Geneformer|Geneformer]]
- [[01_Papers/scFoundation|scFoundation]]

### Related Concepts
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Multi-modal Integration|Multi-modal Integration]]
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]

## Notes
- This is the foundational roadmap paper for the AIVC field
- Read this first before diving into specific methods

## Citation
```bibtex
@article{bunne2024virtual,
  title={How to build the virtual cell with artificial intelligence: Priorities and opportunities},
  author={Bunne, Charlotte and others},
  journal={Cell},
  year={2024},
  doi={10.1016/j.cell.2024.11.015}
}
```

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://doi.org/10.1016/j.cell.2024.11.015). Corrected the DOI from 10.1016/j.cell.2024.11.015. This is a roadmap: prospective capabilities and data needs are not achieved system performance.
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
