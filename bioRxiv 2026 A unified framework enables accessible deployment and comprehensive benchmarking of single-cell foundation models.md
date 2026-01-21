---
title: "A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models"
aliases: []
authors:
  - Siyu Hou
  - Penghui Yang
  - Wenjing Ma
  - Jade Xiaoqing Wang
  - Xiang Zhou
year: 2026
journal: bioRxiv
doi: https://doi.org/10.64898/2026.01.06.698060
url: https://doi.org/10.64898/2026.01.06.698060
tags:
  - paper
  - AIVC
  - Single-cell
  - Foundation-Models
  - Benchmarking
status: unread
rating:
date_added: 2026-01-07
date_read:
---

# A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models

## Quick Summary
> This paper presents a standardized, fully automated, and containerized computational framework for benchmarking single-cell foundation models (scFMs). The authors use this infrastructure to systematically evaluate 13 scFMs alongside classical baselines across more than 50 datasets in zero-shot, few-shot, and fine-tuning settings. The study reveals that while scFMs provide distinct advantages in low-label (few-shot) scenarios and transfer learning, they frequently fail to outperform simple baselines like PCA in zero-shot embedding quality, batch correction, and spatial transcriptomics generalization, suggesting that model scale alone does not guarantee superior performance.

## Key Points
- Development of a reproducible, containerized framework based on [[Nextflow]] to standardize the execution and evaluation of 13 diverse scFMs.
- Systematic benchmarking performed on >50 datasets covering scRNA-seq, spatial transcriptomics, and perturbation data.
- **Zero-shot findings**: scFMs generally do not outperform classical [[PCA]] in clustering purity or batch mixing; PCA remains a strong competitor.
- **Few-shot findings**: scFMs (particularly [[scFoundation]], [[UCE]], and [[SCimilarity]]) demonstrate clear benefits over baselines when training labels are extremely scarce (e.g., 1-shot or 5-shot).
- **Spatial Generalization**: Current scFMs trained on scRNA-seq fail to generalize robustly to spatial transcriptomics data (Visium, MERFISH) under zero-shot conditions.
- **Fine-tuning**: While fine-tuning improves performance, the gap between scFMs and fine-tuned classical baselines is negligible for cell type annotation.
- **Trajectory Inference**: PCA embeddings often preserve continuous biological trajectories and local neighborhoods better than transformer-based embeddings.
- **Resource Profiling**: Detailed analysis of GPU memory usage and runtime, highlighting significant efficiency differences among models.

## Methods
### Data
- **Source**: >50 datasets curated from public repositories including [[CellxGene]], [[Dynverse]] trajectory benchmarks, and [[scPerturb]].
- **Types**: Single-cell RNA-seq (diverse tissues/diseases), Spatial Transcriptomics (Visium, HER2ST, MERFISH), and Perturbation screens (Norman et al., Replogle et al.).
- **Preprocessing**: Unified QC pipeline, standardized input formats (AnnData), and harmonized gene identifiers.

### Model Architecture
- **Evaluated Models**: 13 total, categorized into:
    - *Cell-centric Transformer encoders*: [[Geneformer]], [[scBERT]], [[UCE]], [[scCello]], [[LangCell]].
    - *Gene-aware cell-level Transformers*: [[scGPT]], [[scPRINT]], [[scFoundation]].
    - *LLM-adapted models*: [[CELLama]], [[GenePT]].
    - *Non-canonical/Hybrid*: [[SCimilarity]], [[CellPLM]].
- **Baselines**: Highly Variable Genes ([[HVGs]]) followed by [[PCA]] (50 components); Additive models for perturbation prediction.

### Training Strategy
- **Zero-shot**: Feature extraction using pretrained weights without task-specific updates.
- **Few-shot**: Unified [[Prototypical Learning]] protocol (1-shot to 5-shot) on fixed embeddings.
- **Fine-tuning**: Supervised training of a lightweight classifier (probe) or partial backbone unfreezing, adhering to authors' recommended protocols.
- **Infrastructure**: [[Nextflow]] pipeline with [[Docker]]/[[Singularity]] containers for each model to ensure reproducibility and dependency management.

