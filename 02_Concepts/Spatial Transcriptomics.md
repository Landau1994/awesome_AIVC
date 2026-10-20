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
last_updated: 2026-10-20
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
| **10x Visium (original)** | 55 μm spots, often multiple cells | Transcriptome-wide assay, chemistry-dependent |
| **Visium HD** | 2 μm capture squares; analysis often bins/segments them | Chemistry/panel-dependent |
| **Slide-seq** | ~10μm | Transcriptome-wide |
| **MERFISH** | Single-molecule localization, then cell segmentation | Targeted panel; size varies by implementation |
| **Xenium** | Subcellular transcript localization | Panel-dependent, including Prime 5K |
| **CosMx** | Subcellular transcript localization | Panel-dependent: 1K, 6K and whole-transcriptome offerings |

## Applications in AIVC

### CellPLM
- Pre-trains on spatial data
- Learns cross-cell context; attention or co-occurrence does not independently establish physical signaling
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

## Verification (2026-10-20)

Hardware resolution, capture-bin size and effective cell-level resolution differ. Record the chemistry/panel version with every comparison. [Visium HD specifications](https://www.10xgenomics.com/products/visium-hd-spatial-gene-expression); [Xenium Prime 5K](https://www.10xgenomics.com/products/xenium-5k-panel); [CosMx panel brochure](https://nanostring.com/wp-content/uploads/2022/11/BR_MK5188_CosMx_Brochure_r24.pdf).
