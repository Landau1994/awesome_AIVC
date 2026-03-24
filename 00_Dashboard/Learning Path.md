---
title: Learning Path
aliases: []
tags:
  - dashboard
  - learning
date_created: 2026-01-16
last_updated: 2026-03-25
---

# AI Virtual Cell Learning Path

## Overview

A structured curriculum for mastering AI Virtual Cell technologies.

---

## Phase 1: Foundations (2-4 weeks)

### Biology Fundamentals
- [x] Cell biology basics
- [x] Gene expression and regulation
- [x] Central dogma of molecular biology
- [ ] Introduction to omics technologies (RNA-seq, single-cell, spatial, temporal)

**Resources:**
- [[08_Resources/Index - Resources|Resource Index]]
- Khan Academy: Cell Biology
- Nature Scitable

### Computational Prerequisites
- [x] Python for data science
- [x] PyTorch fundamentals
- [x] Basic statistics and probability
- [x] Linear algebra refresher

**Resources:**
- [[08_Resources/Index - Resources|Resource Index]] - Programming & setup guides
- Kaggle Learn: Python for Data Analysis
- Official PyTorch Documentation

---

## Phase 2: Single-Cell Analysis (2-3 weeks)

### Core Concepts
- [x] [[02_Concepts/scRNA-seq|scRNA-seq workflow & embeddings]]
- [x] Dimensionality reduction (PCA, UMAP, t-SNE)
- [x] Cell clustering and annotation
- [ ] Cell state transitions and trajectory modeling,
	- [ ] [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|velocitybench]],
	- [ ] [[bioRxiv 2026 Benchmarking algorithms for RNA velocity inference]],
	- [ ] [[bioRxiv 2026 Benchmarking zero-shot single-cell foundation model embeddings for cellular dynamics reconstruction]]

### Tools
- [x] Scanpy basics
- [x] AnnData format
- [x] CELLxGENE exploration

