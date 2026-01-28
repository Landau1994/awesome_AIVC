---
title: "AlphaGenome: advancing regulatory variant effect prediction with a unified DNA sequence model"
aliases: []
authors:
  - Žiga Avsec
  - Natasha Latysheva
  - Jun Cheng
  - Guido Novati
  - Kyle R. Taylor
  - Tom Ward
  - Clare Bycroft
  - Lauren Nicolaisen
  - Eirini Arvaniti
  - Joshua Pan
year: 2025
journal: bioRxiv
doi:
url:
tags:
  - paper
  - AIVC
  - Deep-Learning
  - Genomics
  - VEP
status: unread
rating:
date_added: 2026-01-28
date_read:
---

# AlphaGenome: advancing regulatory variant effect prediction with a unified DNA sequence model

## Quick Summary

> AlphaGenome is a unified deep learning model developed by Google DeepMind designed to predict a wide range of genomic regulatory functions directly from DNA sequences. The model accepts long DNA sequences (**1 Mb**) as input and is capable of simultaneously predicting gene expression, splicing (sites, usage, and junctions), chromatin accessibility, histone modifications, transcription factor binding, and 3D chromosomal contact maps at **single-base resolution**. Utilizing a "pre-training + distillation" strategy, AlphaGenome achieves significant breakthroughs in genomic track prediction and variant effect prediction (VEP), matching or exceeding state-of-the-art (SOTA) models in 24 out of 26 variant effect benchmarks, with particularly outstanding performance in splicing and long-range gene regulation prediction.

## Key Points

- **Unified Multimodal Architecture**: Combines long sequence context (1 Mb) with high-resolution output (1 bp), overcoming the traditional trade-off between "long-range interactions" and "high resolution" in previous models.
    
- **Comprehensive Splicing Prediction**: The first model to simultaneously predict splice sites, splice site usage, and splice junctions, allowing for a more comprehensive capture of splicing-related pathogenic variants.
    
- **Superior Performance**: Achieves or exceeds SOTA in 24/26 variant effect prediction benchmarks, including eQTL sign prediction, chromatin accessibility QTLs, and splicing outlier prediction.
    
- **Efficient Inference**: significantly reduces inference costs (under 1 second on a single GPU) by compressing knowledge from multiple teacher models into a single student model via model distillation techniques.
    

## Methods

### Data

- **Training Data**: Human (hg38) and Mouse (mm10) functional genomics data from ENCODE, FANTOM5, GTEx, and 4D Nucleome.
    
- **Modalities Covered**: RNA-seq, CAGE, PRO-cap, DNase-seq, ATAC-seq, ChIP-seq (TF & Histone), Hi-C/Micro-C (contact maps).
    

### Model Architecture

- **Backbone**: Adopts a U-Net style Encoder-Decoder architecture.
    
    - **Encoder**: Convolutional layers downsample the 1 Mb sequence to 128 bp resolution.
        
    - **Transformer Tower**: Processes long-range dependencies in the intermediate layers and generates 2D embeddings for predicting contact maps.
        
    - **Decoder**: Upsamples features back to 1 bp resolution via skip connections.
        
- **Output Heads**: Task-specific heads predict at 1 bp (e.g., RNA-seq, ATAC), 128 bp (e.g., ChIP-seq), or 2048 bp (contact maps) resolutions respectively.
    

### Training Strategy

- **Pre-training**: Sequence-parallel training using 8 TPUv3 cores to learn to predict experimental data from reference genomes.
    
- **Distillation**: A student model is trained to mimic the ensemble predictions of 64 pre-trained teacher models (all-folds models). This stage introduces stronger augmentation strategies (e.g., random mutations, structural variants) to improve model robustness and variant effect prediction capabilities.
    

## Results

|**Metric**|**Value (AlphaGenome)**|**Baseline (SOTA)**|**Description**|
|---|---|---|---|
|eQTL Sign Prediction (auROC)|**0.80**|0.75 (Borzoi)|Prediction of direction of effect for expression quantitative trait loci (eQTL)|
|Gene Expr LFC (Pearson r)|**+17.4%**|(vs Borzoi)|Relative improvement in cell-type specific gene expression Log Fold Change|
|Contact Map (Pearson r)|**+6.3%**|(vs Orca)|Relative improvement in 3D genome contact map prediction|
|Splicing Outlier (auPRC)|**SOTA**|(vs AbSplice)|Prediction of rare variants associated with splicing outliers|
|ClinVar Pathogenic (auPRC)|**0.66**|0.64 (Pangolin)|Distinguishing deep intronic pathogenic variants from benign ones|

## Figures

|**Figure**|**Description**|
|---|---|
|Fig 1|Illustrates AlphaGenome's model architecture (U-Net + Transformer), training pipeline (pre-training & distillation), and an overview of performance improvements against top competitors across benchmarks.|
|Fig 2|Shows prediction examples on unseen genomic regions (e.g., splicing and coverage of the LDLR gene) and high correlation between predicted and observed values across modalities (RNA, ATAC, ChIP, etc.).|

## Critical Analysis

### Strengths

- **The "All-in-One" Solution**: Successfully integrates previously fragmented fields (e.g., specialized splicing models vs. specialized 3D genome models) into a single model achieving pan-modal prediction.
    
- **Balancing Resolution & Range**: Solves the issue where long-sequence models typically sacrifice resolution, maintaining both 1 Mb context and 1 bp output precision.
    
- **Distillation Strategy**: Effectively addresses the slow inference issue of large ensemble models, making large-scale variant effect screening feasible.
    

### Weaknesses

- **Species Limitation**: Currently limited to Human and Mouse genomes; not yet extended to other species.
    
- **Tissue Specificity Challenges**: While performance is excellent, there is still room for improvement in capturing certain fine-grained tissue-specific splicing or expression patterns.
    
- **Personal Genome Prediction**: Has not yet been benchmarked on personal genome prediction tasks, a known weakness for models in this field.
    

### Questions

- How does the model handle personal-specific structural variants (SVs) across different population backgrounds?
    
- Will future versions integrate single-cell data to improve cell-type specific resolution?
    

## Connections

### Related Papers

- **Borzoi (Linder et al., 2025)**: The previous generation multimodal SOTA model, and AlphaGenome's primary comparison target.
    
- **Enformer (Avsec et al., 2021)**: Pioneering work introducing Transformers for processing long-range interactions.
    
- **SpliceAI / Pangolin**: Specialized splicing prediction models, serving as baselines for AlphaGenome's splicing tasks.
    
- **Orca (Zhou, 2022)**: A model specialized for 3D genome contact maps.
    

### Related Concepts

- **Sequence-to-Function Models**: A modeling paradigm predicting function directly from sequence.
    
- **Variant Effect Prediction (VEP)**: Using models to predict the impact of mutations on biological functions.
    
- **Knowledge Distillation**: A technique for model compression and performance enhancement.
    

### Potential Applications

- **Rare Disease Diagnosis**: Assisting in the interpretation of Variants of Uncertain Significance (VUS) in non-coding regions.
    
- **Drug Discovery**: Designing gene therapies such as Antisense Oligonucleotides (ASOs) or tissue-specific enhancers.
    
- **GWAS Interpretation**: Helping to identify causal variants and their mechanisms of action (e.g., eQTL direction prediction) within Genome-Wide Association Study (GWAS) signals.
    

## Notes

- A significant innovation of this model is the direct prediction of **Splice Junctions**, not just splice sites, enabling the detection of complex splicing events like exon skipping.
    
- The paper provides detailed open-source code and APIs, significantly lowering the barrier for community use.