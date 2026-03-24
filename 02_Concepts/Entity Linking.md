---
title: Entity Linking
aliases: [EL, Entity resolution, Ontology linking]
tags:
  - concept
  - NLP
  - knowledge-graphs
  - bioinformatics
  - ontologies
date_created: 2026-03-25
status: draft
---

# Entity Linking (EL)

## Overview

**Entity Linking (EL)** is an NLP task that maps mentions of entities in text to their corresponding entries in a knowledge base or ontology. After identifying entities via NER, linking assigns them to standardized identifiers (e.g., "CD4+ T cell" → CL:0000085).

## Task Pipeline

```
Raw Text
   ↓
Named Entity Recognition (NER)
   ↓
Extracted Mentions: "CD4+ T cell", "CD8+ T cell"
   ↓
Entity Linking (EL)
   ↓
Linked Entities:
  "CD4+ T cell" → CL:0000085
  "CD8+ T cell" → CL:0000786
```

## Key Concepts

### Entity Disambiguation
**Problem**: Multiple mentions may refer to same entity
```
"T cells were isolated from blood."
"T lymphocytes were cultured in vitro."
"T cell receptor expression..."
```
All refer to "T cells" but use different names

**Solution**: Link all to single [[Cell Ontology]] term: CL:0000084

### Exact vs Related Matches
**Exact**: Mention directly matches ontology term
- "CD4+ T cell" → CL:0000085 (exact match in CL)

**Related**: Mention expresses concept not yet in ontology
- "regulatory CD4+ T cell in lung" → CL:0000085 + information about function/location
- May suggest new ontology term

### Ambiguity in Biomedical Domain
```
"Active" in sentence: "The drug is active against..."
vs
"Activated T cells were stimulated..."
vs
"Activated macrophages produce..."
```
Same word, completely different meanings → requires context

## Approaches

### 1. Embedding-Based Methods
- Map mentions and ontology entries to embedding space
- Find nearest neighbor in embedding space
- Examples: [[SapBERT]], [[MedCPT]]

**Advantages**:
✅ Fast inference
✅ Scalable to large ontologies
✅ Easy to update with new entities

**Disadvantages**:
⚠️ Loss of semantic detail in fixed embeddings
⚠️ Struggles with out-of-distribution entities

### 2. Ranking Models
- Score candidate entities given mention context
- Trained on (mention, entity) pairs
- Return top-scoring matches

**Examples**: BioBERT-based rankers

### 3. Agentic/LLM Approaches
- Use LLM (GPT-4/5) to reason about best match
- Access ontology programmatically (e.g., via APIs)
- Multi-step: search → reason → verify

**Advantages**:
✅ Flexible reasoning
✅ Can identify "related" vs "exact" matches
✅ Handles novel entities better

**Disadvantages**:
⚠️ Slow (multiple API calls per entity)
⚠️ Expensive
⚠️ Less reproducible

## Biomedical EL Challenges

### 1. Terminology Variation
- 10+ names for same cell type
- Synonyms, abbreviations, colloquialisms
- "CD4+ helper T cells" vs "Th cells" vs "Type 1 helper cells"

### 2. Ontology Incompleteness
- Ontologies lag behind literature
- [[Cell Ontology]] missing ~30% of new cell types from 2019-2024 papers
- Solution: "related" matches can suggest new terms

### 3. Nested Mentions
- "Regulatory CD4+ T cells in the lung"
- Multiple valid links: CD4+ T cell, Regulatory T cell, Lung cell, etc.
- Which to choose?

### 4. Multi-organism Context
- Same cell type name used for human, mouse, rat, zebrafish
- Need to disambiguate based on context

## Recent Benchmarks

### CellLink Corpus Results

| Model | F1 Score | Speed | Cost |
|-------|----------|-------|------|
| SapBERT (embedding) | 0.842 | Fast ⭐⭐⭐⭐⭐ | Free |
| MedCPT (embedding) | 0.821 | Fast ⭐⭐⭐⭐⭐ | Free |
| OpenAI text-embedding-3 | 0.835 | Medium | $$ |
| GPT-5.2 Agent (LLM) | 0.892 | Slow ⭐⭐ | $$$$ |

