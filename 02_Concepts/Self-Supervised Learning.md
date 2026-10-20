---
title: Self-Supervised Learning
aliases: [SSL, Self-supervision]
tags:
  - concept
  - AIVC
date_created: 2026-10-20
last_updated: 2026-10-20
status: reviewed
---

# Self-Supervised Learning

## Definition

Self-supervised learning constructs training targets from the data themselves rather than requiring task labels for every example. Masking, reconstruction and contrastive prediction are common strategies.

## In Cell Models

- Mask gene identities or expression values and predict the missing target.
- Reconstruct expression under a model-appropriate count or continuous likelihood.
- Align deliberately related views while retaining biological variation.

A generic masked objective is

$$\mathcal L=-\mathbb E_{x,M}\sum_{g\in M}\log p_\theta(x_g\mid x_{\setminus M}).$$

The target variable and likelihood differ across models. A self-supervised pretrained encoder may subsequently be evaluated as a frozen representation or adapted with supervised labels; these evaluation settings must be distinguished.

## Limits

Training without task labels does not eliminate dataset bias, technical confounding or pretraining/test overlap. Augmentations should preserve the biological features relevant to the intended task.

## Related Concepts

- [[Cell Foundation Models]]
- [[Transformers for Biology]]
- [[Transfer Learning Biology]]
- [[02_Concepts/Generalization|Generalization]]

## Sources

- [BERT masked pretraining](https://arxiv.org/abs/1810.04805)
- [SimCLR contrastive learning](https://proceedings.mlr.press/v119/chen20j.html)
- [scGPT](https://doi.org/10.1038/s41592-024-02201-0)
