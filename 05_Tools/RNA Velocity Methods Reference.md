---
title: RNA Velocity Methods Reference
tags:
  - reference
  - RNA-velocity
  - methods
date_added: 2026-10-20
verified: 2026-10-20
---

# RNA Velocity Methods Reference

These entries identify methods referenced elsewhere in the vault. Publication identity and the descriptions below were checked against original papers or author-maintained repositories on 2026-10-20. This is a source map, not a benchmark ranking or a reproduction of results. Dyngen is a simulator and PIDC is a network-inference method; neither is an RNA velocity estimator.

## SDEvelo

SDEvelo models multigene spliced/unspliced dynamics with stochastic differential equations and cell-specific latent time. The original study does not explicitly model spatial coordinates, even when applied to spatial transcriptomics data. Its stochastic formulation does not remove dependence on preprocessing or batch effects.

Sources: [Original article](https://doi.org/10.1038/s41467-024-55146-5); [official repository](https://github.com/Liao-Xu/SDEvelo).

## VeloCycle

VeloCycle uses a Bayesian, manifold-constrained model to infer periodic cell-cycle dynamics and variation in cycle speed. Its circular manifold is a biological assumption suited to cycling populations; it should not be treated as a general branching differentiation model.

Sources: [Statistical inference with a manifold-constrained RNA velocity model uncovers cell cycle speed modulations](https://doi.org/10.1038/s41592-024-02471-8); [official repository](https://github.com/lamanno-epfl/velocycle).

## scKINETICS

scKINETICS jointly estimates regulatory networks and per-cell expression velocities using an expectation–maximization procedure, epigenetic priors and expression structure. It models regulatory velocity rather than relying only on the spliced/unspliced phase delay. Inferred regulatory coefficients are model-dependent hypotheses, not experimentally established causal interactions.

Sources: [scKINETICS: inference of regulatory velocity with single-cell transcriptomics data](https://doi.org/10.1093/bioinformatics/btad267); [official repository](https://github.com/dpeerlab/scKINETICS).

## DeepCycle

DeepCycle uses an autoencoder with a circular latent phase to reconstruct cell-cycle progression from spliced and unspliced expression. It estimates a cycle coordinate, so its output and intended use differ from unrestricted whole-transcriptome velocity estimation. The repository specifies preprocessing with scVelo moments and cell-cycle gene selection.

Sources: [Cell cycle gene regulation dynamics revealed by RNA velocity and deep-learning](https://doi.org/10.1038/s41467-022-30545-8); [official repository](https://github.com/andreariba/DeepCycle).

## NeuroVelo

NeuroVelo combines an interpretable linear expression projection with nonlinear neural ODE dynamics constrained by RNA splicing. It can associate inferred dynamics with genes and candidate regulatory interactions. The paper notes limitations from the linear projection, random initialization and incomplete ChIP-seq reference networks. The verified journal version appeared in 2026; earlier references may identify its 2023/2024 preprint instead.

Sources: [Interpretable learning of temporal cellular dynamics from single-cell data](https://doi.org/10.1016/j.crmeth.2026.101342); [full text](https://pmc.ncbi.nlm.nih.gov/articles/PMC13030976/); [official repository](https://github.com/idriskb/NeuroVelo).

## protaccel

The protaccel software extends RNA velocity analysis to jointly measured RNA and protein, estimating protein velocity and acceleration under a kinetic model. It requires suitable RNA/protein measurements and assumptions about processing and turnover; it is not a substitute for an RNA-only method on arbitrary datasets.

Sources: [Protein velocity and acceleration from single-cell multiomics experiments](https://doi.org/10.1186/s13059-020-1945-3); [author-maintained analysis code](https://github.com/pachterlab/GSP_2019).

## STT

In this vault's cellular-dynamics context, STT means **spatial transition tensor**. It estimates multiple attractor states and transitions from spliced/unspliced expression, optionally incorporating spatial proximity. Attractors are inferred under model and neighborhood assumptions. The acronym is ambiguous outside this context and should not be expanded automatically in unrelated notes.

Source: [Spatial transition tensor of single cells](https://doi.org/10.1038/s41592-024-02266-x).

## Dyngen

**dyngen** simulates cellular dynamics and multi-omic measurements from a specified regulatory system. It supplies known simulated trajectories and regulatory relationships for method evaluation. Simulation ground truth is conditional on its generating model and does not establish correctness on experimental data.

Sources: [Spearheading future omics analyses using dyngen, a multi-modal simulator of single cells](https://doi.org/10.1038/s41467-021-24152-2); [official documentation](https://dyngen.dynverse.org/).

## PIDC

PIDC means **partial information decomposition and context**. It infers gene association networks using multivariate information measures. It does not directly estimate RNA velocity, temporal order or causal direction; its inferred associations require additional evidence before being interpreted mechanistically.

Sources: [Gene Regulatory Network Inference from Single-Cell Data Using Multivariate Information Measures](https://doi.org/10.1016/j.cels.2017.08.014); [original full text](https://pmc.ncbi.nlm.nih.gov/articles/PMC5624513/); [official software](https://github.com/Tchanders/NetworkInference.jl).
