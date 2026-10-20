---
title: Harnessing AI to Build Virtual Cells
aliases:
  - VCHarness
authors:
  - Xingyi Cheng
  - Pan Li
  - Han Guo
  - Youwei Liang
  - Jing Gong
  - William de Vazelhes
  - Changjiang Gou
  - Pengtao Xie
  - Le Song
  - Eric Xing
year: 2026
journal: bioRxiv
doi: 10.64898/2026.04.11.717183
url: https://doi.org/10.64898/2026.04.11.717183
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2026-05-18
date_read:
---

# Harnessing AI to Build Virtual Cells

> [!info] Verification scope — 2026-10-20
> [Source record](https://www.biorxiv.org/content/10.64898/2026.04.11.717183v1). The work was located by title and DOI in its source record. This pass checked bibliographic identity and the broad research topic; detailed method settings, figure descriptions and numerical comparisons below remain reading notes and were not all independently verified.

## Quick Summary
> VCHarness is an autonomous AI system designed for the construction of cellular perturbation-response models. By framing the entire model-building process—including architecture search, data processing, and training pipelines—as a single searchable loop, the system leverages a coding agent, a library of [[02_Concepts/Cell Foundation Models|Foundation Models]], and [[02_Concepts/Methods and Metrics Glossary#MCTS|Monte Carlo tree search (MCTS)]] to iteratively generate, evaluate, and refine candidate models. VCHarness demonstrates that autonomous systems can outperform expert-designed architectures while reducing development timelines from months to days.

## Key Points
- VCHarness treats model development as a search problem over executable programs, automating manual tasks like hyperparameter tuning and architecture design.
- The system employs an LLM-based coding agent to synthesize and debug ML pipelines, utilizing a specialized library of ~100 skills and biological [[02_Concepts/Cell Foundation Models|Foundation Models]].
- MCTS balances exploration and exploitation in the model architecture space, guided by empirical evaluation feedback.
- Consistent performance improvements were observed across four diverse cell lines (HepG2, Jurkat, K562, and hTERT-RPE1) in CRISPR knockdown perturbation-response tasks.
- The system discovered non-obvious architectural patterns, such as hybrid encoders and context-dependent fusion modules, that generalize effectively across different datasets.

## Methods
### Data
- CRISPR knockdown datasets for four cell lines: [[02_Concepts/Biological Context Glossary#HepG2|HepG2]], [[02_Concepts/Biological Context Glossary#Jurkat|Jurkat]], [[02_Concepts/Biological Context Glossary#K562|K562]], and [[02_Concepts/Biological Context Glossary#hTERT-RPE1|hTERT-RPE1]].
- Evaluation metric: [[02_Concepts/Methods and Metrics Glossary#Macro-F1|Macro-F1]] score.

### Model Architecture
- Modular construction using building blocks from a biological [[02_Concepts/Cell Foundation Models|Foundation Models]] library (e.g., [[05_Tools/Additional Model References#AIDO|AIDO]], [[05_Tools/Methods and Data Resources#ESM2|ESM2]], [[02_Concepts/Gene Regulatory Networks|STRING GNN]]).
- Assembled architecture generally follows a three-stage layout: foundation-model encoders, a fusion module (e.g., sigmoidal gated fusion), and a task-specific prediction head.

### Training Strategy
- Closed-loop construction: Generation, debugging, execution, evaluation, and MCTS-based refinement.
- [[02_Concepts/Methods and Metrics Glossary#Distributed Data Parallel|Distributed execution]] across multiple workers and GPUs.
- Structured feedback memory records failure modes and successful motifs to guide the coding agent’s proposals.
- Optimization includes techniques such as [[05_Tools/AI and Scientific Computing Reference#Muon|Muon]], [[02_Concepts/Methods and Metrics Glossary#AdamW|AdamW]], [[02_Concepts/Methods and Metrics Glossary#Focal Loss|Focal Loss]], [[02_Concepts/Methods and Metrics Glossary#Label Smoothing|Label Smoothing]], and [[02_Concepts/Methods and Metrics Glossary#LoRA|LoRA]] fine-tuning.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| hTERT-RPE1 (Macro-F1) | 0.5182 | ~0.3445 |
| Mean Macro-F1 Range (Various) | 0.4423 - 0.4761 | 0.3966 - 0.4470 (GNN Simple) |

## Figures


| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of VCHarness: System architecture, coding agent workflow, and distributed execution. |
| Fig 2  | Performance and search dynamics showing upward Macro-F1 trajectories across four cell lines. |
| Fig 3  | Case study for hTERT-RPE1, showing MCTS search tree, architecture recovery, and motif analysis. |


## Critical Analysis
### Strengths
- Highly autonomous system that significantly accelerates model development cycles.
- Effectively uses [[02_Concepts/Methods and Metrics Glossary#MCTS|MCTS]] to structure search, avoiding random trial-and-error.
- Demonstrates consistent generalizability across diverse biological contexts.
- Provides insights into "non-obvious" model architectures that human experts might overlook.

### Weaknesses
- Computational cost: Model training and execution remain the dominant bottlenecks, constrained by expensive GPU usage.
- Evaluation dependency: The system relies heavily on the quality and throughput of the evaluation metric to drive the search.
- Scope: Currently focused on perturbation-response modeling; more complex virtual cell behaviors (e.g., multiscale temporal dynamics) require more expressive search spaces.

### Questions
- Can the learned architectural motifs be explicitly transferred to new cell types to "warm-start" future campaigns?
- How could the system integrate more complex mechanistic or structural biological priors (e.g., from [[05_Tools/Methods and Data Resources#AlphaFold|AlphaFold]]) to improve interpretability?
- What are the limitations of the current LLM (Claude Sonnet 4.6) when scaling the system to significantly larger and more complex model search spaces?

## Connections
### Related Papers
- [[GEARS]] (Roohani et al.)
- [[scGPT]] (Cui et al.)
- [[scFoundation]] (Hao et al.)
- [[05_Tools/AI and Scientific Computing Reference#AlphaEvolve|AlphaEvolve]] (Novikov et al.)

### Related Concepts
- [[05_Tools/AI and Scientific Computing Reference#AutoML|AutoML]]
- [[05_Tools/AI and Scientific Computing Reference#AI agents|Agentic AI]]
- [[01_Papers/Cell 2026 A world model of the virtual cell|World Model]]
- [[02_Concepts/Cell Foundation Models|Biological Foundation Models]]

### Potential Applications
- Drug target identification.
- Precision medicine and disease modeling.
- Guiding experimental design in genomics.
- Scalable generation of virtual cells.

## Notes
-