**Key Finding**: LLM agents best performance but expensive; embeddings best speed-accuracy tradeoff

## Implementation Approaches

### Simple Embedding-Based Linking

```python
from sentence_transformers import SentenceTransformer
import numpy as np

# Load model
model = SentenceTransformer('dmis-lab/sapbert-from-biowordvec')

# Embed mention and all CL terms
mention_text = "CD4-positive T cells"
mention_emb = model.encode(mention_text)

cl_terms = ["CD4-positive, alpha-beta T cell",
            "CD8-positive, alpha-beta T cell",
            "T cell"]
cl_embs = model.encode(cl_terms)

# Find best match
scores = np.dot(mention_emb, cl_embs.T)
best_idx = np.argmax(scores)
print(f"Linked to: {cl_terms[best_idx]} (score: {scores[best_idx]:.3f})")
```

### LLM-Based Reasoning

```python
from openai import OpenAI
from ontology_access_kit import OntologyInterface

client = OpenAI()
oi = OntologyInterface()

mention = "Activated regulatory T cells"
# Query ontology for candidates
candidates = oi.search_terms(mention, limit=5)

# Use LLM to reason about best match
prompt = f"""
Given the mention: "{mention}"
And candidate ontology terms:
{candidates}

Which is the best match? Explain your reasoning.
Is this an exact match or does it suggest a new term?
"""

response = client.chat.completions.create(
    model="gpt-5.2",
    messages=[{"role": "user", "content": prompt}]
)
print(response.choices[0].message.content)
```

## Evaluation Metrics

### Linking Accuracy
- **Exact Match**: How many entities linked to correct CL ID
- **F1 Score**: Harmonic mean of precision/recall
- **Mean Reciprocal Rank**: Average rank of correct answer in candidates

### Match Type Accuracy
- Can the model distinguish exact vs related matches?
- Important for [[Biocuration]] (exact → update reference, related → consider new term)

## Applications

### 1. Knowledge Base Construction
- Automatically link mentions to ontologies
- Build knowledge graphs: cell type → genes → diseases → drugs
- Enable computational reasoning

### 2. Atlas Annotation
- Semi-automatic annotation of new datasets
- Map to [[Cell Ontology]] automatically
- Reduce curation workload

### 3. Literature Mining
- Extract knowledge from PubMed
- Track emerging cell type discoveries
- Identify research trends

### 4. Data Integration
- Normalize cell type names across studies
- Enable meta-analysis
- Cross-dataset comparisons

## Challenges & Future

### Current Bottlenecks
⚠️ **Scalability**: Large ontologies (50K+ terms) slow down EL
⚠️ **Ambiguity**: Context-dependent meanings hard to resolve
⚠️ **Cost**: LLM-based approaches expensive at scale
⚠️ **Ontology Lag**: Linking to incomplete ontologies problematic

### Future Directions
✅ **Hybrid Approaches**: Fast embedding search + LLM verification
✅ **Continual Learning**: Update embeddings as ontology grows
✅ **Zero-Shot**: Link to unseen cell types not in training
✅ **Uncertainty**: Confidence scores for linked entities

## Related Concepts

- [[Named Entity Recognition]] - First step (extract entities)
- [[Cell Ontology]] - Target knowledge base for linking
- [[Biocuration]] - Validating and improving linked entities
- Knowledge graphs - Using linked entities for reasoning

## Tools & Resources

- **SapBERT**: Biomedical entity linking model
- **MedCPT**: Medical entity embeddings
- **Ontology Access Kit (OAK)**: Query ontologies programmatically
- **Ontology Lookup Service (OLS)**: Web interface for querying
- **PubTator Central**: Online biomedical NER + linking service

## Key Papers

- SapBERT (Liu et al., 2021)
- MedCPT embeddings
- CellLink (recent; demonstrates entity linking for cell types)

---

**Last Updated**: 2026-03-25
