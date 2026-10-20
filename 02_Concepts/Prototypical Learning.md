---
title: Prototypical Learning
aliases: [Prototypical Networks, Prototype Learning]
tags:
  - concept
  - machine-learning
  - few-shot
  - metric-learning
date_created: 2026-03-25
status: draft
---

# Prototypical Learning

## Overview

**Prototypical Learning** (or Prototypical Networks) is a meta-learning approach for few-shot classification. Instead of learning a classifier with many parameters, it learns an embedding space where classification is performed by computing distances to class prototypes (mean embeddings of support examples).

## Core Idea

### Traditional Classification
```
Input → Neural Network → Weights → Class probabilities
(needs many labeled examples)
```

### Prototypical Learning
```
Query Example → Embedding Space
                    ↓
            Compute distance to:
            - Dog Prototype (mean of dog examples)
            - Cat Prototype (mean of cat examples)
                    ↓
            Assign to closest prototype
(works with 1-5 labeled examples per class)
```

## How It Works

### 1. Support Set
Learn prototypes from a small set of labeled examples:
- 1-shot: 1 labeled example per class
- 5-shot: 5 labeled examples per class
- Each class prototype = mean embedding of support examples

### 2. Query Set
Classify new examples:
- Embed query example
- Compute distance to each prototype
- Classify as closest prototype

### 3. Mathematical Formulation

For class $c$ with support set $S_c$:
$$\text{Prototype}_c = \frac{1}{|S_c|} \sum_{(x,y) \in S_c} f_\theta(x)$$

Classification of query $x_q$:
$$P(y=c|x_q) = \text{softmax}(-d(f_\theta(x_q), \text{Prototype}_c))$$

where $d$ is typically Euclidean or cosine distance.

## Advantages in Few-Shot Scenarios

✅ **Low Sample Complexity**: Works with 1-5 examples
✅ **Simple**: Easy to implement and understand
✅ **Fast**: No retraining needed; just compute prototypes
✅ **Interpretable**: Prototypes are mean embedding vectors; they need not correspond to an observed or biologically valid cell
✅ **Transferable in suitable settings**: Cross-domain performance must be measured

## Applications in Single-Cell Biology

### 1. Few-Shot Cell Type Annotation
**Problem**: New dataset with rare cell types, only 1-5 reference examples

**Solution**:
- Learn embedding space from base cell types
- Use prototypical networks to classify new rare cells
- Efficiently leverage scarce annotations

### 2. Cross-Species Transfer
- Learn embeddings on human cells
- Use few mouse examples to adapt
- Classify mouse cells with minimal labels

### 3. Disease-Specific Cell Types
- Have reference "healthy" cells
- Use few "diseased" examples
- Classify disease cells in new patient

## Workflow Example

```python
import numpy as np

# support_embeddings: (n_support, d); query_embeddings: (n_query, d)
# support_labels supplies one class label per support example.
classes = np.unique(support_labels)
prototypes = np.stack([
    support_embeddings[support_labels == c].mean(axis=0) for c in classes
])
distances = ((query_embeddings[:, None, :] - prototypes[None, :, :]) ** 2).sum(axis=2)
predictions = classes[distances.argmin(axis=1)]
```

## Comparison with Other Few-Shot Methods

| Method | Mechanism | Speed | Interpretability |
|--------|-----------|-------|-----------------|
| **Prototypical Networks** | Distances to prototypes | Fast ⭐⭐⭐⭐⭐ | High ⭐⭐⭐⭐ |
| Matching Networks | Attention | Medium ⭐⭐⭐⭐ | Medium ⭐⭐⭐ |
| MAML | Meta-gradient | Slow ⭐⭐⭐ | Low ⭐⭐ |
| Fine-tuning | Retraining | Slow ⭐⭐⭐ | Low ⭐⭐ |

## Key Parameters

### Distance Metric
- **Squared Euclidean**: Used in the original formulation; it is compatible with a spherical Gaussian class model, but applying the distance alone does not prove Gaussian data
- **Cosine**: Better for normalized embeddings
- **Learnable**: Can learn metric end-to-end

### Number of Shots
- **1-shot**: Very few examples, harder
- **5-shot**: More stable, practical
- **10-shot**: Additional labels may help; the gain depends on the task

### Embedding Dimension
- Larger → more expressive but slower
- Typical: 256-1024 dimensions

## Limitations

⚠️ **Intra-class Variance**: If class varies a lot, mean prototype suboptimal
⚠️ **Distance Metric Choice**: Euclidean vs cosine makes a difference
⚠️ **Requires Good Embeddings**: Quality depends on base encoder training
⚠️ **Distribution Shift**: Prototypes may not represent query distribution

## Implementation Frameworks

- **PyTorch**: Manual implementation or libraries like `torchmeta`
- **TensorFlow**: Keras with custom training loops
- **Specialized**: Hugging Face models with prototypical heads

## Related Concepts

- [[02_Concepts/Transfer Learning Biology|Transfer Learning]] - Uses pre-trained embeddings
- [[02_Concepts/Single-Cell Embeddings|Cell Embeddings]] - The representation space
- [[02_Concepts/Zero-shot Learning|Zero-shot Learning]] - Related but different paradigm
- Few-shot Learning - Broader category

## Recent Work in Single-Cell

[[bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models|The single-cell benchmark]] evaluates few-shot classification with pretrained embeddings. The former ~85% liver accuracy and “same prototypes across datasets” claims lack a pinpointed experimental setting here and are withdrawn.

## See Also

- **Meta-Learning**: Learning to learn concept
- **Metric Learning**: Learning embeddings for distance comparisons
- **Transfer Learning**: Reusing pre-trained encoders

---

**Last Updated**: 2026-10-20

## Verification (2026-10-20)

[Prototypical Networks original paper](https://arxiv.org/abs/1703.05175). The encoder is learned on training tasks; fixed-encoder inference still requires a prototype for every supported class. No-shot labels require additional semantic information.
