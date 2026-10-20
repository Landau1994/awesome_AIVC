---
title: Generative Models
aliases: [Generative Models for Biology, Deep Generative Models]
tags:
  - concept
  - AIVC
  - deep-learning
  - generative
  - VAE
  - diffusion
  - learning-path
category: Core Technique
importance: high
date_created: 2026-01-16
last_updated: 2026-10-20
---

# Generative Models

## Definition
> Generative models learn the underlying distribution of data and can generate new samples. In AIVC, they model cell state distributions, predict perturbation responses, and enable in-silico experimentation by generating synthetic cellular states.

## Key Ideas
- **Learn distributions**: Model P(cell state) rather than just classify
- **Generate samples**: Create realistic synthetic cells
- **Latent representations**: Compressed, interpretable cell state space
- **Conditional generation**: Generate cells under specific conditions

## Why Generative Models for AIVC?

### Core AIVC Capabilities Require Generation
| Capability | Generative Task |
|------------|-----------------|
| Simulate | Generate cell states under conditions |
| Predict | Generate post-perturbation distributions |
| Design | Generate cells with desired properties |

### Advantages
- Model uncertainty (distributions, not points)
- Handle missing data (imputation)
- Data augmentation (synthetic training data)
- Counterfactual reasoning (what if?)

## Types of Generative Models

### 1. Variational Autoencoders (VAE)

#### Architecture
```
Cell Expression x
↓
Encoder q(z|x)
↓
Latent z ~ N(μ, σ²)  [Reparameterization trick]
↓
Decoder p(x|z)
↓
Reconstructed Expression x̂
```

#### Objective (ELBO, maximized; its negative is minimized as a loss)
$$\mathcal{L} = \mathbb{E}_{q(z|x)}[\log p(x|z)] - D_{KL}(q(z|x) || p(z))$$

- **Reconstruction**: Generate realistic cells
- **KL divergence**: Regularize latent space

#### Key Models
| Model | Innovation | Application |
|-------|------------|-------------|
| **scVI** | Negative binomial likelihood | Batch correction, imputation |
| **scANVI** | Semi-supervised | Cell type annotation |
| **CPA** | Adversarial autoencoder (not a standard VAE) | Drug combinations |
| **scGen** | Latent arithmetic | Perturbation transfer |

### 2. Diffusion Models

#### Forward Process
$$q(x_t | x_{t-1}) = \mathcal{N}(x_t; \sqrt{1-\beta_t}x_{t-1}, \beta_t I)$$

Gradually add noise to cell expression.

#### Reverse Process
$$p_\theta(x_{t-1}|x_t) = \mathcal{N}(x_{t-1}; \mu_\theta(x_t, t), \Sigma_\theta(x_t, t))$$

Learn to denoise, generating cells from noise.

#### Advantages for Biology
- High-quality generation
- Flexible conditioning
- State-of-the-art in images, adapting to single-cell

### 3. Normalizing Flows

#### Concept
Transform simple distribution (Gaussian) to complex (cell states) via invertible transformations.

$$x = f_\theta(z), \quad z \sim \mathcal{N}(0, I)$$

#### Advantages
- Exact likelihood computation
- Invertible (encode and decode)
- CellOT uses neural optimal transport; it should not be classified as a normalizing-flow density model

### 4. Optimal Transport

#### Concept
Learn map T that transforms one distribution to another with minimal cost.

$$T^* = \arg\min_{T:\,T_\#P=Q} \mathbb{E}_{x \sim P}[c(x,T(x))]$$

#### Application: CellOT
- Map control cell distribution → treated cell distribution
- No paired observations needed
- [[01_Papers/CellOT|CellOT paper]]

## Applications in AIVC

### 1. Perturbation Response Prediction
```
Control cell z_control
↓
Add perturbation effect δ in latent space
↓
Decode: Generate perturbed cell expression
```

### 2. Cell State Imputation
```
Partially observed cell
↓
VAE encoder → latent z
↓
Decode: Generate full expression profile
```

### 3. Trajectory Generation
```
Start state z_0
↓
Interpolate in latent space
↓
Generate intermediate cell states
```

### 4. Conditional Generation
```
Desired properties (cell type, disease state)
↓
Conditional decoder
↓
Generate cells with those properties
```

## Comparison of Approaches

| Model Type | Pros | Cons | Best For |
|------------|------|------|----------|
| VAE | Amortized inference and probabilistic latent space | Model/likelihood assumptions; latent factors need not be interpretable | Latent analysis, perturbation |
| Diffusion | High quality | Slow sampling | Generation quality |
| Flow | Exact likelihood | Complex architecture | Density estimation |
| OT | No pairing needed | Distribution-level | Unpaired prediction |

## Mathematical Details

### VAE Reparameterization Trick
To backpropagate through sampling:
$$z = \mu + \sigma \odot \epsilon, \quad \epsilon \sim \mathcal{N}(0, I)$$

### scVI Likelihood
Uses negative binomial for count data:
$$p(x_g | z, s) = \text{NB}(x_g; \mu_g(z, s), \theta_g)$$

This is schematic: scVI distinguishes batch covariates from library size and offers NB/ZINB likelihood choices. Use raw counts and preserve the chosen likelihood in model metadata.

### CPA Compositionality
$$z_{perturbed} = z_{basal} + z_{drug_1} + z_{drug_2} + ...$$

Linear composition in latent space.

## Code Example

```python
import scvi
import scanpy as sc

# Load data
adata = sc.read_h5ad("data.h5ad")

# Setup and train scVI
scvi.model.SCVI.setup_anndata(adata, batch_key="batch")
model = scvi.model.SCVI(adata)
model.train()

# Get latent representation
latent = model.get_latent_representation()

# Sample counts conditional on observed cells (posterior predictive, not new prior samples)
synthetic = model.posterior_predictive_sample(adata)

# Estimate normalized expression; this does not recover known ground-truth missing counts
imputed = model.get_normalized_expression()
```

## Related Concepts
- [[02_Concepts/Variational Autoencoders|Variational Autoencoders]]
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]
- [[02_Concepts/Cell State Transitions|Cell State Transitions]]

## Key Papers
- [[01_Papers/CPA|CPA]] - Compositional perturbation autoencoder
- [[01_Papers/scGen|scGen]] - VAE + arithmetic
- [[01_Papers/CellOT|CellOT]] - Optimal transport

## Tools & Implementations
- [scvi-tools](https://scvi-tools.org/) - VAE models
- [scLDM: latent diffusion for single-cell expression](https://arxiv.org/abs/2511.02986)
- [CellOT](https://github.com/bunnech/cellot)

## Learning Resources
- "An Introduction to VAEs" (Kingma & Welling)
- "Understanding Diffusion Models" (Lilian Weng)
- scvi-tools tutorials

## Verification (2026-10-20)

Generative modeling alone does not guarantee causal identification or correct individual counterfactuals. [CPA](https://doi.org/10.15252/msb.202211517); [scVI model and input requirements](https://docs.scvi-tools.org/en/stable/user_guide/models/scvi.html); [CellOT](https://doi.org/10.1038/s41592-023-01969-x).
