---
title: Multi-modal Integration
aliases: [Multimodal, Multi-omics Integration]
tags:
  - concept
  - AIVC
  - multi-omics
  - integration
  - learning-path
category: Core Concept
importance: high
date_created: 2026-01-16
last_updated: 2026-01-16
---

# Multi-modal Integration

## Definition
> Multi-modal integration combines multiple measurement types (RNA, protein, chromatin, spatial) to create comprehensive cell representations. In AIVC, this enables richer cell models that capture multiple layers of cellular regulation.

## Key Ideas
- **Complementary information**: Each modality captures different aspects
- **Shared latent space**: Unified representation across modalities
- **Cross-modal prediction**: Infer one modality from another
- **Holistic cell state**: Complete picture of cellular behavior

## Common Modality Combinations

| Combination | Technology | Information |
|-------------|------------|-------------|
| RNA + Protein | CITE-seq | Transcription + translation |
| RNA + ATAC | Multiome, SHARE-seq | Expression + chromatin |
| RNA + Spatial | Spatial transcriptomics | Expression + location |
| RNA + Perturbation | Perturb-seq | Expression + intervention |

## Integration Methods

| Method | Approach | Modalities |
|--------|----------|------------|
| **MOFA+** | Factor analysis | Multiple |
| **MultiVI** | VAE | RNA + ATAC |
| **Cobolt** | VAE | RNA + ATAC |
| **totalVI** | VAE | RNA + Protein |

## AIVC Vision
- Full multi-modal cell models
- Integrate all available measurements
- More complete simulation capability

## Related Concepts
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Spatial Transcriptomics|Spatial Transcriptomics]]
- [[02_Concepts/Generative Models|Generative Models]]

## Key Papers
- [[01_Papers/Bunne 2024 - How to Build Virtual Cell|AIVC Vision]] - Multi-modal emphasis
- [[01_Papers/scGPT|scGPT]] - Multi-omic integration
