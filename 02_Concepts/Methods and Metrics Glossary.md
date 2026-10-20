---
title: "Methods and Metrics Glossary"
tags: [reference, AIVC]
date_created: 2026-10-20
---

# Methods and Metrics Glossary

Short definitions for reading the linked papers. Scores require a named dataset and protocol. The glossary does not reproduce benchmark tables or assert a universal ranking.

## Active Learning

A learner selects informative observations or experiments for labeling. Selection bias and the cost of experiments must be included in evaluation.

Source: [original reference or official documentation](https://burrsettles.com/pub/settles.activelearning.pdf).

## Bayesian Optimization

Sequential optimization of an expensive objective using a probabilistic surrogate and an acquisition rule; uncertainty calibration and the search domain affect results.

Source: [original reference or official documentation](https://arxiv.org/abs/1807.02811).

## Adam

An optimization algorithm using moving estimates of first and second moments of gradients. Learning-rate and numerical choices remain important.

Source: [original reference or official documentation](https://arxiv.org/abs/1412.6980).

## AdamW

Adam with decoupled weight decay; weight decay is separated from the gradient update rather than implemented as a coupled L2 penalty.

Source: [original reference or official documentation](https://arxiv.org/abs/1711.05101).

## Aleatoric vs Epistemic Uncertainty

Aleatoric uncertainty concerns variability in the observation process; epistemic uncertainty concerns uncertainty about the learned model. Their separation depends on modeling assumptions.

Source: [original reference or official documentation](https://arxiv.org/abs/1703.04977).

## Backtracking line search

A step-size search that repeatedly reduces a trial step until a specified sufficient-decrease condition is met.

Source: [original reference or official documentation](https://web.stanford.edu/~boyd/cvxbook/).

## Continuous Normalizing Flows

Neural ODEs parameterize a continuous-time vector field. A continuous normalizing flow additionally tracks the density change under that flow. They are not synonyms for all dynamical biological models.

Source: [original reference or official documentation](https://arxiv.org/abs/1806.07366).

## Contrastive Learning

Representation learning that distinguishes matched pairs from alternatives. The definition of positive pairs determines which biological variation is preserved or suppressed.

Source: [original reference or official documentation](https://arxiv.org/abs/1807.03748).

## Cosine Similarity

The normalized dot product of two nonzero vectors, ranging from −1 to 1. A mean cosine of 0.28 is not 28% classification accuracy.

Source: [original reference or official documentation](https://scikit-learn.org/stable/modules/generated/sklearn.metrics.pairwise.cosine_similarity.html).

## Cross-Boundary Direction Correctness

Cross-boundary direction correctness (CBDir) averages cosine alignment between a source-cell velocity and displacements toward neighbors in an annotated successor cluster. In-cluster coherence compares velocities within a cluster. Other angle-consistency definitions are benchmark-specific. Report the embedding, labels and aggregation; agreement alone does not establish cell fate.

Source: [original reference or official documentation](https://doi.org/10.1038/s41592-023-01994-w).

## Data Scaling Laws

Empirical relationships between resources such as training data, model size or compute and measured performance. Extrapolation beyond the fitted regime is not guaranteed.

Source: [original reference or official documentation](https://arxiv.org/abs/2001.08361).

## DeepSets

Architectures for set-valued inputs using permutation-compatible element transforms and aggregation. Invariance of pooled outputs differs from equivariance of element-wise outputs.

Source: [original reference or official documentation](https://arxiv.org/abs/1703.06114).

## Distributed Data Parallel

Distributed computation divides work across processes or devices. PyTorch DDP synchronizes gradients across replicas; it does not automatically remove data-loader or reproducibility issues.

Source: [original reference or official documentation](https://docs.pytorch.org/docs/stable/generated/torch.nn.parallel.DistributedDataParallel.html).

## E-distance

A distance between distributions based on expected pairwise distances. In single-cell perturbation studies, preprocessing, sample size and the estimator affect the result.

Source: [original reference or official documentation](https://doi.org/10.1038/s41592-023-02144-y).

## Focal Loss

A loss that downweights easy examples relative to hard examples; developed for addressing foreground/background imbalance in object detection.

Source: [original reference or official documentation](https://arxiv.org/abs/1708.02002).

## Integrated Gradients

Feature attribution obtained by integrating gradients along a path from a baseline to an input. Attribution depends on the baseline and does not establish causality.

Source: [original reference or official documentation](https://arxiv.org/abs/1703.01365).

## In-Context Learning

Task adaptation through examples or instructions supplied in the context without updating the model’s weights during that interaction.

Source: [original reference or official documentation](https://arxiv.org/abs/2005.14165).

## KL-divergence

A directed discrepancy between probability distributions. It is nonnegative when defined, generally asymmetric, and not a distance metric.

Source: [original reference or official documentation](https://doi.org/10.1214/aoms/1177729694).

## L1 Regularization

Penalties on parameter magnitude: L1 sums absolute values, while the common L2 penalty sums squares. Their effect depends on scaling and parameterization; they do not directly prove biological sparsity.

Source: [original reference or official documentation](https://web.stanford.edu/~hastie/ElemStatLearn/).

## Label Smoothing

A training convention that mixes hard class labels with a softer target distribution. It changes the objective and can affect confidence calibration.

Source: [original reference or official documentation](https://arxiv.org/abs/1512.00567).

## LoRA

Low-rank adaptation learns a low-rank update to selected weight matrices, reducing the number of trainable parameters for adaptation.

Source: [original reference or official documentation](https://arxiv.org/abs/2106.09685).

## MLP

A multilayer perceptron is a feed-forward neural network composed of affine transformations and nonlinear activations. It is a useful baseline whose capacity should be matched to the task.

Source: [original reference or official documentation](https://www.deeplearningbook.org/contents/mlp.html).

## MSE

Mean squared error averages squared residuals. A reconstruction objective may instead use a count likelihood or another discrepancy; specify the scale and likelihood used.

Source: [original reference or official documentation](https://docs.pytorch.org/docs/stable/generated/torch.nn.MSELoss.html).

## Macro-F1

The unweighted mean of class-specific F1 scores. Unlike micro averaging, it gives each included class equal weight; handling of absent classes must be stated.

Source: [original reference or official documentation](https://scikit-learn.org/stable/modules/generated/sklearn.metrics.f1_score.html).

## MCTS

A search procedure that uses repeated simulations to balance exploration and exploitation in a decision tree; its value estimates depend on the rollout/model assumptions.

Source: [original reference or official documentation](https://doi.org/10.1109/TCIAIG.2012.2186810).

## Mutual information estimation

Estimating dependence between variables through information-theoretic objectives. High-dimensional estimates can depend strongly on the estimator and sample size.

Source: [original reference or official documentation](https://arxiv.org/abs/1801.04062).

## PCC-delta

Pearson correlation evaluated on changes relative to a control reference. The control definition, gene subset and aggregation level must be reported; it differs from correlation of raw expression.

Source: [original reference or official documentation](https://github.com/ArcInstitute/cell-eval).

## Reciprocal Rank Fusion

A retrieval fusion rule that combines rank positions from several ranked lists. Its smoothing constant and candidate pools must be specified.

Source: [original reference or official documentation](https://doi.org/10.1145/1571941.1572114).

## Reinforcement Learning

Learning a policy from a reward signal through interaction or recorded experience. Reward improvement need not imply improved scientific validity.

Source: [original reference or official documentation](http://incompleteideas.net/book/the-book-2nd.html).

## Retrieval-Augmented Generation

A system retrieves external context to condition generation. Retrieval provenance and generation accuracy require separate checks.

Source: [original reference or official documentation](https://arxiv.org/abs/2005.11401).

## Score Matching

Estimating the gradient of a log-density by a score-based objective. Denoising and diffusion formulations extend this idea across noise levels.

Source: [original reference or official documentation](https://jmlr.org/papers/v6/hyvarinen05a.html).

## State-space models

State-space models evolve latent states and map them to observations. Mamba is a selective state-space neural architecture; its learned states need not be biological state variables.

Source: [original reference or official documentation](https://arxiv.org/abs/2312.00752).

## Hyena

A sequence-modeling operator based on long convolutions and gating, proposed as an alternative to attention for long sequences.

Source: [original reference or official documentation](https://arxiv.org/abs/2302.10866).

## Supervised Fine-Tuning

Updating model parameters using task-specific labeled examples. It should be distinguished from frozen-feature probing and inference without weight updates.

Source: [original reference or official documentation](https://arxiv.org/abs/2203.02155).

## Triplet Loss

A metric-learning objective encouraging an anchor to be closer to a matched example than to a mismatched example, usually by a margin.

Source: [original reference or official documentation](https://arxiv.org/abs/1503.03832).

## kNN

A nearest-neighbor method that bases retrieval or prediction on nearby observations. The metric, representation, neighborhood size and reference set determine the behavior.

Source: [original reference or official documentation](https://scikit-learn.org/stable/modules/neighbors.html).

## Zero-Inflated Poisson

A mixture of a point mass at zero and a Poisson distribution. Many zeros alone do not prove that this is the appropriate count model.

Source: [original reference or official documentation](https://doi.org/10.2307/1269547).

## oNMF

Orthogonal nonnegative matrix factorization decomposes a nonnegative matrix under a chosen orthogonality constraint. Gene-program factors depend on preprocessing, rank and optimization.

Source: [original reference or official documentation](https://doi.org/10.1145/1150402.1150420).

## Representation Learning

Learning transformations of data into features or embeddings useful for downstream tasks. A useful representation is task-dependent; embedding similarity alone does not establish biological equivalence or causality.

Source: [Bengio et al., representation-learning review](https://arxiv.org/abs/1206.5538).
