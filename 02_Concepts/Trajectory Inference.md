---
title: Trajectory Inference
aliases: [Cell Trajectory Inference, Pseudotime Inference]
tags:
  - concept
  - AIVC
  - single-cell
  - dynamics
status: draft
---

# Trajectory Inference

## Overview
Trajectory inference estimates how cell states evolve over developmental or response processes, usually from snapshot single-cell data.

## Core Ideas
- Build a graph/manifold over cell states.
- Infer pseudotime ordering or branching structure.
- Optionally combine with [[02_Concepts/RNA Velocity|RNA Velocity]] for directionality.

## Common Methods
- Graph-based: PAGA, Slingshot
- Pseudotime-based: Monocle
- Velocity-augmented: scVelo, Dynamo

## Related
- [[02_Concepts/scRNA-seq|scRNA-seq]]
- [[02_Concepts/Dynamical Systems|Dynamical Systems]]

## Verification (2026-10-20)

Pseudotime is an inferred relative ordering, not necessarily elapsed time or a uniquely identified lineage. Roots, topology and sampling assumptions influence the result. [Trajectory-inference benchmark](https://doi.org/10.1038/s41587-019-0071-9).
