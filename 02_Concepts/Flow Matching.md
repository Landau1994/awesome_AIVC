---
title: Flow Matching
aliases:
  - CFM
  - Conditional Flow Matching
tags:
  - concept
  - AIVC
  - GenerativeModels
category:
  - Deep Learning
  - Diffusion model
importance: High
date_created: 2026-02-24
last_updated: 2026-10-20
---

# Flow Matching

## Definition
> **Flow Matching** is a generative modeling framework for training **Continuous Normalizing Flows (CNFs)**. Unlike traditional CNF training which requires expensive ODE simulations, Flow Matching uses a **simulation-free** objective to regress a vector field that deterministically transforms a simple prior distribution (e.g., Gaussian noise) into a complex data distribution.

## Key Ideas
- **Simulation-Free Training**: It avoids solving Ordinary Differential Equations (ODEs) during the training phase. Instead, it uses **Conditional Flow Matching (CFM)** to regress a target vector field directly.
- **Optimal Transport Paths**: Flow Matching allows the model to learn straight-line trajectories between noise and data. Straight paths are easier to simulate numerically, leading to faster sampling.
- **Deterministic Sampling**: Inference is performed by solving an ODE (using solvers like Euler or RK45), resulting in a deterministic mapping from noise to data (though stochastic variants exist).
- **Relation to diffusion**: FM can train deterministic velocity fields for probability paths also used by diffusion models. A probability path, an ODE trajectory and an SDE sample path are distinct objects.

## Mathematical Formulation
The goal is to learn a time-dependent vector field $v_t(x)$ that generates a probability path $p_t$ from noise $p_0$ to data $p_1$.

The core objective is the **Conditional Flow Matching (CFM)** loss:

$$
\mathcal{L}_{CFM}(\theta) = \mathbb{E}_{t, q(x_1), p_t(x|x_1)} \| v_\theta(t, x) - u_t(x|x_1) \|^2
$$

Where:
- $t \sim \mathcal{U}[0, 1]$ is the time step.
- $x_1 \sim q(x_1)$ is a real data sample.
- $x_0 \sim p(x_0)$ is a noise sample (usually $\mathcal{N}(0, I)$).
- A useful two-endpoint example samples $(x_0,x_1)$ from a coupling and sets $x_t=(1-t)x_0+tx_1$. An arbitrary pairing does not imply that the resulting population transport is globally optimal.
- In the two-endpoint formulation the training target is $x_1-x_0$. Under independent Gaussian-to-point interpolation, the one-endpoint field is $u_t(x\mid x_1)=(x_1-x)/(1-t)$ for $t<1$.
- $v_\theta$ is the neural network (the velocity field).

## Visual Explanation
```excalidraw
(Conceptual Sketch:
Left side: A cloud of Gaussian noise points.
Right side: A complex data distribution (e.g., a spiral or image manifold).
Action: Straight arrows connecting specific noise points directly to data points.
Annotation: "Linear conditional interpolants provide training targets; the learned marginal ODE trajectories need not be straight.")
```

## General Generative Applications
- **Image Generation**: **Stable Diffusion 3 (SD3)** utilizes a Flow Matching backbone (specifically Rectified Flow) to achieve high fidelity and better prompt adherence.
- **Speech Synthesis (TTS)**: Models like **Voicebox** and **Matcha-TTS** use Flow Matching to generate audio non-autoregressively, offering faster inference than diffusion-based TTS.
- **Single-cell generation**: [[arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models|scLDM]] uses latent generative modeling with linear interpolants. Architecture claims require a specific model report.
- **3D Generation**: Used for generating point clouds or latent representations of 3D objects.

## Related Concepts
- [[02_Concepts/Generative Models|Diffusion Models]]
- [[02_Concepts/Methods and Metrics Glossary#Continuous Normalizing Flows|Continuous Normalizing Flows]]
- [[Optimal Transport]]
- [[02_Concepts/Dynamical Systems|Ordinary Differential Equations]] (ODEs)
- [[08_Resources/Foundational Methods References#Flow Straight and Fast: Learning to Generate with Rectified Flow|Rectified Flow]] (A related approach using straight interpolation targets and optional reflow; learned paths need not be exactly straight)

## Key Papers
- [[08_Resources/Foundational Methods References#Flow Matching for Generative Modeling|Flow Matching for Generative Modeling]] (Lipman et al., ICLR 2023) - *The foundational paper introducing the framework.*
- [[08_Resources/Foundational Methods References#Flow Straight and Fast: Learning to Generate with Rectified Flow|Flow Straight and Fast: Learning to Generate with Rectified Flow]] (Liu et al., ICLR 2023) - *Introduced Rectified Flow, a very similar concept focusing on straight paths.*
- [[08_Resources/Foundational Methods References#Scaling Rectified Flow Transformers for High-Resolution Image Synthesis|Scaling Rectified Flow Transformers for High-Resolution Image Synthesis]] (Esser et al., 2024) - *The technical report for Stable Diffusion 3.*
- [[08_Resources/Foundational Methods References#Voicebox: Text-Guided Multilingual Universal Speech Generation at Scale|Voicebox: Text-Guided Multilingual Universal Speech Generation at Scale]] (Le et al., 2023) - *Application in Audio.*

## Tools & Implementations
- **Torchdiffeq**: One available ODE solver library; fixed-step samplers can also be implemented directly.
- **HuggingFace Diffusers**: Implements `FlowMatchEulerDiscreteScheduler` for models like SD3.
- **Official Code**: [facebookresearch/flow_matching](https://github.com/facebookresearch/flow_matching)

## Learning Resources
- [Blog: Flow Matching for Generative Modeling (Tongzhou Wang)](https://tongzhouwang.info/flow_matching/)
- [Flow Matching Guide and Code](https://arxiv.org/abs/2412.06264)

## Notes
- Sampling efficiency depends on learned field curvature, solver, architecture and task. A universal 10–25 versus 50+ step comparison is unsupported.
- It is often paired with **DiT (Diffusion Transformers)** architectures rather than U-Nets in modern implementations.

## Verification (2026-10-20)

Distinguished conditional linear interpolation, marginal ODE trajectories and optimal couplings. Removed an unsupported Sora attribution and universal sampling-step comparison. [Flow Matching](https://arxiv.org/abs/2210.02747); [Rectified Flow](https://arxiv.org/abs/2209.03003).
