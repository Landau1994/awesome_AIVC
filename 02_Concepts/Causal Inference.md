---
title: Causal Inference
aliases: [Causal Inference in Biology, Causality]
tags:
  - concept
  - AIVC
date_created: 2026-10-20
last_updated: 2026-10-20
status: reviewed
---

# Causal Inference

## Definition

Causal inference estimates what would change under an intervention, rather than only predicting associations. In a structural causal model, $P(Y\mid\operatorname{do}(A=a))$ represents intervention on $A$ and generally differs from the observational conditional distribution $P(Y\mid A=a)$.

## In Single-Cell Biology

[[Perturb-seq]] supplies intervention information, but interpreting effects still requires attention to guide assignment, efficacy, off-target effects, selection and experimental controls. A response after perturbing one gene need not be a direct regulatory edge: downstream effects can be mediated by other variables.

## Scope

- Distinguish population-average effects, conditional effects, causal graph discovery and individual counterfactual prediction.
- State assumptions that identify the chosen effect, including relevant confounder control, treatment definition and support/positivity.
- Destructive RNA sequencing rarely observes both potential outcomes of the same cell.
- Predictive accuracy, attention weights and co-expression alone do not demonstrate causal identification.

## Related Concepts

- [[Perturbation Prediction]]
- [[Gene Regulatory Networks]]
- [[Cell State Transitions]]

## Sources

- [Pearl, Causal inference in statistics: An overview (2009)](https://escholarship.org/uc/item/36w8n7pg)
- [Original Perturb-seq study](https://doi.org/10.1016/j.cell.2016.11.038)