## Results
| Metric | Value (Best scFM) | Baseline (PCA/Linear) | Context |
|--------|-------------------|-----------------------|---------|
| **Zero-shot ARI (Stomach)** | 0.68 ([[SCimilarity]]) | 0.65 | Clustering Agreement |
| **Trajectory Neighborhood** | 0.72 ([[scFoundation]]) | 0.95 | Trajectory Preservation |
| **Spatial NMI (Visium)** | 0.29 (Best scFM) | 0.32 | Spatial Domain Clustering |
| **Few-shot Acc (1-shot)** | ~0.85 ([[UCE]]) | 0.54 | Liver dataset Annotation |
| **Fine-tuning Acc** | >98% (Multiple) | ~98% | Cell Type Annotation |
| **Perturbation Correlation** | >0.90 (Multiple) | >0.90 (Additive) | CEBPA+CEBPE perturbation |

## Figures


| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of the unified benchmarking framework, DAG pipeline, and evaluation tasks (zero-shot, few-shot, fine-tuning). |
| Fig 2  | Zero-shot evaluation of scFM embeddings showing UMAP visualizations and aggregated scores for cell type separation and batch mixing. |
| Fig 3  | Zero-shot trajectory inference results comparing linear, bifurcation, and tree-structured trajectories; highlights PCA's strength in preserving continuity. |
| Fig 4  | Zero-shot generalization to spatial transcriptomics (Visium, HER2ST, MERFISH); shows models often fail to identify spatial domains compared to PCA. |
| Fig 5  | Few-shot cell type annotation performance (1-shot vs 5-shot), demonstrating scFMs' advantage in low-data regimes. |
| Fig 6  | Few-shot annotation of continuous cell states and tissue contexts (TME), showing improvement with minimal supervision. |
| Fig 7  | Fine-tuning performance for cell type annotation and perturbation prediction; highlights limited advantages over baselines. |
| Fig 8  | Computational resource profiling: Peak RSS (CPU), Peak GPU memory, and Runtime vs. Batch Size and Cell Counts. |


## Critical Analysis
### Strengths
- **Reproducibility**: The creation of a containerized, one-command execution pipeline solves a major issue in the field regarding conflicting dependencies and broken codebases.
- **Scale**: Benchmarking 13 models across 50+ datasets is one of the most comprehensive studies to date.
- **Rigorous Baselines**: The inclusion of properly tuned PCA and additive baselines exposes the "hype" vs. reality of foundation models.
- **Code Correction**: The authors identified and fixed bugs in original model implementations (e.g., [[CellFM]], [[scCello]], [[scPRINT]]), ensuring a fairer comparison.

### Weaknesses
- **Spatial Failure**: The study highlights a general failure of current scFMs on spatial data but doesn't deeply explore architectural reasons beyond distribution shifts.
- **Date Oddity**: The paper metadata indicates "January 7, 2026," which appears to be a future date relative to the current time, potentially indicating a placeholder or error in the preprint server metadata.

### Questions
- Why do transformer-based scFMs struggle to preserve local neighborhood structure (essential for trajectory inference) compared to linear PCA?
- Can modality-aware pretraining effectively bridge the gap for spatial transcriptomics zero-shot generalization?

## Connections
### Related Papers
- [[scGPT]]: Cui, H. et al. (Nature Methods 2024)
- [[Geneformer]]: Theodoris, C. V. et al. (Nature 2023)
- [[scFoundation]]: Hao, M. et al. (Nature Methods 2024)
- [[UCE]]: Rosen, Y. et al. (bioRxiv)
- Baseline comparisons for perturbation: [[Ahlmann-Eltze]] et al. (Nature Methods 2025)

### Related Concepts
- [[Single-cell Foundation Models]] (scFMs)
- [[Zero-shot Learning]]
- [[Few-shot Learning]]
- [[Prototypical Networks]]
- [[Spatial Transcriptomics]]
- [[Nextflow]] pipelines

### Potential Applications
- **Model Selection**: Users can use the framework to choose the best scFM for their specific data size and label availability.
- **Benchmarking**: The extensible framework allows developers of new models to easily compare against the established zoo.
- **Low-resource Analysis**: Utilizing scFMs for annotating rare cell types where only 1-5 reference examples exist.

## Notes
- The authors emphasize that scFMs are "complementary tools" rather than wholesale replacements for classical methods like PCA/Scanpy.
- The framework treats released codebases as authoritative but applies minimal fixes for bugs (documented in the paper).