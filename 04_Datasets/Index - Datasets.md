---
title: Index - Datasets
aliases: [Datasets Overview]
tags:
  - index
  - MOC
date_created: 2026-01-16
---

# AI Virtual Cell Datasets Index

## Single-Cell Atlases

### Major Repositories

| Repository | Scale | Description |
|------------|-------|-------------|
| **CELLxGENE** | Release-dependent | Curated single-cell data; pin a Census release |
| **Human Cell Atlas** | Multi-tissue | Human reference atlas |
| **[[04_Datasets/Tabula Sapiens 2.0\|Tabula Sapiens 2.0]]** | >1.1M cells | 28 tissues, 24 donors |
| **Tabula Muris** | 100K cells | Mouse atlas |

### Access
- [CELLxGENE Portal](https://cellxgene.cziscience.com/)
- [HCA Data Portal](https://data.humancellatlas.org/)

## Pre-training Datasets

| Dataset | Size | Used By |
|---------|------|---------|
| Genecorpus-30M | 30M cells | Geneformer |
| CELLxGENE subset | 33M cells | scGPT |
| scFoundation corpus | 50M cells | scFoundation |

## Perturbation Datasets

### CRISPR Screens

| Dataset | Year | Cell context | Perturbations | Type |
|---------|------|-------|---------------|------|
| Norman 2019 | 2019 | K562 | CRISPRa; counts depend on retained conditions | Single + combination |
| [[04_Datasets/Replogle\|Replogle 2022]] | 2022 | K562 and RPE1 | CRISPRi; screen-specific targets | Genome-wide and essential-gene screens |
| Dixit 2016 | 2016 | BMDC | ~24 | Original [[02_Concepts/Perturb-seq\|Perturb-seq]] |
| Adamson 2016 | 2016 | K562 | ~100 | CRISPRi |

### Drug Screens
| Dataset | Description |
|---------|-------------|
| LINCS L1000 | Gene expression signatures |
| sci-Plex | Single-cell drug response |

## Benchmarks

### Competition Datasets
| Competition | Task | Status |
|-------------|------|--------|
| Virtual Cell Challenge 2025 | Perturbation prediction | Completed |
| Open Problems | Various | Ongoing |
| NeurIPS SC Competitions | Various | Annual |

### Evaluation Benchmarks
| Benchmark | Tasks |
|-----------|-------|
| scib | Batch integration |
| GEARS benchmark | Perturbation |
| Cell type annotation | Classification |

## Spatial Transcriptomics

| Technology | Resolution |
|------------|-----------|
| 10x Visium | Spot-based |
| MERFISH | Single-cell |
| Slide-seq | Near single-cell |
| Xenium | Subcellular |

## Multi-modal Datasets

| Dataset | Modalities |
|---------|-----------|
| CITE-seq datasets | RNA + protein |
| sci-CAR | RNA + ATAC |
| SHARE-seq | RNA + ATAC |
| Multiome (10x) | RNA + ATAC |

## Data Formats

### Common Formats
- **AnnData (.h5ad)**: Standard for single-cell
- **Seurat objects (.rds)**: R ecosystem
- **Loom (.loom)**: Velocyto compatible
- **CellRanger outputs**: 10x format

### Accessing Data
```python
# CELLxGENE Census
import cellxgene_census
census = cellxgene_census.open_soma()

# Scanpy datasets
import scanpy as sc
adata = sc.datasets.pbmc3k()
```

## Quality Considerations

### Data Quality Metrics
- Sequencing depth
- Genes detected per cell
- Doublet rate
- Batch effects

### Preprocessing Standards
- Refer to [Single-cell Best Practices](https://www.sc-best-practices.org/)

## Versioning

Check each linked dataset note for primary sources and the distinction between full releases and benchmark subsets. The screening table’s “Cell context” column contains cell lines, not cell counts. Technology resolution also depends on the platform generation and segmentation procedure.
