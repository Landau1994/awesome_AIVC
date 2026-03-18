---
title: Deep-learning-based de novo discovery and design of therapeutics that reverse disease-associated transcriptional phenotypes
aliases:
  - GPS
authors:
  - Jing Xing
  - Mingdian Tan
  - Dmitry Leshchiner
  - Mengying Sun
  - Mohamed Abdelgied
  - Li Huang
  - Shreya Paithankar
  - Katie Uhl
  - Rama Shankar
  - Erika Lisabeth
  - Bilal Aleiwi
  - Tara Jager
  - Cameron Lawson
  - Ruoqiao Chen
  - Matthew Giletto
  - Reda Girgis
  - Richard R. Neubig
  - Samuel So
  - Edmund Ellsworth
  - Xiaopeng Li
  - Mei-Sze Chua
  - Jiayu Zhou
  - Bin Chen
year: 2026
journal: Cell
doi: 10.1016/j.cell.2026.02.016
url: https://doi.org/10.1016/j.cell.2026.02.016
tags:
  - paper
  - AIVC
  - Drug-Discovery
  - Deep-Learning
  - Transcriptomics
status: unread
rating:
date_added: 2023-10-24
date_read:
---

# Deep-learning-based de novo discovery and design of therapeutics that reverse disease-associated transcriptional phenotypes

## Quick Summary
> The authors present a deep-learning-based drug discovery platform called GPS (gene expression profile predictor on chemical structures) that infers compound-induced transcriptomic perturbation signatures from chemical structures to screen ultra-large libraries. By combining a robust collaborative learning (RCL) strategy to handle noisy training data with a Monte Carlo tree search (MolSearch) for lead optimization, the authors successfully identified and optimized novel therapeutic compounds for hepatocellular carcinoma (HCC) and idiopathic pulmonary fibrosis (IPF) that reverse disease-specific gene expression phenotypes.

## Key Points
- Developed the GPS model to predict transcriptomic changes strictly from chemical structures, bypassing the need for physical screening.
- Addressed noise in high-throughput transcriptomic data (e.g., LINCS L1000) using an RCL curriculum framework that leverages multiple peer neural networks.
- Formulated the Z-RGES metric to evaluate and rank the ability of a compound's predicted signature to reverse a specific disease expression signature.
- Introduced MolSearch, a multi-objective optimization algorithm based on Monte Carlo tree search, for hit-to-lead refinement.
- Validated GPS in Hepatocellular Carcinoma (HCC) by discovering novel compounds (e.g., MSU45302) with favorable cellular selectivity, sub-micromolar potency, and in vivo efficacy.
- Validated GPS in Idiopathic Pulmonary Fibrosis (IPF) using single-cell RNA-seq to find novel compounds and repurpose candidates (e.g., pyrithyldione) that reverse pathogenic signatures in specific cell populations like myofibroblasts and epithelial cells.

## Methods
### Data
- **Training Data**: [[LINCS L1000]] Phase I dataset containing transcriptomic profiles (978 landmark genes) for 18,746 compounds across 4 well-studied cell lines (HEPG2, MCF7, PC3, VCAP) at 10 μM, 24 h. 
- **Screening Libraries**: [[ZINC]] database (7 million drug-like compounds) and Enamine HTS library.
- **Disease Signatures**: HCC bulk RNA-seq signatures; IPF single-cell RNA-seq and bulk RNA-seq signatures.

### Model Architecture
- **GPS Neural Network**: Fully connected neural networks with hidden layers of (2131, 128, 32, 3) neurons and Leaky ReLU activations.
- **Inputs**: Chemical structures encoded as Extended-Connectivity Fingerprints ([[ECFP4]], 2048 bits) and gene features encoded as 1107 Gene Ontology ([[GO]]) terms.
- **Outputs**: Classification probabilities of a specific gene being upregulated, downregulated, or unchanged by a given compound.

