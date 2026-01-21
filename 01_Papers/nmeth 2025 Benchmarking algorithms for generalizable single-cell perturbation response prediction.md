---
title: "Benchmarking algorithms for generalizable single-cell perturbation response prediction"
aliases: []
authors:
  - Zhiting Wei
  - Yiheng Wang
  - Yicheng Gao
  - Shuguang Wang
  - Ping Li
  - Duanmiao Si
  - Yuli Gao
  - Siqi Wu
  - Danlu Li
  - Kejing Dong
  - Xingbo Yang
  - Chen Tang
  - Shaliu Fu
  - Xiaohan Chen
  - Wannian Li
  - Yuzhou You
  - Chen Zhang
  - Aibin Liang
  - Guohui Chuai
  - Qi Liu
year: 2025
journal: Nature Methods
doi: https://doi.org/10.1038/s41592-025-02980-0
url: https://doi.org/10.1038/s41592-025-02980-0
tags:
  - paper
  - AIVC
  - single-cell
  - benchmarking
  - perturbation-prediction
status: unread
rating:
date_added: 2025-12-11
date_read:
---

# Benchmarking algorithms for generalizable single-cell perturbation response prediction

## Quick Summary
This paper presents a comprehensive benchmark of 27 computational methods for predicting single-cell perturbation responses, evaluated across 29 datasets involving genetic and chemical perturbations. The study categorizes prediction tasks into "cellular context generalization" (predicting known perturbations in new cell types) and "perturbation generalization" (predicting unseen perturbations). The authors find that no single method universally dominates; simple baselines often outperform complex models in specific scenarios, particularly for combinatorial perturbations and distinct cellular contexts. The study highlights the limitations of current foundation models in capturing population-level distributions and proposes a cellular context embedding strategy to enhance generalizability.

## Key Points
- Benchmarked **27 methods** (including deep learning, graph models, and foundation models like [[scGPT]] and [[scFoundation]]) across **29 datasets**.
- Evaluation divided into two scenarios: **Cellular Context Generalization** (new contexts) and **Perturbation Generalization** (new perturbations).
- Found that for **Cellular Context Generalization**, VAE-based methods like [[trVAE]] and [[inVAE]] performed best on average metrics, while [[scVIDR]] excelled for datasets with dosage information.
- In **Perturbation Generalization**:
    - **Genetic Single**: [[GenePert]] is optimal for small training sets; [[CPA]] and [[scGPT]] excel with large fine-tuning datasets.
    - **Genetic Combo**: Simple linear models and [[scouter]] outperformed complex models.
    - **Chemical**: [[chemCPA]] was the preferred choice for single perturbations, but baselines beat complex models for combinations.
- Identified that most methods fail to accurately predict population-distribution metrics (e.g., [[Common-DEGs]]) compared to population-average metrics (e.g., [[MSE]]).
- Proposed a **cellular context embedding** strategy using prior knowledge (cell-line embeddings) which showed promise in improving generalizability.

## Methods
### Data
- **Cellular Context Generalization**: 12 datasets (e.g., [[KangCrossCell]], [[CrossSpecies]], [[Haber]], [[sciPlex3]]) covering cross-cell-line, cross-patient, and cross-species predictions. Includes single-condition and multi-condition (dosage/time) metadata.
- **Perturbation Generalization**: 17 datasets covering genetic (CRISPRa/i, knockout) and chemical perturbations. Includes large-scale screens like [[Replogle-exp]] and [[Norman]] (combinatorial).
- **Preprocessing**: Quality control involved filtering low-expression genes/cells, normalizing to 10,000 counts, and log-transformation. Selected top 5,000 highly variable genes.

### Model Architecture
The benchmark covers four main categories of methods:
1.  **VAE-based**: [[scGen]], [[trVAE]], [[inVAE]], [[scPRAM]], [[scVIDR]].
2.  **Optimal Transport/GANs**: [[CellOT]], [[scPreGAN]], [[SCREEN]].
3.  **Graph/Knowledge-based**: [[GEARS]], [[GenePert]], [[GeneCompass]].
4.  **Foundation Models/LLMs**: [[scGPT]], [[scFoundation]], [[scELMo]], [[scBERT]].
5.  **Baselines**: [[trainMean]], [[linearModel]], [[baseMLP]], [[baseReg]].

### Training Strategy
- **Scenarios**:
    - **O.O.D. (Out-of-Distribution)**: For cellular context, leave-one-context-out cross-validation.
    - **I.I.D. (Independent and Identically Distributed)**: Served as a control where training sees some cells from the test context.
- **Evaluation Metrics**:
    - *Population-Average*: [[MSE]], [[PCC-delta]], [[E-distance]].
    - *Population-Distribution*: [[Wasserstein distance]], [[KL-divergence]], [[Common-DEGs]].
- **Scalability & Robustness**: Tested runtime, memory usage, and performance under simulated noise and sparsity.

