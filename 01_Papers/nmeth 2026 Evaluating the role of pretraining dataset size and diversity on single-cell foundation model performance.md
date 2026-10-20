---
title: Evaluating the role of pretraining dataset size and diversity on single-cell foundation model performance
aliases:
  - seems_no_scaling_law
authors:
  - Alan DenAdel
  - Madeline Hughes
  - Akshaya Thoutam
  - Anay Gupta
  - Andrew W. Navia
  - Nicolo Fusi
  - Srivatsan Raghavan
  - Peter S. Winter
  - Ava P. Amini
  - Lorin Crawford
year: 2026
journal: Nature Methods
doi: 10.1038/s41592-026-03120-y
url: https://doi.org/10.1038/s41592-026-03120-y
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2026-06-10
date_read:
---

# Evaluating the role of pretraining dataset size and diversity on single-cell foundation model performance

> [!info] Verification scope — 2026-10-20
> [Source record](https://www.nature.com/articles/s41592-026-03120-y). The abstract confirms 22.2 million cells, 400 pretrained models and 6,400 experiments. The reported saturation concerns the tested architectures, objectives and tasks; it does not prove that useful scaling is impossible for all future single-cell models. Detailed saturation percentages remain to be checked against the figures.

## Quick Summary
> This paper systematically investigates how pretraining dataset size and diversity influence the performance of a set of single-cell representation models and baselines across zero-shot and fine-tuned tasks. Through 6,400 experiments using a 22.2-million-cell corpus (scTab), the authors find that model performance plateaus at a surprisingly small fraction of the total available data—often as little as 1% to 10%—and that current scFMs lack the clear data scaling laws observed in large language models. The findings suggest that developers should shift focus from simply increasing training data to improving data quality and better aligning pretraining objectives with target downstream tasks.

## Key Points
- Compared five approaches (including baselines rather than five foundation models): [[02_Concepts/Principal Component Analysis|PCA]], [[scVI]], [[02_Concepts/Self-Supervised Learning|SSL]], [[Geneformer]], and [[SCimilarity]].
- Conducted 6,400 experiments across 4 tasks (cell-type classification, batch integration, perturbation response prediction) to assess performance scaling.
- Observed "learning saturation points," where performance gains become marginal once models are trained on only a small subset of the total corpus.
- Contrary to findings in the NLP domain, increasing dataset diversity through techniques like [[05_Tools/AI and Scientific Computing Reference#Geometric sketching|Geometric sketching]] or cell-type re-weighting did not result in significant downstream performance improvements.
- Larger models typically achieve higher absolute performance but still encounter early performance saturation.
- Simple linear baselines or standard statistical methods (like PCA) often outperform or compete with more complex transformer-based scFMs on well-defined tasks.

## Methods
### Data
- Primary Corpus: [[05_Tools/Methods and Data Resources#scTab|scTab]] (22.2M cells, 164 cell types).
- Downstream Tasks: Clonal hematopoiesis, intestine-on-chip, placenta, periodontitis, lung, liver, renal, and Tahoe-100M (perturbation data).
- Diversity Schemes: Uniform random downsampling, cell-type re-weighting, and [[05_Tools/AI and Scientific Computing Reference#Geometric sketching|Geometric sketching]].

### Model Architecture
- [[02_Concepts/Principal Component Analysis|PCA]] (Projection matrices)
- [[scVI]] (Variational autoencoder)
- [[02_Concepts/Self-Supervised Learning|SSL]] (Masked autoencoder)
- [[Geneformer]] (Transformer)
- [[SCimilarity]] (Autoencoder-based metric learning)

### Training Strategy
- Standardized training compute (steps) across all models.
- Pretraining datasets scaled from 1% to 100% of the total corpus.
- Fine-tuning involved freezing encoder weights (for models without built-in fine-tuning) and training a simple MLP layer, or utilizing existing fine-tuning mechanisms for transformer-based models.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Zero-shot Saturation Point | 1-10% (typically) | PCA/HVG |
| Fine-tuned Saturation Point | 1-10% | Logistic Regression |

## Figures


| Figure | Description |
| ------ | ----------- |
| Fig 1  | Strategy schematic: downsampling approaches, model architectures, and experimental workflow. |
| Fig 2  | Zero-shot and fine-tuned classification performance for clonal hematopoiesis dataset, showing early plateau. |
| Fig 3  | Performance saturation heat maps for zero-shot and fine-tuned cell-type classification across multiple datasets. |
| Fig 4  | Performance saturation results for zero-shot batch integration (AvgBIO metric). |
| Fig 5  | Performance saturation results for fine-tuned perturbation response prediction. |
| Fig 6  | Impact of model size (parameter count) on performance. |


## Critical Analysis
### Strengths

- Unusually rigorous and comprehensive benchmarking effort with 6,400 individual experiments.
- Strong control over pretraining compute budgets, ensuring that "more data" did not just mean "more training steps."
- Clear demonstration that complex models are often outperformed by standard, simpler statistical baselines.

### Weaknesses
- Restricted to the evaluated architectures and training regimes; the field is rapidly evolving with newer architectures.
- The use of raw [[05_Tools/Methods and Data Resources#scTab|scTab]] without further curation highlights that performance might be gated by data quality rather than architectural limitations, but a more controlled "high-quality" subset was not explored in depth.

### Questions
- To what extent are the saturation points caused by the specific pretraining tasks chosen, rather than the intrinsic difficulty of the biological domain?
- Can we define a theoretical "quality metric" for single-cell data that effectively predicts the learning saturation point?

## Connections
### Related Papers
- [[Geneformer]] (Theodoris et al., 2023)
- [[scGPT]] (Cui et al., 2024)
- [[scVI]] (Lopez et al., 2018)
- [[SCimilarity]] (Heimberg et al., 2025)

### Related Concepts
- [[02_Concepts/Cell Foundation Models|Foundation Models]]
- [[02_Concepts/Transfer Learning Biology|Transfer Learning]]
- [[02_Concepts/Batch Correction|Batch Integration]]
- [[02_Concepts/Methods and Metrics Glossary#Data Scaling Laws|Data Scaling Laws]]

### Potential Applications
- Designing compute-optimal training regimes for future biological foundation models.
- Prioritizing data curation over raw data collection in single-cell atlas projects.

## Notes
- The authors make a strong case that "scaling laws" from NLP may not directly translate to transcriptomics due to the nature of biological data as a "sentence of genes."