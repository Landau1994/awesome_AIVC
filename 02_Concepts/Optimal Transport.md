---
title: Optimal Transport
aliases: [OT, Wasserstein Distance]
tags:
  - concept
  - AIVC
  - mathematics
  - distribution-matching
  - learning-path
category: Core Technique
importance: high
date_created: 2026-01-16
last_updated: 2026-01-16
---

# Optimal Transport

## Definition
> Optimal Transport (OT) is a mathematical framework for comparing and mapping probability distributions by finding the most efficient way to transform one into another. In AIVC, it enables learning cell state transitions from unpaired observations.

## Key Ideas
- **Transport map**: Function T that transforms distribution P to Q
- **Minimal effort**: Find T that minimizes total "cost"
- **Unpaired data**: Works without matched before/after samples
- **Distribution-level**: Models population shifts, not single cells

## Mathematical Formulation

### Monge Problem
$$T^* = \arg\min_T \int c(x, T(x)) dP(x)$$

### Wasserstein Distance
$$W_p(P, Q) = \left(\inf_{\gamma \in \Gamma(P,Q)} \int c(x,y)^p d\gamma(x,y)\right)^{1/p}$$

## Application: CellOT

```
Control cells (P_control) ──[Neural OT]──→ Treated cells (P_treated)
```

- Uses Input Convex Neural Networks (ICNNs)
- Learns transport map from unpaired observations
- [[01_Papers/CellOT|CellOT paper]]

## Related Concepts
- [[02_Concepts/Generative Models|Generative Models]]
- [[02_Concepts/Cell State Transitions|Cell State Transitions]]
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]

## Key Papers
- [[01_Papers/CellOT|CellOT]]
