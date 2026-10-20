---
title: Index - Models
aliases: [Models Overview]
tags:
  - index
  - MOC
date_created: 2026-01-16
last_updated: 2026-10-20
---

# AI Virtual Cell Models Index

## Overview
This index lists selected models relevant to AI Virtual Cell research. Capability labels are reading aids, not a controlled benchmark or a claim of universal superiority.

## Foundation Models

### Cell-Level Foundation Models

```dataview
TABLE year, authors, status
FROM "01_Papers"
WHERE contains(tags, "foundation-model")
SORT year DESC
```

| Model | Year | Params | Training Data | Key Innovation | Paper |
|-------|------|--------|---------------|----------------|-------|
| **scPRINT-2** | 2025 preprint | See version | 350M cells, 16 species | Extended cell foundation model | [Paper](https://doi.org/10.64898/2025.12.11.693702) / [Docs](https://cantinilab.github.io/scPRINT-2/) |
| **scPRINT** | 2025 | - | 50M cells | Gene network inference | [[01_Papers/scPRINT\|Link]] |
| **scFoundation** | 2024 | 100M | 50M cells | Read-depth aware | [[01_Papers/scFoundation\|Link]] |
| **UCE** | 2024 preprint v2 | 650M | 36M cells, 8 species | Cross-species, ESM2 | [[01_Papers/UCE\|Link]] |
| **GeneCompass** | 2024 | 100M+ | 100M+ human/mouse cells; corpus counts differ within source | Knowledge-informed | [[01_Papers/GeneCompass\|Link]] |
| **CellPLM** | 2024 | - | Spatial + scRNA | Cells-as-tokens, reported task-specific speedups | [[01_Papers/CellPLM\|Link]] |
| **scGPT** | 2024 | - | 33M cells | Gene tokenization, multi-task | [[01_Papers/scGPT\|Link]] |
| **Geneformer** | 2023 | - | 30M cells | Rank-value encoding | [[01_Papers/Geneformer\|Link]] |
| **scBERT** | 2022 | - | 1M+ cells | BERT-style pretraining for cell annotation | [[01_Papers/scBERT\|Link]] |

### Model Comparison Chart

"Zero-shot" may refer to embeddings, network inference or label prediction; these are different tasks. "No" indicates no task demonstrated in this summary, not impossibility. Runtime comparisons require matched tasks, hardware and implementations.

| Model | Architecture | Cross-species | Zero-shot | GRN Inference |
|-------|-------------|---------------|-----------|---------------|
| scPRINT | Transformer | Partial | Yes | **Yes** |
| UCE | Transformer+ESM2 | **Yes (8)** | **Yes** | No |
| GeneCompass | Transformer | Yes (H+M) | Partial | Yes |
| CellPLM | Flowformer | No | Yes | No |
| scFoundation | Asymmetric Trans. | No | Partial | No |
| scGPT | Transformer | No | Partial | Partial |
| Geneformer | Transformer | No | Yes | Partial |
| scBERT | Performer | No | No | No |

### Protein Foundation Models
| Model | Year | Task |
|-------|------|------|
| ESM-2 | 2023 | Protein embeddings |
| ESM3 | 2024 | Multimodal protein |
| AlphaFold2 | 2021 | Structure prediction |

## Perturbation Models

### Perturbation Model Papers

```dataview
TABLE year, authors, status
FROM "01_Papers"
WHERE contains(tags, "perturbation")
SORT year DESC
```

### Detailed Comparison

| Model | Year | Approach | Combination Prediction | Novel Drugs | Key Innovation | Paper |
|-------|------|----------|-----------|-------------|----------------|-------|
| **GEARS** | 2023 | GNN | Genetic perturbations | No | Knowledge graph for combinations | [[01_Papers/GEARS\|Link]] |
| **CPA** | 2023 | Compositional autoencoder | Drug and genetic perturbations | No | Compositional disentanglement | [[01_Papers/CPA\|Link]] |
| **CellOT** | 2023 | Optimal Transport | Not summarized here | No | Distribution mapping, patient transfer | [[01_Papers/CellOT\|Link]] |
| **chemCPA** | 2022 | Autoencoder + molecular encoder | Drug perturbations | **Yes** | Chemical structure encoding | [[01_Papers/chemCPA\|Link]] |
| **scGen** | 2019 | VAE | Not summarized here | No | Latent arithmetic (foundational) | [[01_Papers/scGen\|Link]] |

### Candidate Methods by Use Case

| Use Case | Candidate Method |
|----------|-------------------|
| Multi-gene CRISPR prediction | **GEARS** |
| Drug combination prediction | **CPA** |
| Novel drug screening | **chemCPA** |
| Patient-level generalization | **CellOT** |
| Simple perturbation transfer | **scGen** |
| Foundation model approach | **scGPT** (fine-tuned) |

### Method Evolution
```mermaid
graph TD
    A[scGen 2019<br>VAE + Arithmetic] --> B[CPA 2021 preprint / 2023 journal<br>Compositional]
    B --> C[chemCPA 2022<br>+ Mol Encoder]
    A --> D[CellOT 2023<br>Optimal Transport]
    E[Knowledge Graphs] --> F[GEARS 2023<br>GNN]
    G[Foundation Models] --> H[scGPT 2024<br>Fine-tuning]
```

## Gene Regulatory Network Models

| Model | Type | Key Feature |
|-------|------|-------------|
| **scPRINT** | Transformer | Zero-shot GRN from attention |
| **GeneCompass** | Transformer | Knowledge-informed GRN |
| CellProphet | Dynamic | Temporal GRN |
| SCENIC+ | Motif-based | TF binding motifs |
| GRNBoost2 | Tree-based | Fast inference |
| GENIE3 | Tree-based | Classic method |

## Generative Models

| Model | Architecture | Application |
|-------|--------------|-------------|
| scVI | VAE | Integration, denoising |
| scANVI | Semi-supervised VAE | Annotation transfer |
| Cell diffusion | Diffusion | State generation |
| CellOT | Optimal Transport | Cell state transitions |

## Multimodal LLMs

| Model | Organization | Key Feature | Paper |
|-------|--------------|-------------|-------|
| **Gemini** | Google DeepMind | Native multimodality, long context | [[03_Models/GEMINI\|Link]] |

## Multi-modal Models

| Model | Modalities |
|-------|-----------|
| MOFA+ | Multiple omics |
| Cobolt | RNA + ATAC |
| scMM | RNA + protein |
| MultiVI | RNA + ATAC |

## Model Comparison

### By Training Data Size
```mermaid
graph LR
    A[1M cells] --> B[30-50M cells] --> C[100M+ cells] --> D[350M+ cells]

    A --- scBERT
    B --- scGPT
    B --- Geneformer
    B --- scFoundation
    B --- UCE
    C --- GeneCompass
    D --- scPRINT-2
```

### By Primary Capability

#### Examples for Cell Type Annotation
1. UCE (frozen embeddings with a reference-label classifier)
2. scGPT (fine-tuned)
3. Geneformer

#### Examples for Perturbation Prediction
1. GEARS
2. scGPT (fine-tuned)
3. scFoundation

#### Examples for Gene Network Inference
1. scPRINT
2. GeneCompass
3. SCENIC+

#### Examples for Cross-species Analysis
1. UCE (8 species)
2. GeneCompass (human + mouse)

### By Architecture Type
- **Standard Transformers**: scGPT, Geneformer, GeneCompass, scPRINT
- **Efficient Transformers**: scBERT (Performer), scFoundation (Asymmetric), CellPLM (Flowformer)
- **Hybrid (Transformer + Protein LM)**: UCE (ESM2)
- **VAE-based**: scVI, scGen
- **Compositional autoencoders**: CPA, chemCPA
- **GNN-based**: GEARS

## Resources

### Model Repositories
- [HuggingFace Models](https://huggingface.co/models?search=single-cell)
- [GitHub Topics: single-cell-analysis](https://github.com/topics/single-cell-analysis)
- [awesome-foundation-model-single-cell-papers](https://github.com/OmicsML/awesome-foundation-model-single-cell-papers)

### Benchmarks
- [Open Problems in Single-Cell Analysis](https://openproblems.bio/)
- [Virtual Cell Challenge](https://arcinstitute.org/virtual-cell-challenge)
- [scib (Single-cell Integration Benchmark)](https://github.com/theislab/scib)

### Virtual Cells Platform
- [CZI Virtual Cell Models](https://virtualcellmodels.cziscience.com/)

## Verification scope — 2026-10-20

Corrected CPA/chemCPA architecture and combination labels, publication versions and the scPRINT-2 source. Removed unsupported generic speed rankings. Model data sizes and year labels refer to particular releases; use the linked paper notes for metadata and benchmark qualifications, including the unresolved GeneCompass corpus-count discrepancy. The lists above do not establish a global leaderboard.
