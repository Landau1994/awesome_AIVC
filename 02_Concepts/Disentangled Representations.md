---
title: Disentangled Representations
aliases: [Disentanglement, Disentangled Latent Space]
tags:
  - concept
  - AIVC
  - representation-learning
  - interpretability
  - learning-path
category: Core Technique
importance: medium
date_created: 2026-01-16
last_updated: 2026-10-20
---

# Disentangled Representations

## Definition
> Disentangled representations aim to separate factors of variation into distinct latent coordinates or subspaces. In AIVC, this enables isolating perturbation effects from cell state, batch effects, and other covariates.

## Key Ideas
- **Separation of factors**: Desired factors may occupy multidimensional subspaces; independence and identifiability require assumptions
- **Interpretability**: Understand what each dimension means
- **Compositionality**: Combine factors independently
- **Controllable generation**: Modify specific aspects

## CPA Disentanglement

```
Cell Expression
↓
Encoder
↓
Disentangled Latent Space:
├── z_basal (cell intrinsic state)
├── z_perturbation (drug/gene effect)
└── z_covariate (batch, donor)
↓
Compositional combination for prediction
```

## Benefits for AIVC
- Isolate perturbation effects
- Reduce modeled batch dependence while checking that biological variation is preserved
- Enable combinatorial predictions
- Interpretable latent space

## Related Concepts
- [[02_Concepts/Variational Autoencoders|Variational Autoencoders]]
- [[02_Concepts/Generative Models|Generative Models]]
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]

## Key Papers
- [[01_Papers/CPA|CPA]] - Compositional disentanglement

## Verification (2026-10-20)

Disentanglement is a modeling objective, not an automatic consequence of an autoencoder; unsupervised identification requires assumptions. [Locatello et al.](https://proceedings.mlr.press/v97/locatello19a.html); [CPA](https://doi.org/10.15252/msb.202211517).
