---
title: "A Systematic Literature Review of Single-Cell Foundation Models for Transcriptomics: Design, Adaptation, Benchmarks, and Future Directions"
aliases: []
authors:
  - Xin Zhao
  - Yee Yong Pang
  - Tong Ye Fu
  - Chuan Nan Yang
  - Sim Hiew Moi
year: 2026
journal: IEEE Access
doi: 10.1109/ACCESS.2026.3744403
url: https://ieeexplore.ieee.org/document/3744403
tags:
  - paper
  - AIVC
  - Single-cell
  - Foundation-Models
  - Transcriptomics
  - Systematic-Review
status: unread
rating:
date_added: 2024-05-23
date_read:
---

# A Systematic Literature Review of Single-Cell Foundation Models for Transcriptomics: Design, Adaptation, Benchmarks, and Future Directions

## Quick Summary
> This systematic review synthesizes 166 unique studies on single-cell foundation models (scFMs) for transcriptomics, mapping them across four technical lineages: scale- and architecture-driven modeling, knowledge-enhanced modeling, adaptation and representation reuse, and spatial/multimodal extensions. The authors evaluate the current state of the field, highlighting a "task dependence" where reported model successes are often highly sensitive to evaluation design, baseline strength, and data leakage. They conclude that while scFMs offer powerful opportunities for reusable representation learning, they do not yet provide universal superiority over conventional baselines in zero-shot or perturbation-response settings, emphasizing the need for rigorous, leakage-resistant evaluation standards and stronger biological grounding.

## Key Points
- The findings provide stronger support forsupervised or fine-tuned annotation-like tasks than for zero-shot embedding reuse, while perturbation-response prediction remains more sensitiveto data splitting, overlap between pre-training and test data, comparator strength, and metric choice. Independent benchmarks also provide limitedsupport for treating model scale as a proxy for biological understanding or robust transfer.
- Current scFMs vary substantially in input encoding, tokenization, backbone architecture, and training objectives.
- There is a clear tension between original model claims (often reporting high performance in supervised settings) and independent benchmark evidence (highlighting limitations in zero-shot and perturbation settings).
- Model scale is an experimental variable, not a direct proxy for biological understanding or robust generalization.
- Future work must prioritize independent, leakage-resistant evaluation, stronger biological grounding (e.g., using gene regulatory networks), and practical reproducibility/deployment standards.
- scFM utility should be evaluated according to distinct adaptation regimes: supervised fine-tuning, zero-shot embedding reuse, and task-specific downstream adaptation.

## Methods
### Data
- Synthesis of 166 unique studies (175 reports) published between 1 January 2022 and 9 June 2026.
- Systematic search across Scopus, PubMed, and IEEE Xplore.
- Study-level quality appraisal conducted using a custom "scFM-RoB" (Risk-of-Bias) instrument.

### Model Architecture
- Includes [[Transformer]]-based backbones (common), but also [[Graph Neural Network]] (GNN) architectures and [[State-Space Model]]s (e.g., [[MambaCell]]).
- Diversification toward knowledge-enhanced models (integrating protein-protein interactions, gene networks) and spatial-context-aware models.

### Training Strategy
- Relies on self-supervised representation learning, [[Masked Language Modeling]] (MLM) variants, and generative pre-training.
- Recent trends include parameter-efficient fine-tuning ([[scPEFT]]) and multimodal/multi-tissue pre-training.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Zero-shot integration (scGPT) | 0.447 accuracy | ~0.74–0.79 (Seurat4/scJoint) |
| Cell-type annotation (MambaCell, 1-shot) | 0.652 Macro-F1 | 0.434 (Geneformer) |
| Fine-grained T-cell subtype (ScPanKD) | 0.512 Mean ARI | 0.451 (scGPT-zero) |

## Figures


| Figure | Description |
| ------ | ----------- |
| Fig 1  | Analytical framework organizing scFMs across design, adaptation, tasks, and evaluation. |
| Fig 2  | PRISMA 2020 flow diagram of the study selection process. |
| Fig 3  | Yearly distribution of included scFM studies by publication type (2022–2026). |
| Fig 4  | Domain-level and overall risk-of-bias and reproducibility support distributions. |


## Critical Analysis
### Strengths
- Highly comprehensive and structured synthesis of the scFM landscape up to mid-2026.
- Explicitly separates original developer claims from independent benchmark/re-evaluation evidence.
- Provides a clear and rigorous [[scFM-RoB]] appraisal framework to standardize future reviews.

### Weaknesses
- The fast-moving nature of the field (specifically the rapid emergence of preprint studies) makes systematic reviews difficult to maintain.
- Performance comparisons across heterogeneous datasets/tasks remain difficult to consolidate.

### Questions
- To what extent can biological priors (e.g., GRNs) be integrated without introducing unwanted inductive bias or overfitting to well-studied genes?
- How can we standardize the definition of "zero-shot" transfer to ensure apples-to-apples comparisons across models?

## Connections
### Related Papers
- [[scBERT]] (Yang et al. 2022)
- [[Geneformer]] (Theodoris et al. 2023)
- [[scGPT]] (Cui et al. 2024)
- [[scFoundation]] (Hao et al. 2024)
- [[scCluBench]] (Xu et al. 2026)

### Related Concepts
- [[Foundation Models]]
- [[Transcriptomics]]
- [[Self-supervised learning]]
- [[Out-of-distribution (OOD) evaluation]]
- [[Gene Regulatory Networks (GRN)]]

### Potential Applications
- [[Cell-type annotation]]
- [[Drug response prediction]]
- [[Spatial transcriptomics]]
- [[Clinical prognosis and survival prediction]]

## Notes
- The review highlights that "model scale" is being over-prioritized as a proxy for success, which the authors suggest is a trap for the field.
- Reproducibility (code availability, environment containerization) is emphasized as a critical differentiator for scFM utility.