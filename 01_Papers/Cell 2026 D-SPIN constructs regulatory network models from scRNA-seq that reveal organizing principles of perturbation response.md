---
title: D-SPIN constructs regulatory network models from scRNA-seq that reveal organizing principles of perturbation response
aliases:
  - D-SPIN
authors:
  - Jialong Jiang
  - Sisi Chen
  - Tiffany Tsou
  - Christopher S. McGinnis
  - Tahmineh Khazaei
  - Qin Zhu
  - Jong H. Park
  - Inna-Marie Strazhnik
  - Jost Vielmetter
  - Yingying Gong
  - John Hanna
  - Eric D. Chow
  - David A. Sivak
  - Zev J. Gartner
  - Matt Thomson
year: 2026
journal: Cell
doi: 10.1016/j.cell.2026.04.028
url: https://doi.org/10.1016/j.cell.2026.04.028
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2026-06-12
date_read:
---

# D-SPIN constructs regulatory network models from scRNA-seq that reveal organizing principles of perturbation response

> [!info] Verification scope — 2026-10-20
> [Source record](https://pubmed.ncbi.nlm.nih.gov/42127893/). The work was located by title and DOI in its source record. This pass checked bibliographic identity and the broad research topic; detailed method settings, figure descriptions and numerical comparisons below remain reading notes and were not all independently verified.

## Quick Summary
D-SPIN (Dimension-scalable single-cell perturbation integration network) is a computational framework for constructing mechanistically interpretable, generative models of cellular regulatory networks from single-cell mRNA-seq data across thousands of perturbation conditions. By leveraging [[01_Papers/Cell 2026 D-SPIN constructs regulatory network models from scRNA-seq that reveal organizing principles of perturbation response|Spin network model]] architecture—a specific form of [[01_Papers/Cell 2026 D-SPIN constructs regulatory network models from scRNA-seq that reveal organizing principles of perturbation response|Markov random field]]—D-SPIN infers how perturbations reconfigure regulatory interactions, allowing it to reveal global organization, identify key regulators of cell fate, and simulate cellular responses to unobserved conditions, such as combinatorial drug dosages.

## Key Points
- D-SPIN integrates large-scale perturbation data into a unified, generative [[02_Concepts/Gene Regulatory Networks|Gene Regulatory Network]] (GRN) model.
- The framework uses a spin network approach to learn interaction parameters and condition-dependent bias vectors (perturbation responses).
- It outperforms existing methods (like [[05_Tools/Methods and Data Resources#GENIE3|GENIE3]], [[05_Tools/RNA Velocity Methods Reference#PIDC|PIDC]], [[05_Tools/Methods and Data Resources#GRNBoost2|GRNBoost2]]) in network reconstruction accuracy by effectively integrating perturbation information.
- D-SPIN enables [[01_Papers/Cell 2026 D-SPIN constructs regulatory network models from scRNA-seq that reveal organizing principles of perturbation response|Dimension-scalable]] modeling by identifying [[02_Concepts/Gene Regulatory Networks|Gene programs]] via [[02_Concepts/Methods and Metrics Glossary#oNMF|oNMF]] (orthogonal nonnegative matrix factorization).
- The framework successfully models combinatorial drug responses using an additive model with interaction strengths, enabling interpolation of cell-state distributions at unobserved dosages.
- Identified mechanisms include the additive recruitment of gene programs in macrophages under multi-drug treatments.

## Methods
### Data
- Genome-wide [[Perturb-seq]] dataset in K562 human chronic myelogenous leukemia cell lines.
- Custom drug-response profiling dataset in human peripheral blood mononuclear cells (PBMCs) across 502 small molecules.

### Model Architecture
- [[01_Papers/Cell 2026 D-SPIN constructs regulatory network models from scRNA-seq that reveal organizing principles of perturbation response|Probabilistic graphical model]] based on the [[01_Papers/Cell 2026 D-SPIN constructs regulatory network models from scRNA-seq that reveal organizing principles of perturbation response|Ising model]] / [[01_Papers/Cell 2026 D-SPIN constructs regulatory network models from scRNA-seq that reveal organizing principles of perturbation response|Spin glass]] formalism.
- [[01_Papers/Cell 2026 D-SPIN constructs regulatory network models from scRNA-seq that reveal organizing principles of perturbation response|Markov random field]] to simulate gene interactions.
- [[02_Concepts/Methods and Metrics Glossary#oNMF|oNMF]] used for unsupervised [[02_Concepts/Gene Regulatory Networks|Gene program]] discovery.
- [[01_Papers/Cell 2026 D-SPIN constructs regulatory network models from scRNA-seq that reveal organizing principles of perturbation response|Pseudolikelihood method]] used for scalable inference on large networks.

### Training Strategy
- Gradient ascent on the log-likelihood function.
- Parallelized optimization using the [[02_Concepts/Methods and Metrics Glossary#Adam|Adam optimizer]] and [[02_Concepts/Methods and Metrics Glossary#Backtracking line search|Backtracking line search]].
- [[02_Concepts/Methods and Metrics Glossary#L1 Regularization|L1 Regularization]] used for network sparsity and [[02_Concepts/Methods and Metrics Glossary#L1 Regularization|L2 Regularization]] for response vector constraints.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Directed Network AUPRC (HSC) | 0.77 | 0.44–0.57 (Other methods) |
| Directed Network Accuracy (250-node modular) | 0.944 | 0.553 (Next best method) |
| Cosine similarity of cell-state distributions | >0.96 | N/A |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of D-SPIN framework and theory of perturbation integration. |
| Fig 2  | D-SPIN benchmarking on HSC network and network-level mechanisms of fate modulation. |
| Fig 3  | Regulatory network models of genome-wide Perturb-seq data in K562. |
| Fig 4  | Global perturbation response strategies (e.g., metabolic, translational) in K562. |
| Fig 5  | D-SPIN drug response network model in human immune cells. |
| Fig 6  | Phenotypic classification of drugs based on response vectors. |
| Fig 7  | D-SPIN revealed mechanisms of combinatorial drug action and dosage interpolation. |

## Critical Analysis
### Strengths
- **Mechanistic Interpretability:** Unlike deep learning "black box" models, D-SPIN provides an explicit network architecture reflecting biochemical pathways.
- **Generative Capability:** Can simulate full transcriptional state distributions, not just predict average expression values.
- **Scalability:** The framework is highly efficient, capable of handling millions of cells and thousands of genes via parallelization and pseudolikelihood.
- **Combinatorial Interpolation:** Demonstrates powerful predictive ability for unobserved drug dosage combinations using only limited experimental data.

### Weaknesses
- **Equilibrium Assumption:** Being an equilibrium-based model, it does not inherently account for the temporal dynamics of gene expression changes.
- **Pairwise Interaction Limitation:** Currently restricted to pairwise interactions between genes/programs, potentially missing complex higher-order cooperative effects.
- **Training Data Dependence:** The accuracy of combinatorial predictions relies on the quality and design of training perturbation experiments.

### Questions
- Can the model be extended to explicitly incorporate time-series data without discarding the current undirected network formulation?
- How well does the model generalize to highly heterogeneous tissues with much higher cell-state complexity than PBMCs?

## Connections
### Related Papers
- Replogle et al. (2022) - *Mapping information-rich genotype-phenotype landscapes with genome-scale Perturb-seq.*
- Pratapa et al. (2020) - *Benchmarking algorithms for gene regulatory network inference from single-cell transcriptomic data.*
- Hopfield (1982) - *Neural networks and physical systems with emergent collective computational abilities.*

### Related Concepts
- [[02_Concepts/Gene Regulatory Networks|Gene Regulatory Network]]
- [[01_Papers/Cell 2026 D-SPIN constructs regulatory network models from scRNA-seq that reveal organizing principles of perturbation response|Ising Model]]
- [[02_Concepts/Dimensionality Reduction|Dimensionality Reduction]]
- [[02_Concepts/Drug Discovery|Combinatorial Drug Design]]

### Potential Applications
- **Drug Discovery:** Predicting the synergistic effects of drug combinations in complex immune contexts.
- **Precision Medicine:** Modeling patient-specific regulatory network responses to tailor therapeutic interventions.
- **Developmental Biology:** Mapping the regulatory logic behind stem cell differentiation trajectories.

## Notes
- D-SPIN models cells as systems residing in an "energy landscape" modulated by a perturbation vector, providing a physical bridge between transcriptomic state and regulatory logic.