---
title: Molecular Representations
aliases: [Molecule Embeddings, Chemical Representations]
tags:
  - concept
  - AIVC
  - chemistry
  - drug-discovery
  - learning-path
category: Core Technique
importance: medium
date_created: 2026-01-16
last_updated: 2026-01-16
---

# Molecular Representations

## Definition
> Molecular representations encode chemical structures as numerical vectors suitable for machine learning. In AIVC, they enable prediction of cellular responses to novel drugs based on their chemical structure.

## Key Ideas
- **Structure encoding**: Convert molecules to vectors
- **Structure-activity relationships**: Similar structures → similar effects
- **Transfer learning**: Pre-trained chemical embeddings
- **Novel drug prediction**: Predict effects of unseen compounds

## Representation Types

| Type | Method | Example |
|------|--------|---------|
| **Fingerprints** | Binary vectors | ECFP, MACCS |
| **Descriptors** | Physicochemical properties | RDKit descriptors |
| **Graph-based** | GNN on molecular graph | MPNN, AttentiveFP |
| **Pre-trained** | Language model on SMILES | ChemBERTa, MolBERT |

## Application: chemCPA

```
Drug SMILES → Molecule Encoder → Perturbation Embedding → Cell Response
```

- Pre-trained molecule encoder (CDDD, MolBERT)
- Maps structure to perturbation effect
- Enables novel drug prediction
- [[01_Papers/chemCPA|chemCPA]]

## Tools
- **RDKit**: Fingerprints, descriptors
- **DeepChem**: GNN models
- **ChemBERTa**: Pre-trained transformer

## Related Concepts
- [[02_Concepts/Drug Discovery|Drug Discovery]]
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]

## Key Papers
- [[01_Papers/chemCPA|chemCPA]]
