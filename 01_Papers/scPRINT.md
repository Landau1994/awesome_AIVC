---
title: "scPRINT: Pre-training on 50 Million Cells for Gene Network Predictions"
aliases: [scPRINT, scPRINT-2]
authors:
  - Jérémie Kalfon
  - et al.
year: 2025
journal: Nature Communications
doi: 10.1038/s41467-025-58699-1
url: https://github.com/cantinilab/scPRINT
tags:
  - paper
  - AIVC
  - foundation-model
  - transformer
  - single-cell
  - GRN
  - gene-network
  - learning-path
status: unread
rating:
priority: P1
date_added: 2026-01-16
date_read:
---

# scPRINT: Pre-training on 50 Million Cells for Gene Network Predictions

## Quick Summary
> scPRINT (Single-cell PRe-trained Inference of Networks with Transformers) is a foundation model trained on 50+ million cells that uniquely generates cell-specific gene regulatory networks in zero-shot mode, alongside standard tasks like denoising, embedding, and label prediction.

## Key Points
- **Gene network inference**: Unique capability among foundation models
- **Zero-shot capable**: Multiple tasks without fine-tuning
- **50M+ cells**: Large-scale pre-training
- **scPRINT-2**: Next-gen version with 350M cells, 16 organisms
- **Outperforms GENIE3**: Better than classical GRN methods

## Methods

### Architecture
```
scRNA-seq Expression Data
↓
Novel Encoding Mechanism
  - Expression-specific tokenization
  - Designed for gene expression
↓
Bidirectional Transformer
↓
Multiple Zero-shot Outputs:
  - Cell embeddings
  - Denoised expression
  - Label predictions
  - Gene regulatory networks
```

### Three Pre-training Tasks
1. Expression reconstruction
2. Cell context modeling
3. Gene relationship learning

### Key Innovation: Gene Network Generation
- Extracts attention patterns from transformer
- Converts to gene-gene interaction scores
- Produces cell-specific GRNs
- No explicit GRN training needed

## Zero-shot Capabilities

| Task | Description |
|------|-------------|
| Expression denoising | Increase data resolution |
| Cell embedding | Low-dimensional representation |
| Label prediction | Cell type, disease, sex, etc. |
| Gene network inference | Cell-specific GRNs |

## Results

### GRN Benchmark
| Method | Performance |
|--------|-------------|
| scPRINT | Best on many benchmarks |
| GENIE3 | Competitive but slower |
| scGPT | Inferior on GRN task |
| DeepSEM | Lower performance |
| Geneformer v2 | Lower performance |

### Key Finding
> Pushing training to millions of cells and large parameter sizes is essential for gene network inference

## scPRINT-2 (Next Generation)

| Feature | scPRINT | scPRINT-2 |
|---------|---------|-----------|
| Training cells | 50M | 350M |
| Species | Multiple | 16 organisms |
| Performance | Strong | State-of-the-art |

### scPRINT-2 Improvements
- Enhanced tokenization
- Better loss functions
- State-of-the-art on denoising, embedding, cell type prediction

## Ecosystem Tools
- **scDataLoader**: Dataloader for large cell models
- **GRnnData**: Work with gene networks from scRNA-seq
- **benGRN**: Benchmark GRN inference methods

## Critical Analysis
### Strengths
- Unique GRN inference capability
- True zero-shot multi-task
- Comprehensive evaluation
- Active development (scPRINT-2)
- Good software ecosystem

### Weaknesses
- GRN validation is challenging
- Newer, less established
- Computational requirements

### Questions
- How to validate predicted GRNs?
- Cell type specificity of networks?
- Comparison with experimental GRNs?

## Connections
### Related Papers
- [[01_Papers/scGPT|scGPT]]
- [[01_Papers/Geneformer|Geneformer]]
- [[01_Papers/GeneCompass|GeneCompass]] (also GRN-focused)

### Related Concepts
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Gene Regulatory Networks|Gene Regulatory Networks]]
- [[02_Concepts/Zero-shot Learning|Zero-shot Learning]]

## Tools & Code
- GitHub: https://github.com/cantinilab/scPRINT
- scPRINT-2: https://cantinilab.github.io/scPRINT-2/
- Paper: https://www.nature.com/articles/s41467-025-58699-1

## Citation
```bibtex
@article{kalfon2025scprint,
  title={scPRINT: pre-training on 50 million cells allows robust gene network predictions},
  author={Kalfon, J{\'e}r{\'e}mie and others},
  journal={Nature Communications},
  year={2025}
}
```
