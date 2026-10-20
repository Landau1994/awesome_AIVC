---
title: Dynamical Systems
aliases: [Dynamic Systems, System Dynamics]
tags:
  - concept
  - AIVC
  - mathematics
  - modeling
status: draft
---

# Dynamical Systems

## Overview
A dynamical system describes how a state evolves over time according to explicit rules, often written as differential equations.

## In Single-Cell Biology
- Cell state is represented as a point in gene-expression space.
- RNA velocity methods estimate local direction vectors.
- The global vector field approximates developmental dynamics.

## Why It Matters
- Gives a formal language for trajectories, attractors, and fate branches.
- Helps interpret methods like [[01_Papers/scvelo|scvelo]] and [[01_Papers/Dynamo|Dynamo]].

## Related
- [[02_Concepts/RNA Velocity|RNA Velocity]]
- [[02_Concepts/Trajectory Inference|Trajectory Inference]]


## ODEs, SDEs and reaction-diffusion models

An ordinary differential equation (ODE), $dx/dt=f(x,t)$, describes deterministic state evolution under specified initial conditions. A stochastic differential equation (SDE), $dX_t=f(X_t,t)dt+G(X_t,t)dW_t$, adds a stochastic term; the stochastic convention and noise model must be specified. A stochastic simulation samples trajectories and is not necessarily an SDE solver.

Reaction-diffusion models combine local reactions with spatial transport, often as $\partial_t u=D
abla^2u+R(u)$. A well-fitting trajectory does not by itself identify a unique biological mechanism.

Sources: [neural ODEs](https://arxiv.org/abs/1806.07366), [SDE inference](https://arxiv.org/abs/2001.01328), and [Turing’s reaction-diffusion model](https://doi.org/10.1098/rstb.1952.0012). Definitions added 2026-10-20.
