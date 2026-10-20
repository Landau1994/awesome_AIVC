---
title: "Predicting cellular responses to perturbation across diverse contexts with State"
aliases: ["STATE"]
authors:
 - "Abhinav K. Adduri"
 - "Dhruv Gautam"
 - "Beatrice Bevilacqua"
 - "Alishba Imran"
 - "Rohan Shah"
 - "Mohsen Naghipourfar"
 - "Noam Teyssier"
 - "Rajesh Ilango"
 - "Yusuf H. Roohani"
year: 2025
journal: "bioRxiv"
doi: "10.1101/2025.06.26.661135"
url: "https://www.biorxiv.org/content/10.1101/2025.06.26.661135v2"
tags:
  - paper
  - AIVC
  - "single-cell"
  - "perturbation-prediction"
  - "foundation-model"
status: unread
rating:
date_added: 2026-01-21
date_read:
---

# Predicting cellular responses to perturbation across diverse contexts with STATE

## Quick Summary

> STATE is a multi-scale machine learning architecture designed to predict cellular responses to perturbations (such as drugs or genetic edits) across diverse biological contexts. It addresses the challenge of generalizing effects from observed to unobserved contexts by modeling cellular heterogeneity using a transformer-based "State Transition" (ST) model that operates on sets of cells rather than individuals. Additionally, it utilizes a "State Embedding" (SE) model trained on 167 million observational single-cell data points to generate robust, transferrable cell representations.

## Key Points

- **Multi-scale Architecture**: STATE consists of two modules: a State Transition (ST) model that predicts perturbation effects across sets of cells, and a State Embedding (SE) model that learns robust cell representations from massive observational data.
    
- **Modeling Heterogeneity**: ST uses self-attention over sets of cells to capture biological heterogeneity within populations without explicit distributional assumptions, effectively simulating [[02_Concepts/Perturb-seq|Perturb-seq]] experiments.
    
- **Foundation Model Scale**: The embedding model (SE) is trained on 167 million human cells, while the transition model (ST) is trained on over 100 million perturbed cells.
    
- **Theoretical Grounding**: Under the regularity assumptions stated in the paper, the authors prove that the unique continuous Optimal Transport (OT) map between unperturbed and perturbed populations lies within STATE's solution family in the asymptotic limit.
    
- **Zero-Shot Generalization**: Using SE embeddings allows STATE to identify strong perturbation effects in novel cellular contexts where no perturbation data was seen during training.
    

## Methods

### Data

- **Perturbation Data (ST Training)**: Over 100 million perturbed cells from large-scale screens, including the Tahoe-100M (drug perturbations), Parse-PBMC (cytokine signaling), and Replogle-Nadig (genetic perturbations) datasets.
    
- **Observational Data (SE Training)**: 167 million human cells from repositories like Arc scBaseCount, CZ CELLxGENE, and Tahoe-100M.
    
- **Preprocessing**: Data was filtered to 19,790 protein-coding genes and normalized to 10,000 UMI depth; ST inputs are grouped into non-disjoint cell sets of fixed size (e.g., 256 cells) matched by covariates.
    

### Model Architecture

- **State Transition (ST)**: A transformer-based model that takes sets of unperturbed (control) cell populations and perturbation labels as input to predict perturbed populations. It uses self-attention to model interactions within the cell set.
    
- **State Embedding (SE)**: An encoder-decoder model (600M parameters) where the encoder is a dense, bidirectional transformer that learns cell embeddings, and the decoder is an MLP predicting gene expression. It uses protein language model embeddings (ESM-2) to represent genes.
    

### Training Strategy

- **ST Loss**: Trained using Maximum Mean Discrepancy (MMD) loss between predicted and observed transcriptomes of perturbed cell sets to match distributions.
    
- **SE Loss**: Trained via self-supervision with two objectives: (1) Gene expression prediction (reconstruction) and (2) An auxiliary dataset classification task to disentangle batch effects from biological signals.
    
- **Pretraining and Fine-Tuning**: ST models can be pretrained on large datasets (like Tahoe-100M) and fine-tuned on smaller target datasets to test generalization.
    

## Results

