---
title: "Dynverse: Trajectory Inference Benchmarks"
aliases: [Dynverse, Dynamic verse]
tags:
  - dataset
  - benchmark
  - trajectory-inference
  - single-cell
date_created: 2026-03-25
status: draft
---

# Dynverse: Trajectory Inference Benchmarks

Dynverse is an ecosystem for running and comparing single-cell trajectory inference methods. Its reference implementation is built around R packages (`dyno`, `dynwrap`, `dynmethods`, `dyneval`) and containerized method wrappers. It is not a Python package with the API `import dynverse` shown in the previous note.

## Data and evaluation

Wrapped expression data and trajectory objects describe milestones, their network and cell progressions. AnnData files can be converted for particular workflows, but `dpt_pseudotime` is not a mandatory Dynverse field. Inferred topology, cell ordering and branch assignments should be assessed separately; biological annotations are imperfect reference standards.

## Official workflow

Use the [official R quick start](https://dynverse.org/users/3-user-guide/3-running/) with a supported container runtime and compatible package versions. Its documented sequence is `wrap_expression(...)`, then `infer_trajectory(dataset, ti_comp1())`. This note does not claim that a local environment has been installed or executed.

## Sources

- [Dynverse user documentation](https://dynverse.org/users/)
- [Function reference](https://dynverse.org/dyno/reference/infer_trajectories.html)
- [Saelens et al., A comparison of single-cell trajectory inference methods (2019)](https://doi.org/10.1038/s41587-019-0071-9)

## Related notes

- [[02_Concepts/Trajectory Inference]]
- [[02_Concepts/Principal Component Analysis]]
- [[bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models]]

Checked 2026-10-20: implementation language and documented object/API structure. Comparative model results belong to their individual benchmark protocols.
