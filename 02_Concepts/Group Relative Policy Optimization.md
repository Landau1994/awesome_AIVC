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

**Group Relative Policy Optimization (GRPO)** is a reinforcement learning algorithm designed to align large language models (LLMs) with biological or domain-specific objectives without requiring a separate critic network. It simplifies the RL training pipeline compared to traditional methods like PPO (Proximal Policy Optimization) or RLHF (Reinforcement Learning from Human Feedback).

## Key Concepts

### Core Idea
GRPO optimizes model outputs by:
1. Generating multiple responses/outputs from the model
2. Computing a reward for each output based on a biological objective (e.g., correlation with experimental data, biological validity score)
3. Using *relative* comparisons within a group of outputs to update the policy
4. Eliminating the need for a separate critic network by using group-based statistics

### Why GRPO for Biology?

- **Eliminates Critic Network**: Simpler, more stable training (critic networks can become bottlenecks)
- **Group Comparisons**: Comparing outputs within a group is more stable than absolute reward scaling
- **Direct Reward Integration**: Can directly incorporate biological metrics (BioBERTScore, correlation with L1000 data, etc.)
- **Scalable**: Works well with large models without additional learnable components

## Technical Details

### Algorithm Steps

1. **Prompt Sampling**: Sample a batch of prompts from training data
2. **Response Generation**: Generate K responses per prompt from the current policy
3. **Reward Computation**: Score each response using a reward function $r(y|x)$
   - Example: Correlation between predicted and observed gene expression
   - Example: BioBERTScore for question answering quality
4. **Advantage Estimation**: Within each group of K responses, compute advantages:
   $$A_i = r_i - \text{mean}(r_1, ..., r_K)$$
5. **Policy Update**: Update model parameters using the advantage-weighted log-likelihood:
   $$\mathcal{L} = -\mathbb{E}[\log \pi_\theta(y|x) \cdot A(y|x)]$$
6. **Repeat**: Iterate until convergence

### Comparison to Other Methods

| Method | Critic Network | Training Stability | Scalability |
|--------|---|---|---|
| REINFORCE | No | Low | Medium |
| PPO | Yes | Medium | Medium |
| RLHF | Yes (implicit) | Medium-High | Medium |
| **GRPO** | **No** | **High** | **High** |

## Applications in Single-Cell Biology

### 1. Perturbation Prediction
- **Reward**: Correlation between predicted expression changes and experimental data
- **Objective**: Improve generalization to unseen perturbations (drugs, CRISPR)
- **Example**: [[01_Papers/Cell2Sentence|C2S-Scale]] uses GRPO to predict response to chemical perturbations

### 2. Question Answering
- **Reward**: BioBERTScore (semantic similarity with ground truth answers)
- **Objective**: Generate accurate, biologically sound answers to queries
- **Example**: "What genes are upregulated in this cell type?" → Ranked by biological accuracy

### 3. Gene Expression Generation
- **Reward**: Realism of generated transcriptome (scFID metric)
- **Objective**: Generate biologically plausible gene expression profiles
- **Constraint**: Maintain consistency with experimental datasets

## Advantages

✅ **No Critic Network**: Eliminates a source of training instability and complexity
✅ **Stable Learning**: Group-based relative comparisons prevent reward scale issues
✅ **Direct Biological Metrics**: Can incorporate any differentiable or non-differentiable reward
✅ **Scalable**: Works efficiently with very large models (27B+ parameters)
✅ **Interpretable**: Clear connection between rewards and model behavior

## Limitations

⚠️ **Reward Function Design**: Quality of RL depends entirely on reward function engineering
⚠️ **Computational Cost**: Requires multiple forward passes per prompt (K responses)
⚠️ **Mode Collapse**: May still suffer from mode collapse in some settings
⚠️ **Sample Efficiency**: Less sample-efficient than offline RL methods

## Implementation Notes

### Key Hyperparameters
- **Group Size (K)**: Number of responses per prompt (typically 4-8)
- **Learning Rate**: Usually lower than supervised fine-tuning
- **Reward Scaling**: Normalize rewards to reasonable ranges
- **Training Iterations**: Depends on convergence of reward metric

### Pseudocode

```python
def grpo_training_step(prompts, model, reward_fn, group_size=4):
    """Single GRPO training step"""
    losses = []

    for prompt in prompts:
        # Generate multiple responses per prompt
        responses = []
        for _ in range(group_size):
            response = model.generate(prompt)
            responses.append(response)

        # Compute rewards
        rewards = [reward_fn(prompt, r) for r in responses]

        # Compute advantages within group
        mean_reward = mean(rewards)
        advantages = [r - mean_reward for r in rewards]

        # Compute loss
        for response, advantage in zip(responses, advantages):
            log_prob = model.log_prob(response | prompt)
            loss = -log_prob * advantage
            losses.append(loss)

    # Update model
    total_loss = mean(losses)
    total_loss.backward()
    optimizer.step()

    return total_loss
```

## Related Concepts

- [[02_Concepts/Transfer Learning Biology|Transfer Learning in Biology]] - GRPO used for fine-tuning
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]] - Target models for GRPO alignment
- [[02_Concepts/Transformers for Biology|Transformers for Biology]] - Architecture being optimized

## Related Papers

- [[01_Papers/Cell2Sentence|Cell2Sentence (C2S-Scale)]]: Uses GRPO for perturbation prediction and QA
- DeepSeek-R1 (2024): Demonstrates GRPO effectiveness at scale
- OpenAI RLHF papers: Foundation for reward-based RL in LLMs

## See Also

- **RLHF**: More complex but uses human feedback
- **PPO**: Standard policy gradient method with critic
- **DPO (Direct Preference Optimization)**: Simpler offline alternative
- **Supervised Fine-Tuning (SFT)**: Baseline without RL

## Notes

- GRPO is particularly effective when biological rewards can be computed directly (not requiring human annotation)
- The method scales well to 27B+ parameter models, making it practical for large foundation models
- Group-based relative comparisons make it more stable than REINFORCE but simpler than PPO
- Can be combined with other techniques (e.g., supervised fine-tuning before RL)

---

**Last Updated**: 2026-03-25