### Training Strategy
- **Robust Collaborative Learning (RCL)**: A curriculum learning framework where multiple neural network "peers" train collaboratively. Early in training, the networks are forced to disagree to mitigate sample selection bias, and later they fuse knowledge to agree on high-quality samples. This re-weights reliable drug-gene pairs rather than discarding entire low-quality profiles.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| GPS F1 Score (HEPG2) | ~0.48 | ~0.43 (RF Single Gene HQ) |
| GPS Balanced Accuracy (HEPG2) | ~0.50 | ~0.45 (RF Single Gene HQ) |
| HCC Hit Rate (Z-RGES, Top 10) | ~40% | Random / Raw RGES |
| Optimized HCC Hit (MSU45302) IC50 | 0.34 μM (Huh7) | 4.1 μM (Original PB56874852) |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of the GPS framework encompassing transcriptomic signature prediction, virtual screening, hit-to-lead optimization, and model performance comparisons (RCL vs baseline models). |
| Fig 2  | Biological insights of GPS-imputed compound signatures, showing that predicted expression profiles group compounds by pathway/mechanism rather than just structure, and align with shRNA knockdown profiles. |
| Fig 3  | Validation of the Z-RGES scoring function using GPS predictions to find and optimize anti-HCC compounds, including niclosamide analogs. |
| Fig 4  | Large-scale screening for anti-HCC hits from the ZINC library and the subsequent hit-to-lead optimization via MolSearch to generate MSU45302, validated in vivo. |
| Fig 5  | Structure-gene-activity relationship (SGAR) analysis for HCC hits, elucidating the mechanism of action by linking MSU45302 efficacy to the downregulation of the UHRF1 gene. |
| Fig 6  | Application of GPS to Idiopathic Pulmonary Fibrosis (IPF) using single-cell RNA-seq signatures, leading to the identification of pyrithyldione and novel compounds that reverse myofibroblast and epithelial cell signatures. |

## Critical Analysis
### Strengths
- Bridges the gap between phenotypic screening (using rich transcriptomic signatures) and massive virtual libraries, enabling de novo drug discovery previously limited to target-based docking.
- The use of robust collaborative learning significantly improves model tolerance to the inherently noisy and inconsistent L1000 dataset.
- Integrates a complete pipeline from initial deep learning predictions to wet-lab validations, structural optimization (MolSearch), and in vivo animal testing.
- Showcases cutting-edge use of [[Single-Cell RNA-Seq]] to tackle complex diseases (IPF) by targeting specific sub-populations of cells rather than relying on bulk tissue approximations.

### Weaknesses
- GPS predictions currently rely on a fixed context (10 μM dose, 24-hour timepoint) and are trained on only four canonical cancer cell lines, limiting generalizability to varied physiological conditions and tissues.
- The model is restricted by the biological scope of the 978 landmark genes in the LINCS dataset.
- Transcriptomics-based prediction does not capture direct ligand-protein physical interactions or detailed pharmacokinetics directly.

### Questions
- Can the model be extended using transfer learning to incorporate low-dose or diverse cell-line data without suffering from catastrophic forgetting?
- How does the GPS model's ECFP4 fingerprint representation compare with newer 3D geometric graph neural networks for this specific transcription-prediction task in a larger benchmark?

## Connections
### Related Papers
- *The Connectivity Map: using gene-expression signatures to connect small molecules, genes, and disease* (Lamb et al. 2006) - Foundational concept of matching drug signatures to disease signatures.
- *OCTAD: an open workspace for virtually screening therapeutics targeting precise cancer patient groups using gene expression features* (Zeng et al. 2020) - Platform utilized in this study for benchmarking and repurposing.

### Related Concepts
- [[Transcriptomics-guided Drug Discovery]]
- [[Phenotypic Drug Discovery]]
- [[Robust Collaborative Learning]]
- [[Structure-Gene-Activity Relationship (SGAR)]]

### Potential Applications
- Rapid screening of ultra-large virtual chemical libraries for complex or rare diseases lacking clear single-protein targets.
- Mechanism of Action (MoA) deconvolution for phenotypic screening hits using SGAR.
- Precision medicine applications involving complex tissue microenvironments, like fibrosis and neurodegeneration, using single-cell derived disease signatures.

## Notes
-