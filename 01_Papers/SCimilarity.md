---
title: "A cell atlas foundation model for scalable search of similar human cells"
aliases: [SCimilarity]
authors:
  - Graham Heimberg
  - Tony Kuo
  - Daryle J. DePianto
  - Omar Salem
  - Tobias Heigl
  - Nathaniel Diamant
  - Gabriele Scalia
  - Tommaso Biancalani
  - Shannon J. Turley
  - Jason R. Rock
  - Héctor Corrada Bravo
  - Josh Kaminker
  - Jason A. Vander Heiden
  - Aviv Regev
year: 2024
journal: Nature
doi: 10.1038/s41586-024-08411-y
url: https://doi.org/10.1038/s41586-024-08411-y
tags:
  - paper
  - AIVC
  - Foundation-Models
  - scRNA-seq
status: unread
rating: 
date_added: 2024-05-24
date_read: 
---

# A cell atlas foundation model for scalable search of similar human cells

## Quick Summary
> The authors introduce SCimilarity, a deep metric learning foundation model trained on over 23 million single-cell RNA-seq profiles across diverse human tissues. By combining supervised triplet loss and unsupervised reconstruction loss, SCimilarity learns a unified and interpretable 128-dimensional representation of cell states. This framework enables rapid, scalable searches for transcriptionally similar cells across hundreds of studies without the need for manual batch correction or harmonized annotations. As a proof of concept, the authors utilized SCimilarity to identify fibrosis-associated macrophages (FMΦs) across multiple fibrotic diseases and uncovered a 3D hydrogel in vitro culture system that replicates this specific in vivo cell state.

## Key Points
- Uses [[Metric Learning]] to embed single-cell profiles into a shared hyperspherical latent space where similar cells are close and dissimilar cells are far apart.
- Trained on 7.9 million cells from 56 studies and evaluated against a reference atlas of 23.4 million cells from 412 studies.
- Avoids the need for explicit batch correction during queries by forcing cross-study anchor/positive pairs during triplet loss training.
- Scales efficiently to millions of cells, taking ~50 milliseconds to retrieve nearest neighbors using [[hnswlib]] approximate nearest-neighbor search.
- Integrates an explainability framework based on [[Integrated Gradients]] to identify key genes driving the similarity between cell profiles.
- Identified FMΦ-like cells not only in interstitial lung disease but also in COVID-19, various cancers, and an ex vivo 3D hematopoietic stem cell culture model.

## Methods
### Data
- **Corpus**: 412 sc/snRNA-seq studies generated primarily with the 10x Genomics Chromium platform, totaling 23.4 million cells. 
- **Training Set**: 7.9 million single-cell profiles from 56 studies with author-provided annotations mapped to 203 Cell Ontology terms.
- **Validation Set**: 15 studies (1.4 million cells) explicitly held out from the training phase to evaluate zero-shot generalization and integration.

### Model Architecture
- A multi-layer fully connected autoencoder architecture.
- **Encoder**: Four hidden layers (1024, 1024, 1024, 128 dimensions). The 128-dimensional output is L2-normalized to project embeddings onto the surface of a hypersphere.
- **Decoder**: Used exclusively to compute a Mean Squared Error (MSE) reconstruction loss for regularization.
- Incorporates 40% input dropout and 50% hidden layer dropout for regularization.

### Training Strategy
- Simultaneously optimizes two objectives: (1) a supervised [[Triplet Loss]] with semi-hard negative mining to cluster similar cell types across studies, and (2) an unsupervised [[Reconstruction Loss]] to preserve subtle intra-cell-type transcriptional variation.
- Triplet selection strictly required positive cells (same Cell Ontology term) to come from a different study than the anchor, forcing the model to learn batch-invariant biology.
- Relationships with vertical (ancestor-descendant) Cell Ontology links were excluded to prevent ambiguous comparisons.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Spearman correlation ($\rho$) with FMΦ signature | 0.77 | scFoundation (0.54), scGPT (0.59) |
| Cell Type Annotation Accuracy (F1) vs scANVI | ~86.5% | 85.2% (scANVI direct train) |
| Runtime for 23.4M cell query | ~0.05 seconds | ~2.7 hours (manual signature score) |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of SCimilarity. Demonstrates query functionality against a 23.4M cell database and details the metric learning (triplet sampling) methodology. |
| Fig 2  | Benchmarks SCimilarity's generalized representation against established data integration models (Harmony, Scanorama, scVI, scArches) using study NMI, ARI, and cell type ASW. |
| Fig 3  | Shows SCimilarity accurately annotating cell types across 15 held-out datasets on par with, or better than, bespoke models like CellTypist, TOSICA, and scANVI. |
| Fig 4  | Application of SCimilarity to discover Fibrosis-Associated Macrophages (FMΦs) across interstitial lung disease, COVID-19, and pancreatic cancers. Showcases the explainability feature via gene attributions. |
| Fig 5  | Identification of an ex vivo 3D hydrogel PBMC culture system that successfully replicates the in vivo FMΦ state, validated experimentally by the authors. |

## Critical Analysis
### Strengths
- **Scalability**: The use of approximate k-NN indices allows users to query tens of millions of cells in milliseconds, fundamentally changing how researchers interact with massive cell atlases.
- **No Fine-tuning Required**: Unlike many foundation models that require task-specific fine-tuning, SCimilarity provides a robust zero-shot embedding for querying and annotation.
- **Interpretable**: The integration of an attribution framework allows researchers to immediately understand the biological drivers (genes) behind a similarity match.

### Weaknesses
- **Ontology Bottleneck**: The model's training is heavily reliant on the availability and accuracy of Cell Ontology mappings. Ambiguous or poorly annotated datasets can limit training efficiency.
- **Poorly Represented States**: The authors note that the model struggles with non-differentiated populations (e.g., fetal samples, stem cells, granulocytes) and explicitly withheld cancer cells due to high biological ambiguity.
- **Platform Bias**: The model was trained exclusively on 10x Genomics Chromium data. While the authors showed some generalization to other platforms (e.g., SMART-Seq2), performance slightly degrades on non-UMI or full-length sequencing platforms.

### Questions
- How well would this metric learning approach adapt to multi-modal data (e.g., CITE-seq, scATAC-seq)?
- Can the hyperspherical latent space be effectively used for continuous trajectory inference, or is it strictly better suited for discrete clustering and retrieval?

## Connections
### Related Papers
- scGPT: Towards Building a Foundation Model for Single-Cell Multi-omics Using Generative AI (Cui et al., 2023)
- Large Scale Foundation Model on Single-cell Transcriptomics [scFoundation] (Hao et al., 2023)
- Mapping single-cell data to reference atlases by transfer learning [scArches] (Lotfollahi et al., 2022)

### Related Concepts
- [[Metric Learning]]
- [[Foundation Models]]
- [[02_Concepts/scRNA-seq|Single-cell RNA-seq]]
- [[Batch Correction]]
- [[Explainable AI]]

### Potential Applications
- Automated, fast cell-type annotation for newly sequenced scRNA-seq datasets.
- Hypothesis generation for identifying in vitro conditions that mimic rare in vivo disease states.
- Pan-tissue discovery of novel or poorly characterized cell states (e.g., immune cell subsets in different microenvironments).

## Notes
-