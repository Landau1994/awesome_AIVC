---
title: Cell Ontology
aliases: [CL, Cell type ontology]
tags:
  - concept
  - ontology
  - knowledge-base
  - single-cell
  - AIVC
date_created: 2026-03-25
status: draft
---

# Cell Ontology (CL)

## Overview

The **Cell Ontology (CL)** is a standardized, hierarchical classification system for cell types and cell-type-related entities. It provides a controlled vocabulary for annotating cell types across organisms, enabling consistent naming and computational integration of single-cell genomics data.

## Core Structure

### Hierarchy Levels
- **Root**: Cell
  - Organism-specific cells (human, mouse, etc.)
    - Tissue-resident cells (liver cell, neuron, etc.)
      - Cell type variants (activated T cell, CD4+ T cell, etc.)

### Key Properties
- **Unique identifiers**: CL:0000001 format
- **Synonyms**: Multiple names for same cell type
- **Definitions**: Clear biological descriptions
- **Parent-child relationships**: Cell type inheritance
- **Cross-references**: Links to other ontologies (GO, CHEBI, UBERON)

## Importance in Single-Cell Biology

### 1. Data Integration
- Standardize cell type names across studies
- Enable meta-analysis across datasets
- Reduce redundancy (10 names for "T cell" → 1 CL term)

### 2. Tool Development
- Single-cell atlases use CL for annotation
- Tools like [[02_Concepts/Dimensionality Reduction|cell type inference]] output CL terms
- Enables programmatic queries

### 3. Biocuration
- [[Biocuration]] experts maintain and expand CL
- New cell types discovered via scRNA-seq → added to CL
- Recent work: [[bioRxiv 2026 Cell phenotypes in the biomedical literature a systematic analysis and text mining corpus|CellLink]] improved chondrocyte hierarchy

## Structure Example

```
CL:0000000 Cell
├── CL:0000001 Human cell
│   ├── CL:0000129 Fibroblast
│   ├── CL:0000451 Dendritic cell
│   │   ├── CL:0000453 Inflammatory dendritic cell
│   │   ├── CL:0001043 Plasmacytoid dendritic cell
│   └── CL:0000084 T cell
│       ├── CL:0000085 CD4-positive, alpha-beta T cell
│       ├── CL:0000786 CD8-positive, alpha-beta T cell
└── CL:0000010 Mouse cell
    └── ... (similar hierarchy)
```

## Recent Expansions

The Cell Ontology is actively maintained and expanded:
- **2023-2024**: ~200+ new cell types added annually
- **scRNA-seq driven**: Most new terms discovered through single-cell studies
- **Cross-organism**: Improving human-mouse alignments

### CellLink Contribution
[[bioRxiv 2026 Cell phenotypes in the biomedical literature a systematic analysis and text mining corpus|Recent work]] used text mining to:
- Identify gaps in chondrocyte classification
- Add 15+ new chondrocyte subtypes to CL
- Improve hierarchy depth and specificity

## Usage in Computational Tools

### Scanpy Integration
```python
import scanpy as sc
import cellxgene_census

# Query using CL terms
cells = cellxgene_census.get_cells(
    cell_types=['CL:0000084']  # All T cells
)
```

### Standardization
- Human Cell Atlas uses CL
- CELLxGENE Census curated with CL
- scVI-tools compatible

## Challenges

⚠️ **Scope Creep**: Does "activated CD4+ T cell in a specific tissue" deserve own CL term?
⚠️ **Consensus**: Different labs use different granularity
⚠️ **Growth Rate**: ~200 new terms/year; scRNA-seq discovering faster
⚠️ **Organism Coverage**: Human/mouse well-represented; others sparse

## Advantages

✅ **Standardization**: One vocabulary for all
✅ **Hierarchical**: Flexible query granularity
✅ **Community-Driven**: Scientists can propose new terms
✅ **Interoperability**: Links to anatomy, GO, disease ontologies
✅ **Computational**: Programmatic access via OBO format

## Related Concepts

- [[Biocuration]] - Manual curation of Cell Ontology
- [[Named Entity Recognition]] - Extracting cell types from text
- [[Entity Linking]] - Mapping text mentions to CL terms
- [[02_Concepts/Single-Cell Embeddings|Single-cell Analysis]] - Uses CL for annotation

## Tools & Access

- **OBO Format**: Cell.obo file (open format)
- **Ontology Lookup Service (OLS)**: https://www.ebi.ac.uk/ols/ontologies/cl
- **Cell Ontology GitHub**: https://github.com/obophenotype/cell-ontology
- **Pronto**: Python library for ontology manipulation

## See Also

- Entity Linking to ontologies
- Biocuration workflows
- Single-cell cell type assignment

---

**Last Updated**: 2026-03-25
