---
title: Spatial Transcriptomics
aliases: [Spatial, ST, Spatial Omics]
tags:
  - concept
  - AIVC
  - spatial
  - technology
  - learning-path
category: Technology
importance: high
date_created: 2026-01-16
last_updated: 2026-01-16
---

# Spatial Transcriptomics

## Definition
> Spatial transcriptomics measures gene expression while preserving the physical location of cells within tissue. In AIVC, spatial data enables modeling cell-cell interactions, tissue organization, and context-dependent cellular behavior.

## Key Ideas
- **Location preserved**: Know where each cell/spot is in tissue
- **Tissue context**: Understand microenvironment
- **Cell neighborhoods**: Analyze spatial relationships
- **Multi-scale**: From subcellular to whole tissue

## Technologies

| Technology | Resolution | Genes |
|------------|------------|-------|
| **10x Visium** | ~50μm spots | Transcriptome-wide |
| **Slide-seq** | ~10μm | Transcriptome-wide |
| **MERFISH** | Single-cell | 100-1000 genes |
| **Xenium** | Subcellular | 100s genes |
| **CosMx** | Subcellular | 1000+ genes |

## Applications in AIVC

### CellPLM
- Pre-trains on spatial data
- Learns cell-cell relationships from physical proximity
- [[01_Papers/CellPLM|CellPLM]]

### Future Directions
- Spatial foundation models
- 3D tissue modeling
- Organ-level virtual cells

## Analysis Tools
- **Squidpy**: Spatial analysis in Python
- **Giotto**: Comprehensive spatial toolkit
- **SpatialData**: Unified data structure

## Related Concepts
- [[02_Concepts/Cell-Cell Communication|Cell-Cell Communication]]
- [[02_Concepts/Multi-modal Integration|Multi-modal Integration]]

## Key Papers
- [[01_Papers/CellPLM|CellPLM]] - Uses spatial pre-training
