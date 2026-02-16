---
title: "Benchmarking RNA velocity methods across 17 independent studies"
aliases: []
authors:
  - Ya Luo
  - Jun Ren
  - Qian Yang
  - Ying Zhou
  - Zhiyu You
  - Qiyuan Li
year: 2025
journal: bioRxiv
doi: 10.1101/2025.08.02.668272
url: https://doi.org/10.1101/2025.08.02.668272
tags:
  - paper
  - AIVC
  - RNA-Velocity
  - Benchmarking
  - Single-cell
status: unread
rating:
date_added: 2025-08-02
date_read:
---

# Benchmarking RNA velocity methods across 17 independent studies

## Quick Summary
> This paper presents a comprehensive benchmark of 14 RNA velocity inference methods using 17 independent scRNA-seq datasets. The authors evaluate the methods based on inference accuracy, algorithmic stability (via down-sampling), and computational usability. The study reveals that no single method consistently outperforms others across all metrics; while [[veloVI]] shows the highest directional accuracy, [[DeepVelo]] is the most computationally efficient, and [[latentVelo]] offers high stability. Significant discrepancies were found in the velocity fields inferred by different methods, suggesting a need for consensus approaches in future studies.

## Key Points
- A systematic evaluation of 14 RNA velocity methods, categorized into ODE-based, Machine Learning-based, and Deep Learning-based approaches.
- Utilized 17 independent [[scRNA-seq]] datasets covering diverse biological contexts (e.g., pancreatic endocrinogenesis, hematopoiesis, brain development).
- [[veloVI]] achieved the highest overall cross-boundary direction correctness ([[CBDir]] = 0.28).
- [[veloVAE]] frequently inferred reversed transitions (negative CBDir).
- [[latentVelo]] demonstrated the highest stability and intra-cluster coherence ([[ICCoh]] = 0.99) but had low agreement with other methods.
- [[DeepVelo]] was the most computationally efficient (avg 16s runtime, ~543MB memory), while [[pyro-velocity]] and [[cell2fate]] required significant memory (>22GB).
- Inter-method agreement is generally low, particularly for highly differentiated cell types.

## Methods
### Data
- 17 public [[scRNA-seq]] datasets involving dynamic development and differentiation.
- Key datasets include: Pancreatic endocrinogenesis (Dataset 1), Mouse dentate gyrus (Dataset 2), Erythrocyte maturation (Dataset 3), and Human bone marrow (Dataset 4).
- Datasets were pre-processed using log-normalization and smoothing (30 PCs, 30 nearest neighbors).

### Model Architecture
- The study benchmarked 14 distinct algorithms:
    - **ODE-based:** [[velocyto]], [[scvelo]] (stochastic & dynamical), [[MultiVelo]].
    - **Machine Learning-based:** [[uniTvelo]], [[Dynamo]], [[Pyro-Velocity]], [[cell2fate]].
    - **Deep Learning-based:** [[veloAE]], [[veloVI]], [[veloVAE]], [[latentVelo]], [[cellDancer]], [[DeepVelo]].

### Training Strategy
- Methods were run according to original guidelines with default parameters.
- **Stability Testing:** Performed stratified down-sampling of the spliced matrix on 4 benchmark datasets at rates of 0.4, 0.5, 0.6, 0.7, and 0.8.
- **Evaluation Metrics:**
    - Accuracy: Cross-boundary direction correctness ([[CBDir]]), Intra-cluster coherence ([[ICCoh]]), Velocity consistency.
    - Agreement: Method agreement scores A1 (vector similarity) and A2 (similarity to median vector).
    - Usability: GPU/CPU runtime and memory increment.

## Results
| Metric | Value | Baseline/Note |
|--------|-------|----------|
| Avg CBDir (All methods) | 0.14 | Low overall directional accuracy |
| Max CBDir | 0.28 | Achieved by [[veloVI]] |
| Max ICCoh | 0.99 | Achieved by [[latentVelo]] |
| Method Agreement (A1) | < 0.3 | General average, indicates high discrepancy |
| GPU Memory (DeepVelo) | ~543 MB | Most efficient |
| GPU Memory (cell2fate) | > 22 GB | Least efficient |

## Figures


| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of the RNA velocity analysis workflow, timeline of method development (2018-2024), and schematic of the benchmarking study design. |
| Fig 2  | Performance of 14 methods across 17 datasets based on CBDir (direction correctness), ICCoh (coherence), and velocity consistency. |
| Fig 3  | Comparison of cell velocity field agreement (A1 and A2 scores) showing pairwise correlations and discrepancies between methods. |
| Fig 4  | Stability analysis showing the impact of down-sampling on CBDir, ICCoh, and method agreement metrics. |
| Fig 5  | Comprehensive summary ranking methods by accuracy, stability, and usability. |


## Critical Analysis
### Strengths
- **Breadth:** Covers a wide range of methods (14) and datasets (17), providing a more extensive view than previous benchmarks.
- **Multidimensional Evaluation:** Balances accuracy metrics with practical concerns like stability and resource usage.
- **Reproducibility:** Highlights the lack of consensus between methods, serving as a caution for researchers relying on a single tool.

### Weaknesses
- **Ground Truth Reliance:** The primary accuracy metric ([[CBDir]]) relies on "known" biological trajectories, which can be subjective or biased in exploratory datasets.
- **Over-smoothing:** High scores in coherence ([[ICCoh]]) might reward methods that over-smooth data rather than those capturing complex, real biological noise.
- **Simulated Stability:** Down-sampling is a simplified proxy for technical noise and may not fully represent the complexities of sequencing depth issues.

### Questions
- Why does [[veloVAE]] consistently infer reversed directions compared to other Deep Learning methods?
- How can the distinct strengths of different methods (e.g., [[veloVI]]'s accuracy vs. [[latentVelo]]'s stability) be integrated into a consensus framework?

## Connections
### Related Papers
- [[velocyto]] (La Manno et al., 2018) - The foundational paper for RNA velocity.
- [[scvelo]] (Bergen et al., 2020) - Introduces the dynamical model, a key baseline in this study.
- [[DeepVelo]] (Cui et al., 2024) - Highlighted here for computational efficiency.

### Related Concepts
- [[RNA Velocity]]
- [[Trajectory Inference]]
- [[Single-cell Transcriptomics]]
- [[Splicing Kinetics]]
- [[Dynamical Systems]]

### Potential Applications
- Guiding the selection of RNA velocity tools based on available computational resources and specific biological questions.
- Development of ensemble methods that weigh predictions based on cell-type specific performance.

## Notes
-