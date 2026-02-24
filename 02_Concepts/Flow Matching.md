---
title: Flow Matching
aliases:
  - CFM
  - Conditional Flow Matching
  - Rectified Flow
tags:
  - concept
  - AIVC
  - GenerativeModels
category: 
  - Deep Learning
  - Diffusion model
importance: High
date_created: 2026-02-24
last_updated: 2026-02-24
---

# Flow Matching

## Definition
> **Flow Matching** is a generative modeling framework for training **Continuous Normalizing Flows (CNFs)**. Unlike traditional CNF training which requires expensive ODE simulations, Flow Matching uses a **simulation-free** objective to regress a vector field that deterministically transforms a simple prior distribution (e.g., Gaussian noise) into a complex data distribution.

## Key Ideas
- **Simulation-Free Training**: It avoids solving Ordinary Differential Equations (ODEs) during the training phase. Instead, it uses **Conditional Flow Matching (CFM)** to regress a target vector field directly.
- **Optimal Transport Paths**: Flow Matching allows the model to learn straight-line trajectories between noise and data. Straight paths are easier to simulate numerically, leading to faster sampling.
- **Deterministic Sampling**: Inference is performed by solving an ODE (using solvers like Euler or RK45), resulting in a deterministic mapping from noise to data (though stochastic variants exist).
- **Generalization of Diffusion**: It unifies diffusion models and CNFs. Diffusion models can be viewed as a specific instance of Flow Matching with curved, stochastic paths.

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
- $x$ is the intermediate state. For the **Optimal Transport** path, defined as linear interpolation: $x_t = (1-t)x_0 + tx_1$.
- $u_t(x|x_1)$ is the conditional target vector field (the derivative of the path), which is simply $x_1 - x_0$ for linear paths.
- $v_\theta$ is the neural network (the velocity field).

## Visual Explanation
```excalidraw
(Conceptual Sketch:
Left side: A cloud of Gaussian noise points.
Right side: A complex data distribution (e.g., a spiral or image manifold).
Action: Straight arrows connecting specific noise points directly to data points.
Annotation: "Flow Matching learns straight trajectories (Optimal Transport), unlike Diffusion which takes curved/noisy paths.")
```

## Applications in AIVC
- **Image Generation**: **Stable Diffusion 3 (SD3)** utilizes a Flow Matching backbone (specifically Rectified Flow) to achieve high fidelity and better prompt adherence.
- **Speech Synthesis (TTS)**: Models like **Voicebox** and **Matcha-TTS** use Flow Matching to generate audio non-autoregressively, offering faster inference than diffusion-based TTS.
- **Video Generation**: Emerging video models (e.g., potentially **Sora** and others) are shifting toward Flow Matching to ensure temporal consistency and reduce the number of sampling steps required for high-dimensional video data.
- **3D Generation**: Used for generating point clouds or latent representations of 3D objects.

## Related Concepts
- [[Diffusion Models]]
- [[Continuous Normalizing Flows]]
- [[Optimal Transport]]
- [[Ordinary Differential Equations]] (ODEs)
- [[Rectified Flow]] (A specific formulation of Flow Matching that enforces straight paths)

## Key Papers
- [[Flow Matching for Generative Modeling]] (Lipman et al., ICLR 2023) - *The foundational paper introducing the framework.*
- [[Flow Straight and Fast: Learning to Generate with Rectified Flow]] (Liu et al., ICLR 2023) - *Introduced Rectified Flow, a very similar concept focusing on straight paths.*
- [[Scaling Rectified Flow Transformers for High-Resolution Image Synthesis]] (Esser et al., 2024) - *The technical report for Stable Diffusion 3.*
- [[Voicebox: Text-Guided Multilingual Universal Speech Generation at Scale]] (Le et al., 2023) - *Application in Audio.*

## Tools & Implementations
- **Torchdiffeq**: A PyTorch library for ODE solvers, essential for the inference/sampling step.
- **HuggingFace Diffusers**: Implements `FlowMatchEulerDiscreteScheduler` for models like SD3.
- **Official Code**: [facebookresearch/flow_matching](https://github.com/facebookresearch/flow_matching)

## Learning Resources
- [Blog: Flow Matching for Generative Modeling (Tongzhou Wang)](https://tongzhouwang.info/flow_matching/)
- [YouTube: CVPR 2023 Tutorial on Denoising Diffusion-based Generative Modeling (Section on Flow Matching)]

## Notes
- A major advantage of Flow Matching over Diffusion is efficiency. Because the learned trajectories are straighter, the ODE solver can take larger steps. High-quality samples can often be generated in 10-25 steps without distillation, whereas standard diffusion often requires 50+.
- It is often paired with **DiT (Diffusion Transformers)** architectures rather than U-Nets in modern implementations.
```