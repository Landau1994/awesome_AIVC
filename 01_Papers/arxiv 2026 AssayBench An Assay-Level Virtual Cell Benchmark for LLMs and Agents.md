---
title: "AssayBench: An Assay-Level Virtual Cell Benchmark for LLMs and Agents"
aliases:
  - AssayBench
authors:
  - Edward De Brouwer
  - Carl Edwards
  - Alexander Wu
  - Jenna Collier
  - Graham Heimberg
  - Xiner Li
  - Meena Subramaniam
  - Ehsan Hajiramezanali
  - David Richmond
  - Jan-Christian Hütter
  - Sara Mostafavi
  - Gabriele Scalia
year: 2026
journal: Preprint (arXiv)
doi: 10.48550/arXiv.2605.10876
url: https://github.com/Genentech/AssayBench
tags:
  - paper
  - AIVC
  - CRISPR
  - LLMs
  - Benchmark
status: unread
rating:
date_added: 2026-05-11
date_read:
---

# AssayBench: An Assay-Level Virtual Cell Benchmark for LLMs and Agents

## Quick Summary
> ASSAYBENCH is a large-scale benchmark for in silico phenotypic screen prediction, containing 1,920 human CRISPR screens. It frames screen prediction as a gene-ranking task conditioned on free-text experiment descriptions, providing a rigorous testbed for evaluating LLMs and agentic systems as "virtual cells." The study finds that while frontier generalist LLMs outperform biology-specific models, their performance remains significantly below an empirically estimated ceiling based on technical replicates, highlighting both the potential and the remaining challenges in modeling cellular responses to genetic perturbations.

## Key Points
- Introduces [[ASSAYBENCH]], a comprehensive benchmark comprising 1,920 human CRISPR screens categorized into five broad phenotype classes.
- Implements a temporal train/test split to evaluate generalization to novel, unseen experimental screens.
- Proposes [[Adjusted nDCG]] (AnDCG), a novel continuous metric that enables performance comparison across heterogeneous assays by accounting for screen-specific random baselines.
- Evaluates various frontier LLMs, biology-specific models, and neural predictors, finding that generalist LLMs (like Gemini 3 Pro and GPT-5.4) currently lead on the benchmark.
- Uses technical replicates to estimate an "empirical performance ceiling," revealing that current state-of-the-art models are still far from solving the task.
- Demonstrates that performance is influenced by screen characteristics, such as citation count and phenotype type (e.g., higher performance in viability screens).
- Explores optimization techniques including [[Supervised Fine-Tuning]], [[GRPO]] (reinforcement learning), and ensemble strategies like reciprocal rank fusion.

## Methods
### Data
- Compiled from 1,952 human CRISPR screens in [[BioGRID ORCS]] and 19 recent publications (the LaTest split).
- Harmonized textual descriptions, gene symbols (normalized to [[HGNC]]), and relevance scores.
- Screen entries include five broad categories: Fitness/Proliferation, Chemical Response, Host-Pathogen Response, Molecular Output, and Trafficking/Localization.

### Model Architecture
- Evaluated frontier [[LLMs]] (e.g., [[Gemini 3 Pro]], [[GPT-5.4]], [[Qwen3.5]]).
- Evaluated domain-specific agents and models like [[Biomni]] and [[C2S-Scale]].
- Developed a [[DeepSet]]-based neural gene-relevance predictor.
- Implemented retrieval-based baselines ([[kNN]]) and frequency-based models.

### Training Strategy
- Used zero-shot evaluation for frontier models.
- Applied [[Supervised Fine-Tuning]] (SFT) and [[GRPO]] for task-optimized variants.
- Utilized Bayesian optimization to discover effective [[Reciprocal Rank Fusion]] ensemble strategies.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| AnDCG@100 (Test) | 0.1570 (Gemini 3 Pro) | 0.2918 (Oracle kNN) |
| Precision@100 (Test) | 0.2226 (Gemini 3 Pro) | 0.3798 (Oracle kNN) |
| dFDR@100 (Test) | 0.0164 (Gemini 3 Pro) | 0.0037 (Oracle kNN) |

## Figures


| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of the ASSAYBENCH creation pipeline, dataset splits, and screen-to-ranking prediction task. |
| Fig 2  | Benchmark results for main models and a performance comparison with technical replicates (the performance ceiling). |
| Fig 3  | Stratification of AnDCG@100 predictive performance by phenotype category on the test split. |
| Fig 4  | Scaling trends for the Qwen family and regression analysis of performance covariates (e.g., citations). |
| Fig 5  | Analysis of biological biases in language models across curated gene sets. |
| Fig 6  | Comparison of validation vs. test performance for ensemble functions. |
| Fig 7  | Performance progression of Qwen ~8B model variants over time. |

## Critical Analysis
### Strengths
- Highly relevant task for modern drug discovery pipelines.
- Standardized, large-scale dataset with a well-motivated metric (AnDCG) that handles the high variability of biological screens.
- Careful handling of temporal distribution shift and identification of a performance ceiling using technical replicates.

### Weaknesses
- Strong dependence on the pretraining corpus of LLMs, raising significant questions about potential data memorization rather than biological reasoning.
- Ensemble methods showed significant overfitting on the test set during optimization.
- The "empirical ceiling" is conservative, as technical replicates may not be perfectly identical in practice.

### Questions
- How does the benchmark performance scale with auxiliary tasks like pathway-level inference or causal reasoning?
- To what extent are the models actually "learning biology" versus merely using the frequency of gene appearance in the training data?
- How might the benchmark be adapted to handle non-CRISPR perturbation data (e.g., small molecule screens)?

## Connections
### Related Papers
- [[GEARS]] (Roohani et al., 2024)
- [[scGPT]] (Cui et al., 2024)
- [[biolord]] (Piran et al., 2024)
- [[Bixbench]] (Mitchener et al., 2025)

### Related Concepts
- [[Virtual Cell]]
- [[Phenotypic Screening]]
- [[CRISPR screens]]
- [[LLM Benchmarking]]
- [[Gene Ranking]]

### Potential Applications
- Accelerated drug discovery and target prioritization.
- Development of "Foundation Models" for biology.
- Benchmarking AI agents for automated experimental design.

## Notes
-