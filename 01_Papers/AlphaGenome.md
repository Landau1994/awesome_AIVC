---
title: Advancing regulatory variant effect prediction with AlphaGenome
aliases:
  - AlphaGenome
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
year: 2026
journal: Nature
doi: 10.1038/s41586-025-10014-0
url: https://doi.org/10.1038/s41586-025-10014-0
tags:
  - paper
  - AIVC
  - Deep-Learning
  - Genomics
  - VEP
  - Nature
status: unread
rating:
date_added: 2026-01-29
date_read:
---

# Advancing regulatory variant effect prediction with AlphaGenome

## Quick Summary

> AlphaGenome is a unified deep learning model developed by Google DeepMind that predicts thousands of functional genomic tracks from **1 Mb** DNA sequences at **single-base resolution**. It overcomes the traditional trade-off between input sequence length and prediction resolution. The model simultaneously predicts gene expression, splicing (including splice sites, usage, and junctions), chromatin accessibility, histone modifications, transcription factor binding, and 3D chromatin contact maps. Trained on human and mouse genomes using a "pre-training + distillation" strategy, AlphaGenome matches or exceeds state-of-the-art (SOTA) models in **25 of 26** variant effect prediction benchmarks. It demonstrates particular strength in interpreting complex non-coding variants, such as those driving oncogene regulation in T-cell acute lymphoblastic leukemia (T-ALL).

## Key Points

- **Unified Architecture**: Combines long-range context (1 Mb) with high-resolution output (1 bp), solving the limitation where previous models sacrificed one for the other.
    
- **Comprehensive Splicing**: The first model to explicitly predict splice junction coordinates and strength alongside splice sites and usage, enabling the detection of complex splicing events like exon skipping.
    
- **SOTA Performance**: Outperforms specialized models (like Orca for 3D genome and Pangolin for splicing) and multimodal models (like Borzoi) across the vast majority of benchmarks.
    
- **Efficient Distillation**: Compresses an ensemble of teacher models into a single student model, enabling highly accurate inference in less than 1 second on a single GPU.
    

## Methods

### Data

- **Training Data**: Human (hg38) and Mouse (mm10) functional genomics data from large-scale consortia including ENCODE, GTEx, FANTOM5, and 4D Nucleome.
    
- **Modalities**: 5,930 human and 1,128 mouse tracks covering RNA-seq, CAGE, PRO-cap, DNase-seq, ATAC-seq, ChIP-seq (TF & Histone), and Hi-C/Micro-C contact maps.
    

### Model Architecture

- **Backbone**: A U-Net-inspired architecture that efficiently processes 1 Mb sequences.
    
    - **Encoder**: Convolutional layers downsample the sequence to extract features.
        
    - **Transformer Tower**: Operates at lower resolution to model long-range dependencies (e.g., enhancer-promoter interactions) and generate 2D embeddings for contact maps.
        
    - **Decoder**: Upsamples features back to 1 bp resolution via skip connections.
        
- **Output Heads**: Task-specific heads predict at appropriate resolutions: 1 bp (e.g., RNA-seq, ATAC), 128 bp (e.g., ChIP-seq), or 2048 bp (contact maps).
    

### Training Strategy

- **Pre-training**: Models are trained on reference genome intervals to predict experimental data using sequence parallelism across TPU devices.
    
- **Distillation**: A single student model is trained to reproduce the predictions of an ensemble of "all-fold" teacher models. This stage includes aggressive data augmentation (random shifts, reverse complements, and random mutations) to improve robustness and variant effect prediction accuracy.
    

## Results

|**Metric**|**Value (AlphaGenome)**|**Baseline (SOTA)**|**Description**|
|---|---|---|---|
|VEP Benchmarks|**25/26**|-|AlphaGenome matches or exceeds SOTA on 25 out of 26 variant effect prediction tasks.|
|Gene Expr LFC (Pearson r)|**+14.7%**|(vs Borzoi)|Relative improvement in predicting cell-type-specific gene expression log-fold change.|
|Contact Map (Pearson r)|**+6.3%**|(vs Orca)|Relative improvement in 3D genome contact map prediction.|
|eQTL Sign Prediction (auROC)|**0.80**|0.75 (Borzoi)|Accuracy in predicting the direction of effect for expression QTLs.|
|ClinVar Pathogenic (auPRC)|**0.66**|0.64 (Pangolin)|Performance in distinguishing deep intronic/synonymous pathogenic variants from benign ones.|

