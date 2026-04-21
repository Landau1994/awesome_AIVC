---
title: Reimagining human-centric drug development with new approach methodologies
aliases:
  - Science_2026_NAM_proposal
authors:
  - Xuekun Wu
  - Matthew A. Wu
  - James Zou
  - Nicole Kleinstreuer
  - Joseph C. Wu
year: 2026
journal: Science
doi: 10.1126/science.aeb0045
url: https://www.science.org/doi/10.1126/science.aeb0045
tags:
  - paper
  - AIVC
  - NAMs
  - DrugDiscovery
  - OrganOnChip
  - AI
status: unread
rating:
date_added: 2024-05-22
date_read:
---

# Reimagining human-centric drug development with new approach methodologies

## Quick Summary
> This review article explores the transition from traditional animal-based drug development to a human-centric paradigm using New Approach Methodologies (NAMs). By integrating human-derived cellular systems (like iPSCs and organoids), microphysiological systems (organs-on-chips), and artificial intelligence (including LLMs and digital twins), the authors argue that the pharmaceutical industry can bridge the "translational gap" that causes over 90% of drug candidates to fail in human trials. The paper outlines a four-step roadmap for implementing these technologies within the context of recent landmark regulatory shifts like the US FDA Modernization Act 3.0.

## Key Points
- **The Translational Gap:** Traditional animal models only approximate human biology, leading to high clinical failure rates, especially for modern modalities like oligonucleotide drugs and antibody-drug conjugates.
- **Biological NAMs:** Progress in induced pluripotent stem cells (iPSCs), 3D organoids, and organs-on-chips allows for more faithful replication of human physiology and disease states.
- **Computational NAMs:** AI is shifting from simple prediction to "agentic intelligence" (e.g., Virtual Lab), utilizing generative design for molecules and multimodal foundation models for disease modeling.
- **Regulatory Shift:** The enactment of the FDA Modernization Act 2.0 (2022) and 3.0 (2025) officially positions NAMs as suitable substitutes or complements to animal studies.
- **Roadmap for Integration:** The authors propose a four-step evolution: 1) Lab-in-a-loop discovery, 2) Human organs-on-chips for safety/PK, 3) Clinical trial-in-a-dish for population diversity, and 4) Digital-experimental twins for longitudinal prediction.

## Methods
### Data
- The review synthesizes data from various sources: transcriptomic perturbation profiles (over 1 million), biomedical image-text pairs (15 million for BiomedCLIP), and electronic health record trajectories (9 million for reconstructing virtual cohorts).

### Model Architecture
- **Generative AI:** Transformers and Graph Neural Networks for molecular design.
- **Foundation Models:** Large Language Models (LLMs) like MedFound (176-billion-parameter) for diagnostic reasoning and TITAN for pathology.
- **Agentic AI:** Hierarchical AI agents (e.g., "Virtual Lab") that orchestrate hypothesis generation and experimental design.

### Training Strategy
- **Active Learning:** Closed-loop strategy that selects compounds to reduce model uncertainty.
- **Multimodal Learning:** Integrating epigenomic, genomic, proteomic, and clinical data to capture dynamic disease states.
- **Federated Learning:** Proposed to allow collaborative training without compromising data privacy.

## Results
| Metric / Discovery | Value | Note |
|--------|-------|----------|
| Drug Attrition | >90% | Percentage of drugs that pass preclinical but fail human trials. |
| AI Design Speed | 18 months | Time to advance an AI-discovered TNIK inhibitor to clinical testing. |
| Hit Rate Improvement | 17-fold | Increase in hit rates using the DrugReflector platform vs. random search. |
| Gene-Editing Efficiency | >20% | Efficiency achieved by AI-designed lipid nanoparticles vs. 15% for commercial standards. |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Timeline of global regulatory milestones (1950s–2026) showing the shift from the 3Rs principle to the FDA Modernization Act 3.0. |
| Fig 2  | Schematic of the NAM ecosystem showing the convergence of organoids, organs-on-chips, human cellular systems, and AI. |
| Fig 3  | Diagram of a human-centered "lab-in-a-loop" for iterative drug discovery and model refinement. |
| Fig 4  | Visualization of a patient-derived multiorgan chip circuit for "clinical trial-in-a-dish" testing. |

## Critical Analysis
### Strengths
- **Interdisciplinary Synthesis:** Successfully bridges the gap between high-end bioengineering and state-of-the-art computational science.
- **Regulatory Context:** Provides a clear legal and ethical framework for why these changes are happening now (FDA 3.0).
- **Practical Roadmap:** Moves beyond theory to suggest specific operational steps for industry adoption.

### Weaknesses
- **Data Fragmentation:** Acknowledges that data remains siloed across institutions, which hinders model generalization.
- **Biological Immaturity:** Notes that iPSC-derived models often display developmental immaturity, potentially limiting their use in late-onset disease modeling.
- **Standardization:** While progressing, the lack of global alignment on validation criteria remains a hurdle.

### Questions
- How will regulatory bodies handle the "black box" nature of deep learning models when they are used to justify skipping animal safety trials?
- Can digital twins eventually replace the need for "Phase 0" or micro-dosing studies in humans entirely?

## Connections
### Related Papers
- **FDA Modernization Act 2.0/3.0:** Primary legal drivers cited.
- **CiPA Initiative:** Standardized cardiac safety assessment using iPSC-CMs.
- **ISTAND Program:** FDA pathway for qualifying new drug development tools.

### Related Concepts
- [[Induced Pluripotent Stem Cells (iPSCs)]]
- [[Organ-on-a-Chip (OoC)]]
- [[Digital Twins in Healthcare]]
- [[Generative AI for Drug Design]]
- [[Microphysiological Systems (MPS)]]

### Potential Applications
- **Rare Disease Modeling:** Using patient-specific iPSCs where animal models do not exist.
- **Personalized Medicine:** "Clinical trial-in-a-dish" to identify responders before actual enrollment.
- **Safety Screening:** Rapidly identifying drug-induced liver injury (DILI) or proarrhythmia risk.

## Notes
- The review emphasizes that NAMs should not be seen as competing approaches but as an integrated, multilayered infrastructure.
- The next decade is predicted to be a "transitional period" where animal models move from the default main evidentiary foundation to a calibrated reference system.