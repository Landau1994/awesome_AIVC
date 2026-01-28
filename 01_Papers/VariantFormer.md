---
title: "VariantFormer: A hierarchical transformer integrating DNA sequences with genetic variations and regulatory landscapes for personalized gene expression prediction"

aliases: [VariantFormer]

authors:
 - Sayan Ghosal
 - Youssef Barhomi
 - Tejaswini Ganapathi
 - Amy Krystosik
 - Lakshmi Krishnan
 - Sashidhar Guntury
 - Donghui Li
 - Francesco Paolo Casale
 - Theofanis Karaletsos
year: 2025
journal: bioRxiv
doi: 10.1101/2025.10.31.685862
url: https://doi.org/10.1101/2025.10.31.685862
tags:
  - paper
  - AIVC
  - Deep-Learning
  - Genomics
  - Personalized-Medicine
status: unread
rating:
date_added: 2026-01-28
date_read:
---

# VariantFormer: A hierarchical transformer integrating DNA sequences with genetic variations and regulatory landscapes for personalized gene expression prediction

## Quick Summary

> VariantFormer is a 1.2-billion-parameter hierarchical transformer model designed to predict gene-level RNA abundance directly from **personalized diploid genomes**. Unlike previous reference-based models, VariantFormer explicitly encodes individual genetic variations (including SNPs and Indels) into DNA sequences using IUPAC ambiguity codes and integrates long-range cis-regulatory elements (CREs). Trained on 21,004 genome-transcriptome pairs from 2,330 donors, the model achieves state-of-the-art performance in predicting gene expression across genes, tissues, and individuals, while demonstrating superior generalization to out-of-distribution contexts such as cancer cell lines with high somatic mutation burdens.

## Key Points

- **Personalized Diploid Input**: The first sequence-based model to natively model heterozygous genotypes and haplotype effects by encoding individual variants directly into the DNA sequence using IUPAC codes.
    
- **Hierarchical Transformer Architecture**: Features a "frozen CRE encoder + fine-tuned gene encoder" strategy, employing cross-attention to model regulatory influences from distal elements onto gene bodies.
    
- **Robust Generalization**: Generalizes better to out-of-distribution contexts, including somatic mutation settings in cancer cell lines, where it significantly outperforms reference-based models.
    
- **Ancestry Stability**: Maintains robust performance across diverse genetic ancestries (e.g., African, East Asian), overcoming the performance degradation seen in traditional genotype-based models for underrepresented populations.
    
- **Disease Risk Stratification**: Demonstrates utility in Alzheimer's disease (AD) applications, where gene embeddings prioritize causal genes and _in silico_ mutagenesis faithfully recovers known risk-modifying effects of APOE alleles.
    

## Methods

### Data

- **Training Data**: 21,004 bulk RNA-seq samples from 2,330 donors derived from GTEx, 1000 Genomes (MAGE), ENCODE, and ADNI cohorts.
    
- **Coverage**: Spans 54 tissues and 7 cell lines; includes paired whole-genome sequencing (WGS) and expression data.
    

### Model Architecture

- **Backbone**: A 1.2-billion-parameter hierarchical transformer.
    
- **Encoders**:
    
    - **Mutation-aware CRE Encoder**: Pre-trained on chromatin activity and frozen during downstream tasks to capture regulatory syntax.
        
    - **Gene Encoder**: Fine-tuned end-to-end to process transcriptional windows (gene body ± window).
        
- **Modulators**:
    
    - **Epigenetics Modulator**: Models interactions between cis-regulatory elements (CREs).
        
    - **Gene Modulator**: Uses cross-attention to integrate regulatory context from CREs into the gene sequence representations.
        
- **Conditioning**: Learnable tissue-specific registry tokens are used to condition predictions on specific cell types or tissues.
    

### Training Strategy

- **Pre-training**: Mutation-aware encoders are pre-trained on an auxiliary task of predicting chromatin activity using donor-specific ENTEx data.
    
- **Fine-tuning**: Performed in two stages:
    
    1. **Stage 1**: Trained on protein-coding genes (VariantFormer-PCG).
        
    2. **Stage 2**: Extended to all annotated genes (VariantFormer-AG), including non-coding genes.
        

## Results

