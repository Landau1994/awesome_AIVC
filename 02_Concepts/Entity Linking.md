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

**Entity Linking (EL)** is an NLP task that maps mentions of entities in text to their corresponding entries in a knowledge base or ontology. After identifying entities via NER, linking assigns them to standardized identifiers (e.g., "CD4+ T cell" → CL:0000624).

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
  "CD4+ T cell" → CL:0000624
  "CD8+ T cell" → CL:0000625
```

## Key Concepts

### Entity Disambiguation
**Problem**: Multiple mentions may refer to same entity
```
"T cells were isolated from blood."
"T lymphocytes were cultured in vitro."
"T lymphocyte populations..."
```
These are potential mentions of T cells; contextual qualifiers determine the appropriate term. A T-cell receptor is a molecular entity, not a cell-type mention.

**Solution**: Link all to single [[Cell Ontology]] term: CL:0000084

### Exact vs Related Matches
**Exact**: Mention directly matches ontology term
- "CD4+ T cell" → CL:0000624 (exact match in CL)

**Related**: Mention expresses concept not yet in ontology
- "regulatory CD4+ T cell in lung" → CL:0000624 + information about function/location
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
- Examples: [[05_Tools/Methods and Data Resources#SapBERT|SapBERT]], [[05_Tools/Methods and Data Resources#MedCPT|MedCPT]]

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
✅ Can propose matches for novel descriptions, subject to verification

**Disadvantages**:
⚠️ Slow (multiple API calls per entity)
⚠️ Expensive
⚠️ Less reproducible

## Biomedical EL Challenges

### 1. Terminology Variation
- 10+ names for same cell type
- Synonyms, abbreviations, colloquialisms
- Broad helper T-cell terms and subtype terms such as type 1 helper T cells are related but not interchangeable

### 2. Ontology Incompleteness
- Ontologies lag behind literature
- Some mentions require related rather than exact ontology matches; corpus-specific fractions are not the fraction of all newly discovered cell types missing from CL
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
| OpenAI text-embedding-3-large | 0.812 | Not benchmarked here | API-dependent |
| GPT-5.2 Agent (LLM) | 0.892 | Slow ⭐⭐ | $$$$ |

**Scope**: These are overall F1 values for exact CL matches in CellLink Table 5, not all-ID or cell-phenotype-only F1. GPT-5.2 led this particular comparison; speed/cost symbols above are qualitative, not measured benchmarks.

## Implementation Approaches

### Simple Embedding-Based Linking

```python
import torch
import torch.nn.functional as F
from transformers import AutoTokenizer, AutoModel

checkpoint = "cambridgeltl/SapBERT-from-PubMedBERT-fulltext"
tokenizer = AutoTokenizer.from_pretrained(checkpoint)
model = AutoModel.from_pretrained(checkpoint).eval()
mention = "CD4-positive T cells"
terms = ["CD4-positive, alpha-beta T cell", "CD8-positive, alpha-beta T cell", "T cell"]
tokens = tokenizer([mention] + terms, padding=True, truncation=True, return_tensors="pt")
with torch.no_grad():
    # This checkpoint uses the final CLS state before the pooler.
    vectors = F.normalize(model(**tokens).last_hidden_state[:, 0, :], dim=1)
scores = vectors[1:] @ vectors[0]
print(terms[int(scores.argmax())])
# Retrieve candidates only; assess specificity, context and no-match cases separately.
```

### LLM-Based Reasoning

Conceptual workflow (not executable SDK code):

1. Retrieve candidate ontology identifiers, definitions and synonyms.
2. Supply the mention and its surrounding text to a language model.
3. Request a ranked candidate and an exact/related/no-match assessment.
4. Validate the returned identifier against the pinned ontology release.
5. Route uncertain or proposed new concepts to expert review.

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
⚠️ **Scalability**: Retrieval cost depends on ontology size and indexing; 50K+ is not a stated size of CL
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

**Last Updated**: 2026-10-20

## Verification (2026-10-20)

Exact CD4/CD8 examples assume alpha-beta T-cell context. The previous OpenAI embedding F1 of 0.835 was corrected to 0.812. [CellLink preprint, Table 5](https://pmc.ncbi.nlm.nih.gov/articles/PMC12918994/); [SapBERT implementation](https://github.com/cambridgeltl/sapbert). The illustrative linking code has not been executed against a pinned environment.
