---
title: Practical utility of sequence-to-omics models for improving the reproducibility of genetic fine-mapping
aliases: []
authors:
  - Michael D. Sweeney
  - Hyun Min Kang
year: 2026
journal: bioRxiv
doi: https://doi.org/10.64898/2026.02.04.703796
url: https://doi.org/10.64898/2026.02.04.703796
tags:
  - paper
  - AIVC
  - Genomics
  - Deep-Learning
  - Fine-mapping
  - benchmarking
status: unread
rating:
date_added: 2026-02-06
date_read:
---

# Practical utility of sequence-to-omics models for improving the reproducibility of genetic fine-mapping

## Quick Summary
This study addresses the high replication failure rates (RFRs) observed in statistical genetic fine-mapping by integrating predictions from deep learning sequence-to-omics (S2O) models. The authors evaluate four major S2O models—[[nature 2026 Advancing regulatory variant effect prediction with AlphaGenome|AlphaGenome]], [[Borzoi]], [[Enformer]], and [[Sei]]—using large-scale expression quantitative trait loci (eQTL) datasets from [[GTEx]] and [[TOPMed]]. They propose a generalized framework called "functionally informed PIPs" ([[fiPIPs]]) that combines traditional posterior inclusion probabilities with S2O scores. The results demonstrate that newer models like AlphaGenome and Borzoi significantly outperform older ones and statistical baselines in prioritizing causal variants that replicate across independent studies, offering a robust method to reduce false positives in fine-mapping.

## Key Points
- Statistical fine-mapping often suffers from high replication failure rates (32.8% for high-confidence SNPs in this study).
- S2O model scores, particularly from [[AlphaGenome]] and [[Borzoi]], correlate strongly with eQTL effect sizes and replication status.
- The authors developed the [[fiPIP]] framework, which uses [[XGBoost]] to reweight statistical fine-mapping probabilities based on S2O predictions.
- **Critical Technical Finding**: The study identified an allele-swapping artifact in precomputed [[Enformer]] scores that requires correction for accurate use.
- [[AlphaGenome]] and [[Borzoi]] achieved the highest accuracy in prioritizing replicated variants, outperforming [[Enformer]], [[Sei]], and the [[Expression Modifier Score (EMS)]] baseline.
- The method was validated on blood eQTLs (GTEx vs. TOPMed) and Lymphoblastoid Cell Lines (GTEx vs. MAGE), showing consistent performance.

## Methods
### Data
- **Discovery Set**: Whole blood eQTLs from [[GTEx]] v10 (n = 800 individuals, 6,958 credible sets).
- **Replication Set**: Whole blood eQTLs from [[TOPMed]] (n = 6,454 individuals, 54,000 credible sets).
- **Secondary Analysis**: Lymphoblastoid Cell Line (LCL) eQTLs from GTEx (n = 326) and [[MAGE]] (n = 731).
- **Filtering**: Indels and complex variants were removed; analysis focused on SNPs.

### Model Architecture
- **S2O Models Evaluated**:
    - [[AlphaGenome]]: Hybrid Transformer-CNN (1Mb input).
    - [[Borzoi]]: Hybrid Transformer-CNN (524kb input).
    - [[Enformer]]: Hybrid Transformer-CNN (200kb input).
    - [[Sei]]: CNN (sequence class prediction).
- **Integration Framework**: A Variant-to-Probability (V2P) model using [[XGBoost]] classifiers. This model takes S2O scores (single-track or multi-track) as input to predict the probability of variant replication.
- **Final Output**: Functionally informed Posterior Inclusion Probabilities ([[fiPIPs]]), calculated by reweighting original [[SuSiE]] PIPs using the V2P scores.

### Training Strategy
- **Labeling**: 
    - *Positive Labels*: Replicated SNPs from the discovery set with high PIP (≥ 0.9) in singleton credible sets.
    - *Negative Labels*: Unreplicated SNPs with low PIP (≤ 0.1).
- **Validation**: Leave-one-chromosome-out ([[LOCO]]) cross-validation to prevent overfitting.
- **Features**: Absolute values of rescaled S2O model scores (reflecting regulatory impact magnitude).

