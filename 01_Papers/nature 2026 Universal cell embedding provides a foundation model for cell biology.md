---
title: Universal cell embedding provides a foundation model for cell biology
aliases:
  - uce
authors:
  - Yanay Rosen
  - Yusuf Roohani
  - Ayush Agrawal
  - Leon Samotorčan
  - Tabula Sapiens Consortium
  - Stephen R. Quake
  - Jure Leskovec
year: 2026
journal: Nature
doi: 10.1038/s41586-026-10689-z
url: https://doi.org/10.1038/s41586-026-10689-z
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2024-05-22
date_read:
---

# Universal cell embedding provides a foundation model for cell biology

## Quick Summary
> The paper introduces the Universal Cell Embedding (UCE), a 33-layer, 650-million-parameter transformer-based foundation model designed for single-cell gene expression analysis. By leveraging a protein language model ([[ESM2]]) to tokenize genes, UCE is genome-agnostic, enabling it to represent cells across diverse tissues and species without the need for model retraining or fine-tuning. Trained on a 36-million-cell [[Integrated Mega-scale Atlas (IMA)]], the model demonstrates emergent biological organization and superior performance in zero-shot cell type classification and cross-species data integration compared to existing state-of-the-art methods like [[Geneformer]] and [[scGPT]].

## Key Points
- [[UCE]] architecture: 33-layer transformer model utilizing protein-product embeddings for gene tokenization.
- Genome-agnostic design allows embedding of cells from species not included in the training set.
- Achieves high-quality zero-shot performance, matching or exceeding fine-tuned methods like [[scVI]] and [[scArches]].
- Demonstrates emergent properties, including the identification of developmental lineages and cross-tissue homogeneity (e.g., macrophage identity).
- Provides a new workflow for identifying and characterizing novel cell types (e.g., Norn cells) across datasets without explicit retraining.
- Trained on 36 million cells from 300+ datasets, representing a significant scale in biological foundation modeling.

## Methods
### Data
- [[scRNA-seq]] count data from the [[CellXGene (CxG) Census]] and other public sources.
- Protein sequences for gene tokenization via [[ESM2]].
- Tabula Sapiens v.2 as a gold-standard benchmarking dataset.
- Novel species data: green monkey, naked mole rat, chicken (retina/heart).

### Model Architecture
- Transformer neural network (33 layers, 650M parameters).
- Gene input: Weighted, normalized samples of expressed genes (1,024 genes).
- Gene tokenization: Average embedding of protein products via [[ESM2]] (15B-parameter model).
- Cell representation: CLS token at the final transformer layer.

### Training Strategy
- Fully self-supervised, masked language modeling approach.
- 20% of expressed genes are masked; the model predicts the expression status of these genes using binary cross-entropy loss.
- Trained on 24 A100 80 GB GPUs for 40 days.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Overall score (vs Geneformer) | +13.9% | Geneformer |
| Biological conservation | +16.2% | Geneformer |
| Batch correction score | +10.1% | Geneformer |

## Figures


| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of the UCE model architecture, training scheme, and IMA visualizations. |
| Fig 2  | Zero-shot cell embedding capabilities and comparison to fine-tuned methods. |
| Fig 3  | Evaluation of UCE's organization of cell types against Cell Ontology and cross-dataset alignment. |
| Fig 4  | Norn cell case study demonstrating the UCE workflow for identifying cell types and disease-associated markers. |


## Critical Analysis
### Strengths
- **Zero-shot capability**: Eliminates the need for resource-intensive retraining when processing new, out-of-distribution data.
- **Cross-species utility**: Does not rely on orthology mapping, making it highly versatile for evolutionary biology.
- **Robustness**: Effectively corrects batch effects and handles technology-specific artifacts at levels comparable to supervised, fine-tuned models.

### Weaknesses
- **Black-box nature**: Limited interpretability regarding how specific embeddings are derived, making it difficult to pinpoint the exact contribution of specific biological features.
- **Bias**: Data remains heavily skewed toward mammalian (human/mouse) and brain-related tissues, potentially limiting performance on rare or under-represented species.
- **Loss of fine-grained signal**: Sampling only 1,024 genes per cell may omit subtle quantitative variation in highly complex or heterogeneous cell states.

### Questions
- How can interpretability tools be integrated to map the transformer's attention weights to specific biological gene pathways?
- Could the architecture be optimized using state space models (e.g., [[Mamba]]) to overcome the quadratic scaling of standard transformers and allow for larger context lengths?

## Connections
### Related Papers
- [[]]
- Theodoris, C. V. et al. "Transfer learning enables predictions in network biology." *Nature* (2023).
- Cui, H. et al. "scGPT: toward building a foundation model for single-cell multi-omics using generative AI." *Nat. Methods* (2024).

### Related Concepts
- [[Foundation Models]]
- [[Transfer Learning]]
- [[Single-cell Omics]]
- [[Bioinformatics]]

### Potential Applications
- Rapid annotation of large-scale single-cell atlases.
- Cross-species investigation of disease states and cell function.
- De novo identification of novel cell types in heterogeneous disease environments.

## Notes
-