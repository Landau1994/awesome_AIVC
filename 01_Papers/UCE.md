---
title: "Universal Cell Embeddings: A Foundation Model for Cell Biology"
aliases: [UCE, Universal Cell Embeddings]
authors:
  - Yanay Rosen
  - Yusuf Roohani
  - Ayush Agrawal
  - Leon Samotorcan
  - Stephen R. Quake
  - Jure Leskovec
year: 2024
journal: "bioRxiv"
doi: "10.1101/2023.11.28.568918"
url: "https://www.biorxiv.org/content/10.1101/2023.11.28.568918v2"
tags:
  - paper
  - AIVC
  - foundation-model
  - transformer
  - single-cell
  - cross-species
  - zero-shot
  - learning-path
status: unread
rating:
priority: P1
date_added: 2026-01-16
date_read:
---

# UCE: Universal Cell Embeddings

## Quick Summary
> UCE learns cell embeddings using expression profiles and protein-language-model gene embeddings. The preprint describes a 650-million-parameter model and a 36-million-cell atlas spanning eight species. Zero-shot evaluation supports transfer across tested datasets and species; it does not establish reliable embedding of every cell or organism.

## Key Points
- **Cross-species**: Trained on 8 species (human, mouse, zebrafish, etc.)
- **Zero-shot capable**: Embed new datasets without retraining
- **Large scale**: 650M parameters, 33-layer transformer
- **ESM2 integration**: Uses protein language model for gene representations
- **Mega-scale atlas**: 36M cells, 1000+ cell types

## Methods

### Architecture
```
Gene Expression Profile
↓
ESM2 Protein Embeddings (for each gene)
↓
33-layer Transformer Encoder
↓
Universal Cell Embedding
```

### Key Innovation: Protein-Informed Gene Embeddings
- Uses ESM2 protein language model
- Converts gene expression to biologically meaningful embeddings
- Enables cross-species generalization

### Training Data
| Species | Cells |
|---------|-------|
| Human | ~25M |
| Mouse | ~8M |
| Zebrafish | Included |
| Mouse lemur | Included |
| Macaque (2 species) | Included |
| Frog | Included |
| Pig | Included |

## Results
> [!warning] Benchmark details require verification
> The inherited percentages below have not been traced to exact panels, splits and score definitions. They are not verified measurements or a universal model ranking.

### Zero-shot Benchmark (vs other foundation models)
| Metric | UCE Improvement |
|--------|-----------------|
| Overall score | +13.9% vs Geneformer |
| Biological conservation | +16.2% vs Geneformer |
| Batch correction | +10.1% vs Geneformer |
| Cell type silhouette | Best for 67% of types |

### Comparison
- Outperforms Geneformer on 80% of cell types
- Outperforms scGPT on 83% of cell types
- Outperforms tGPT on 73% of cell types

## Emergent Capabilities
- Identifies developmental lineages (not explicitly trained)
- Embeds novel species not in training set
- Discovers cell type relationships across species

## Integrated Mega-scale Atlas
- 36 million cells embedded
- 1000+ unique cell types
- Hundreds of experiments
- Dozens of tissues
- 8 species unified

## Critical Analysis
### Strengths
- True cross-species capability
- Strong zero-shot performance
- ESM2 integration is elegant
- Comprehensive evaluation

### Weaknesses
- Computational cost (650M params)
- Requires protein sequences for genes
- This note retains the preprint revision; the peer-reviewed Nature 2026 publication is linked below.

### Questions
- How well does it generalize to invertebrates?
- Can it be fine-tuned effectively?
- Performance on rare cell types?

## Connections
### Related Papers
- [[01_Papers/scGPT|scGPT]]
- [[01_Papers/Geneformer|Geneformer]]
- [[01_Papers/GeneCompass|GeneCompass]] (also cross-species)

### Related Concepts
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Cell Embeddings|Cell Embeddings]]
- [[02_Concepts/Zero-shot Learning|Zero-shot Learning]]

## Tools & Code
- GitHub: https://github.com/snap-stanford/UCE
- Installation and checkpoint instructions: [official repository](https://github.com/snap-stanford/UCE)
- Virtual Cells Platform: https://virtualcellmodels.cziscience.com/model/uce

## Citation
```bibtex
@article{rosen2023universal,
  title={Universal Cell Embeddings: A Foundation Model for Cell Biology},
  author={Rosen, Yanay and Roohani, Yusuf and Agrawal, Ayush and others},
  journal={bioRxiv},
  year={2024},
  doi={10.1101/2023.11.28.568918}
}
```

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://www.biorxiv.org/content/10.1101/2023.11.28.568918v2). This note retains the 6 October 2024 revision v2 (first posted in 2023). The work is now published: [[01_Papers/nature 2026 Universal cell embedding provides a foundation model for cell biology|Nature 2026 UCE]], [journal DOI](https://doi.org/10.1038/s41586-026-10689-z).
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