The v2 abstract reports more than 30% improved discrimination on large datasets and improved differential-expression prediction. This is an author-reported, benchmark-specific result, not a universal accuracy gain. The previous table of precise percentages lacked figure/panel provenance and is deferred pending verification.

## Figures

|**Figure**|**Description**|
|---|---|
|Fig 1|Overview of STATE architecture, illustrating the State Embedding (SE) and State Transition (ST) modules and the "set-based" modeling approach.|
|Fig 2|Benchmarking results showing STATE outperforms baselines (Linear, scVI, scGPT) on chemical, signaling, and genetic datasets across metrics like DE overlap and effect size.|
|Fig 3|Evaluation of State Embeddings (SE), demonstrating improved zero-shot perturbation prediction in novel contexts compared to other foundation models.|
|Fig 4|Analysis of cell type-specific responses, highlighting STATE's ability to detect specific effects (e.g., Trametinib in BRAF-mutant melanoma cells) that mean-baselines miss.|

## Critical Analysis

### Strengths

- **Handling Heterogeneity**: Uniquely models cells as sets/distributions via transformers, avoiding the need for explicit matching or rigid distributional assumptions found in OT methods.
    
- **Scale**: Leverages massive datasets (100M+ cells) effectively; unlike other models, STATE shows proportionate performance gains with increased data scale.
    
- **Generalization**: The authors report improved performance over mean/linear baselines for their evaluated cell-context generalization tasks.
    
- **Theoretical Robustness**: Provides proofs that the architecture is capable of learning the continuous Optimal Transport map.
    

### Weaknesses

- **Sensitivity of Subtle Metrics**: While global metrics are strong, "subtler metrics" like the accuracy of individual DE genes are still sensitive to dataset size and quality.
    
- **Computational Cost**: Training the SE model required substantial compute (4 nodes with 8 H100 GPUs each).
    
- **Unseen Datasets**: The model was evaluated on held-out contexts within datasets, but not yet tested on "entirely held-out datasets" where no contexts were seen during training.
    

### Questions

- How effectively will the model scale to combinatorial perturbations (e.g., multi-gene edits) which are mentioned as a future direction?35.
    
- Can the implicit bias of the ST optimization be theoretically characterized to understand why it favors biologically plausible transport maps?36.
    

## Connections

### Related Papers

- **scGPT**: Cited as a baseline foundation model; STATE outperforms its embeddings in separating perturbation phenotypes.
    
- **CellOT**: An optimal transport method cited; STATE is framed as a generalization that doesn't require explicit convex potentials.
    
- **scVI**: A generative model baseline; STATE outperforms it on log fold change correlations.
    

### Related Concepts

- **Optimal Transport**: The paper theoretically links the ST model's objective to learning OT maps.[[Optimal Transport]]
    
- **[[02_Concepts/Perturb-seq|Perturb-seq]]**: The experimental method the model is designed to simulate.
    
- **Foundation Models**: STATE creates a single-cell foundation model (SE) to generate transferrable representations.
    

### Potential Applications

- **Virtual Cell Models**: Scaling development of virtual cells to predict cellular states.
    
- **Drug Discovery**: Identifying strong perturbations in novel cell types (e.g., patient-specific responses) without experimental data.
    
- **Experimental Design**: Guiding AI agents to select informative perturbations for future experiments.
    

## Notes

- The "set size" hyperparameter in ST is crucial; performance peaks at set sizes around 256 cells, suggesting an optimal balance between noise reduction and information content.
    
- The authors introduced a specific evaluation framework called "CELL-EVAL" to standardize these metrics.
    
- The SE model uses "expression-aware embeddings" (soft binning) rather than just gene tokens, embedding expression magnitude into gene identity.

## Verification (2026-10-20)

- Checked title, year, venue and identifier against the [primary source](https://www.biorxiv.org/content/10.1101/2025.06.26.661135v2). This note retains the 10 July 2025 preprint v. See [[01_Papers/Cell 2026 Predicting cellular responses to perturbation across diverse contexts with State|Cell 2026 State]] for the journal version; do not mix version-specific metrics.
- Scope: publication metadata, abstract and accessible method descriptions. Numerical results, figure references and experiments have not all been independently checked or reproduced. Comparisons remain specific to their datasets, metrics and versions.