## Results
| Metric | Value | Baseline (SuSiE PIP) |
|--------|-------|----------|
| **VPA** (Size-2 Credible Sets) | **79.3%** (Combined fiPIP) | 66.6% |
| **VPA** (Size-2 Credible Sets) | **77.8%** (AlphaGenome fiPIP) | 66.6% |
| **RFR** (High-Confidence SNPs) | **~9-13%** (Top Decile S2O) | 21.7% (Top Decile PIP) |
| **Correlation** (Replicated SNPs) | **$\rho_s$ = 0.642** (AlphaGenome) | N/A |

*Note: VPA = Variant Prioritization Accuracy; RFR = Replication Failure Rate.*

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Analysis of Replication Failure Rate (RFR) in GTEx vs. TOPMed; shows high RFR in statistical mapping and strong correlation between [[AlphaGenome]] scores and replication status. |
| Fig 2  | RFR and Variant Prioritization Accuracy (VPA) for credible sets $\le$ 10 SNPs; demonstrates S2O scores prioritize variants better than PIPs alone. |
| Fig 3  | Schematic of the [[fiPIP]] framework and a case study of the *LRRC56* locus where fiPIPs resolve a large LD block to a single causal SNP. |
| Fig 4  | Evaluation on size-2 credible sets (single replicate); fiPIPs significantly improve the identification of the correct replicated variant compared to SuSiE. |
| Fig 5  | Detailed benchmarks: Single-track vs. Multi-track, comparison of classifiers ([[XGBoost]] vs. LightGBM/RF/Logistic), and sensitivity to training labels. |
| Fig 6  | Validation on Lymphoblastoid Cell Line (LCL) eQTLs showing transferability of findings to smaller datasets and different tissues. |


## Critical Analysis
### Strengths
- **Systematic Evaluation**: The paper provides a comprehensive comparison of four major S2O models using high-quality, large-scale datasets.
- **Practical Framework**: The authors release a generalized tool ([[fiPIP]]) that allows users to plug in scores from any functional model, not just the ones tested.
- **Robustness**: The analysis accounts for potential biases (e.g., LD structure, allele flipping artifacts) and validates across different tissues.
- **High Impact**: Identifying the allele-swapping issue in [[Enformer]] precomputed scores is a significant technical contribution for the community.

### Weaknesses
- **Exclusion of Indels**: The study is limited to SNPs because current S2O models are less reliable for indels, yet indels explain a significant portion of heritability.
- **Computational Cost**: Generating scores for models like [[Borzoi]] is computationally expensive without GPUs, though precomputed scores help.
- **Dependence on Existing Sets**: The method reweights existing credible sets rather than using S2O scores as priors *during* the initial fine-mapping step (though this is discussed as a future direction).

### Questions
- How would [[fiPIP]] perform if integrated directly into the [[SuSiE]] prior step rather than as a post-hoc reweighting?
- Can this framework be effectively adapted for complex traits (GWAS) where the "ground truth" (replication) is harder to define than in eQTLs?

## Connections
### Related Papers
- [[SuSiE]] (Wang et al., 2020) - The statistical fine-mapping baseline used.
- [[PolyFun]] (Weissbrod et al., 2020) - A related method for functionally informed fine-mapping.
- [[Expression Modifier Score (EMS)]] (Wang et al., 2021) - A previous S2O-based scoring method used as a baseline.
- [[AlphaGenome]] (Avsec et al., 2025) - One of the primary models evaluated.

### Related Concepts
- [[Fine-mapping]]
- [[Expression Quantitative Trait Loci (eQTL)]]
- [[Posterior Inclusion Probability (PIP)]]
- [[Sequence-to-Omics]]
- [[Variant Prioritization]]

### Potential Applications
- **Drug Target Discovery**: More accurate identification of causal variants improves the selection of genetic targets for drug development.
- **CRISPR Screen Design**: Prioritizing variants for functional validation experiments to reduce search space.
- **Polygenic Risk Scores**: Improving the weights of causal variants in prediction models by filtering out false positives.

## Notes
- The paper highlights that statistical confidence (high PIP) often overestimates replication probability, termed "Replication Failure Rate" (RFR).
- The "Combined" model (using all 4 S2O scores) offered marginal improvement over [[AlphaGenome]] or [[Borzoi]] alone, suggesting the top models capture most of the relevant signal.
- The repository for the tool is located at `https://github.com/statgen/fipip`.