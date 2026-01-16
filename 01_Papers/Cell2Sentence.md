---
title: "Cell2Sentence: Teaching Large Language Models the Language of Biology"
aliases: [Cell2Sentence, C2S, C2S-Scale]
authors:
  - Daniel Levine
  - Syed Asad Rizvi
  - Sacha Lévy
  - Nazreen Palani
  - David Zhang
  - Xingyu Chen
  - Marco Hennig
  - Erdem Varol
  - Pascal Notin
  - Debora Marks
  - David van Dijk
year: 2024
journal: ICML 2024 / bioRxiv
doi: 10.1101/2025.04.14.648850
url: https://github.com/vandijklab/cell2sentence
tags:
  - paper
  - AIVC
  - foundation-model
  - LLM
  - single-cell
  - Google
  - instruction-tuning
  - learning-path
status: unread
rating:
priority: P1
date_added: 2026-01-16
date_read:
---

# Cell2Sentence: Teaching Large Language Models the Language of Biology

## Quick Summary
> Cell2Sentence (C2S) transforms single-cell gene expression into natural language "cell sentences" to directly adapt large language models to biology. The scaled version (C2S-Scale), developed with Google, reaches 27B parameters trained on 57M cells and enables novel capabilities like perturbation prediction, biological Q&A, and even discovered a new cancer therapy pathway.

## Key Points
- **Novel paradigm**: Gene expression → text sentences for LLM processing
- **Google collaboration**: Yale + Google Research + DeepMind
- **Massive scale**: 27B parameters, 57M cells from CellxGene + HCA
- **Unified modality**: Combines transcriptomic + textual data
- **Real discovery**: Identified novel cancer immunotherapy pathway (validated!)

## The Innovation

### Core Idea: Cells as Sentences
```
Traditional: Gene expression vector [g1=5.2, g2=0.1, g3=8.7, ...]
     ↓
C2S Transform: "TP53 high, MYC high, BRCA1 medium, ..."
     ↓
LLM Processing: Standard language model can now process biology
```

### Why This Matters
- Leverage massive LLM pre-training investment
- Natural language interface for biology
- Instruction following for flexible tasks
- Text generation for interpretable outputs

## Methods

### Cell2Sentence Transformation
```
Single Cell Gene Expression
↓
1. Rank genes by expression level
2. Select top N most active genes
3. Convert to text: "gene1, gene2, gene3, ..."
↓
"Cell Sentence" (text format)
```

### Architecture Evolution

| Model | Parameters | Base LLM | Training Data |
|-------|------------|----------|---------------|
| C2S-160M | 160M | Pythia-160M | Initial release |
| C2S-410M | 410M | Pythia | Scaled |
| C2S-1B | 1B | Gemma-2 | 57M cells |
| C2S-2B | 2B | Gemma-2 | 57M cells |
| C2S-9B | 9B | Gemma-2 | 57M cells |
| **C2S-27B** | **27B** | **Gemma-2** | **57M cells** |

