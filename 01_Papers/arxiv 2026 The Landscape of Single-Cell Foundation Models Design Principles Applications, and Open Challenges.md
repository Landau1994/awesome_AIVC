---
title: "The Landscape of Single-Cell Foundation Models: Design Principles, Applications, and Open Challenges"
aliases:
  - aivc_landscape_review
authors:
  - Shiyu Jiang
  - Zhaoyu Fang
  - Yujie Zhang
  - Xuting Zhang
  - Jérémie Kalfon
  - Weixu Wang
  - Xi Fu
  - Aakash Patel
  - Syed Rizvi
  - Yuancheng Ryan Lu
  - Siyu He
  - Yixin Wang
  - Kejun Ying
  - Peter Pao-Huang
  - Yifan Lu
  - Weize Xu
  - Mengchen Wang
  - Ziyang Miao
  - Jianhui Lin
  - Jimmy Ding
  - Zitong Jerry Wang
  - Wei Ouyang
  - Tianlong Chen
  - Guoxian Yu
  - Min Li
  - Jiayi Ma
  - Fei Wang
  - Yuying Xie
  - Jiliang Tang
  - Raul Rabadan
  - David van Dijk
  - Pengtao Xie
  - Peng He
  - Emily B. Fox
  - Le Song
  - Fabian J. Theis
  - Eric Xing
  - Christina V. Theodoris
  - Xiaojie Qiu
  - Jiayuan Ding
year: 2026
journal: Preprints.org
doi: 10.20944/preprints202608.1166.v1
url: https://github.com/OmicsML/awesome-foundation-model-single-cell-papers
tags:
  - paper
  - AIVC
  - scFM
  - foundation-models
status: unread
rating:
date_added: 2026-08-18
date_read:
---

# The Landscape of Single-Cell Foundation Models: Design Principles, Applications, and Open Challenges

## Quick Summary
> This comprehensive review surveys the emerging field of single-cell foundation models (scFMs), synthesizing recent progress across model architectures, data tokenization strategies, and pretraining objectives. The authors evaluate how these frameworks move single-cell biology from task-specific pipelines toward unified, generalizable, and predictive systems. Furthermore, they identify key challenges—including generalization failures, evaluation limitations, and data privacy—and provide a structured guide for future research toward the development of AI-driven "virtual cells" and autonomous scientific discovery agents.

## Key Points
- scFMs leverage large-scale pretraining to learn transferable representations of cellular states, genes, and modalities.
- Tokenization strategies (e.g., discrete vs. continuous, rank-based, or latent) are critical inductive biases that significantly impact downstream performance.
- Current backbone architectures include [[Transformers]], [[Hyena]] operators, [[State-space models]] (e.g., [[Mamba]]), [[Graph neural networks]], and [[Diffusion model]]-based frameworks.
- Scaling in scFMs is complex; data diversity and context coverage often prove more impactful than raw data volume.
- There is a transition from static representation learning to dynamic, intervention-sensitive models capable of simulating cellular behavior under perturbation.
- Future directions emphasize "lab-in-the-loop" discovery, where foundation models guide wet-lab experimental design and prioritization.

## Methods
### Data
- Large-scale integrated atlases (e.g., [[Human Cell Atlas]], [[CELLxGENE]]).
- Multimodal data: Transcriptomic, epigenomic (scATAC-seq), proteomic, spatial transcriptomics, and perturbational (Perturb-seq).

### Model Architecture
- [[Transformers]] (using efficient attention mechanisms like [[FlashAttention]]).
- [[LLMs]] adapted for biological sequence modeling.
- Alternative structured backbones: [[Hyena]], [[State-space models]], [[Graph neural networks]], and [[Diffusion model]]s.

### Training Strategy
- Reconstruction (masked modeling/denoising).
- Autoregressive generation.
- Contrastive learning/alignment (e.g., CLIP-style).
- Task-informed supervision (label-guided prediction).

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| N/A (Review Paper) | N/A | N/A |

## Figures


| Figure | Description |
| ------ | ----------- |
| Fig 1  | Evolution of scFMs across modalities (branching lineages by year and modality). |
| Fig 2  | Conceptual framework connecting biological organization to foundation model applications. |
| Fig 3  | Comparison of neural network architectures (Transformer, Hyena, State-space, Perceiver, GNN, Diffusion). |
| Fig 4  | Scaling of scFMs (parameters vs. release date; pretraining data scale in cells vs. release date). |
| Fig 5  | Applications (gene-level, cell-level, donor-level) and challenges (quadrant view of opportunities/barriers). |


## Critical Analysis
### Strengths
- Highly structured and thorough taxonomy of design components (tokenization, architecture, objectives).
- Bridges the gap between computational machine learning methods and experimental biology applications.
- Provides comprehensive supplementary tables for benchmarks, datasets, and infrastructures.
- Addresses the "science of evaluation" by highlighting why current benchmarks are often flawed or insufficient.

### Weaknesses
- As a review, it synthesizes existing literature and does not present novel experimental benchmark results.
- Highlights a wide field where consensus on "optimal" architecture is still lacking, reflecting a rapid, fragmented landscape.

### Questions
- How can we standardize benchmarking to ensure it reflects true biological generalization rather than dataset-specific memorization?
- What are the most effective ways to integrate causal perturbation data to move beyond observational correlations?

## Connections
### Related Papers
- [[Geneformer]]
- [[scGPT]]
- [[scFoundation]]
- [[Tabula]]
- [[Perturb-seq]]

### Related Concepts
- [[AI virtual cell]]
- [[Foundation models]]
- [[scRNA-seq]]
- [[Spatial transcriptomics]]
- [[Multi-omics]]
- [[Generative AI]]

### Potential Applications
- In-silico drug screening.
- Causal perturbation effect prediction.
- Automated experimental design via [[AI agents]].
- Patient-level clinical stratification.

## Notes
-