## Figures

|**Figure**|**Description**|
|---|---|
|Fig 1|Overview of the U-Net + Transformer architecture, the pre-training and distillation pipeline, and a summary of performance gains across 24 genome track and 26 variant effect benchmarks.|
|Fig 2|Visual examples of track predictions (e.g., _LDLR_ locus) showing high correlation with observed data across modalities. Highlights the ability to resolve fine-scale features like exon boundaries and splice junctions.|
|Fig 3|Deep dive into splicing variant prediction. Demonstrates detection of exon skipping events (e.g., _DLG1_) and superior performance on ClinVar and splicing QTL benchmarks compared to Pangolin and SpliceAI.|
|Fig 4|Evaluation of gene expression variant prediction (eQTLs). Shows SOTA performance in predicting effect size and direction, and applications in interpreting GWAS loci.|
|Fig 5|Analysis of chromatin accessibility and TF binding variants (caQTLs/bQTLs). Demonstrates accurate prediction of motif disruptions (e.g., SPI1, NF-kB) and saturation mutagenesis performance.|
|Fig 6|A multimodal case study on _TAL1_ oncogene regulation in T-ALL. The model correctly predicts how non-coding mutations create neo-enhancers, alter chromatin marks, and upregulate gene expression.|

## Critical Analysis

### Strengths

- **Unification**: Successfully integrates diverse genomic modalities into a single framework without compromising performance on individual tasks.
    
- **Resolution & Context**: Achieves the "holy grail" of maintaining single-base resolution while modeling megabase-scale context.
    
- **Mechanism Discovery**: The multimodal output allows for mechanistic interpretation of variants (e.g., distinguishing whether an expression change is due to splicing disruption or enhancer modulation).
    

### Weaknesses

- **Long-range Limitations**: Performance still decays for regulatory elements located >100 kb away from the target gene.
    
- **Tissue Specificity**: Accurately capturing fine-grained tissue-specific patterns across all cell contexts remains a challenge.
    
- **Non-coding Genes**: Training and evaluation are heavily biased towards protein-coding genes; non-coding genes (e.g., microRNAs) are less well covered.
    
- **Personal Genomes**: The model has not yet been benchmarked on predicting phenotypes from full personal genomes, a known difficulty for sequence-based models.
    

### Questions

- How can the model be extended to effectively capture very distal interactions (> 1 Mb) that are currently missed?
    
- Can the integration of single-cell data improve the resolution of cell-type-specific predictions?
    

## Connections

### Related Papers

- **Borzoi (Linder et al., 2025)**: The previous multimodal SOTA model and primary baseline for comparison.
    
- **Enformer (Avsec et al., 2021)**: The predecessor model that introduced Transformers for long-range genomic interactions.
    
- **Orca (Zhou, 2022)**: A specialized 3D genome model outperformed by AlphaGenome in contact map prediction.
    
- **Pangolin / SpliceAI**: Specialized splicing models used as baselines.
    

### Related Concepts

- **Sequence-to-Function Models**: Deep learning models that predict biological function directly from DNA sequence.
    
- **Variant Effect Prediction (VEP)**: The task of predicting the functional consequences of genetic variants.
    
- **Knowledge Distillation**: The technique used to compress the ensemble of teacher models into a single, efficient student model.
    

### Potential Applications

- **Rare Disease Diagnosis**: Prioritizing and interpreting Variants of Uncertain Significance (VUS) in non-coding regions.
    
- **Therapeutic Design**: Designing sequences for gene therapy, such as tissue-specific enhancers or antisense oligonucleotides.
    
- **GWAS Interpretation**: Identifying causal variants and their mechanisms of action (e.g., direction of effect) underlying complex traits.
    

## Notes

- This Nature 2026 version presents slightly updated metrics compared to earlier preprints (e.g., SOTA on 25/26 tasks).
    
- The model includes a dedicated "Splice Junction Head" that models donor-acceptor interactions, a novel feature for multimodal models.