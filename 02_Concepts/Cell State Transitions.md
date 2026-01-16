---
title: Cell State Transitions
aliases: [Cell Transitions, State Transitions]
tags:
  - concept
  - AIVC
  - dynamics
  - trajectory
  - learning-path
category: Core Concept
importance: high
date_created: 2026-01-16
last_updated: 2026-01-16
---

# Cell State Transitions

## Definition
> Cell state transitions describe how cells change from one state to another over time or in response to perturbations. In AIVC, modeling these transitions enables prediction of cell fate, differentiation trajectories, and perturbation responses.

## Key Ideas
- **State space**: Cells occupy positions in expression space
- **Trajectories**: Paths cells follow during transitions
- **Perturbations**: External stimuli that induce transitions
- **Potential landscapes**: Energy-like view of cell states

## Transition Types

| Type | Example | Timescale |
|------|---------|-----------|
| **Differentiation** | Stem cell → specialized | Days-weeks |
| **Activation** | Resting → activated immune | Hours |
| **Drug response** | Untreated → treated | Hours-days |
| **Disease progression** | Healthy → diseased | Variable |

## Modeling Approaches

### Optimal Transport (CellOT)
- Map control distribution → treated distribution
- No paired observations needed
- [[01_Papers/CellOT|CellOT]]

### Latent Space Dynamics (scGen)
- Transitions as vectors in latent space
- δ = treated - control
- [[01_Papers/scGen|scGen]]

### RNA Velocity
- Infer direction of cell movement
- Use spliced/unspliced ratios
- Velocyto, scVelo

## Related Concepts
- [[02_Concepts/Optimal Transport|Optimal Transport]]
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]
- [[02_Concepts/Generative Models|Generative Models]]

## Key Papers
- [[01_Papers/CellOT|CellOT]]
- [[01_Papers/scGen|scGen]]
