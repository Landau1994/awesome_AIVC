---
title: "CellPLM: Pre-training of Cell Language Model Beyond Single Cells"
aliases: [CellPLM]
authors: ["Hongzhi Wen", "Wenzhuo Tang", "Xinnan Dai", "Jiayuan Ding", "Wei Jin", "Yuying Xie", "Jiliang Tang"]
year: 2024
journal: "ICLR 2024"
doi: null
url: "https://proceedings.iclr.cc/paper_files/paper/2024/hash/173bcdbd820edbe43284e0941109ada9-Abstract-Conference.html"
tags:
  - paper
  - AIVC
  - foundation-model
  - transformer
  - single-cell
  - spatial
  - cell-cell-relations
  - learning-path
status: unread
rating:
priority: P1
date_added: 2026-01-16
date_read:
doi_status: "Article DOI not listed in the official proceedings page; use the proceedings URL"
---

# CellPLM: Pre-training of Cell Language Model Beyond Single Cells

## Quick Summary
> CellPLM treats cells as tokens and tissues as sequences, incorporating spatially resolved data to learn intercellular context. The authors report improved downstream performance and roughly 100-fold faster cell-embedding inference in their comparison; these results are specific to the evaluated models and setup.

## Key Points
- **Novel paradigm**: Cells as tokens, tissues as sentences (not genes as tokens)
- **Spatial awareness**: Uses spatial transcriptomics in pre-training
- **Cell-cell relations**: First model to encode inter-cellular relationships
- **Reported speed**: Approximately 100-fold faster embedding inference in the paper's comparison
- **ICLR 2024**: Top venue acceptance

## Core Innovation

### The Problem with Current Models
Previous models treat:
- Genes as tokens
- Cells as sentences

This ignores three key differences from NLP:
1. scRNA-seq is **bag-of-genes**, not sequences
2. **Cell-cell relations** are more important than sentence relations
3. Single-cell data is **noisier and smaller** than text data

### CellPLM Solution
- **Cells as tokens**: Each cell is a token
- **Tissues as sentences**: Group of cells form context
- **Spatial information**: Leverage physical positions
- **Gaussian prior**: Inductive bias for limited data

## Methods

### Architecture
```
Cell Expression Profiles (multiple cells)
↓
Gene Expression Embedder
  - Gene embeddings aggregated by expression
  - Unmeasured/masked genes filtered
↓
Flowformer (efficient Transformer variant)
  - Processes cell-cell attention
  - Spatial position encoding
↓
Cell Embeddings with Contextual Information
```

### Key Components

#### Gene Expression Embedder
- Initializes embedding for each gene type
- Aggregates based on expression levels
- Handles variable gene sets

#### Flowformer
- Efficient Transformer variant
- Lower memory and computational complexity
- Handles input constraints

#### Spatial Pre-training
- Incorporates spatial transcriptomics (SRT) data
- Learns cell-cell spatial relationships
- Positional information encoded

### Pre-training Objective
- Masked cell prediction
- Spatial context reconstruction
- Gaussian prior regularization

## Results
| Task | Performance |
|------|-------------|
| Cell type annotation | Outperforms baselines |
| Denoising/Imputation | State-of-the-art |
| Zero-shot embedding | Strong generalization |
| Perturbation prediction | Competitive |

### Speed Comparison
- The authors report approximately **100-fold faster** embedding inference against the compared pretrained models; speed depends on hardware, batching and implementation.
- Efficient cell embedding generation

## Critical Analysis
### Strengths
- Novel cell-as-token paradigm
- First to model cell-cell relations
- Spatial data integration
- Excellent speed improvement
- Top venue (ICLR) acceptance

### Weaknesses
- Requires spatial data for full benefit
- Less established than gene-as-token models
- Newer, less community adoption

### Questions
- How critical is spatial data for performance?
- Can it scale to larger tissue contexts?
- Comparison with graph-based approaches?

## Connections
### Related Papers
- [[01_Papers/scGPT|scGPT]] (gene-as-token approach)
- [[01_Papers/scFoundation|scFoundation]] (also uses efficient Transformer)
- [[01_Papers/Geneformer|Geneformer]] (comparison baseline)

### Related Concepts
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Spatial Transcriptomics|Spatial Transcriptomics]]
- [[02_Concepts/Cell-Cell Communication|Cell-Cell Communication]]

## Tools & Code
- GitHub: https://github.com/OmicsML/CellPLM
- Install: `pip install cellplm`
- ICLR proceedings available

## Citation
```bibtex
@inproceedings{wen2024cellplm,
  title={CellPLM: Pre-training of Cell Language Model Beyond Single Cells},
  author={Wen, Hongzhi and Tang, Wenzhuo and Dai, Xinnan and others},
  booktitle={International Conference on Learning Representations (ICLR)},
  year={2024}
}
```

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://proceedings.iclr.cc/paper_files/paper/2024/hash/173bcdbd820edbe43284e0941109ada9-Abstract-Conference.html).
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