|**Metric**|**Value (VariantFormer)**|**Baseline (Enformer/Borzoi)**|**Description**|
|---|---|---|---|
|Gene Correlation (Protein-coding)|**0.804**|~0.774 (Enformer)|Correlation of predicted vs. observed expression across donors/tissues|
|Gene Correlation (Non-coding)|**0.544**|0.507 (Enformer)|Prediction performance for non-protein-coding genes (7.3% improvement)|
|Somatic Mutation Generalization|**0.848** (GM23248)|~0.65 (Borzoi)|Performance on unseen cancer cell lines with high somatic mutation burden|
|eQTL Effect Correlation|**~0.60**|~0.00|Correlation between predicted variant effects (logFC) and experimental eQTL effect sizes|
|Cross-Ancestry Stability|**0.244**|0.145 (Enformer)|Mean gene-level correlation across diverse ancestry groups|

## Figures

|**Figure**|**Description**|
|---|---|
|Fig 1|Overview of the model architecture, showing the integration of CRE and gene windows via cross-attention and the use of IUPAC codes for personalization.|
|Fig 2|Benchmarking results for gene expression prediction across genes, tissues, and individuals, highlighting performance on protein-coding vs. non-coding genes.|
|Fig 3|Evaluation of ancestry-specific performance, demonstrating VariantFormer's stability across diverse populations compared to baselines.|
|Fig 5|Validation of variant effect prediction against independent eQTL data and _in silico_ mutagenesis analysis of APOE variants in Alzheimer's disease.|
|Fig 6|Interpretability analysis showing the alignment between the model's attention scores and experimental DNase-seq chromatin accessibility data.|

## Critical Analysis

### Strengths

- **Native Diploid Modeling**: Successfully integrates phased variants into the input sequence, allowing the model to distinguish between reference and alternate alleles and capture heterozygous effects, which is a major advancement over reference-only models.
    
- **Non-coding Performance**: Achieves substantial improvements in predicting expression for non-protein-coding genes, a notoriously difficult task due to complex regulation.
    
- **OOD Generalization**: Demonstrates exceptional capability to handle out-of-distribution data, such as cancer genomes with somatic mutations, where traditional genotype-based models fail.
    
- **Interpretability**: Attention maps correlate well with physical chromatin accessibility, suggesting the model learns biologically meaningful regulatory grammar.
    

### Weaknesses

- **Context Limitations**: The model is restricted to cis-regulatory elements and transcriptional windows within megabase-scale neighborhoods, preventing it from modeling trans-acting factors or cross-gene regulatory networks.
    
- **Chromosomal Coverage**: Training was limited to autosomes (Chr1-22), excluding sex chromosomes and their associated dosage compensation mechanisms.
    
- **Static Prediction**: Predicts steady-state expression levels and cannot explicitly model dynamic responses to environmental perturbations or temporal developmental changes.
    

### Questions

- How can the model be extended to incorporate Hi-C derived chromatin contact maps to better capture 3D genome organization?
    
- Can the architecture be adapted for single-cell resolution predictions by fine-tuning on cell-type atlases?
    

## Connections

### Related Papers

- **Enformer (Avsec et al., 2021) / Borzoi (Linder et al., 2025)**: Sequence-based deep learning baselines used for comparison; VariantFormer outperforms them by integrating personalized variant information.
    
- **AlphaGenome (Avsec et al., 2025)**: Another SOTA multimodal model mentioned as a baseline for variant effect prediction.
    
- **Evo 2 (Brixi et al., 2025)**: An evolutionary foundation model used as a baseline, showing that task-specific fine-tuning with personalized data yields better expression predictions.
    

### Related Concepts

- **eQTL (Expression Quantitative Trait Locus)**: The paper extensively benchmarks against eQTL data to validate variant effect predictions.
    
- **In Silico Mutagenesis**: Used to predict the impact of specific mutations (like APOE) by computationally altering the input sequence.
    
- **IUPAC Ambiguity Codes**: The method used to represent heterozygous variants in the DNA sequence input.
    

### Potential Applications

- **Precision Medicine**: Predicting patient-specific gene expression profiles to guide personalized treatment strategies.
    
- **Rare Disease Diagnosis**: prioritizing likely causal genes and interpreting variants of uncertain significance (VUS) in non-coding regions.
    
- **Drug Discovery**: Identifying therapeutic targets by analyzing the regulatory landscape of disease-associated genes.
    

## Notes

- The model's ability to perform **Zero-shot MAGMA enrichment analysis** for Alzheimer's disease without supervised training on disease labels is a significant finding, validating the biological relevance of its learned embeddings.
    
- Code and pretrained models are publicly available, fostering reproducibility and further research.