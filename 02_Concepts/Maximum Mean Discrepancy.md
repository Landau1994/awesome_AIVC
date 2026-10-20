---
title: Maximum Mean Discrepancy
aliases: [MMD]
tags:
  - concept
  - AIVC
date_created: 2026-10-20
last_updated: 2026-10-20
status: reviewed
---

# Maximum Mean Discrepancy

## Definition

Maximum mean discrepancy compares two probability distributions through their mean embeddings in a reproducing-kernel Hilbert space. For kernel $k$, independent $X,X'\sim P$ and $Y,Y'\sim Q$,

$$\operatorname{MMD}_k^2(P,Q)=\mathbb{E}k(X,X')+\mathbb{E}k(Y,Y')-2\mathbb{E}k(X,Y).$$

With a characteristic kernel and appropriate integrability assumptions, zero population MMD implies equal distributions. An arbitrary kernel need not distinguish every pair of distributions.

## In Single-Cell Modeling

MMD can compare generated and measured expression distributions without paired cells. Its value depends on feature space, normalization, kernel, bandwidth and sample size. Report these choices when comparing methods.

A small empirical MMD does not prove biological equivalence or correct cell-level counterfactuals. The unbiased estimator of squared MMD can be negative in finite samples; the biased estimator is nonnegative. A statistic alone is not a calibrated hypothesis test without an appropriate null procedure.

## Related Concepts

- [[Generative Models]]
- [[Optimal Transport]]
- [[Perturbation Prediction]]

## Source

- [Gretton et al., A Kernel Two-Sample Test (2012)](https://jmlr.org/papers/v13/gretton12a.html)
