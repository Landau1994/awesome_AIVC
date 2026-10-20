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
last_updated: 2026-10-20
---

# Optimal Transport

## Definition
> Optimal Transport (OT) is a mathematical framework for comparing and mapping probability distributions by finding the most efficient way to transform one into another. In AIVC, it enables learning cell state transitions from unpaired observations.

## Key Ideas
- **Transport map**: Function T that transforms distribution P to Q
- **Minimal effort**: Find T that minimizes total "cost"
- **Unpaired data**: Works without matched before/after samples
- **Distribution constraints**: Fit population distributions; an inferred map may act on individual cells but does not identify their true counterfactual fates

## Mathematical Formulation

### Monge Problem
$$T^* = \arg\min_{T:\,T_\#P=Q} \int c(x, T(x))\,dP(x).$$

The pushforward constraint $T_\#P=Q$ is essential; a deterministic transport map need not exist for every pair of distributions.

### Wasserstein Distance
$$W_p(P,Q)=\left(\inf_{\pi\in\Pi(P,Q)}\int d(x,y)^p\,d\pi(x,y)\right)^{1/p},\qquad p\ge1.$$

Here $d$ is a metric and $\Pi(P,Q)$ contains couplings with marginals $P,Q$; finite $p$th moments are assumed.

## Application: CellOT

```mermaid
graph LR
    A["Control cells (P_control)"] -- "Neural OT" --> B["Treated cells (P_treated)"]
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

## Verification (2026-10-20)

Restored the pushforward constraint in the Monge problem and specified the metric/moment assumptions for Wasserstein distance. [Computational Optimal Transport](https://arxiv.org/abs/1803.00567); [CellOT](https://doi.org/10.1038/s41592-023-01969-x).
