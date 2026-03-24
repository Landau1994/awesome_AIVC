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
