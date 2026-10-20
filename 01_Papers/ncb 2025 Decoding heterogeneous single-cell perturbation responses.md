---

title: "Decoding heterogeneous single-cell perturbation responses"

aliases: ["perturbation-response score", "Song et al. 2025"]

authors:
  - Bicna Song
  - Dingyu Liu
  - Weiwei Dai
  - Natalie F. McMyn
  - Qingyang Wang
  - Dapeng Yang
  - Adam Krejci
  - Anatoly Vasilyev
  - Nicole Untermoser
  - Anke Loregger
  - Dongyuan Song
  - Breanna Williams
  - Bess Rosen
  - Xiaolong Cheng
  - Lumen Chao
  - Hanuman T. Kale
  - Hao Zhang
  - Yarui Diao
  - Tilmann Bürckstümmer
  - Janet D. Siliciano
  - Jingyi Jessica Li
  - Robert F. Siliciano
  - Danwei Huangfu
  - Wei Li
year: 2025
journal: "Nature Cell Biology"
doi: "10.1038/s41556-025-01626-9"
url: "https://www.nature.com/articles/s41556-025-01626-9"
tags:
- paper
    
- AIVC
    
- "single-cell"
    
- "perturbation-prediction"
    
- "drug-response"
    
- "heterogeneity"
status: unread
    
rating:
    
date_added: 2026-01-21
    
date_read:
    
---

# Decoding heterogeneous single-cell perturbation responses

> [!warning] Corrected attribution — 2026-10-20
> The previous note incorrectly attributed this article to “PerturbNet” and described a cVAE drug-response generator. Its DOI pointed to an unrelated review, and the author names, numerical results and figure descriptions were unreliable. Those claims have been replaced using the [publisher article](https://www.nature.com/articles/s41556-025-01626-9) and [bibliographic record](https://pubmed.ncbi.nlm.nih.gov/40011559/).

## Quick Summary
Song and colleagues introduce the **perturbation-response score (PS)** to quantify heterogeneous responses in observed single-cell perturbation datasets. This is a response-scoring method, not a generative predictor of unseen drug combinations.

## Methods
PS selects or accepts perturbation-signature genes, estimates average effects using scMAGeCK, and uses constrained optimization to infer cell-specific response strengths. PS = 0 represents no perturbation effect; PS = 1 represents the maximum effect within the dataset. Scores are dataset-relative, not calibrated knockout probabilities.

## Results
The study evaluates partial perturbations, single-cell dosage responses, buffered versus sensitive essential genes, and heterogeneous biological responses. The former note's R² > 0.85 and invented resistance-prediction table are unsupported and have been removed. See the original figures for quantitative comparisons.

## Connections
- [[Perturb-seq]]
- [[scRNA-seq]]
- [[Gene Regulatory Networks]]

## Source and Scope
Published online 26 February 2025; Nature Cell Biology 27, 493–504. This correction checks the bibliographic identity and core method; it does not independently reproduce the experiments or validate clinical applications.
