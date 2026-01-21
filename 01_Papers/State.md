---
title: "Predicting cellular responses to perturbation across diverse contexts with STATE"
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
 - year:2025
journal: "bioRxiv"
doi:
url:
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

> STATE is a multi-scale machine learning architecture designed to predict cellular responses to perturbations (such as drugs or genetic edits) across diverse biological contexts1. It addresses the challenge of generalizing effects from observed to unobserved contexts by modeling cellular heterogeneity using a transformer-based "State Transition" (ST) model that operates on sets of cells rather than individuals2. Additionally, it utilizes a "State Embedding" (SE) model trained on 167 million observational single-cell data points to generate robust, transferrable cell representations3.

## Key Points

- **Multi-scale Architecture**: STATE consists of two modules: a State Transition (ST) model that predicts perturbation effects across sets of cells, and a State Embedding (SE) model that learns robust cell representations from massive observational data4.
    
- **Modeling Heterogeneity**: ST uses self-attention over sets of cells to capture biological heterogeneity within populations without explicit distributional assumptions, effectively simulating Perturb-Seq experiments555.
    
- **Foundation Model Scale**: The embedding model (SE) is trained on 167 million human cells, while the transition model (ST) is trained on over 100 million perturbed cells6.
    
- **Theoretical Grounding**: The authors prove that the unique continuous Optimal Transport (OT) map between unperturbed and perturbed populations lies within STATE's solution family in the asymptotic limit7.
    
- **Zero-Shot Generalization**: Using SE embeddings allows STATE to identify strong perturbation effects in novel cellular contexts where no perturbation data was seen during training888.
    

## Methods

### Data

- **Perturbation Data (ST Training)**: Over 100 million perturbed cells from large-scale screens, including the Tahoe-100M (drug perturbations), Parse-PBMC (cytokine signaling), and Replogle-Nadig (genetic perturbations) datasets9999.
    
- **Observational Data (SE Training)**: 167 million human cells from repositories like Arc scBaseCount, CZ CELLxGENE, and Tahoe-100M10101010.
    
- **Preprocessing**: Data was filtered to 19,790 protein-coding genes and normalized to 10,000 UMI depth; ST inputs are grouped into non-disjoint cell sets of fixed size (e.g., 256 cells) matched by covariates11111111.
    

### Model Architecture

- **State Transition (ST)**: A transformer-based model that takes sets of unperturbed (control) cell populations and perturbation labels as input to predict perturbed populations12. It uses self-attention to model interactions within the cell set13.
    
- **State Embedding (SE)**: An encoder-decoder model (600M parameters) where the encoder is a dense, bidirectional transformer that learns cell embeddings, and the decoder is an MLP predicting gene expression14141414. It uses protein language model embeddings (ESM-2) to represent genes15.
    

### Training Strategy

- **ST Loss**: Trained using Maximum Mean Discrepancy (MMD) loss between predicted and observed transcriptomes of perturbed cell sets to match distributions16.
    
- **SE Loss**: Trained via self-supervision with two objectives: (1) Gene expression prediction (reconstruction) and (2) An auxiliary dataset classification task to disentangle batch effects from biological signals17.
    
- **Zero-Shot Adaptation**: ST models can be pretrained on large datasets (like Tahoe-100M) and fine-tuned on smaller target datasets to test generalization18.
    

## Results

|**Metric**|**Value**|**Baseline**|
|---|---|---|
|Perturbation Discrimination (Tahoe)|+54% improvement|Mean/Linear Baselines 19|
|Perturbation Discrimination (PBMC)|+29% improvement|Mean/Linear Baselines 20|
|Pearson Correlation (Tahoe)|+63% improvement|Baselines 21|
|DE Gene AUPRC (Genetic Data)|+184% higher|Next best approach 22|
|Effect Size Correlation (Tahoe)|+70% higher|Baselines 23|

## Figures

|**Figure**|**Description**|
|---|---|
|Fig 1|Overview of STATE architecture, illustrating the State Embedding (SE) and State Transition (ST) modules and the "set-based" modeling approach24.|
|Fig 2|Benchmarking results showing STATE outperforms baselines (Linear, scVI, scGPT) on chemical, signaling, and genetic datasets across metrics like DE overlap and effect size25.|
|Fig 3|Evaluation of State Embeddings (SE), demonstrating improved zero-shot perturbation prediction in novel contexts compared to other foundation models26.|
|Fig 4|Analysis of cell type-specific responses, highlighting STATE's ability to detect specific effects (e.g., Trametinib in BRAF-mutant melanoma cells) that mean-baselines miss27.|

## Critical Analysis

### Strengths

- **Handling Heterogeneity**: Uniquely models cells as sets/distributions via transformers, avoiding the need for explicit matching or rigid distributional assumptions found in OT methods28282828.
    
- **Scale**: Leverages massive datasets (100M+ cells) effectively; unlike other models, STATE shows proportionate performance gains with increased data scale29.
    
- **Generalization**: The first model to reliably outperform simple linear/mean baselines in generalizing perturbation effects to new cell contexts30.
    
- **Theoretical Robustness**: Provides proofs that the architecture is capable of learning the continuous Optimal Transport map31.
    

### Weaknesses

- **Sensitivity of Subtle Metrics**: While global metrics are strong, "subtler metrics" like the accuracy of individual DE genes are still sensitive to dataset size and quality32.
    
- **Computational Cost**: Training the SE model required substantial compute (4 nodes with 8 H100 GPUs each)33.
    
- **Unseen Datasets**: The model was evaluated on held-out contexts within datasets, but not yet tested on "entirely held-out datasets" where no contexts were seen during training34.
    

### Questions

- How effectively will the model scale to combinatorial perturbations (e.g., multi-gene edits) which are mentioned as a future direction?35.
    
- Can the implicit bias of the ST optimization be theoretically characterized to understand why it favors biologically plausible transport maps?36.
    

## Connections

### Related Papers

- **scGPT**: Cited as a baseline foundation model; STATE outperforms its embeddings in separating perturbation phenotypes37373737.
    
- **CellOT**: An optimal transport method cited; STATE is framed as a generalization that doesn't require explicit convex potentials38383838.
    
- **scVI**: A generative model baseline; STATE outperforms it on log fold change correlations39393939.
    

### Related Concepts

- **[Optimal Transport]**: The paper theoretically links the ST model's objective to learning OT maps40.
    
- **[Perturb-Seq]**: The experimental method the model is designed to simulate41.
    
- **[Foundation Models]**: STATE creates a single-cell foundation model (SE) to generate transferrable representations42.
    

### Potential Applications

- **Virtual Cell Models**: Scaling development of virtual cells to predict cellular states43.
    
- **Drug Discovery**: Identifying strong perturbations in novel cell types (e.g., patient-specific responses) without experimental data44.
    
- **Experimental Design**: Guiding AI agents to select informative perturbations for future experiments45.
    

## Notes

- The "set size" hyperparameter in ST is crucial; performance peaks at set sizes around 256 cells, suggesting an optimal balance between noise reduction and information content46.
    
- The authors introduced a specific evaluation framework called "CELL-EVAL" to standardize these metrics47.
    
- The SE model uses "expression-aware embeddings" (soft binning) rather than just gene tokens, embedding expression magnitude into gene identity48.