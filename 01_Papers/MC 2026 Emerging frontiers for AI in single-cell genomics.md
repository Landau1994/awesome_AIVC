---
title: "Emerging frontiers for AI in single-cell genomics"
aliases: []
authors:
  - Sneha Mitra
  - Jiaxin Li
  - Christina S. Leslie
year: 2026
journal: Molecular Cell
doi: 10.1016/j.molcel.2026.09.014
url: https://doi.org/10.1016/j.molcel.2026.09.014
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2025-05-14
date_read:
---

# Emerging frontiers for AI in single-cell genomics

## Quick Summary
> This review article examines the rapid evolution of artificial intelligence in single-cell genomics, specifically focusing on foundation models for [[scRNA-seq]] and [[02_Concepts/ATAC-seq|scATAC-seq]], virtual cell models for perturbation prediction, and gene regulatory network inference. The authors critically assess the current state of these technologies, noting that while large-scale models and pretraining strategies are theoretically promising, they have not yet consistently outperformed simpler statistical baselines or achieved widespread adoption by experimental biologists. The paper concludes by emphasizing the need for biologically-informed benchmarking and closer collaboration between AI researchers and experimentalists to address real-world biological questions.

## Key Points
- Single-cell genomics is currently undergoing a shift from standard analysis pipelines (e.g., [[05_Tools/Methods and Data Resources#Seurat|Seurat]], [[05_Tools/Methods and Data Resources#Scanpy|scanpy]]) to advanced AI-driven representation learning.
- Foundation models, pretrained on massive atlas-scale datasets, are emerging but often struggle with downstream task performance compared to specialized or simpler models.
- "Virtual cell" models, designed to predict the effects of perturbations (genetic, drug, or cytokine), face significant challenges in generalization and biological interpretability.
- A citation analysis using the BioCiteTrace pipeline reveals a notable disconnect: most highly-cited AI methods in this space are "mentioned" in literature rather than applied to solve biological discovery problems.
- Current benchmarking often utilizes pseudobulk data, which may mask cellular heterogeneity; more rigorous, cell-level evaluation is required.

## Methods
### Data
- The review covers datasets from the [[05_Tools/Methods and Data Resources#Human Cell Atlas|Human Cell Atlas]], [[05_Tools/Methods and Data Resources#CELLxGENE|CELLxGENE]], and various multi-modal projects including [[scRNA-seq]], [[02_Concepts/ATAC-seq|scATAC-seq]], [[02_Concepts/Biological Context Glossary#Multiome|multiome]], and [[Perturb-seq]].

### Model Architecture
- The paper reviews diverse AI architectures:
  - VAEs (e.g., [[scVI]], [[05_Tools/Additional Model References#scANVI|scANVI]])
  - Transformer-based models (e.g., [[scBERT]], [[Geneformer]], [[scGPT]], [[scPRINT]], [[scFoundation]], [[UCE]], [[05_Tools/Additional Model References#TranscriptFormer|TranscriptFormer]])
  - Graph-based methods (e.g., [[05_Tools/Additional Model References#SIMBA|SIMBA]], [[GEARS]])
  - Flow-matching models (e.g., [[01_Papers/bioRxiv 2025 CellFlow enables generative single-cell phenotype modeling with flow matching|CellFlow]], [[05_Tools/Additional Model References#scDFM|scDFM]])
  - Chromatin and regulatory models (e.g., [[05_Tools/Additional Model References#scBasset|scBasset]], [[05_Tools/Additional Model References#GET|GET]], [[05_Tools/Additional Model References#EpiAgent|EpiAgent]])

### Training Strategy
- Focuses on self-supervised pretraining (e.g., masked token prediction, generative autoregressive tasks) followed by fine-tuning on downstream tasks like cell annotation and perturbation prediction.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Perturbation prediction | Often comparable or worse than "perturbed mean" baseline | Mean expression |
| Adoption (citation analysis; unverified numerical detail) | The note reports <8% biological application | The note reports >60% mentions; both percentages require full-text confirmation |
| Foundation model vs. [[scVI]] | [[scVI]] ranked first in some integration benchmarks | Foundation models |

## Figures


| Figure | Description |
| ------ | ----------- |
| Fig 1  | Development of foundation models and virtual cell models; embedding strategies and parameter/cell counts. |
| Fig 2  | Citation analysis workflow and results via BioCiteTrace pipeline. |


## Critical Analysis
### Strengths
- Provides an exhaustive categorization of models across RNA, chromatin, and perturbation modalities.
- Honest assessment of the "AI hype" in single-cell biology, backed by citation audits and recent benchmarking results.
- Highlights specific gaps, such as the reliance on fixed vocabularies and limited generalization capability of current virtual cell models.

### Weaknesses
- While the review covers many models, the sheer volume of emerging methods makes the field feel fragmented.
- The critique of current models is heavy, but more concrete suggestions on specific "biological priors" (beyond sequence models) are needed to guide future architectures.

### Questions
- Can future models move beyond simply mimicking co-expression patterns and instead learn actual causal regulatory syntax?
- How should the community balance the push for "larger" foundation models against the practical needs of labs with smaller, specialized datasets?

## Connections
### Related Papers
- [[scVI]] (Lopez et al., 2018)
- [[Geneformer]] (Theodoris et al., 2023)
- [[scGPT]] (Cui et al., 2024)
- [[05_Tools/Additional Model References#scBasset|scBasset]]  (Yuan & Kelley, 2022)

### Related Concepts
- [[02_Concepts/Cell Foundation Models|Foundation Models]]
- [[01_Papers/Bunne 2024 - How to Build Virtual Cell|Virtual Cell]]
- [[02_Concepts/Biological Context Glossary#Regulatory Genomics|Regulatory Genomics]]
- [[02_Concepts/Methods and Metrics Glossary#Representation Learning|Representation Learning]]

### Potential Applications
- In-silico perturbation screening for drug discovery.
- Cross-species and cross-tissue cell type annotation.
- Regulatory network deconvolution from multimodal data.

## Notes
-
## Verification scope (2026-10-20)

Title, authors, DOI, publication date (15 October 2026) and broad review scope match the [PubMed record](https://pubmed.ncbi.nlm.nih.gov/42880218/). The full text was not accessible: the BioCiteTrace percentages, figure descriptions and individual benchmark rankings have not been confirmed. Interpret these as provisional reading-note details, not verified quantitative conclusions. Linked model references identify the methods independently; they do not validate this review’s comparisons. The existing date_added field is retained as user provenance, not a publication date.
