---
title: Group Relative Policy Optimization
aliases: [GRPO, Group Relative PO]
tags:
  - concept
  - reinforcement-learning
  - LLM
  - alignment
  - AIVC
date_created: 2026-03-25
status: unread
---

# Group Relative Policy Optimization (GRPO)

## Overview

GRPO is a policy-optimization method introduced in **DeepSeekMath (2024)**. It estimates relative advantages from multiple responses to the same prompt, avoiding a separately trained value critic. It is a general language-model training method, not a method originally designed for biology. [DeepSeekMath](https://arxiv.org/abs/2402.03300)

## Core Procedure

1. Sample a prompt $x$ and $K$ responses from a frozen behavior policy $\pi_{\mathrm{old}}$.
2. Evaluate a task-specific reward $r_i$ for each response.
3. For outcome supervision, normalize rewards within the group:

$$\hat A_i=\frac{r_i-\bar r}{\operatorname{std}(r_1,\ldots,r_K)+\epsilon_{\mathrm{num}}}.$$

4. Optimize a clipped importance-ratio objective, with reference-policy KL regularization in the original formulation. A schematic token-level objective is

$$J(\theta)=\mathbb E\left[\frac1K\sum_i\frac1{|y_i|}\sum_t\left\{\min\!\left(\rho_{i,t}\hat A_i,\operatorname{clip}(\rho_{i,t},1-\varepsilon,1+\varepsilon)\hat A_i\right)-\beta\,\widehat D_{\mathrm{KL},i,t}\right\}\right],$$

where $\rho_{i,t}=\pi_\theta(y_{i,t}\mid x,y_{i,<t})/\pi_{\mathrm{old}}(y_{i,t}\mid x,y_{i,<t})$. The behavior and reference policies have different roles. Identical group rewards yield zero relative learning signal from the reward term. Implementations can modify normalization, length weighting and KL handling; record the variant.

## Comparison with Related Methods

| Method | Distinction |
|---|---|
| REINFORCE | Policy gradient; can use a baseline, but does not inherently have PPO clipping |
| PPO | Usually learns a value baseline and clips policy-ratio updates |
| GRPO | Uses within-prompt group rewards rather than a separate value critic |
| RLHF | Describes a feedback/training setting, not one optimization algorithm; can use different optimizers |
| DPO | Learns from preference pairs with a different objective |

No universal ranking of training stability, sample efficiency or quality follows from this table.

## Potential Biological Applications

Rewards could score perturbation predictions, biological question answering or generated expression profiles. These are application designs rather than intrinsic GRPO capabilities. Biological validity depends on reward construction, experimental evidence and evaluation on held-out settings. Optimizing correlation or a language-based score alone does not establish biological correctness.

See [[01_Papers/Cell2Sentence|Cell2Sentence / C2S-Scale]] for the specific model version and training tasks. Do not infer that every Cell2Sentence release uses the same RL procedure.

## Advantages and Limitations

- Avoiding the value critic can reduce memory, but generating several responses per prompt costs compute.
- Rewards need not be differentiable; they still need to reflect the intended task.
- Reward gaming, poor exploration, noisy rewards and distribution shift remain possible.
- Group size, sampling policy, clipping, KL coefficient and normalization affect behavior; there is no universal best group size or stability guarantee.

## Implementation Notes

The former example only minimized an advantage-weighted log-likelihood. That is a policy-gradient sketch, not the full GRPO algorithm. Use a documented implementation that retains behavior-policy log probabilities, masks/pads tokens correctly, normalizes rewards, clips importance ratios and handles the selected KL term. This note is conceptual, not a tested training recipe.

## Related Concepts

- [[02_Concepts/Transfer Learning Biology|Transfer Learning in Biology]]
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Transformers for Biology|Transformers for Biology]]

## Sources and Verification (2026-10-20)

- [DeepSeekMath (2024), Section 4.1](https://arxiv.org/html/2402.03300v3): original GRPO formulation.
- [DeepSeek-R1 (2025)](https://arxiv.org/abs/2501.12948): later reasoning-model application; the former 2024 date was incorrect.
- [[01_Papers/Cell2Sentence|Cell2Sentence / C2S-Scale]]: check the paper’s task and checkpoint before transferring biological application claims.
