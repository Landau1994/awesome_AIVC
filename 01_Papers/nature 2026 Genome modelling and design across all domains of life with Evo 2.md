---
title: "Genome modelling and design across all domains of life with Evo 2"
aliases: [Evo 2]
authors:
- Garyk Brixi
- Matthew G. Durrant
- Jerome Ku
- Mohsen Naghipourfar
- Michael Poli
- Gwanggyu Sun
- Patrick D. Hsu
- Brian L. Hie
year: 2026
journal: Nature
doi: 10.1038/s41586-026-10176-5
url: 
 -[https://doi.org/10.1038/s41586-026-10176-5(https://doi.org/10.1038/s41586-026-10176-5)
tags:
- paper
- AIVC
- DNA-language-model
- foundation-model
- genomics
status: unread
    
rating:
date_added: 2026-03-24
date_read:
---

# Genome modelling and design across all domains of life with Evo 2

## Quick Summary

> Evo 2 is a biological foundation model trained on 9 trillion DNA base pairs spanning all domains of life. It features a 1-million-token context window with single-nucleotide resolution, enabling the prediction of genetic variation impacts and the generative design of sequences from molecular to whole-genome scales. By leveraging the new StripedHyena 2 architecture, the model achieves superior processing efficiency and loss scaling compared to previous hybrid models and Transformers.

## Key Points

- **Scale and Scope**: Trained on 9.3 trillion tokens (Evo 2 40B) from the curated OpenGenome2 dataset covering bacteria, archaea, eukarya, and phage.
    
- **Long Context**: Utilizes a 1-million-token context window, allowing the model to capture distal biological relationships such as human topologically associating domains (TADs).
    
- **Zero-Shot Capability**: Accurately predicts the functional impact of mutations—including noncoding pathogenic variants and BRCA1/2 variants—without specific fine-tuning.
    
- **Mechanistic Interpretability**: Sparse autoencoders (SAEs) reveal that the model learns internal representations for features like prophages, exon-intron boundaries, and transcription factor binding sites.
    
- **Generative Design**: Capable of generating mitochondrial, prokaryotic, and eukaryotic sequences; it can also be guided at inference time to design specific chromatin accessibility patterns.
    

## Methods

### Data

- **OpenGenome2**: A curated dataset of 8.8 trillion non-redundant nucleotides.
    
- **Exclusions**: Eukaryotic viruses were excluded for biosafety to prevent the model from learning to design human pathogens.
    

### Model Architecture

- **StripedHyena 2**: A convolutional multi-hybrid architecture combining three variants of input-dependent convolution operators with attention.
    
- **Efficiency**: Offers up to 3x higher throughput at a 1-million context length compared to optimized Transformer baselines.
    

### Training Strategy

- **Two-Phase Approach**:
    
    1. **Pretraining**: 8,192 token context focusing on functional genetic elements.
        
    2. **Midtraining**: Multi-stage extension of context length up to 1 million tokens.
        

## Results

|**Metric**|**Value**|**Baseline**|
|---|---|---|
|Exon Classification (AUROC)|0.91 – 0.99|Outperforms Nucleotide Transformer & Evo 1|
|Human Gene Essentiality (AUROC)|0.66|Outperforms other genomic LMs (0.50–0.59)|
|SpliceVarDB (Exonic/Intronic)|Ranked 1st|Outperformed all other unsupervised models|
|Throughput (40B scale, 1M context)|3x speedup|Highly optimized Transformers|

## Figures

|**Figure**|**Description**|
|---|---|
|Fig 1|Overview of Evo 2 architecture, StripedHyena 2 operators, and the two-phase training strategy.|
|Fig 2|Evaluation of mutational effect prediction across DNA, RNA, and protein fitness.|
|Fig 3|Zero-shot and supervised human clinical variant effect prediction (coding and noncoding).|
|Fig 4|Mechanistic interpretability results showing learned features for phage, secondary structures, and exons.|
|Fig 5|Genome-scale generation results for mitochondria, _M. genitalium_, and yeast.|
|Fig 6|Controllable design of mammalian chromatin accessibility using inference-time guidance.|

## Critical Analysis

### Strengths

- **Universality**: Generalizes across all domains of life without requiring task-specific fine-tuning.
    
- **Interpretability**: Demonstrates that large biological models are not "black boxes" through the use of SAEs.
    
- **Open Science**: The authors released model parameters, training code, and the OpenGenome2 dataset.
    

### Weaknesses

- **Generative Limits**: In silico metrics do not guarantee that generated sequences will be functional or replication-competent in vivo.
    
- **Compute Intensity**: Inference-time guidance (beam search) for complex designs remains computationally expensive.
    

### Questions

- How effectively can Evo 2 be fine-tuned with experimental feedback to improve the success rate of whole-genome designs?
    

## Connections

### Related Papers

- **Evo (Evo 1)**: The predecessor model focused primarily on prokaryotic sequences.
    
- **Enformer/Borzoi**: Predictive models used as scoring functions for Evo 2's guided generation.
    

### Related Concepts

- [[Foundation Models in Biology]]
    
- [[Mechanistic Interpretability]]
    
- [[Synthetic Genomics]]
    

### Potential Applications

- **Clinical Genetics**: Zero-shot pathogenicity prediction for rare or uncharacterized variants.
    
- **Synthetic Biology**: Designing custom regulatory elements and minimal genomes.
    

## Notes

- Evo 2 40B 1M-context is noted as the best-performing version, while the 1B-parameter short-context model is weaker and should generally be avoided.
    

Would you like me to explain more about the mechanistic interpretability findings or the specific results of the human variant prediction?