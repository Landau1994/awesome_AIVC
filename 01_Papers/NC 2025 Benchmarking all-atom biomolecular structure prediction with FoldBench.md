---
title: Benchmarking all-atom biomolecular structure prediction with FoldBench
aliases:
  - FoldBench
authors:
  - Sheng Xu
  - Qiantai Feng
  - Lifeng Qiao
  - Hao Wu
  - Tao Shen
  - Yu Cheng
  - Shuangjia Zheng
  - Siqi Sun
year: 2026
journal: Nature Communications
doi: 10.1038/s41467-025-67127-3
url: https://doi.org/10.1038/s41467-025-67127-3
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2026-07-15
date_read:
---

# Benchmarking all-atom biomolecular structure prediction with FoldBench

## Quick Summary
> The paper introduces FoldBench, a comprehensive, low-homology benchmark dataset comprising 1,522 biological assemblies to evaluate the performance of all-atom biomolecular structure prediction models (AlphaFold 3, Boltz-1, Chai-1, HelixFold 3, and Protenix). The study reveals that while AlphaFold 3 consistently achieves superior accuracy across diverse tasks—including monomers, protein-ligand interactions, protein-protein interactions, and antibody-antigen complexes—current models struggle with data-scarce domains, allosteric sites, and long-range interactions in complex nucleic acids.

## Key Points
- FoldBench covers nine prediction tasks across proteins, nucleic acids, ligands, and diverse interfaces.
- Performance in protein-ligand docking is highly dependent on ligand similarity to the training set, suggesting models rely on memorized binding modes.
- Antibody-antigen predictions remain challenging with >50% failure rates for most models, highlighting the sensitivity to CDR-H3 loop conformation.
- Nucleic acid structure prediction is significantly limited by data scarcity, with current models performing poorly on complex tertiary architectures and G/C-rich sequences.
- AlphaFold 3 demonstrates robust performance in conformational change modeling, whereas other evaluated models often converge on monomeric or limited states.

## Methods
### Data
- 1,522 biological assemblies sourced from PDB entries between 2023-01-13 and 2024-11-01.
- Curated as a low-homology dataset by filtering based on sequence/structural identity to the AlphaFold 3 training set.
- Includes monomers (protein, RNA, DNA) and interface types (protein-protein, antibody-antigen, protein-ligand, protein-RNA, protein-DNA, protein-peptide).

### Model Architecture
- Evaluates five leading models: [[AlphaFold 3]], [[Boltz-1]], [[Chai-1]], [[HelixFold 3]], and [[Protenix]].
- Inference performed using a 5 × 5 sampling strategy (5 seeds × 5 samples) with 10 recycles.

### Training Strategy
- N/A (The paper focuses on benchmarking existing models rather than proposing a new training architecture).

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| AlphaFold 3 (Ligand success) | 64.9% (overall) | Boltz-1 (~55%) |
| AlphaFold 3 (PPI DockQ) | 72.9% (success rate) | Chai-1 (68.5%) |
| Antibody-antigen (AlphaFold 3) | 45.4% (success) | Other models (~30%) |

## Figures


| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of the FoldBench workflow for evaluating all-atom structure prediction models. |
| Fig 2  | Data curation pipeline, statistical summary of dataset, and distribution of chain/token counts. |
| Fig 3  | Performance on protein-ligand interaction modeling including similarity vs. success rate. |
| Fig 4  | Performance on protein-protein tasks, including structural similarity vs. complex quality. |
| Fig 5  | Performance on antibody-antigen subset, including the impact of sampling and CDR H3 loop modeling. |
| Fig 6  | Performance on nucleic acid prediction tasks, including RNA/DNA monomers and protein-nucleic acid interfaces. |


## Critical Analysis
### Strengths
- Provides a much-needed, unified, and rigorous benchmark for current all-atom prediction tools.
- Thoroughly addresses "data leakage" by establishing a strict, post-2023 validation set.
- Demonstrates insightful analysis into model "memorization" versus true generalization in ligand and PPI docking.

### Weaknesses
- Focuses primarily on "off-the-shelf" performance; computational cost for re-running all models is significant.
- The evaluation of allosteric sites is limited to specific case studies (e.g., PDB 8FNY), which might not capture global trends for allosteric inhibitors.

### Questions
- How will the performance gap between these models shift as more diverse, non-homologous structure data becomes available in the PDB?
- Can reinforcement learning, as suggested by the authors, effectively improve ranking functions without simply overfitting to the benchmark?

## Connections
### Related Papers
- [[AlphaFold 3]] (Abramson et al., 2024)
- [[Boltz-1]] (Wohlwend et al., 2024)
- [[Chai-1]] (Chai Discovery team, 2024)
- [[HelixFold 3]] (Liu et al., 2024)
- [[Protenix]] (ByteDance AI4Science, 2025)

### Related Concepts
- [[Protein-ligand docking]]
- [[Antibody-antigen interface prediction]]
- [[Conformational sampling]]
- [[Structural bioinformatics]]

### Potential Applications
- Benchmarking the next generation of generative protein and interface models.
- Guiding development of more robust ranking algorithms for molecular structure ensembles.

## Notes
-