**Papers:**
- [x] Scanpy tutorial paper
- [ ] [Best practices in single-cell analysis](https://www.sc-best-practices.org/preamble.html)
- [ ] [[01_Papers/bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|RNA velocity benchmarking]]

---

## Phase 3: Deep Learning for Biology (3-4 weeks)

### Neural Network Architectures
- [x] [[02_Concepts/Graph Neural Networks|Graph Neural Networks for molecular data]]
- [x] [[02_Concepts/Transformers for Biology|Transformers and attention mechanisms]]
- [ ] [[02_Concepts/Variational Autoencoders|Variational Autoencoders]]
- [ ] [[02_Concepts/Generative Models|Diffusion & generative models basics]]

### Biological Applications
- [x] Sequence modeling
- [ ] Structure prediction
- [x] Expression prediction

**Papers:**
- [x] Transformer architecture (Vaswani et al. 2017) - Attention Is All You Need
- [ ] [[02_Concepts/Graph Neural Networks|Graph neural network foundations]]
- [ ] Diffusion models for generative biology

---

## Phase 4: Foundation Models (3-4 weeks)

### Cell Foundation Models
- [x] [[01_Papers/Bunne 2024 - How to Build Virtual Cell|How to Build the Virtual Cell with AI]] (Core paper)
- [x] [[01_Papers/scGPT|scGPT: Toward Building a Foundation Model for Single-Cell Multi-omics]]
- [ ] [[01_Papers/Geneformer|Geneformer: Transfer learning enables predictions]]
- [ ] [[01_Papers/scFoundation|scFoundation]]

### Key Concepts
- [x] [[02_Concepts/Cell Embeddings|Cell embeddings and representations]]
- [x] [[02_Concepts/Transfer Learning Biology|Transfer learning in biology]]
- [ ] [[02_Concepts/Multi-modal Integration|Multi-modal data integration]]

### Benchmarking & Evaluation
- [x] Model evaluation metrics for biological data
- [ ] Comparing foundation models across datasets

---

## Phase 5: Perturbation Modeling (2-3 weeks)

### Theory
- [ ] [[02_Concepts/Perturbation Prediction|Perturbation prediction framework]]
- [ ] [[02_Concepts/Gene Regulatory Networks|Gene regulatory networks]]
- [ ] Causal inference and counterfactual reasoning in biology

### Methods & Papers
- [ ] [[01_Papers/CPA|CPA: Compositional Perturbation Autoencoder]]
- [ ] [[01_Papers/GEARS|GEARS: Predicting transcriptional outcomes of novel multi-gene perturbations]]
- [ ] Dynamic gene regulatory network inference methods
- [ ] Single-cell perturbation atlas studies

### Practical
- [ ] [[02_Concepts/Perturb-seq|Perturb-seq]] data analysis
- [ ] Virtual Cell Challenge datasets preparation
- [ ] Building perturbation prediction models

---

## Phase 6: Advanced Topics (Ongoing)

### Multi-scale Modeling
- [ ] Cell-tissue interactions
- [ ] Spatial transcriptomics integration
- [ ] Temporal dynamics and trajectory modeling
- [ ] RNA velocity and future state prediction

### Clinical Translation
- [ ] Drug response prediction
- [ ] Personalized medicine applications
- [ ] Regulatory considerations for AI in healthcare

### Competitions & Challenges
- [ ] Arc Institute Virtual Cell Challenge (2025-2026)
- [ ] Kaggle biological challenges
- [ ] Open Problems in Single-Cell Analysis
- [ ] NeurIPS CompBio workshops

---

## Phase 7: Research & Publication (Advanced)

### Research Implementation
- [ ] Design novel perturbation experiments
- [ ] Implement custom models from recent papers
- [ ] Reproduce key benchmarks from literature

### Open-Source Contribution
- [ ] Contribute to scVI-tools
- [ ] Contribute to Scanpy ecosystem
- [ ] Maintain experimental code repository

### Publication Ready
- [ ] Manuscript writing for biological discoveries
- [ ] Figures and supplementary materials
- [ ] Code documentation and reproducibility

---

## Phase 8: Academic Contribution & Scholarly Writing (Advanced+)

### Research Paper Publication
- [ ] Identify novel research questions in Virtual Cell domain
- [ ] Conduct literature review and gap analysis
- [ ] Design experimental or computational studies
- [ ] Write manuscript (Introduction, Methods, Results, Discussion)
- [ ] Prepare figures and supplementary data
- [ ] Submit to peer-reviewed journals
- [ ] Respond to reviewer comments (revision rounds)

### Peer Review & Editorial Work
- [ ] Review papers for conferences (NeurIPS, ICML, ICLR, etc.)
- [ ] Review manuscripts for journals (Nature Computational Science, etc.)
- [ ] Evaluate grant proposals
- [ ] Serve on conference committees

### Educational Content & Reviews
- [ ] Write comprehensive review articles
- [ ] Contribute textbook chapters on Virtual Cell topics
- [ ] Create educational tutorials and documentation
- [ ] Develop open-source educational frameworks
- [ ] Publish blog posts and technical documentation

### Mentoring & Community Leadership
- [ ] Mentor junior researchers or students
- [ ] Organize workshops or seminars
- [ ] Lead discussion groups on latest papers
- [ ] Contribute to community standards and best practices
- [ ] Speak at conferences and seminars

---

## Milestones

### Beginner ✓ (In Progress)
- [x] Complete Phase 1 & 2
- [x] Reproduce a basic scRNA-seq analysis

### Intermediate
- [x] Complete Phase 3 & 4
- [ ] Fine-tune a cell foundation model
- [ ] Understand core Virtual Cell concepts

### Advanced
- [ ] Complete Phase 5 & 6
- [ ] Implement perturbation prediction system
- [ ] Contribute to open-source project
- [ ] Submit to competition or publish

### Expert
- [ ] Complete Phase 7 & 8
- [ ] Lead a novel research direction
- [ ] Mentor others in the field
- [ ] Publish peer-reviewed research

### Scholar
- [ ] Published 2+ papers in top venues
- [ ] Serve as regular reviewer
- [ ] Contribute textbooks or comprehensive reviews
- [ ] Established thought leadership in the field

---

## Progress Tracker

**Current Status: Intermediate Level** 🟡
- Foundation & single-cell analysis mastered
- Deep learning & foundation models studied
- Next: Perturbation modeling & practical applications

```dataview
TABLE WITHOUT ID
    file.link as "Topic",
    status as "Status"
FROM "02_Concepts" OR "01_Papers"
WHERE contains(tags, "learning-path")
SORT status ASC
```

---

## Quick Reference

| Phase | Duration | Status | Priority |
|-------|----------|--------|----------|
| 1: Foundations | 2-4 weeks | ✅ Complete | High |
| 2: Single-Cell | 2-3 weeks | ✅ Complete | High |
| 3: Deep Learning | 3-4 weeks | 🟡 In Progress | High |
| 4: Foundation Models | 3-4 weeks | 🟡 In Progress | High |
| 5: Perturbation | 2-3 weeks | ⚪ Not Started | High |
| 6: Advanced Topics | Ongoing | ⚪ Not Started | Medium |
| 7: Research & Pub | Ongoing | ⚪ Not Started | Medium |
| 8: Academic Contribution | Ongoing | ⚪ Not Started | Medium |

---

## Learning Resources

**Key Communities & Platforms:**
- [[08_Resources/Index - Resources|General Resources Index]]
- scVI-tools Discord/GitHub community
- Single Cell Omics Society
- NeurIPS CompBio community

**Essential Papers & Tools:**
- Foundation Models: [[01_Papers/Bunne 2024 - How to Build Virtual Cell|Virtual Cell]], [[01_Papers/scGPT|scGPT]], [[01_Papers/Geneformer|Geneformer]]
- Perturbation Methods: [[01_Papers/GEARS|GEARS]], [[01_Papers/CPA|CPA]]
- Analysis Tools: [[02_Concepts/Gene Regulatory Networks|GRN inference]], [[02_Concepts/Spatial Transcriptomics|Spatial data]]

**Recommended Datasets:**
- CELLxGENE Census (61M+ cells) - https://cellxgene.cziscience.com/
- Arc Institute Virtual Cell Challenge 2025-2026
- [[02_Concepts/Perturb-seq|Perturb-seq]] benchmark datasets
