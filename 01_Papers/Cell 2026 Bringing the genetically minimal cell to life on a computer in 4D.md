---
title: Bringing the genetically minimal cell to life on a computer in 4D
aliases:
  - 4DWCM
authors:
  - Zane R. Thornburg
  - Andrew Maytin
  - Jiwoong Kwon
  - Troy A. Brier
  - Benjamin R. Gilbert
  - Enguang Fu
  - Yang-Le Gao
  - Jordan Quenneville
  - Tianyu Wu
  - Henry Li
  - Talia Long
  - Weria Pezeshkian
  - Lijie Sun
  - John I. Glass
  - Angad P. Mehta
  - Taekjip Ha
  - Zaida Luthey-Schulten
year: 2026
journal: Cell
doi: 10.1016/j.cell.2026.02.009
url: https://doi.org/10.1016/j.cell.2026.02.009
tags:
  - paper
  - AIVC
  - whole-cell-modeling
  - computational-biology
status: unread
rating:
date_added: 2023-10-24
date_read:
---

# Bringing the genetically minimal cell to life on a computer in 4D

## Quick Summary
> The authors present a 4D (space and time) whole-cell model (4DWCM) simulating the complete ~100 minute cell cycle of the genetically minimal bacterium JCVI-syn3A. By integrating hybrid computational methods (ODEs, CME, RDME, and Brownian dynamics), the model captures the spatial and kinetic dynamics of genetic information processes, metabolism, cell growth, chromosome replication/segregation, and cell division. The simulations successfully predict experimental metrics such as doubling time, mRNA half-lives, and the origin-to-terminus DNA ratio, revealing the impact of spatial heterogeneity and stochasticity on cell-to-cell variation.

## Key Points
- Developed a comprehensive 4D whole-cell spatial and kinetic model for the entire cell cycle of a minimal cell.
- Simulations integrate genetic information processes, metabolic networks, growth, and division simultaneously.
- The model captures origin-to-terminus DNA ratios, mRNA half-lives, protein distributions, and ribosome counts that align with experimental measurements.
- Predicts not only average behaviors (like symmetric partitioning to daughter cells) but also the inherent stochastic heterogeneity among individual cells.
- Highlights the necessity of assimilating a wide array of multi-omics and imaging experiments for constructing and validating predictive whole-cell models.

## Methods
### Data
- [[Cryo-electron tomography]] (Cryo-ET) for initial spatial distribution and morphology constraints.
- Multi-omics datasets: proteomics, transcriptomics, metabolomics, and lipidomics.
- DNA sequencing coverage to determine the experimental *ori:ter* ratio (measured at 1.21).
- Fluorescence imaging of JCVI-syn3B+FtsZ:mCherry to track membrane, DNA, and division ring morphologies.

### Model Architecture
- **Hybrid 4D Simulation**: Couples multiple algorithms to span different temporal and spatial scales.
- **RDME (Reaction-Diffusion Master Equation)**: Simulated via [[Lattice Microbes]] (LM) on a 10 nm cubic lattice to handle spatial stochastic reactions (RNAP binding, translation, membrane protein insertion).
- **CME (Chemical Master Equation)**: Solves global well-stirred stochastic reactions (transcription, tRNA charging).
- **ODE (Ordinary Differential Equations)**: Manages deterministic metabolic networks (glycolysis, lipid/nucleotide synthesis) using `odeCELL`.
- **Brownian Dynamics (BD)**: Simulates the coarse-grained chromosome (10 bp/bead) polymer dynamics, DNA replication, and SMC looping, executed in [[LAMMPS]] via GPU.

### Training Strategy
- Simulated 50 unique replicate cells to capture population-level stochasticity.
- Computations were highly intensive, requiring 4–6 days of run time per replicate cell cycle (~250 GPU hours per replicate on NVIDIA A100 GPUs), totaling ~15,000 GPU hours.

## Results
| Metric | Value | Baseline (Experimental) |
|--------|-------|----------|
| Doubling Time | 105 min | 105 min |
| Chromosome Replication Time | 51 min | N/A |
| *ori:ter* ratio | 1.28 | 1.21 |
| Avg mRNA half-life | 3.63 min | ~2 min (estimated from related *Mycoplasma*) |
| Active Ribosome Fraction | ~55% | 20%-40% (polysomes in Syn3A) |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Visualization of 3D components of the 4DWCM, showing cell cycle progression, lattice membrane, ribosomes, and DNA replication. |
| Fig 2  | Flowchart of the hybrid simulation algorithm detailing how RDME, Global CME, ODEs, and Brownian Dynamics communicate, plus compute time breakdowns. |
| Fig 3  | Coarse-grained modeling of the minimal cell chromosome, detailing bending/stretching potentials, excluded volume, SMC-driven loop extrusion, and the replication model. |
| Fig 4  | Comparison of 4DWCM predictions with experiments, showing DNA/volume doubling timings, experimental *ori:ter* sequencing ratios, and fluorescence imaging of morphologies. |
| Fig 5  | Dynamics of gene expression and macromolecular assembly (ribosomes, RNAP, degradosomes), including translation efficiency, mRNA lifetimes, and replication initiation kinetics. |
| Fig 6  | Partitioning of macromolecules (ribosomes, degradosomes, PtsG, GapDH) to daughter cells, demonstrating stochastic binomial-like distributions after division. |

## Critical Analysis
### Strengths
- Unprecedented level of physical and chemical integration, linking 3D spatial diffusion, chromosome polymer physics, and metabolic fluxes over an entire cell cycle.
- Strong reliance on diverse experimental data constraints (sequencing, proteomics, cryo-ET, fluorescence) to validate emergent model behaviors.
- Capable of predicting single-cell heterogeneity and partitioning variance that well-stirred models cannot capture.

### Weaknesses
- Extremely computationally expensive, limiting the ability to run large-scale population studies or extensive parameter sweeps.
- Chromosome partitioning relies on an artificial repulsive force (12 pN) because a strictly physics-based model of SMC/entropic segregation would be too computationally intensive to simulate over the required timescales.
- Lacks explicit modeling of polysomes, which likely contributes to the slight underproduction of large proteins compared to experimental proteomics.

### Questions
- How would the explicit inclusion of coupled transcription-translation and polysomes alter the spatial distribution of ribosomes and the predicted active fraction?
- Can machine learning surrogate models be trained on these 4D trajectories to accelerate the simulation of minimal cells?

## Connections
### Related Papers
- Thornburg et al., 2022 (Cell): The predecessor well-stirred and early-cell-cycle 4D model of JCVI-syn3A.
- Breuer et al., 2019 (eLife): Essential metabolism for a minimal cell.

### Related Concepts
- [[Whole-Cell Modeling]]
- [[Synthetic Biology]]
- [[Reaction-Diffusion Systems]]
- [[Stochastic Simulation]]

### Potential Applications
- Serving as a "virtual cell" sandbox to test the viability of synthetic genetic circuits before in vivo implementation.
- Investigating the fundamental biophysical limits of cell division and spatial organization in minimal life forms.

## Notes
-