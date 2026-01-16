---
title: Transformers for Biology
aliases: [Biological Transformers, Attention for Biology]
tags:
  - concept
  - AIVC
  - deep-learning
  - transformer
  - attention
  - learning-path
category: Core Technique
importance: critical
date_created: 2026-01-16
last_updated: 2026-01-16
---

# Transformers for Biology

## Definition
> Transformers are attention-based neural networks that have revolutionized biological sequence modeling. In AIVC, they serve as the backbone for cell foundation models, learning relationships between genes and capturing cellular states.

## Key Ideas
- **Self-attention**: Every element attends to every other element
- **Parallelizable**: Unlike RNNs, processes all positions simultaneously
- **Long-range dependencies**: Captures distant relationships
- **Pre-training**: Learn from massive unlabeled biological data

## Why Transformers for Single-Cell?

### The Analogy
| NLP | Single-Cell Biology |
|-----|---------------------|
| Word | Gene |
| Sentence | Cell |
| Vocabulary | ~20,000 genes |
| Corpus | Millions of cells |
| Context | Co-expressed genes |

### Key Insight
> Genes that are co-expressed may have functional relationships, similar to how words in a sentence have semantic relationships

## Mathematical Formulation

### Self-Attention
$$\text{Attention}(Q, K, V) = \text{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V$$

### Multi-Head Attention
$$\text{MultiHead}(Q, K, V) = \text{Concat}(\text{head}_1, ..., \text{head}_h)W^O$$

### Transformer Block
```
Input → LayerNorm → MultiHeadAttention → + → LayerNorm → FFN → + → Output
         ↑_____________________________|        ↑______________|
                  (Residual)                      (Residual)
```

## Adaptations for Single-Cell

### Challenge 1: Gene Expression is Not Sequential
**NLP**: Words have order (sentence structure)
**scRNA-seq**: Genes have no inherent order

**Solutions**:
- Geneformer: Rank genes by expression (most → least expressed)
- scGPT: Learn positional embeddings per gene
- CellPLM: Treat cells as tokens, tissues as sentences

### Challenge 2: Expression Values are Continuous
**NLP**: Discrete tokens (vocabulary)
**scRNA-seq**: Continuous expression values

**Solutions**:
- Binning: Discretize into value bins
- Rank encoding: Use expression rank as position
- Value embeddings: Embed continuous values

### Challenge 3: Variable Gene Sets
**NLP**: Fixed vocabulary
**scRNA-seq**: Different genes measured per experiment

**Solutions**:
- Union vocabulary: Include all ~20K genes
- Masked attention: Only attend to measured genes
- Gene embeddings: Fixed embedding per gene

## Cell Foundation Model Architectures

### scGPT Architecture
```
Gene Expression Vector
↓
Gene Tokenization (binning)
↓
Gene Embeddings + Value Embeddings + Condition Embeddings
↓
Transformer Encoder (masked gene modeling)
↓
Cell Embedding / Gene Predictions
```

### Geneformer Architecture
```
Gene Expression Vector
↓
Rank Encoding (sort genes by expression)
↓
Gene Embeddings (ordered by rank)
↓
Transformer Encoder
↓
Cell Embedding
```

### Key Differences

| Model | Tokenization | Encoding | Pre-training |
|-------|--------------|----------|--------------|
| scGPT | Binned values | Gene + value + condition | Masked gene prediction |
| Geneformer | Rank order | Gene position = rank | Masked gene prediction |
| scFoundation | Read-depth aware | Asymmetric | Masked prediction |
| CellPLM | Cell-level | Cells as tokens | Masked cell prediction |

## Attention Patterns in Biology

### What Attention Captures
- **Gene-gene co-expression**: Functionally related genes attend to each other
- **Regulatory relationships**: TFs attend to target genes
- **Pathway membership**: Genes in same pathway attend together

### Extracting Biological Insights
```python
# Extract attention weights
attention_weights = model.get_attention(cell)

# Attention can reveal gene relationships
# High attention between gene A and B suggests functional link
```

## Pre-training Objectives

### Masked Gene Modeling (Most Common)
- Mask 15-40% of genes
- Predict masked gene expression
- Similar to BERT's MLM

### Contrastive Learning
- Similar cells → similar embeddings
- Different cells → different embeddings

### Generative Pre-training
- Predict next gene (autoregressive)
- Similar to GPT

## Code Example

```python
import torch
import torch.nn as nn

class CellTransformer(nn.Module):
    def __init__(self, n_genes, d_model, n_heads, n_layers):
        super().__init__()
        self.gene_embed = nn.Embedding(n_genes, d_model)
        self.value_embed = nn.Linear(1, d_model)

        encoder_layer = nn.TransformerEncoderLayer(
            d_model=d_model,
            nhead=n_heads,
            batch_first=True
        )
        self.transformer = nn.TransformerEncoder(
            encoder_layer,
            num_layers=n_layers
        )

    def forward(self, gene_ids, expression_values):
        # Combine gene identity and expression value
        x = self.gene_embed(gene_ids) + self.value_embed(expression_values)

        # Transformer encoding
        out = self.transformer(x)
        return out
```

## Comparison: Transformer vs GNN vs VAE

| Aspect | Transformer | GNN | VAE |
|--------|-------------|-----|-----|
| Inductive bias | Attention (implicit) | Graph structure (explicit) | Latent distribution |
| Scalability | O(n²) attention | O(edges) | O(n) |
| Pre-training | Easy (MLM) | Harder | Reconstruction |
| Knowledge integration | Implicit | Explicit edges | Implicit |

## Related Concepts
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Single-Cell Embeddings|Single-Cell Embeddings]]
- [[02_Concepts/Graph Neural Networks|Graph Neural Networks]]

## Key Papers
- [[01_Papers/scGPT|scGPT]]
- [[01_Papers/Geneformer|Geneformer]]
- [[01_Papers/scFoundation|scFoundation]]
- [[01_Papers/CellPLM|CellPLM]]

## Tools & Implementations
- [scGPT](https://github.com/bowang-lab/scGPT)
- [Geneformer](https://huggingface.co/ctheodoris/Geneformer)
- [HuggingFace Transformers](https://huggingface.co/transformers/)

## Learning Resources
- "Attention Is All You Need" (original paper)
- Stanford CS224N: NLP with Deep Learning
- Jay Alammar's "The Illustrated Transformer"
