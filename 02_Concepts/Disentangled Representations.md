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
last_updated: 2026-01-16
---

# Disentangled Representations

## Definition
> Disentangled representations separate independent factors of variation in data into distinct latent dimensions. In AIVC, this enables isolating perturbation effects from cell state, batch effects, and other covariates.

## Key Ideas
- **Separation of factors**: Each latent dimension captures one factor
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
- Remove batch effects cleanly
- Enable combinatorial predictions
- Interpretable latent space

## Related Concepts
- [[02_Concepts/Variational Autoencoders|Variational Autoencoders]]
- [[02_Concepts/Generative Models|Generative Models]]
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]

## Key Papers
- [[01_Papers/CPA|CPA]] - Compositional disentanglement
