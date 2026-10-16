---
title: Fifteen challenges for generative AI applications to cell biology
aliases: []
authors:
  - Leo Dupire
  - Aly A. Khan
  - Theofanis Karaletsos
  - Shana Kelley
  - Emma Lundberg
  - Jian Ma
  - Evan Paull
  - Stephen R. Quake
  - Raul Rabadan
  - Rowan Cassius
  - Peter Sims
  - Sohail Tavazoie
  - John S. Tsang
  - Mingxuan Zhang
  - Andrea Califano
year: 2026
journal: Cell
doi: 10.1016/j.cell.2026.07.004
url: https://doi.org/10.1016/j.cell.2026.07.004
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2026-10-09
date_read:
---

# Fifteen challenges for generative AI applications to cell biology

## Quick Summary
> The paper proposes 15 "grand challenges" for the application of Generative AI (Gen-AI) in cellular and multicellular biology to focus community efforts on translationally relevant questions. It argues that while current models have excelled in protein structure prediction, modeling complex system behavior requires moving beyond pure scaling laws. The authors advocate for integrating biological and physical priors into model architectures and establishing a two-tiered benchmarking framework (Tier 1 for technical improvement, Tier 2 for novel biological discovery) supported by a public-private consortium for generating large-scale, purposeful, and diverse perturbation data.

## Key Points
- Current biological Gen-AI successes (e.g., protein folding) rely on relatively linear biological structures and massive, high-quality databases.
- Modeling cellular and organismal behavior is significantly more difficult due to combinatorial complexity and data scarcity.
- Challenges "The Bitter Lesson" (Sutton)—which favors scale over domain knowledge—by noting that in biology, physical laws and biological priors are essential to constrain models within physically plausible mechanisms.
- Proposes 15 challenges categorized by level: Molecular Interactions, Molecular Function, Cellular/Systems Function, and Translation.
- Emphasizes the need for "purposeful" data generation (e.g., perturbation-based atlases) rather than repurposing existing steady-state single-cell data.
- Critiques current benchmarking, which often relies on retrospective datasets and statistical significance on trivial tasks (like cell-type classification) rather than prospective validation.
- Fifteen challenges: 
- 1. 

## Methods
### Data
- Requires large-scale, perturbational multi-omics datasets generated de novo.
- Emphasizes the need for demographic and geographic diversity to ensure model generalizability.
- Proposed use of "piggybacking" on clinical trials to secure patient molecular data.

### Model Architecture
- Advocates for "biology-anchored" models that "pre-wire" knowledge.
- Suggests [[graph-based attention mechanisms]] and [[diffusion kernels]] to represent molecular interaction networks.
- Incorporates mechanism-based constraints (thermodynamics, structural properties) into the model architecture.

### Training Strategy
- Proposes dynamic prior reassessment based on evaluating model inference.
- Suggests fine-tuning or training with knowledge bases regarding subcellular localization and complex formation.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| N/A (Framework Paper) | N/A | Varies per challenge (detailed in Table 2) |

## Figures


| Figure | Description |
| ------ | ----------- |
| Fig 1  | Circular diagram illustrating the 15 Gen-AI biological challenges organized hierarchically by objective (Molecular Interactions, Molecular Function, Cellular/Systems Function, Translation). |
| Table 1 | Summary of proof-of-concept benchmarking examples for the 15 challenges, including potential design and validation strategies. |
| Table 2 | Comprehensive list of success metrics, data availability, and current non-Gen-AI computational/experimental baselines for each of the 15 challenges. |


## Critical Analysis
### Strengths
- Provides a clear, actionable, and structured framework for moving biological AI beyond simple statistical benchmarks.
- Successfully bridges the gap between AI development and experimental biology/clinical application.
- Candidly addresses the failure of current "single-cell foundation models" to outperform linear baselines on out-of-distribution tasks.

### Weaknesses
- The scope is extremely ambitious, requiring massive institutional coordination and funding.
- Challenges may be difficult to implement given the proprietary nature of pharmaceutical clinical trial data.
- Relies heavily on the assumption that "pre-wiring" biological knowledge will solve the interpretability and performance issues, which remains an open research question.

### Questions
- How can academic researchers secure the level of clinical data required to train these models without being part of a massive consortium?
- To what extent can a "generalized" cell model be achieved if cell contexts are fundamentally defined by unique epigenetic states?

## Connections
### Related Papers
- [[AlphaFold]] (Jumper et al., 2021)
- [[GREmLN]] (Zhang et al., 2026)
- [[scGPT]] / [[Geneformer]] (benchmark subjects)

### Related Concepts
- [[Generative AI]]
- [[Foundation Models]]
- [[Systems Biology]]
- [[Perturb-seq]]
- [[Multicellular modeling]]

### Potential Applications
- Drug discovery and mechanism-of-action (MoA) elucidation.
- Precision medicine via immune health metrics and setpoint prediction.
- Synthetic biology for complex circuit design.

## Notes
- The 15 challenges are structured like Hilbert's 23 mathematical problems, emphasizing that they are meant to guide the community over decades, not years.