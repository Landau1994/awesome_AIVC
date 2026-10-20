---
title: Evaluating generalization in protein–ligand cofolding methods
aliases:
  - nsmb_benchmark_2026
authors:
  - Peter Škrinjar
  - Jérôme Eberhardt
  - Gabriel Studer
  - Gerardo Tauriello
  - Torsten Schwede
  - Janani Durairaj
year: 2026
journal: Nature Structural & Molecular Biology
doi: 10.1038/s41594-026-01797-5
url: https://doi.org/10.1038/s41594-026-01797-5
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2026-07-15
date_read:
---

# Evaluating generalization in protein–ligand cofolding methods

> [!info] Verification scope — 2026-10-20
> [Source record](https://www.nature.com/articles/s41594-026-01797-5). The work was located by title and DOI in its source record. This pass checked bibliographic identity and the broad research topic; detailed method settings, figure descriptions and numerical comparisons below remain reading notes and were not all independently verified.

## Quick Summary
> The authors introduce "Runs N’ Poses," a comprehensive benchmark dataset consisting of 2,600 high-resolution protein–ligand systems released after the training cutoffs of leading all-atom cofolding methods. By testing [[05_Tools/Methods and Data Resources#AlphaFold 3|AlphaFold3]], [[05_Tools/Methods and Data Resources#Chai-1|Chai-1]], [[05_Tools/Methods and Data Resources#Protenix|Protenix]], and [[05_Tools/Methods and Data Resources#Boltz-1|Boltz-1]] against this dataset, the study reveals that current state-of-the-art models exhibit a strong performance correlation with training set similarity, highlighting limited generalization to low-similarity systems. Similarity-dependent performance alone does not establish that every prediction is memorized or that these models have no generalization ability.

## Key Points
- Current deep learning cofolding methods suffer from "limited generalization," where prediction success rates drop significantly as the target system's similarity to the training set decreases.
- The "Runs N’ Poses" benchmark serves as an independent evaluation set to detect data leakage, which has previously led to inflated performance metrics in the field.
- Success is defined using stringent criteria combining [[01_Papers/nsmb 2026 Evaluating generalization in protein–ligand cofolding methods|LDDT-PLI]] (>0.8) and ligand r.m.s.d. (<2 Å).
- Data scarcity is a primary driver of memorization; prevalent ligands (those with many training analogs) perform better than distinct ligands.
- Diffusion steering (e.g., in [[05_Tools/Methods and Data Resources#Boltz-1|Boltz-1x]]) improves physical validity of predicted poses, but does not solve the underlying memorization trend.
- Standard similarity thresholds (e.g., 40% sequence identity) are insufficient to assess data leakage in protein–ligand interaction tasks.

## Methods
### Data
- The "Runs N’ Poses" dataset: 2,600 high-resolution [[05_Tools/Methods and Data Resources#PDB|PDB]] systems released after September 30, 2021.
- Systems filtered for X-ray resolution (≤3.5 Å), reliability, and relevance (PLIP interaction checks, molecular weight constraints).
- Similarity defined using [[01_Papers/nsmb 2026 Evaluating generalization in protein–ligand cofolding methods|SuCOS]]-pocket similarity, which captures both chemical/volume overlap and pocket coverage.

### Model Architecture
- Evaluation of four all-atom cofolding deep learning methods:
    - [[05_Tools/Methods and Data Resources#AlphaFold 3|AlphaFold3]]
    - [[05_Tools/Methods and Data Resources#Chai-1|Chai-1]]
    - [[05_Tools/Methods and Data Resources#Protenix|Protenix]]
    - [[05_Tools/Methods and Data Resources#Boltz-1|Boltz-1]] (and [[05_Tools/Methods and Data Resources#Boltz-1|Boltz-1x]])

### Training Strategy
- Assessment against model training cutoffs (Sept 2021 for primary methods, June 2023 for [[05_Tools/Methods and Data Resources#Boltz-1|Boltz-2]]).
- Comparison against five non-cofolding baselines: [[01_Papers/NC 2025 Benchmarking all-atom biomolecular structure prediction with FoldBench|Redocking]], [[01_Papers/nsmb 2026 Evaluating generalization in protein–ligand cofolding methods|AF3-dock]], [[01_Papers/nsmb 2026 Evaluating generalization in protein–ligand cofolding methods|AF3-dock-ideal]], [[01_Papers/nsmb 2026 Evaluating generalization in protein–ligand cofolding methods|HM-dock-ideal]], and [[01_Papers/nsmb 2026 Evaluating generalization in protein–ligand cofolding methods|HM-transplant]].

## Results
| Metric | Value (Low Similarity 0-20) | Value (High Similarity 80-100) | Baseline |
|--------|-------|----------|----------|
| Success Rate | < 20% | > 80% | All Methods |
| LDDT-LP (>0.8) | ~60% | > 90% | Aggregate |

## Figures


| Figure | Description |
| ------ | ----------- |
| Fig 1  | Success rate correlation with training set similarity and distribution of LDDT-PLI/r.m.s.d. |
| Fig 2  | Performance across different training cutoffs (Boltz-1 vs Boltz-2) and training set distribution. |
| Fig 3  | Comparison of prevalent vs. distinct ligands and cluster representative performance. |
| Fig 4  | Correlation between protein/pocket/ligand similarity metrics and leakage. |
| Fig 5  | Visual examples of successful vs. failed predictions across similarity bins. |
| Fig 6  | Confidence metrics (iPTM) and the impact of sampling multiple seeds. |
| Fig 7  | Performance comparison of AlphaFold3 vs. physics-based docking baselines. |

## Critical Analysis
### Strengths
- Highly rigorous and independent benchmarking on a large, well-curated, and diverse dataset.
- The use of [[01_Papers/nsmb 2026 Evaluating generalization in protein–ligand cofolding methods|SuCOS]]-pocket similarity provides a more robust metric for detecting data leakage than simple sequence identity.
- Explicitly addresses the "black box" nature of current cofolding methods by testing against non-cofolding baselines.

### Weaknesses
- Many systems (128) failed to produce outputs across all models, potentially introducing a selection bias in the successful predictions.
- Reliance on experimental data in the [[05_Tools/Methods and Data Resources#PDB|PDB]] remains a bottleneck for evaluating performance on truly novel, "out-of-distribution" chemical space.

### Questions
- Can future architectures move beyond template-like memorization by incorporating physics-based constraints or foundational models for ligand space?
- How effectively can industrial data-sharing initiatives (e.g., [[05_Tools/Methods and Data Resources#MELLODDY|MELLODDY]]) address the documented data scarcity issues?

## Connections
### Related Papers
- [[05_Tools/Methods and Data Resources#AlphaFold|Jumper et al., 2021]] (AlphaFold2 foundation)
- [[05_Tools/Methods and Data Resources#AlphaFold 3|Abramson et al., 2024]] (AlphaFold3)
- [[01_Papers/nsmb 2026 Evaluating generalization in protein–ligand cofolding methods|Buttenschoen et al., 2024]] (PoseBusters)

### Related Concepts
- [[01_Papers/NC 2025 Benchmarking all-atom biomolecular structure prediction with FoldBench|Protein-ligand docking]]
- [[02_Concepts/Generalization|Data leakage]]
- [[02_Concepts/Generalization|Generalization]]
- [[01_Papers/NC 2025 Benchmarking all-atom biomolecular structure prediction with FoldBench|Deep learning for structural biology]]

### Potential Applications
- Assessment of de novo drug design capabilities.
- Validation of AI-based protein-ligand structure prediction software.

## Notes
-