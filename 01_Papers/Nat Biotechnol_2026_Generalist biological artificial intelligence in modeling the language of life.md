---
title: "Generalist biological artificial intelligence in modeling the language of life"
aliases: []
authors:
  - Vishwanatha M. Rao
  - Serena Zhang
  - Brian S. Plosky
  - Patrick D. Hsu
  - Bo Wang
  - James Zou
  - Marinka Zitnik
  - Eric J. Topol
  - Pranav Rajpurkar
year: 2026
journal: Nature Biotechnology
doi: 10.1038/s41587-026-03064-w
url: https://doi.org/10.1038/s41587-026-03064-w
tags:
  - paper
  - AIVC
  - GBAI
  - foundation-models
  - bioinformatics
status: unread
rating:
date_added: 2024-05-22
date_read:
---

# Generalist biological artificial intelligence in modeling the language of life

## Quick Summary
This review article defines and synthesizes the emerging field of Generalist Biological Artificial Intelligence (GBAI). GBAI represents a transformative approach to modeling the "language of life" by creating unified systems capable of concurrently processing and predicting across diverse biological domains—from DNA and RNA sequences to protein structures, cellular imaging, and tissue-level processes. The authors chart a course for how these generalist systems can accelerate scientific discovery, automate therapeutic design, and eventually realize the vision of the AI Virtual Cell (AIVC).

## Key Points
- **Definition of GBAI:** Unified systems that interpret, synthesize, and scale across several biological domains to perform multiple tasks requiring cross-domain understanding.
- **The Shift to Generative AI:** Evolution from specialized, single-task algorithms to general-purpose architectures (Transformers, Diffusion models, GNNs) that leverage large-scale unannotated data.
- **Multimodal Integration:** The goal is to move beyond modeling singular biological sequences to integrated models that handle the flow of information defined by the central dogma (DNA $\rightarrow$ RNA $\rightarrow$ Protein $\rightarrow$ Cell).
- **Agentic AI:** The potential for autonomous AI agents to orchestrate specialized models, design experiments in silico, and interact with human researchers for scientific discovery.
- **Core Vision:** The development of an AI Virtual Cell (AIVC) and AI-driven digital organisms that can simulate biological activity and predict responses to perturbations.

## Methods
### Data
- **Genomic/Nucleotide:** Large corpora of unannotated DNA/RNA sequences, including multispecies datasets (e.g., the 9 trillion token dataset for Evo 2).
- **Proteomic:** Protein Data Bank (PDB) for structures and UniProt for sequences.
- **Cellular:** Single-cell RNA sequencing (scRNA-seq) atlases (e.g., Human Cell Atlas) and spatial transcriptomics.
- **Imaging:** Whole-slide images (WSI) for histology and fluorescence microscopy for subcellular analysis.

### Model Architecture
- **Transformers:** Utilized for sequence modeling (DNA, protein, gene expression) using self-attention mechanisms.
- **Diffusion Models:** Employed for generative tasks like de novo protein design (e.g., RFdiffusion) and structure prediction (AlphaFold 3).
- **Graph Neural Networks (GNNs):** Used for structural modeling and capturing spatial relationships in tissues.
- **Multimodal Encoders:** Aimed at creating a joint latent space to represent different biological scales (nucleotides, amino acids, gene expression).

### Training Strategy
- **Self-Supervised Learning:** Predominantly Masked Language Modeling (MLM) and next-token prediction on unlabeled data.
- **Multitask Learning:** Training models to perform diverse analytical tasks (classification, prediction, generation) simultaneously.
- **Zero-Shot/Few-Shot Learning:** Evaluating foundation models on tasks they weren't explicitly trained for to test generalization.

## Results
The paper provides a comparative overview of representative models in Table 1:

| Model | Category | Highlight Strength | Major Limitation |
|--------|-------|----------|---|
| **Evo 2** | Genomic | Generates complex systems (CRISPR-Cas); 1M context length. | Proof-of-concept for complex systems; needs fine-tuning for cell-specificity. |
| **AlphaFold 3** | Structure | SOTA prediction for proteins, nucleic acids, and ligands. | Does not always respect chirality; liable to hallucinations in disordered regions. |
| **scGPT** | Single-cell | Trained on 33M cells; effective for batch correction/cell annotation. | Reliant on fine-tuning; zero-shot reliability can be limited. |
| **Virchow 2** | Histology | Trained on 3.1M WSIs; pan-cancer and biomarker detection. | Performance saturation; needs more robust clinical validation. |
| **DreaMS** | Metabolomics | Learns generalized spectral embeddings from mass spectra. | Limited to tandem mass spectra; disregards some spectral features. |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | **Vision for GBAI**: Illustrates inputs (DNA/RNA/Protein/Cell) and the breadth of domain-specific processes leading to complex outputs like therapeutic design and pathway prediction. |
| Fig 2  | **Applications of Biological AI**: Shows the intersection of Agentic AI (orchestrating specialist models), Multimodal Analysis (cross-domain encoding), and Virtual Cell Integration. |
| Fig 3  | **Challenges**: Visualizes hurdles in joint encoding spaces, biological complexity (2D to 3D to interactions), context length (genome scale), and the need for experimental validation. |

## Critical Analysis
### Strengths
- **Comprehensive Scope:** Successfully bridges molecular biology, structural biology, and pathology under a single AI framework.
- **Pragmatic Realism:** Acknowledges that foundation models currently often fail to outperform simpler, specialized baselines on specific tasks.
- **Future-Oriented:** Provides a clear conceptual roadmap for "Agentic AI" and "Virtual Cells" rather than just reviewing past successes.

### Weaknesses
- **Data Biases:** Highlights the over-representation of prokaryotic data in current genomic foundation models, limiting human-specific accuracy.
- **Validation Gap:** Notes the critical lack of wet-lab/in vivo validation for many current AI-generated biological hypotheses.
- **Interpretability:** Admits that as these models become more "generalist," they often become "black boxes," losing the mechanistic insights biologists value.

### Questions
- How can we solve the context-length problem to model entire human chromosomes (3 billion bp) efficiently?
- What standardized benchmarks can truly evaluate the "emergent" capabilities of a GBAI versus an ensemble of specialized models?

## Connections
### Related Papers
- **AlphaFold 3 (Abramson et al., 2024):** Core reference for structural prediction.
- **Evo (Nguyen et al., 2024):** Key paper for large-scale genomic sequence modeling.
- **scGPT (Cui et al., 2024):** Foundational work for single-cell transcriptomics LLMs.

### Related Concepts
- **[Central Dogma of Molecular Biology]**
- **[Foundation Models]**
- **[AI Virtual Cell (AIVC)]**
- **[Masked Language Modeling]**

### Potential Applications
- **Automated Drug Discovery:** Designing binders and predicting off-target effects in silico.
- **Precision Medicine:** Predicting patient-specific responses to genetic perturbations.
- **Synthetic Biology:** De novo design of enzymes and regulatory circuits.

## Notes
- GBAI is not just about "bigger" models, but about models that can "translate" between different layers of biological information (e.g., how a DNA mutation changes a protein structure which then changes a cell's morphology).
- The transition from "static predictors" to "active collaborators" (Agentic AI) is a major theme for the next decade of digital biology.