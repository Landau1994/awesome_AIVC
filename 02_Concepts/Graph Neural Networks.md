---
title: Graph Neural Networks
aliases: [GNN, GNNs, Graph Networks]
tags:
  - concept
  - AIVC
  - deep-learning
  - GNN
  - learning-path
category: Core Technique
importance: high
date_created: 2026-01-16
last_updated: 2026-01-16
---

# Graph Neural Networks

## Definition
> Graph Neural Networks (GNNs) are neural networks designed to operate on graph-structured data, learning representations by aggregating information from neighboring nodes. In AIVC, they model gene-gene interactions, protein networks, and cell-cell relationships.

## Key Ideas
- **Message passing**: Nodes exchange information with neighbors
- **Permutation invariance**: Order of nodes doesn't matter
- **Relational inductive bias**: Explicitly model relationships
- **Flexible structure**: Handle varying graph sizes/topologies

## Why GNNs for Biology?

### Biological Data is Graph-Structured
| Biological Entity | Graph Representation |
|-------------------|---------------------|
| Genes | Gene regulatory networks |
| Proteins | Protein-protein interactions |
| Cells | Cell-cell communication |
| Molecules | Molecular graphs |

### Advantages over MLPs/Transformers
- Explicitly encode known relationships
- Incorporate biological knowledge graphs
- Scale to large networks efficiently
- Interpretable message passing

## Mathematical Formulation

### Message Passing Framework
For node $v$ at layer $l$:

$$\mathbf{h}_v^{(l+1)} = \text{UPDATE}\left(\mathbf{h}_v^{(l)}, \text{AGGREGATE}\left(\{\mathbf{h}_u^{(l)} : u \in \mathcal{N}(v)\}\right)\right)$$

### Common Architectures

#### Graph Convolutional Network (GCN)
$$\mathbf{H}^{(l+1)} = \sigma\left(\tilde{\mathbf{D}}^{-1/2}\tilde{\mathbf{A}}\tilde{\mathbf{D}}^{-1/2}\mathbf{H}^{(l)}\mathbf{W}^{(l)}\right)$$

#### Graph Attention Network (GAT)
$$\mathbf{h}_v^{(l+1)} = \sigma\left(\sum_{u \in \mathcal{N}(v)} \alpha_{vu} \mathbf{W}\mathbf{h}_u^{(l)}\right)$$

where $\alpha_{vu}$ are learned attention weights.

## Applications in AIVC

### 1. Perturbation Prediction (GEARS)
```
Gene perturbation signal
↓
Propagate through gene-gene knowledge graph
↓
Predict downstream expression changes
```
- Uses GO, STRING, co-expression networks
- Enables multi-gene perturbation prediction
- [[01_Papers/GEARS|GEARS paper]]

### 2. Gene Regulatory Network Inference
```
Gene expression data
↓
GNN learns gene-gene edges
↓
Predicted regulatory network
```

### 3. Drug-Target Interaction
```
Drug molecular graph + Target protein graph
↓
GNN encodes both
↓
Predict binding affinity
```

### 4. Cell-Cell Communication
```
Spatial transcriptomics
↓
Cells as nodes, spatial neighbors as edges
↓
Model signaling patterns
```

## Key GNN Variants

| Variant | Key Feature | Use Case |
|---------|-------------|----------|
| GCN | Spectral convolution | General graphs |
| GAT | Attention mechanism | Weighted relationships |
| GraphSAGE | Sampling neighbors | Large graphs |
| GIN | Injective aggregation | Graph classification |
| MPNN | Flexible message passing | Molecular property |

## Knowledge Graphs in AIVC

### Common Knowledge Sources
| Source | Information | Used By |
|--------|-------------|---------|
| Gene Ontology | Functional annotations | GEARS |
| STRING | Protein interactions | GEARS, GeneCompass |
| Reactome | Pathways | Various |
| KEGG | Metabolic pathways | Various |

### Integration Pattern
```python
# Combine expression + knowledge graph
knowledge_graph = load_go_annotations()
expression_features = encode_expression(adata)

# GNN propagates perturbation through knowledge
gnn_output = gnn(expression_features, knowledge_graph)
```

## Code Example

```python
import torch
from torch_geometric.nn import GCNConv, GATConv

class GeneGNN(torch.nn.Module):
    def __init__(self, in_dim, hidden_dim, out_dim):
        super().__init__()
        self.conv1 = GATConv(in_dim, hidden_dim)
        self.conv2 = GATConv(hidden_dim, out_dim)

    def forward(self, x, edge_index):
        # x: gene features, edge_index: gene-gene edges
        x = self.conv1(x, edge_index).relu()
        x = self.conv2(x, edge_index)
        return x

# Gene-gene graph from STRING/GO
edge_index = load_gene_network()
gene_features = get_perturbation_encoding()
output = model(gene_features, edge_index)
```

## Comparison with Transformers

| Aspect | GNN | Transformer |
|--------|-----|-------------|
| Structure | Explicit graph | Implicit (attention) |
| Prior knowledge | Easy to incorporate | Harder |
| Scalability | Better for sparse | Better for dense |
| Interpretability | Edge importance | Attention weights |

## Related Concepts
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]
- [[02_Concepts/Gene Regulatory Networks|Gene Regulatory Networks]]
- [[02_Concepts/Knowledge Graphs|Knowledge Graphs]]

## Key Papers
- [[01_Papers/GEARS|GEARS]] - GNN for perturbation
- [[01_Papers/GeneCompass|GeneCompass]] - Knowledge-informed

## Tools & Implementations
- [PyTorch Geometric](https://pytorch-geometric.readthedocs.io/)
- [DGL](https://www.dgl.ai/)
- [GEARS](https://github.com/snap-stanford/GEARS)

## Learning Resources
- Stanford CS224W: Machine Learning with Graphs
- PyTorch Geometric tutorials
- "A Gentle Introduction to GNNs" (Distill)
