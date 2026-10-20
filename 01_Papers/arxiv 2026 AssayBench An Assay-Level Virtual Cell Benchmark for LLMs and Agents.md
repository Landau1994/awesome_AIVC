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
url: https://arxiv.org/abs/2605.10876
code_url: https://github.com/Genentech/AssayBench
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

> [!info] Verification scope — 2026-10-20
> [Source record](https://arxiv.org/html/2605.10876v1). Checked v1 dataset counts, AnDCG definition and the quoted Table 2 values. The 1,920 entries are not 1,920 independent experiments. Model rankings are those of this benchmark/version, not a current general ranking of LLMs.

## Quick Summary
> ASSAYBENCH is a large-scale benchmark for in silico phenotypic screen prediction, containing 1,920 human CRISPR benchmark entries (1,584 unique screens including merged replicates). It frames screen prediction as a gene-ranking task conditioned on free-text experiment descriptions, providing a rigorous testbed for evaluating LLMs and agentic systems as "virtual cells." The study finds that while frontier generalist LLMs outperform biology-specific models, their performance remains significantly below an empirically estimated ceiling based on technical replicates, highlighting both the potential and the remaining challenges in modeling cellular responses to genetic perturbations.

## Key Points
- Introduces [[01_Papers/arxiv 2026 AssayBench An Assay-Level Virtual Cell Benchmark for LLMs and Agents|ASSAYBENCH]], a comprehensive benchmark comprising 1,920 benchmark entries derived from human CRISPR screens, categorized into five broad phenotype classes.
- Implements a temporal train/test split to evaluate generalization to novel, unseen experimental screens.
- Proposes [[01_Papers/arxiv 2026 AssayBench An Assay-Level Virtual Cell Benchmark for LLMs and Agents|Adjusted nDCG]] (AnDCG), a novel continuous metric that enables performance comparison across heterogeneous assays by accounting for screen-specific random baselines.
- Evaluates various frontier LLMs, biology-specific models, and neural predictors, finding that generalist LLMs (like Gemini 3 Pro and GPT-5.4) currently lead on the benchmark.
- Uses technical replicates to estimate an "empirical performance ceiling," revealing that current state-of-the-art models are still far from solving the task.
- Demonstrates that performance is influenced by screen characteristics, such as citation count and phenotype type (e.g., higher performance in viability screens).
- Explores optimization techniques including [[02_Concepts/Methods and Metrics Glossary#Supervised Fine-Tuning|Supervised Fine-Tuning]], [[02_Concepts/Group Relative Policy Optimization|GRPO]] (reinforcement learning), and ensemble strategies like reciprocal rank fusion.

## Methods
### Data
- Starts from 1,952 human CRISPR screens in [[05_Tools/Methods and Data Resources#BioGRID ORCS|BioGRID ORCS]] plus 19 recent-literature screens. Direction-specific entries and replicate merging yield 1,920 benchmark entries; LaTest contains 19 screens (source Table 1).
- Harmonized textual descriptions, gene symbols (normalized to [[05_Tools/Methods and Data Resources#HGNC|HGNC]]), and relevance scores.
- Screen entries include five broad categories: Fitness/Proliferation, Chemical Response, Host-Pathogen Response, Molecular Output, and Trafficking/Localization.

### Model Architecture
- Evaluated frontier [[05_Tools/AI and Scientific Computing Reference#LLMs|LLMs]] (e.g., [[05_Tools/AI and Scientific Computing Reference#Gemini 3 Pro|Gemini 3 Pro]], [[05_Tools/AI and Scientific Computing Reference#GPT-5.4|GPT-5.4]], [[05_Tools/AI and Scientific Computing Reference#Qwen3.5|Qwen3.5]]).
- Evaluated domain-specific agents and models like [[01_Papers/Science 2026 Autonomous biomedical research with an artificial intelligence agent|Biomni]] and [[01_Papers/Cell2Sentence|C2S-Scale]].
- Developed a [[02_Concepts/Methods and Metrics Glossary#DeepSets|DeepSet]]-based neural gene-relevance predictor.
- Implemented retrieval-based baselines ([[02_Concepts/Methods and Metrics Glossary#kNN|kNN]]) and frequency-based models.

### Training Strategy
- Used zero-shot evaluation for frontier models.
- Applied [[02_Concepts/Methods and Metrics Glossary#Supervised Fine-Tuning|Supervised Fine-Tuning]] (SFT) and [[02_Concepts/Group Relative Policy Optimization|GRPO]] for task-optimized variants.
- Utilized Bayesian optimization to discover effective [[02_Concepts/Methods and Metrics Glossary#Reciprocal Rank Fusion|Reciprocal Rank Fusion]] ensemble strategies.

## Results
AnDCG@k = (nDCG@k − random-baseline nDCG@k) / (1 − random-baseline nDCG@k), after condensing unassayed genes. Zero denotes random ranking, one ideal ranking; negative values are possible. Oracle kNN uses target ground truth and is an oracle retrieval reference, not a deployable predictor or the technical-replicate ceiling.

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
- Ensemble strategies optimized on validation data showed a validation-to-test generalization gap; the test set must remain held out during optimization.
- The "empirical ceiling" is conservative, as technical replicates may not be perfectly identical in practice.

### Questions
- How does the benchmark performance scale with auxiliary tasks like pathway-level inference or causal reasoning?
- To what extent are the models actually "learning biology" versus merely using the frequency of gene appearance in the training data?
- How might the benchmark be adapted to handle non-CRISPR perturbation data (e.g., small molecule screens)?

## Connections
### Related Papers
- [[GEARS]] (Roohani et al., 2024)
- [[scGPT]] (Cui et al., 2024)
- [[05_Tools/Methods and Data Resources#biolord|biolord]] (Piran et al., 2024)
- [[01_Papers/arxiv 2026 BixBench|Bixbench]] (Mitchener et al., 2025)

### Related Concepts
- [[01_Papers/Bunne 2024 - How to Build Virtual Cell|Virtual Cell]]
- [[02_Concepts/Drug Discovery|Phenotypic Screening]]
- [[02_Concepts/Biological Context Glossary#CRISPR screens|CRISPR screens]]
- [[05_Tools/AI and Scientific Computing Reference#LLM Benchmarking|LLM Benchmarking]]
- [[02_Concepts/Gene Regulatory Networks|Gene Ranking]]

### Potential Applications
- Accelerated drug discovery and target prioritization.
- Development of "Foundation Models" for biology.
- Benchmarking AI agents for automated experimental design.

## Notes
-