### Training Approach
1. **Base LLM**: Start with Gemma-2 (Google's open model)
2. **Instruction fine-tuning**: Train on cell sentences + task instructions
3. **Multi-task**: Cell type prediction, perturbation, Q&A, summarization

### Training Data
- **Source**: CellxGene + Human Cell Atlas
- **Scale**: 800+ datasets, 57M human and mouse cells
- **Format**: Instruction-tuned examples

## Capabilities

### 1. Cell Type Annotation
```
Input: "What cell type is: TP53, MYC, CD4, ..."
Output: "This is a T helper cell because..."
```

### 2. Perturbation Prediction
```
Input: "Predict expression after knocking out BRCA1 in: ..."
Output: "Expected changes: TP53 increases, cell cycle genes decrease..."
```

### 3. Dataset Summarization
```
Input: "Summarize this single-cell dataset..."
Output: "This dataset contains 5 cell types, predominantly..."
```

### 4. Cluster Captioning
```
Input: "Describe cluster 3..."
Output: "Cluster 3 represents activated T cells characterized by..."
```

### 5. Biological Q&A
```
Input: "What pathways are active in these cells?"
Output: "Based on the gene expression, immune response pathways..."
```

## Breakthrough Discovery

### Cancer Immunotherapy Finding
> C2S-Scale generated a novel hypothesis about cancer cellular behavior that was experimentally validated

#### The Discovery
- Model predicted a mechanism to make "cold" tumors "hot"
- Identified interferon-conditional amplifier pathway
- Could make tumors more responsive to immunotherapy

#### Validation
- In silico prediction confirmed multiple times in vitro
- First AI-generated biological hypothesis validated experimentally
- Demonstrates real scientific utility

## Results

### Benchmark Performance
| Task | C2S-Scale Performance |
|------|----------------------|
| Cell type annotation | Competitive with specialized models |
| Perturbation prediction | Strong |
| Zero-shot generalization | Excellent |
| Biological reasoning | Novel capability |

### Scaling Laws
- Performance improves with model size
- 27B significantly better than smaller variants
- Follows LLM scaling trends

## Comparison with Other Foundation Models

| Model | Approach | Text Interface | Reasoning |
|-------|----------|----------------|-----------|
| scGPT | Gene tokenization | No | Limited |
| Geneformer | Rank encoding | No | Limited |
| **C2S** | **Cell sentences** | **Yes** | **Yes** |
| UCE | ESM2 + Transformer | No | Limited |

### Unique Advantages of C2S
1. **Natural language I/O**: Ask questions in plain English
2. **Instruction following**: Flexible task specification
3. **Explainable**: Generates text explanations
4. **LLM knowledge**: Leverages pre-trained knowledge

## Critical Analysis

### Strengths
- Novel paradigm bridging NLP and biology
- Google collaboration ensures scale and quality
- Experimentally validated discovery
- Flexible instruction-based interface
- Open models available

### Weaknesses
- Information loss in text conversion
- Computational cost (27B parameters)
- Depends on LLM base model quality
- Ranking loses absolute expression values

### Questions
- Optimal number of genes in cell sentence?
- How to handle rare genes?
- Comparison with multimodal approaches?

## Connections

### Related Papers
- [[01_Papers/scGPT|scGPT]] - Different tokenization
- [[01_Papers/Geneformer|Geneformer]] - Rank-based encoding
- [[01_Papers/UCE|UCE]] - Cross-species foundation model

### Related Concepts
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Transformers for Biology|Transformers for Biology]]
- [[02_Concepts/Single-Cell Embeddings|Single-Cell Embeddings]]

## Tools & Code

### Repositories
- GitHub: https://github.com/vandijklab/cell2sentence
- HuggingFace: https://huggingface.co/vandijklab/C2S-Scale-Gemma-2-27B

### Model Variants
- `vandijklab/C2S-Scale-Gemma-2-27B` (largest)
- Smaller variants available (2B, 9B)

### Usage
```python
from transformers import AutoModelForCausalLM, AutoTokenizer

model = AutoModelForCausalLM.from_pretrained("vandijklab/C2S-Scale-Gemma-2-27B")
tokenizer = AutoTokenizer.from_pretrained("vandijklab/C2S-Scale-Gemma-2-27B")

# Convert cell to sentence
cell_sentence = "TP53, MYC, BRCA1, CD4, ..."

# Ask a question
prompt = f"What cell type is this: {cell_sentence}"
output = model.generate(tokenizer(prompt, return_tensors="pt").input_ids)
```

## Resources
- [Google Research Blog](https://research.google/blog/teaching-machines-the-language-of-biology-scaling-large-language-models-for-next-generation-single-cell-analysis/)
- [Yale News](https://medicine.yale.edu/news-article/bridging-biology-and-ai-yale-and-googles-collaborative-breakthrough-in-single-cell-analysis/)
- [van Dijk Lab](https://www.vandijklab.org/c2s-scale)

## Citation
```bibtex
@article{levine2024cell2sentence,
  title={Cell2Sentence: Teaching Large Language Models the Language of Biology},
  author={Levine, Daniel and Rizvi, Syed Asad and Lévy, Sacha and others},
  booktitle={International Conference on Machine Learning (ICML)},
  year={2024}
}

@article{c2sscale2025,
  title={Scaling Large Language Models for Next-Generation Single-Cell Analysis},
  author={van Dijk Lab and Google Research and Google DeepMind},
  journal={bioRxiv},
  year={2025},
  doi={10.1101/2025.04.14.648850}
}
```
