---
title: Named Entity Recognition
aliases: [NER, Entity extraction]
tags:
  - concept
  - NLP
  - text-mining
  - bioinformatics
date_created: 2026-03-25
status: draft
---

# Named Entity Recognition (NER)

## Overview

**Named Entity Recognition (NER)** is a Natural Language Processing (NLP) task that identifies and classifies named entities (specific things like cell types, genes, diseases) mentioned in text. For biomedical text, NER extracts domain-specific entities like cell phenotypes, proteins, or gene names.

## Task Definition

Given text:
```
"CD4-positive T cells and regulatory macrophages were isolated from lung tissue."
```

NER Output:
```
Entity: "CD4-positive T cells"     Type: CELL_TYPE
Entity: "regulatory macrophages"   Type: CELL_TYPE
Entity: "lung"                     Type: ANATOMY
```

## Approaches

### 1. Rule-Based (Traditional)
- Hand-crafted patterns and dictionaries
- Fast but brittle
- Limited to known entity patterns

### 2. Supervised Learning (Classic)
- Train on annotated corpus
- Methods: CRF, SVM, early neural nets
- Requires labeled training data

### 3. Deep Learning
- **LSTM-CRF**: Sequence labeling with character awareness
- **BERT-based**: Pre-trained models fine-tuned on domain data
- **Transformers**: State-of-the-art performance

### 4. Large Language Models (LLMs)
- **GPT-4/5**: Few-shot prompting without fine-tuning
- **In-context Learning**: Show examples in prompt
- Trade-off: Slower, more expensive, but very flexible

## Biomedical NER Challenges

### 1. Terminology Variation
- "CD4+ T cell", "CD4 T lymphocyte", "helper T cell" → same entity
- Cell naming varies by field (scRNA-seq: molecular, histology: morphological)

### 2. Nested Entities
- "Regulatory CD4+ T cells in lung tissue"
- Multiple levels: "T cells" ⊂ "CD4+ T cells" ⊂ "Regulatory CD4+ T cells"

### 3. Domain Specificity
- General NER fails on biomedical text
- "active" = linguistic feature vs "activated T cell" = biological state
- Requires domain knowledge

### 4. Evolving Vocabulary
- scRNA-seq introduces new cell type names constantly
- Static models become outdated
- [[bioRxiv 2026 Cell phenotypes in the biomedical literature a systematic analysis and text mining corpus|CellLink study]] shows rapid terminology shift 2019-2024

## Recent Benchmarks

### CellLink Corpus Results

| Model | F1 Score | Notes |
|-------|----------|-------|
| BiomedBERT (fine-tuned) | 0.874 | Best for cell phenotypes |
| GPT-4.1 (few-shot) | 0.612 | Slower, needs prompting |
| GPT-5.2 (few-shot) | 0.568 | More flexible but less accurate |
| Legacy CRAFT model | 0.36-0.58 | Outdated on modern terminology |

**Key Finding**: Fine-tuned BERT still outperforms LLMs on specific NER tasks

## Evaluation Metrics

### Exact Match
- Boundaries and entity type both correct
- Strictest metric
- Most practically relevant

### Partial Match
- Boundary overlap acceptable (e.g., "CD4 T cells" vs "CD4-positive T cells")
- Softer metric
- May be more useful for downstream tasks

### Per-Type Performance
- Different entity types have different difficulty
- Cell phenotypes: 87-90% F1
- Vague populations: 50-70% F1
- Heterogeneous populations: 70% F1

## Applications in Bioinformatics

### 1. Literature Mining
- Extract cell types from PubMed abstracts
- Build knowledge bases automatically
- Identify novel cell type discoveries

### 2. Atlas Curation
- Semi-automatically annotate new datasets
- Link to [[Cell Ontology]] terms
- Speed up [[Biocuration]] workflows

### 3. Knowledge Graph Construction
- Extract (cell type, tissue, disease) triples
- Link to genes, pathways, functions
- Enable reasoning about cell biology

## Implementation Example

```python
from transformers import pipeline

# Load pre-trained biomedical NER model
ner_pipeline = pipeline(
    "token-classification",
    model="d4data/biomedical-ner-all"
)

text = "CD4+ T cells infiltrated the tumor microenvironment."
results = ner_pipeline(text)

# Output: [
#   {'entity': 'B-CELL_TYPE', 'score': 0.99, 'word': 'CD4'},
#   {'entity': 'I-CELL_TYPE', 'score': 0.98, 'word': '+'},
#   ...
# ]
```

## Fine-Tuning Workflow

```python
from transformers import AutoTokenizer, AutoModelForTokenClassification

# 1. Load pre-trained BERT
model = AutoModelForTokenClassification.from_pretrained(
    "dmis-lab/biobert-base-cased-v1.1"
)

# 2. Fine-tune on CellLink corpus
trainer = Trainer(
    model=model,
    train_dataset=celllink_train,
    eval_dataset=celllink_eval,
    ...
)

# 3. Evaluate
trainer.train()
trainer.evaluate()
```

## Challenges & Future Directions

### Current Issues
⚠️ **Domain Shift**: Models trained on one corpus fail on another
⚠️ **Rare Entities**: Low-frequency cell types poorly recognized
⚠️ **Context Dependence**: Same phrase means different things in different papers
⚠️ **Annotation Cost**: Creating training corpora expensive and time-consuming

### Future Work
✅ **Continual Learning**: Models that adapt as new terminology emerges
✅ **Multi-lingual**: NER for non-English biomedical literature
✅ **Uncertainty**: Knowing when the model is uncertain
✅ **Interpretability**: Understanding why model made specific predictions

## Related Concepts

- [[Entity Linking]] - Mapping entities to knowledge bases (e.g., [[Cell Ontology]])
- [[Biocuration]] - Manual entity identification and validation
- [[Named Entity Recognition]] - This concept
- [[bioRxiv 2026 Cell phenotypes in the biomedical literature a systematic analysis and text mining corpus|CellLink]] - Modern NER corpus

## Tools & Resources

- **Hugging Face**: Pre-trained biomedical NER models
- **BioBERT**: Biomedical BERT variant
- **BiomedBERT**: Specialized for biomedical NER
- **spaCy**: NLP framework with biomedical models
- **PubTator**: Online biomedical NER and linking service

## Benchmarking Corpora

- **BioID**: Gene/protein NER (Arighi et al., 2017)
- **CRAFT**: Biomedical concept NER (Verspoor et al., 2012)
- **AnatEM**: Anatomical entity NER (Pyysalo et al., 2014)
- **CellLink**: Cell phenotype NER (recent; 22K annotations)

---

**Last Updated**: 2026-03-25
