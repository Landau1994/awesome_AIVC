---
title: "Human interpretable grammar encodes multicellular systems biology models to democratize virtual cell laboratories"
aliases: [Physicell]
authors:
  - Jeanette A.I. Johnson
  - Daniel R. Bergman
  - Heber L. Rocha
  - Genevieve L. Stein-O'Brien
  - Elana J. Fertig
  - Paul Macklin
year: 2025
journal: Cell
doi: 10.1016/j.cell.2025.06.048
url: https://doi.org/10.1016/j.cell.2025.06.048
tags:
  - paper
  - AIVC
  - Agent-Based-Modeling
  - Systems-Biology
  - PhysiCell
status: unread
rating:
date_added: 2023-10-24
date_read:
---

# Human interpretable grammar encodes multicellular systems biology models to democratize virtual cell laboratories

## Quick Summary
> The authors developed a human-interpretable "cell behavior hypothesis grammar" that translates plain-text descriptions of cellular rules into mathematical expressions for Agent-Based Models (ABMs). Built on the [[PhysiCell]] framework, this grammar allows scientists to easily integrate biological knowledge and multi-omics data to simulate complex multicellular dynamics. The study demonstrates the platform's utility by creating virtual "thought experiments" that model tumor hypoxia, cancer-associated fibroblast (CAF) interactions, immune evasion, virtual clinical trials of combination immunotherapies in pancreatic cancer, and even cortical layer formation in brain development.

## Key Points
- Introduction of a plain text modeling language to build virtual cell models without requiring extensive coding expertise.
- Translates natural language cell behavior statements into mathematical equations (multivariate Hill response functions).
- Integrates multi-omics data (e.g., [[scRNA-seq]] and spatial transcriptomics) to initialize and parameterize simulations.
- Capable of modeling complex tumor microenvironment (TME) dynamics, including macrophage plasticity, CD8+ T cell exhaustion, and CAF-mediated invasion.
- Facilitates *in silico* virtual clinical trials to test combination therapies (e.g., GVAX + ICI + URU) across heterogeneous patient profiles.
- Demonstrates generalizability by simulating region-specific laminarization in neurodevelopment using Allen Brain Atlas data.

## Methods
### Data
- **Spatial Transcriptomics (ST)**: Visium data of human Pancreatic Ductal Adenocarcinoma (PDAC) lesions.
- **Single-cell RNA-seq**: Immune-enriched scRNA-seq from untreated PDAC tumors to estimate immune populations.
- **In Vitro Assays**: Cell motility tracking (Panc10.05 and hT231 CAFs) in 3D collagen-I hydrogels; patient-derived organoid (PDO) invasion assays.
- **Reference Atlases**: Allen Brain Atlas for calibrating the neurodevelopment model.

### Model Architecture
- **Agent-Based Modeling (ABM)**: Built on the open-source [[PhysiCell]] framework.
- **Hypothesis Grammar**: A custom parser that reads CSV files containing behavioral rules formatted as `[cell type], [signal], [response], [behavior], [parameters]`. 
- **Mathematical Translation**: Individual rules are translated into sigmoidal (Hill), linear, or step response functions that modulate a baseline behavioral parameter based on incoming signals (e.g., oxygen, physical pressure, chemokines).

### Training Strategy
- **Parameter Calibration**: Used *in vitro* motility assay data to fit migration speeds using an anisotropic persistent random walk model.
- **Data-Driven Initialization**: Used ST data (via CODA and ProjectR) to spatially map cell types (epithelial, mesenchymal, fibroblasts) and initialize the ABM.
- **Uncertainty Quantification**: Conducted local sensitivity analyses using multiplicative perturbations (1% to 20%) in a high-dimensional parameter space to assess the robustness of Quantities of Interest (QoIs) like tumor area under the curve (AUC).

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| PDAC invasion with CAF 10:1 | High Invasiveness | Monoculture |
| EGF motility induction | Significant increase | PBS control |
| Triple Therapy (GVAX+ICI+URU) | Heterogeneous tumor clearance | Untreated Baseline |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of using agent-based models and the cell behavior grammar to digitize cell knowledge into mathematical statements. |
| Fig 2  | Simulation of tumor hypoxia dynamics and post-hypoxic migration, including parameter sensitivity analysis. |
| Fig 3  | Model showing CAFs supporting epithelial-to-mesenchymal transition (EMT) in pancreatic cells, promoting invasive growth. Includes Visium ST initialization. |
| Fig 4  | Simulation of a tumor evading cytotoxic killing by manipulating its immune microenvironment (macrophage M1/M2 plasticity and CD8+ T cell exhaustion). |
| Fig 5  | Tumor-associated macrophages in an M2-like state assist invasive breast cancer spheroids through EGF signaling, validated by *in vitro* experiments. |
| Fig 6  | Virtual clinical trial of combination immunotherapies simulated for untreated pancreatic adenocarcinomas, parameterized via scRNA-seq data. |
| Fig 7  | Extension of the grammar to model region-specific laminarization of the cortex (brain development) calibrated with the Allen Brain Atlas. |

## Critical Analysis
### Strengths
- **Accessibility**: Significantly lowers the barrier to entry for computational modeling by allowing domain experts to use plain English to write mathematical rules.
- **Data Integration**: Successfully bridges the gap between static snapshot omics data (scRNA-seq, ST) and dynamic temporal simulations.
- **Flexibility**: Highly modular and extensible framework that works across distinct biological domains (cancer progression, immunology, neurodevelopment).
- **Open Science**: The models, tools (PhysiCell Studio), and rules are open-source and run in cloud environments, ensuring reproducibility.

### Weaknesses
- **Rule Dependency**: The model relies on accurate cataloging of individual cell behaviors and rules; unknown or poorly understood biological pathways cannot be reliably simulated.
- **Intracellular Dynamics**: While the ABM handles cell-cell interactions well, complex intracellular gene regulatory networks are abstracted into simple response functions in these examples.
- **Inference Limitations**: Directly fitting high-dimensional parameters to macroscopic spatial data remains computationally challenging.

### Questions
- How effectively can Large Language Models (LLMs) be integrated to automatically extract these grammar rules directly from scientific literature?
- Can this framework scale to simulate entire organs or systemic interactions (e.g., multi-organ digital twins) without prohibitive computational costs?

## Connections
### Related Papers
- Ghaffarizadeh et al. (2018). *PhysiCell: An open source physics-based cell simulator for 3-D multicellular systems.* (Foundational software).
- Rozenblatt-Rosen et al. (2020). *The Human Tumor Atlas Network.* (Context for integrating omics into dynamic models).

### Related Concepts
- [[Agent-Based Modeling]]
- [[Digital Twins]]
- [[Spatial Transcriptomics]]
- [[Tumor Microenvironment]]
- [[Systems Biology]]

### Potential Applications
- **Virtual Clinical Trials**: Pre-screening combination therapies (e.g., immunotherapies) in heterogeneous patient cohorts to prioritize clinical trial arms.
- **Hypothesis Generation**: Testing mechanistic biological theories *in silico* before committing resources to *in vitro* or *in vivo* experiments.
- **Precision Medicine**: Creating patient-specific digital twins using individual patient biopsy or omics data to predict treatment responses.

## Notes
-