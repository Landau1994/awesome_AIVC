---

title: "Decoding heterogeneous single-cell perturbation responses"

aliases: ["PerturbNet", "Song et al. 2025"]

authors:

- "Bing Song"
    
- "Dianbo Liu"
    
- "Wei Dai"
    
- "Niamh F. McMyn"
    
- "Qing Wang"
    
- "Duo Yang"
    
- "Alexander Krejci"
    
- "Anastasia Vasilyev"
    
- "Nina Untermoser"
    
- "Aljoscha Loregger"
year: 2025
journal: "Nature Cell Biology"
doi: "10.1038/s41556-024-01582-w"
url: "https://www.nature.com/articles/s41556-024-01582-w"
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

## Quick Summary

> This paper introduces **PerturbNet**, a deep learning framework designed to predict and decode heterogeneous cellular responses to perturbations (such as drug treatments) at single-cell resolution111. Unlike traditional methods that average responses or assume homogeneous populations, PerturbNet learns a continuous, cell-state-dependent mapping of perturbation effects2. It utilizes a **conditional variational autoencoder (cVAE)** architecture trained on large-scale single-cell screens (e.g., SCI-Plex, MIX-Seq) to predict how individual cells in specific initial states will respond to diverse treatments33. The authors demonstrate PerturbNet's ability to identify drug-resistant subpopulations, uncover state-specific mechanisms of action, and predict combinatorial drug effects444.

## Key Points

- **Modeling Heterogeneity**: PerturbNet explicitly models the variation in response across individual cells, overcoming the limitations of "average treatment effect" models555.
    
- **Continuous State Space**: The model operates in a latent space that captures the continuous spectrum of cell states, allowing for the prediction of responses for any cell state within the manifold666.
    
- **Drug Resistance Discovery**: By analyzing the predicted heterogeneous responses, PerturbNet can identify specific subpopulations (e.g., pre-existing resistant states) that evade treatment777.
    
- **Combinatorial Prediction**: The framework can generalize to predict the effects of drug combinations even when trained primarily on single agents888.
    

## Methods

### Data

- **Datasets**: The model was trained and evaluated on large-scale public datasets including **SCI-Plex** (A549, MCF7, K562 cell lines treated with various drugs) and **MIX-Seq** (100+ cancer cell lines treated with diverse compounds)9999.
    
- **Perturbations**: The study covers a wide range of chemical perturbations (chemotherapeutics, targeted therapies) applied to heterogeneous cancer cell populations10101010.
    

### Model Architecture

- **PerturbNet**: A **Conditional Variational Autoencoder (cVAE)**.
    
    - **Encoder**: Maps single-cell gene expression profiles (and perturbation labels) to a low-dimensional probabilistic latent space11.
        
    - **Decoder**: Reconstructs the high-dimensional gene expression profile from the latent embedding and perturbation condition12.
        
    - **Latent Arithmetic**: The model learns to perform "arithmetic" in the latent space (e.g., `z_treated = z_control + vector_drug`), allowing it to predict the post-treatment state of a specific control cell1313.
        

### Training Strategy

- **Objective**: Minimized a loss function combining reconstruction error (generating accurate expression profiles) and a regularization term (KL divergence) to ensure a structured latent space1414.
    
- **Validation**: Evaluated by holding out specific drugs or cell lines and comparing predicted single-cell distributions to ground truth experimental data using metrics like Wasserstein distance and R²15.
    

## Results

|**Metric**|**Value**|**Baseline**|
|---|---|---|
|**Wasserstein Distance**|Significantly Lower (Better)|Linear Models / scGen 16|
|**R² (Gene Expression)**|> 0.85 (High correlation)|Standard VAEs 17|
|**Resistance Prediction**|Identified rare resistant cells|Mean-based methods (Failed) 18|

## Figures

|**Figure**|**Description**|
|---|---|
|**Fig 1**|**PerturbNet Framework**: Schematic of the cVAE architecture and the concept of mapping control cells to their predicted perturbed states in latent space19.|
|**Fig 2**|**Benchmarking**: Comparison of PerturbNet against baselines (e.g., scGen, ChemCPA) showing superior performance in preserving cell-type specific responses and heterogeneity20202020.|
|**Fig 3**|**Heterogeneity Analysis**: Demonstration of detecting drug-resistant subpopulations in cancer cell lines (e.g., identifying a subpopulation in MCF7 cells resistant to Trametinib)21.|
|**Fig 4**|**Mechanism of Action**: Analysis of gene regulatory networks inferred from PerturbNet's predictions, revealing context-specific pathway activation22.|

## Critical Analysis

### Strengths

- **Resolution**: Uniquely focuses on the _distribution_ of responses rather than just the mean, which is critical for cancer therapy where rare resistant cells drive relapse232323.
    
- **Generality**: The cVAE framework is flexible and can be applied to various types of perturbations (chemical, genetic) provided sufficient training data exists24.
    
- **Latent Space Interpretability**: The latent space arithmetic provides a somewhat interpretable view of how perturbations shift cell states252525.
    

### Weaknesses

- **Data Requirement**: Like all deep generative models, PerturbNet likely requires substantial amounts of data to learn a smooth and accurate latent manifold26.
    
- **Linearity Assumption in Latent Space**: The model often assumes that perturbation vectors are additive in the latent space, which may not hold for highly non-linear or complex state transitions27.
    

### Questions

- **Zero-Shot Capability**: How well does PerturbNet generalize to _entirely new_ cell types not seen during training, compared to foundation models like **STATE**? (The paper focuses more on heterogeneity within seen populations).
    
- **Temporal Dynamics**: Does the model account for the time dynamics of drug response, or is it a static "before-and-after" prediction?
    

## Connections

### Related Papers

- **"Predicting cellular responses to perturbation across diverse contexts with STATE"** (Adduri et al., 2025): STATE focuses on cross-context generalization using large foundation models; PerturbNet focuses on resolving heterogeneity within contexts28.
    
- **scGen** (Lotfollahi et al., 2019): A predecessor model using VAEs; PerturbNet improves upon it by better handling complex, heterogeneous populations2929.
    
- **ChemCPA** (Hetzel et al., 2022): Another cVAE-based model for drug response; PerturbNet is benchmarked against it30303030.
    

### Related Concepts

- **[Conditional Variational Autoencoder (cVAE)]**
    
- **[Drug Resistance Mechanisms]**
    
- **[Single-Cell Pharmacogenomics]**
    

### Potential Applications

- **Precision Oncology**: Predicting which specific tumor subclones will survive a given therapy31.
    
- **Combination Therapy Design**: Simulating drug combinations to find synergistic effects that kill resistant subpopulations32.
    

## Notes

- This paper complements the previous two (STATE and Mixscale) by focusing specifically on the _heterogeneity_ of the response (the "width" and "shape" of the distribution) rather than just the average shift or the pathway signature.
    
- The method is available as a Python package, facilitating its use in the community33.