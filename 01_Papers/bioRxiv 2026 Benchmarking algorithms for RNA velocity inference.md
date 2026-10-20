---
title: "Benchmarking algorithms for RNA velocity inference"
aliases: []
authors:
  - Kexin Huang
  - Yu Zhou
  - Tiangang Wang
  - Xiao Li
  - Xinlong Zhao
  - Xi Liu
  - Liyu Huang
  - Xiaobo Zhou
  - Jiajia Liu
year: 2026
journal: bioRxiv
doi: 10.64898/2026.01.03.697314
url: https://doi.org/10.64898/2026.01.03.697314
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2026-01-03
date_read:
---

# Benchmarking algorithms for RNA velocity inference

> [!info] Verification scope — 2026-10-20
> [Source record](https://www.biorxiv.org/content/10.64898/2026.01.03.697314v1). The work was located by title and DOI in its source record. This pass checked bibliographic identity and the broad research topic; detailed method settings, figure descriptions and numerical comparisons below remain reading notes and were not all independently verified.

## Quick Summary
> This study presents a comprehensive benchmark of 29 RNA velocity inference methods, evaluating them across 114 simulated datasets with ground truth and 62 real scRNA-seq datasets. The authors developed a unified framework to assess performance based on accuracy, scalability, stability, and usability. The results indicate that no single method is universally optimal; however, tools like [[veloVI]], [[cellDancer]], and [[05_Tools/RNA Velocity Methods Reference#SDEvelo|SDEvelo]] achieved high aggregate rankings. The paper highlights critical bottlenecks in the field, particularly regarding scalability to large datasets (>100k cells) and sensitivity to gene selection, and provides a practical decision-tree guideline for users to select appropriate tools based on data modality and biological priors.

## Key Points
- Benchmarked **29 velocity inference methods**: 20 RNA-only, 7 multi-omics (spatial, chromatin, protein), and 2 cell-cycle specific tools.
- Evaluated on **176 datasets**: 114 synthetic datasets generated via [[05_Tools/RNA Velocity Methods Reference#Dyngen|Dyngen]] (varying topologies and sizes) and 62 real datasets (scRNA-seq, spatial, multi-omics).
- Performance decomposed into four dimensions: **Accuracy**, **Scalability**, **Stability**, and **Usability**.
- **Top Performers**: [[veloVI]] ranked first overall, followed by [[cellDancer]], [[05_Tools/RNA Velocity Methods Reference#SDEvelo|SDEvelo]], [[05_Tools/RNA Velocity Methods Reference#STT|STT]], and [[DeepVelo]].
- **Scalability**: A major failure point; only a small subset (e.g., [[veloVI]], [[01_Papers/veloVAE|VeloVAE]]) could handle datasets with 500,000 cells.
- **Stability**: [[05_Tools/RNA Velocity Methods Reference#SDEvelo|SDEvelo]] and [[cellDancer]] showed the highest robustness to data down-sampling.
- **Spatial Velocity**: Performance is platform-dependent; spatial methods perform better on single-cell resolution technologies (e.g., [[05_Tools/Methods and Data Resources#seqFISH|seqFISH]]) than spot-based ones (e.g., [[05_Tools/Methods and Data Resources#10x Genomics|Visium]]) due to cell mixing.
- **Guidance**: Provided a decision tree for tool selection (e.g., use [[MultiVelo]] for paired RNA+ATAC, [[05_Tools/RNA Velocity Methods Reference#protaccel|protaccel]] for CITE-seq).

## Methods
### Data
- **Synthetic Datasets**: Generated using [[05_Tools/RNA Velocity Methods Reference#Dyngen|Dyngen]]. Included 114 datasets with various topologies (linear, bifurcating, cycle, etc.) and scales (500 to 500,000 cells; 500 to 200,000 genes).
- **Real Datasets**: 62 datasets collected from tool repositories and public archives (GEO/ArrayExpress), covering differentiation, cell cycle, and disease progression. Technologies included [[05_Tools/Methods and Data Resources#10x Genomics|10x Genomics]], [[05_Tools/Methods and Data Resources#Smart-seq2|Smart-seq2]], and spatial platforms.

### Model Architecture
- The paper is a benchmark study rather than a new model proposal. It evaluates existing methods that employ various architectures:
    - **Steady-state models**: e.g., [[velocyto]].
    - **Dynamical models**: e.g., [[01_Papers/scvelo|scVelo]], [[01_Papers/uniTvelo|UniTVelo]].
    - **Deep Generative Models (VAE)**: e.g., [[veloVI]], [[DeepVelo]], [[01_Papers/veloVAE|VeloVAE]].
    - **Differential Equations (SDE/ODE)**: e.g., [[05_Tools/RNA Velocity Methods Reference#SDEvelo|SDEvelo]].
    - **Multi-omics models**: e.g., [[MultiVelo]], [[05_Tools/RNA Velocity Methods Reference#scKINETICS|scKINETICS]], [[05_Tools/RNA Velocity Methods Reference#protaccel|protaccel]].

### Training Strategy
- **Environment**: Containerized execution using **Docker** for reproducibility.
- **Hardware**: GPU-accelerated servers (NVIDIA RTX 3090) for deep learning methods; High-core CPU servers (AMD EPYC) for statistical methods.
- **Evaluation Metrics**:
    - **Accuracy**: [[02_Concepts/Methods and Metrics Glossary#Cosine Similarity|Cosine Similarity]] (ground truth), [[02_Concepts/Methods and Metrics Glossary#Cross-Boundary Direction Correctness|Cross-Boundary Direction Correctness]] (CBDir), [[02_Concepts/Methods and Metrics Glossary#Cross-Boundary Direction Correctness|In-Cluster Coherence]] (ICCoh), [[02_Concepts/Methods and Metrics Glossary#Cross-Boundary Direction Correctness|Velocity Angle Consistency]].
    - **Scalability**: Runtime, Peak Memory (RAM/VRAM).
    - **Stability**: Robustness to cell/gene down-sampling and run-to-run reproducibility (random seed variation).
    - **Usability**: Installation, documentation, maintenance, and code quality scoring.

## Results
| Metric | Value | Baseline/Notes |
|--------|-------|----------|
| **Overall Rank #1** | [[veloVI]] | Balanced performance across all metrics. |
| **Stability (Down-sampling)** | 0.64 score ([[05_Tools/RNA Velocity Methods Reference#SDEvelo\|SDEvelo]]) | Highest robustness score among methods. |
| **Reproducibility** | 1.00 ([[05_Tools/RNA Velocity Methods Reference#NeuroVelo\|NeuroVelo]], [[05_Tools/RNA Velocity Methods Reference#SDEvelo\|SDEvelo]]) | Perfect correlation across repeated runs. |
| **Scalability (Max Cells)** | 500k cells ([[veloVI]], [[01_Papers/veloVAE\|VeloVAE]]) | Most other methods failed or timed out >100k cells. |
| **Cell Cycle Accuracy (ARI)** | Higher for [[05_Tools/RNA Velocity Methods Reference#DeepCycle\|DeepCycle]] | vs. [[05_Tools/RNA Velocity Methods Reference#VeloCycle\|VeloCycle]], though [[05_Tools/RNA Velocity Methods Reference#VeloCycle\|VeloCycle]] is faster. |
| **Spatial Consistency** | High for [[05_Tools/RNA Velocity Methods Reference#SDEvelo\|SDEvelo]] | Better preservation of spatial logic than [[cell2fate]]. |

## Figures
| Figure | Description |
| ------ | ----------- |
| **Fig 1**  | Overview of the benchmarking framework, dataset compendium, and method categories (RNA, cell-cycle, multi-omics). |
| **Fig 2**  | Summary table of method requirements (inputs, platforms) and aggregated performance rankings across Accuracy, Scalability, Stability, and Usability. |
| **Fig 3**  | Detailed breakdown of performance on **simulated datasets**: Accuracy metrics, Runtime/Memory heatmaps, Stability scores, and Usability ratings. |
| **Fig 4**  | Comparison of cell-cycle velocity tools ([[05_Tools/RNA Velocity Methods Reference#DeepCycle\|DeepCycle]] vs. [[05_Tools/RNA Velocity Methods Reference#VeloCycle\|VeloCycle]]) regarding phase prediction accuracy, pseudotime alignment, and resource usage. |
| **Fig 5**  | Benchmarking multi-omics velocity: [[05_Tools/RNA Velocity Methods Reference#scKINETICS\|scKINETICS]] vs. [[MultiVelo]] on accuracy; spatial velocity comparisons ([[cell2fate]], [[05_Tools/RNA Velocity Methods Reference#STT\|STT]], [[05_Tools/RNA Velocity Methods Reference#SDEvelo\|SDEvelo]]) on mouse embryo data. |
| **Fig 6**  | (Inferred from context/thumbnails) A decision tree/flowchart providing practical guidance for users to select velocity tools based on data type and priors. |

## Critical Analysis
### Strengths
- **Comprehensive Scope**: Covers a vast array of methods (29) including niche multi-omics and cell-cycle tools, which are often overlooked.
- **Multi-dimensional Evaluation**: Goes beyond simple accuracy to include practical constraints like installation difficulty (usability) and computational cost (scalability).
- **Reproducibility**: The use of Docker containers for every method ensures fair comparison and reproducibility of the benchmark itself.
- **Actionable Advice**: The "Practical guidelines" and decision tree provide immediate value to end-users.

### Weaknesses
- **Simulation Reliance**: Heavy reliance on [[05_Tools/RNA Velocity Methods Reference#Dyngen|Dyngen]] for ground-truth accuracy metrics. While necessary, synthetic gene regulatory networks may not fully capture the complexity of real biological noise and splicing kinetics.
- **Ground Truth in Real Data**: Accuracy on real data relies on proxy metrics (e.g., cluster coherence, prior biological knowledge), which can be circular if the "known" biology is what velocity is trying to refine.
- **Rapid Obsolescence**: The field moves fast; some "state-of-the-art" tools might be superseded quickly, though the benchmark framework remains valid.

### Questions
- How do these methods perform on datasets with strong batch effects or technical artifacts, which are common in atlas-scale integration?
- The paper mentions gene selection as a major variable; does the benchmark suggest a standardized gene selection pipeline, or is that left as an open problem?
- Why did [[cell2fate]] perform poorly on spatial consistency in the mouse embryo dataset compared to RNA-only methods projected spatially? Is it purely a resolution/mixing issue?

## Connections
### Related Papers
- [[01_Papers/velocyto|La Manno et al., 2018]]: The foundational paper introducing [[02_Concepts/RNA Velocity|RNA velocity]].
- [[01_Papers/scvelo|Bergen et al., 2020]]: Introduced [[01_Papers/scvelo|scVelo]] and the dynamical model, a key baseline in this benchmark.
- [[01_Papers/veloVI|Gayoso et al., 2024]]: Introduced [[veloVI]], the top-ranked method in this study.
- [[05_Tools/RNA Velocity Methods Reference#Dyngen|Cannoodt et al., 2021]]: Introduced [[05_Tools/RNA Velocity Methods Reference#Dyngen|Dyngen]], the simulator used for synthetic data.

### Related Concepts
- [[02_Concepts/RNA Velocity|RNA velocity]]
- [[02_Concepts/scRNA-seq|Single-cell RNA sequencing]] (scRNA-seq)
- [[Spatial Transcriptomics]]
- [[02_Concepts/Multi-modal Integration|Multi-omics]]
- [[Trajectory Inference]]
- [[02_Concepts/Generative Models|Deep Generative Models]] (VAEs)
- [[02_Concepts/Docker Containerization|Docker]] (for reproducible research)

### Potential Applications
- **Tool Selection**: Researchers can use the decision tree to pick the right software for their specific dataset size and modality.
- **Method Development**: Developers can identify the "scalability wall" at 100k+ cells and the need for better spot-deconvolution in spatial velocity as key areas for innovation.
- **Atlas Construction**: The scalability results guide which tools are feasible for building large-scale developmental atlases.

## Notes
- The paper emphasizes that RNA velocity should be treated as an "exploratory tool" for hypothesis generation rather than definitive fate proof, especially given the sensitivity to gene selection and preprocessing.
- Interesting finding: [[05_Tools/RNA Velocity Methods Reference#scKINETICS|scKINETICS]] (unpaired multi-omics) performed comparably or better than [[MultiVelo]] (paired) in some metrics, suggesting that regulatory priors can be as powerful as paired measurements.