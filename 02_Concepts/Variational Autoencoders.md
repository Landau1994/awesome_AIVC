---
title: Variational Autoencoders
aliases: [VAE, VAEs]
tags:
  - concept
  - AIVC
  - deep-learning
  - generative
  - learning-path
category: Core Technique
importance: high
date_created: 2026-01-16
last_updated: 2026-10-20
---

# Variational Autoencoders

## Definition
> Variational Autoencoders (VAEs) are generative models that learn a probabilistic latent representation of data. In AIVC, they power batch correction (scVI), perturbation prediction (scGen), and cell state modeling.

## Key Ideas
- **Encoder**: Maps data to latent distribution parameters (μ, σ)
- **Latent space**: Low-dimensional, regularized representation
- **Decoder**: Reconstructs data from latent samples
- **Regularization**: KL divergence enforces structure

## Mathematical Formulation

### ELBO (Evidence Lower Bound; maximize this objective)
$$\mathcal{L} = \mathbb{E}_{q(z|x)}[\log p(x|z)] - D_{KL}(q(z|x) \| p(z))$$

- **Reconstruction term**: Generate realistic cells
- **KL term**: Keep latent space structured

### Reparameterization Trick
$$z = \mu + \sigma \odot \epsilon, \quad \epsilon \sim \mathcal{N}(0, I)$$

## Applications in AIVC

| Model | Application | Innovation |
|-------|-------------|------------|
| **scVI** | Batch correction | NB likelihood |
| **scANVI** | Annotation | Semi-supervised |
| **scGen** | Perturbation | Latent arithmetic |

## Related Concepts
- [[02_Concepts/Generative Models|Generative Models]]
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]
- [[02_Concepts/Disentangled Representations|Disentangled Representations]]

## Key Papers
- [[01_Papers/CPA|CPA]] — related adversarial autoencoder; not a standard VAE
- [[01_Papers/scGen|scGen]]

## Verification (2026-10-20)

The ELBO is maximized; training commonly minimizes its negative. CPA is a related adversarial autoencoder rather than a standard VAE. [VAE original paper](https://arxiv.org/abs/1312.6114); [CPA](https://doi.org/10.15252/msb.202211517).
