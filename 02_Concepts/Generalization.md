---
title: Generalization
aliases: [Out-of-Distribution Generalization, OOD Generalization]
tags:
  - concept
  - AIVC
date_created: 2026-10-20
last_updated: 2026-10-20
status: reviewed
---

# Generalization

## Definition

Generalization is performance on data not used to fit or select a model. In-distribution evaluation and distribution-shift evaluation answer different questions. A new cell from a familiar donor is not the same challenge as a new donor, tissue, species or perturbation.

## Evaluation in AIVC

- Define what is held out: cells, donors, studies, cell types, perturbation identities or combinations.
- Keep the evaluation set out of preprocessing fitting, hyperparameter selection and reference-label construction.
- Audit overlap with foundation-model pretraining when claiming novel biological generalization.
- Report suitable baselines, variability over splits and performance in relevant subgroups.
- Distinguish unseen combinations of known perturbations from combinations containing unseen components.

A model can succeed on one split and fail under another. Generalization is an empirical property of a model and evaluation design, not a guarantee provided by model size.

## Related Concepts

- [[Transfer Learning Biology]]
- [[Zero-shot Learning]]
- [[Few-shot Learning]]
- [[Perturbation Prediction]]

## Sources

- [WILDS: distribution-shift benchmark (2021)](https://proceedings.mlr.press/v139/koh21a.html)
- [GEARS perturbation-holdout evaluation](https://doi.org/10.1038/s41587-023-01905-6)
