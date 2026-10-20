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

### Hierarchy
CL represents cell types with multiple inheritance and logical relationships. Many canonical terms are species-agnostic; organism and tissue information can be recorded separately. It is not a tree with “human cell” and “mouse cell” as its main branches.

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
- Cell-type annotation tools may map predictions to CL terms; dimensionality reduction alone does not assign ontology labels
- Enables programmatic queries

### 3. Biocuration
- [[Biocuration]] experts maintain and expand CL
- New cell types discovered via scRNA-seq → added to CL
- Recent work: [[bioRxiv 2026 Cell phenotypes in the biomedical literature a systematic analysis and text mining corpus|CellLink]] improved chondrocyte hierarchy

## Structure Example

| Identifier | Cell type |
|---|---|
| CL:0000000 | cell |
| CL:0000084 | T cell |
| CL:0000624 | CD4-positive, alpha-beta T cell |
| CL:0000625 | CD8-positive, alpha-beta T cell |

This table lists examples, not direct parent-child edges. Consult the released ontology for the complete hierarchy.

## Recent Expansions

The Cell Ontology is actively maintained and expanded:
- **Versioned releases**: Counts and additions must be tied to a specific release
- **Single-cell evidence**: Transcriptomic studies contribute alongside anatomical, functional and other evidence
- **Cross-organism**: Improving human-mouse alignments

### CellLink Contribution
[[bioRxiv 2026 Cell phenotypes in the biomedical literature a systematic analysis and text mining corpus|Recent work]] used text mining to:
- Identify gaps in chondrocyte classification
- Support revision of chondrocyte classifications; the exact number requires release-level evidence
- Improve hierarchy depth and specificity

## Usage in Computational Tools

### Scanpy Integration
```python
import cellxgene_census

with cellxgene_census.open_soma() as census:
    cells = census["census_data"]["homo_sapiens"].obs.read(
        value_filter="cell_type_ontology_term_id == 'CL:0000084'",
        column_names=["soma_joinid", "cell_type", "cell_type_ontology_term_id"],
    ).concat().to_pandas()
# Exact-ID filtering does not automatically include annotated descendant types.
```

### Standardization
- Human Cell Atlas uses CL
- CELLxGENE Census curated with CL
- scVI-tools compatible

## Challenges

⚠️ **Scope Creep**: Does "activated CD4+ T cell in a specific tissue" deserve own CL term?
⚠️ **Consensus**: Different labs use different granularity
⚠️ **Versioning**: Terminology and definitions change; record the ontology release
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
- **Ontology Lookup Service (OLS)**: https://www.ebi.ac.uk/ols4/ontologies/cl
- **Cell Ontology GitHub**: https://github.com/obophenotype/cell-ontology
- **Pronto**: Python library for ontology manipulation

## See Also

- Entity Linking to ontologies
- Biocuration workflows
- Single-cell cell type assignment

---

**Last Updated**: 2026-10-20

## Verification (2026-10-20)

Corrected mislabeled identifiers and a nonexistent Census API call. [CL documentation](https://obophenotype.github.io/cell-ontology/); [CL logical definitions](https://pmc.ncbi.nlm.nih.gov/articles/PMC3024222/); [CD8 term](https://www.informatics.jax.org/vocab/cell_ontology/CL%3A0000625); [Census query documentation](https://chanzuckerberg.github.io/cellxgene-census/notebooks/api_demo/census_query_extract.html).
