---
title: Learning Path
aliases: []
tags:
  - dashboard
  - learning
date_created: 2026-01-16
---

# AI Virtual Cell Learning Path

## Overview

A structured curriculum for mastering AI Virtual Cell technologies.

---

## Phase 1: Foundations (2-4 weeks)

### Biology Fundamentals
- [ ] Cell biology basics
- [ ] Gene expression and regulation
- [ ] Central dogma of molecular biology
- [ ] Introduction to omics technologies

**Resources:**
- [[08_Resources/Biology Primers|Biology Primers]]
- Khan Academy: Cell Biology
- Nature Scitable

### Computational Prerequisites
- [ ] Python for data science
- [ ] PyTorch fundamentals
- [ ] Basic statistics and probability
- [ ] Linear algebra refresher

**Resources:**
- [[08_Resources/Programming Resources|Programming Resources]]

---

## Phase 2: Single-Cell Analysis (2-3 weeks)

### Core Concepts
- [ ] [[02_Concepts/Single-Cell RNA Sequencing|scRNA-seq workflow]]
- [ ] [[02_Concepts/Dimensionality Reduction|Dimensionality reduction (PCA, UMAP, t-SNE)]]
- [ ] [[02_Concepts/Cell Clustering|Cell clustering and annotation]]
- [ ] [[02_Concepts/Trajectory Inference|Trajectory inference]]

### Tools
- [ ] Scanpy basics
- [ ] AnnData format
- [ ] CELLxGENE exploration

**Papers:**
- [ ] Scanpy tutorial paper
- [ ] Best practices in single-cell analysis

---

## Phase 3: Deep Learning for Biology (3-4 weeks)

### Neural Network Architectures
- [ ] [[02_Concepts/Graph Neural Networks|Graph Neural Networks for molecular data]]
- [ ] [[02_Concepts/Transformers for Biology|Transformers and attention mechanisms]]
- [ ] [[02_Concepts/Variational Autoencoders|Variational Autoencoders]]
- [ ] [[02_Concepts/Diffusion Models|Diffusion models basics]]

### Biological Applications
- [ ] Sequence modeling
- [ ] Structure prediction
- [ ] Expression prediction

**Papers:**
- [ ] [[01_Papers/Attention Is All You Need|Attention Is All You Need]]
- [ ] [[01_Papers/Graph Attention Networks|Graph Attention Networks]]

---

## Phase 4: Foundation Models (3-4 weeks)

### Cell Foundation Models
- [ ] [[01_Papers/Bunne 2024 - How to Build Virtual Cell|How to Build the Virtual Cell with AI]] (Core paper)
- [ ] [[01_Papers/scGPT|scGPT: Toward Building a Foundation Model for Single-Cell Multi-omics]]
- [ ] [[01_Papers/Geneformer|Geneformer: Transfer learning enables predictions]]
- [ ] [[01_Papers/scFoundation|scFoundation]]

### Key Concepts
- [ ] [[02_Concepts/Cell Embeddings|Cell embeddings and representations]]
- [ ] [[02_Concepts/Transfer Learning Biology|Transfer learning in biology]]
- [ ] [[02_Concepts/Multi-modal Integration|Multi-modal data integration]]

---

## Phase 5: Perturbation Modeling (2-3 weeks)

### Theory
- [ ] [[02_Concepts/Perturbation Prediction|Perturbation prediction framework]]
- [ ] [[02_Concepts/Gene Regulatory Networks|Gene regulatory networks]]
- [ ] [[02_Concepts/Causal Inference|Causal inference in biology]]

### Methods & Papers
- [ ] [[01_Papers/CPA|CPA: Compositional Perturbation Autoencoder]]
- [ ] [[01_Papers/GEARS|GEARS: Predicting transcriptional outcomes of novel multi-gene perturbations]]
- [ ] [[01_Papers/CellProphet|CellProphet: Dynamic GRN inference]]

### Practical
- [ ] Perturb-seq data analysis
- [ ] Virtual Cell Challenge datasets

---

## Phase 6: Advanced Topics (Ongoing)

### Multi-scale Modeling
- [ ] Cell-tissue interactions
- [ ] Spatial transcriptomics
- [ ] Temporal dynamics

### Clinical Translation
- [ ] Drug response prediction
- [ ] Personalized medicine
- [ ] Regulatory considerations

### Competitions & Challenges
- [ ] Arc Institute Virtual Cell Challenge
- [ ] Kaggle biological challenges
- [ ] Open Problems in Single-Cell Analysis

---

## Milestones

### Beginner
- [ ] Complete Phase 1 & 2
- [ ] Reproduce a basic scRNA-seq analysis

### Intermediate
- [ ] Complete Phase 3 & 4
- [ ] Fine-tune a cell foundation model

### Advanced
- [ ] Complete Phase 5 & 6
- [ ] Contribute to open-source project
- [ ] Submit to competition or publish

---

## Progress Tracker

```dataview
TABLE WITHOUT ID
    file.link as "Topic",
    status as "Status"
FROM "02_Concepts" OR "01_Papers"
WHERE contains(tags, "learning-path")
SORT status ASC
```