## Results
| Scenario | Sub-task | Top Performing Method (Avg Metrics) | Key Insight |
|:---|:---|:---|:---|
| **Cell Context** | Single Condition | [[trVAE]], [[CellOT]], [[inVAE]] | Methods struggle when new context is very dissimilar (high inter-heterogeneity). |
| **Cell Context** | Multi-Condition | [[scVIDR]] | Few methods utilize dosage/time metadata effectively. |
| **Perturbation** | Genetic (Small Data) | [[GenePert]] | LLM-based embeddings help in low-data regimes. |
| **Perturbation** | Genetic (Large Data) | [[CPA]], [[scGPT]] | Foundation models scale well with sufficient fine-tuning data. |
| **Perturbation** | Genetic Combo | [[linearModel]], [[scouter]] | Simple additive models often beat complex deep learning for combinations. |
| **Perturbation** | Chemical Single | [[chemCPA]] | Effective use of prior knowledge improves performance. |
| **Perturbation** | Chemical Combo | [[baseReg]] (Baseline) | Current deep learning methods fail to beat baselines in chemical combos. |

## Figures

| Figure | Description |
|:---|:---|
| **Fig 1** | Overview of the benchmarking framework, categorizing the 27 methods and 29 datasets into cellular context vs. perturbation generalization scenarios. |
| **Fig 2** | Results for **Cellular Context Generalization** (o.o.d. setting). Shows performance of 14 methods; highlights that most methods perform poorly on distribution metrics like Common-DEGs. |
| **Fig 3** | Analysis of limitations in cellular context generalization. Demonstrates that performance correlates strongly with **inter-heterogeneity** (similarity between training and test contexts). |
| **Fig 4** | Results for **Genetic Perturbation Generalization**. Shows [[GenePert]] winning on small data, [[CPA]]/[[scGPT]] on large data, and linear models winning on combinatorial data. |
| **Fig 5** | Results for **Chemical Perturbation Generalization** and summary recommendations. [[chemCPA]] leads in single perturbations; baselines lead in combinations. Includes guide for user method selection. |

## Critical Analysis
### Strengths
- **Comprehensive Scope**: Covers a vast array of methods (27) and datasets (29), arguably the most extensive benchmark in this niche to date.
- **Rigorous Metrics**: Distinguishes between population-average (easy to optimize) and population-distribution metrics (hard to optimize, biologically relevant), revealing that many "state-of-the-art" models fail to capture cellular heterogeneity.
- **Foundation Model Scrutiny**: Provides a critical look at foundation models ([[scGPT]], [[scFoundation]]), showing they are not a silver bullet and often require large fine-tuning sets to beat simpler baselines.
- **Practical Guidance**: Offers a decision tree (Fig 5g) for researchers to select tools based on data size, type, and computational resources.

### Weaknesses
- **Chemical Combination Gap**: The study reveals a significant lack of effective methods for chemical combination prediction, where baselines still dominate.
- **Foundation Model Implementation**: scFoundation encountered OOM (out-of-memory) errors on several tasks, limiting its full evaluation.
- **Context Embedding limitation**: The proposed solution (cellular context embedding) is currently limited to cell-line-derived contexts and doesn't apply to patient-derived data yet.

### Questions
- Why do deep learning models consistently fail to outperform additive linear baselines in predicting combinatorial genetic interactions (Fig 4e)?
- How can population-distribution metrics be directly optimized in loss functions to improve heterogeneity prediction?

## Connections
### Related Papers
- **[[scGen]]** (Lotfollahi et al., 2019): A foundational VAE method benchmarked here.
- **[[GEARS]]** (Roohani et al., 2024): A knowledge-graph method for perturbation prediction.
- **[[scGPT]]** (Cui et al., 2024) & **[[scFoundation]]** (Hao et al., 2024): Foundation models evaluated in the study.
- **[[ChemCPA]]** (Hetzel et al., 2022): The leading method for chemical perturbations.

### Related Concepts
- [[Single-cell Perturbation Prediction]]
- [[Generalization]] (Out-of-distribution vs. In-distribution)
- [[Foundation Models in Biology]]
- [[Differential Expression Analysis]]
- [[Cellular Heterogeneity]]

### Potential Applications
- **Drug Discovery**: Selecting the right model (e.g., [[chemCPA]]) to predict drug responses in screened cell lines.
- **Experimental Design**: Using simulation to determine if a dataset is large enough to justify using a foundation model like [[scGPT]].
- **Combinatorial Screening**: Understanding that linear assumptions are often sufficient for predicting genetic interactions, saving computational resources.

## Notes
- The distinction between "population-average" and "population-distribution" metrics is crucial. High MSE/correlation doesn't mean the model captured the biological variance of the cell population.
- The paper introduces a "Cellular Context Embedding" strategy as a proof-of-concept to fix the poor generalization across cell lines.