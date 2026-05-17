---
title: SCMBench benchmarking domain-specific and foundation models for single-cell multi-omics data integration
aliases:
  - SCMBench
authors:
  - Yixuan Wang
  - Yimin Fan
  - Xuesong Wang
  - Tingyang Yu
  - Yongshuo Zong
  - Xinyuan Liu
  - Gaoyang Zhong
  - Meitong Liu
  - Qing Li
  - Kin Hei Lee
  - Khachatur Dallakyan
  - Zhichao Hu
  - Yaqian Qi
  - Junjie Huang
  - Gengjie Jia
  - Jiao Yuan
  - Ting-Fung Chan
  - Xin Gao
  - Irwin King
  - Yu Li
year: 2026
journal: Nature Communications
doi: 10.1038/s41467-026-72570-x
url: https://doi.org/10.1038/s41467-026-72570-x
tags:
  - paper
  - AIVC
  - Benchmarking
  - single-cell
  - Foundation-Models
status: unread
rating:
date_added: 2023-10-24
date_read:
---

# SCMBench: benchmarking domain-specific and foundation models for single-cell multi-omics data integration

## Quick Summary
> The paper introduces SCMBench, a comprehensive benchmarking framework evaluating 23 single-cell multi-omics integration tools, spanning both Domain-specific Models (DMs) and modern Foundation Models (FMs). Through extensive testing across paired, unpaired, and simulated datasets, the authors evaluate integration accuracy, biomarker detection, trajectory inference, and batch effect correction, ultimately demonstrating that while zero-shot FMs currently underperform top DMs like [[GLUE]] and [[scJoint]], a proposed lightweight adapter strategy significantly boosts FM efficacy for multi-modal tasks.

## Key Points
- Benchmarks 19 DMs and 4 FMs ([[scGPT]], [[Geneformer]], [[scFoundation]], [[UCE]]) on single-cell multi-omics data integration.
- Introduces an evaluation framework covering 13 metrics across technical accuracy, biological information conservation (biomarkers, DARs, motifs), trajectory conservation, and batch effect correction.
- Recommends [[GLUE]] as the most consistently reliable method for paired multi-omics integration and [[scJoint]] for unpaired scenarios.
- Uncovers that zero-shot FMs struggle significantly with multi-modal integration (especially scATAC-seq), typically performing worse than state-of-the-art DMs.
- Proposes a computationally efficient adapter-based strategy (combining FM embeddings with [[scVI]]) that bridges the performance gap, improving FM integration accuracy by over 65% in some cases.
- Outlines a practical recommendation pipeline to guide method selection based on data characteristics (paired/unpaired), species, and computational constraints.

## Methods
### Data
- **Real Data:** 3 paired datasets (PBMC-10k, Chen-2019, Ma-2020), 2 unpaired datasets (Muto-2021, Yao-2021), and 1 triple-omics dataset (mouse cortex integrating scRNA-seq, scATAC-seq, and snmC-seq).
- **Simulated Data:** Datasets generated via [[scMultiSim]] with varying degrees of batch effects to quantitatively evaluate robustness.
- **Preprocessing:** ATAC-seq peaks are transformed into gene activity scores using [[MAESTRO]] to make them compatible with gene-centric FM tokenizers.

### Model Architecture
- **Domain-specific Models (DMs):** Includes statistical methods (e.g., PCA, MOFA, bindSC, LIGER, Seurat4, Seurat5) and deep learning methods (e.g., GLUE, scVI, TotalVI, scJoint, Cobolt).
- **Foundation Models (FMs):** scGPT, Geneformer, scFoundation, and UCE. 
- **Adapter Strategy:** A hybrid architecture where pre-trained FM embeddings are fed into a lightweight [[scVI]] variational autoencoder module (e.g., scGPT-scVI, UCE-scVI) for joint representation learning.

### Training Strategy
- Evaluated zero-shot prediction for FMs compared against hyperparameter-tuned DMs.
- For FMs (specifically scGPT), compared zero-shot, fine-tuning from scratch, fine-tuning specific transformer modules, and the adapter-based integration method to identify optimal trade-offs between computational cost and performance.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Overall Integration Accuracy (Paired) | GLUE highest (~0.599 mean) | PCA, iNMF (lower) |
| Overall Integration Accuracy (Unpaired) | scJoint highest | Seurat4, Harmony |
| Trajectory Conservation | MOFA (Paired), Harmony (Unpaired) top scores | PCA |
| Adapter FM Improvement | UCE-scVI improved accuracy by >65% | UCE zero-shot |

## Figures
| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of the SCMBench workflow, dataset characteristics, and evaluation methodology. |
| Fig 2  | Benchmarking results for integration accuracy on paired and unpaired datasets, plus computational efficiency (CPU/GPU) analysis. |
| Fig 3  | Comparison of cellular identity preservation evaluated via biomarker detection, Differential Accessible Regions (DARs), and enriched motifs. |
| Fig 4  | Comparison of biological dynamics preservation via trajectory alignment metrics across paired and unpaired scenarios. |
| Fig 5  | Comprehensive evaluation of batch effect correction capabilities on simulated datasets with escalating quantitative batch effects. |
| Fig 6  | In-depth analysis of FM adaptation strategies (e.g., scGPT-scVI, UCE-scVI) and a practical software recommendation pipeline. |

## Critical Analysis
### Strengths
- **Holistic Evaluation:** Goes beyond standard clustering accuracy metrics to assess biological feature preservation like marker genes, regulatory motifs, and developmental trajectories.
- **Inclusion of FMs:** Timely assessment of highly popular single-cell Foundation Models on multi-omics tasks, detailing their exact limitations in zero-shot settings.
- **Actionable Guidelines:** Provides a concrete recommendation tree for practitioners to select the right algorithm based on specific constraints (e.g., unpaired vs paired, mouse vs human, memory limits).

### Weaknesses
- **Modality Scope:** Predominantly focuses on scRNA-seq and scATAC-seq. Multi-omics is rapidly expanding to spatial and proteomic data, which are less covered here (though a brief triple-omics assessment is included).
- **Scalability Limitations:** Several established DMs hit Out-of-Memory (OOM) errors on large atlas-level datasets, meaning the benchmark couldn't uniformly assess every model at peak scale.

### Questions
- How would the proposed FM-adapter strategy perform if the foundation model itself was pre-trained simultaneously on RNA and ATAC modalities, rather than translating ATAC to gene activity?
- Are the batch correction findings highly sensitive to the specific simulation framework (scMultiSim) used?

## Connections
### Related Papers
- *Benchmarking atlas-level data integration in single-cell genomics* (Luecken et al., 2022) - A predecessor benchmarking single-omics batch correction.
- *scGPT: toward building a foundation model for single-cell multi-omics using generative AI* (Cui et al., 2024) - One of the core models evaluated.

### Related Concepts
- [[Single-cell Multi-omics]]
- [[Foundation Models]]
- [[Batch Effect Correction]]
- [[Trajectory Inference]]
- [[Latent Space Alignment]]

### Potential Applications
- Guiding bioinformatics pipelines for atlas-scale single-cell integration projects.
- Informing the architectural design of next-generation multi-modal foundation models.

## Notes
-