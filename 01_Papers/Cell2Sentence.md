---
title: "Scaling Large Language Models for Next-Generation Single-Cell Analysis"
aliases: [Cell2Sentence, C2S, C2S-Scale]
authors:
  - Syed Asad Rizvi
  - Daniel Levine
  - Aakash Patel
  - Shiyang Zhang
  - Eric Wang
  - Curtis Jamison Perry
  - Ivan Vrkic
  - Nicole Mayerli Constante
  - Zirui Fu
  - Sizhuang He
  - David Zhang
  - Cerise Tang
  - Zhuoyang Lyu
  - Rayyan Darji
  - Chang Li
  - Emily Sun
  - David Jeong
  - Lawrence Zhao
  - Jennifer Kwan
  - David Braun
  - Brian Hafler
  - Hattie Chung
  - Rahul M. Dhodapkar
  - Paul Jaeger
  - Bryan Perozzi
  - Jeffrey Ishizuka
  - Shekoofeh Azizi
  - David van Dijk
year: 2025
journal: bioRxiv
doi: 10.1101/2025.04.14.648850
url: https://doi.org/10.1101/2025.04.14.648850
tags:
  - paper
  - AIVC
  - Foundation-Models
  - Single-cell
  - LLM
status: unread
rating:
date_added: 2025-12-31
date_read:
---

# Scaling Large Language Models for Next-Generation Single-Cell Analysis

## Quick Summary
This paper introduces **C2S-Scale**, a family of multimodal foundation models for single-cell biology ranging from 410 million to 27 billion parameters. Building on the Cell2Sentence framework, the authors train standard large language models (LLMs) on a massive corpus of over 50 million single-cell transcriptomes converted into text, alongside biological literature. The study demonstrates that scaling model size and data volume yields predictable improvements in performance across diverse tasks, including cell annotation, perturbation prediction, and spatial reasoning. The utility of the model is experimentally validated through a "virtual screen" that identified **silmitasertib** as a context-dependent enhancer of antigen presentation in tumors.

## Key Points
- **Unified Framework**: C2S-Scale unifies transcriptomic data and natural language text into a single autoregressive training objective, avoiding bespoke architectures used in models like [[01_Papers/scGPT|scGPT]] or [[01_Papers/Geneformer|Geneformer]].
- **Scaling Laws**: Performance consistently improves with model size (up to 27B parameters) and training tokens (over 1 billion), adhering to scaling laws similar to those in NLP.
- **Multimodal Capabilities**: The model performs annotation, generation, and reasoning tasks, integrating metadata, gene interaction networks, and spatial context natively via prompts.
- **Reinforcement Learning Alignment**: Uses [[02_Concepts/Group Relative Policy Optimization|Group Relative Policy Optimization]] (GRPO) to align model outputs with biological ground truth, significantly improving performance in perturbation prediction and question answering.
- **Experimental Validation**: A dual-context virtual screen predicted silmitasertib (CX-4945) would upregulate MHC-I specifically in interferon-low environments, a hypothesis confirmed via wet-lab experiments on tumor fragments and cell lines.
- **New Metric**: Introduces **scFID** (Single-Cell Fréchet Inception Distance), adapting the computer vision metric to evaluate the realism of generated transcriptomic profiles in latent space.

## Methods
### Data
- **Corpus**: Over **50 million single-cell transcriptomes** from 825 datasets sourced from CELLxGENE and the Human Cell Atlas.
- **Representation**: **"Cell Sentences"**: Gene expression profiles are converted into ordered text strings of gene names, ranked by expression level.
- **Multimodality**: The corpus links transcriptomic profiles with cell, tissue, and donor metadata, as well as text from scientific abstracts and papers.
- **Tasks**: Data is formatted for multi-task training including single-cell modeling, cell type annotation, cluster captioning, and perturbation prediction.

### Model Architecture
- **Base Models**: Initialized from pretrained Gemma-2 (2B, 9B, 27B) and Pythia (410M, 1B, 6.9B) checkpoints.
- **Architecture**: Standard decoder-only [[02_Concepts/Transformers for Biology|Transformer]] architecture with causal attention. No modifications to the tokenizer or internal architecture were made to accommodate biological data, relying entirely on the "Cell2Sentence" data transformation.
- **Vocabulary**: Uses the existing natural language tokenizer; genes are treated as text tokens.

### Training Strategy
1.  **Continued Pretraining**: Autoregressive next-token prediction on the multimodal corpus (cell sentences + text).
2.  **Supervised Fine-Tuning (SFT)**: Instruction fine-tuning on diverse tasks (e.g., "Predict the cell type of this cell", "Generate a cell sentence for...").
3.  **Reinforcement Learning (RL)**:
    -   **Algorithm**: [[02_Concepts/Group Relative Policy Optimization|Group Relative Policy Optimization]] (GRPO).
    -   **Objectives**: Optimized for biological validity (e.g., maximizing BioBERTScore for QA, or correlation metrics for perturbation).
    -   **Context**: Used specifically for Question Answering (scQA) and perturbation response prediction (e.g., L1000 and cytokine datasets).

## Results
| Metric | Value (C2S-Scale) | Baseline (Best Alt) | Notes |
|--------|-------|----------|-------|
| Cell Type Accuracy (OOD) | ~88% | <80% (scGPT/Geneformer) | Out-of-distribution immune cells |
| Perturbation scFID (Lower is better) | Lowest | Higher (ChemCPA/CondOT) | SciPlex3 dataset (unseen drugs) |
| Perturbation Correlation ($\tau$) | High | Lower (Linear Models) | L1000 Dataset |
| QA BioBERTScore | Highest | Lower (GPT-4o/Gemini) | Single-cell Question Answering (scQA) |
| Spatial Neighborhood Acc. | >60% | ~50% (Nicheformer) | Spatial transcriptomics prediction |

## Figures

| Figure | Description |
| ------ | ----------- |
| **Fig 1**  | Overview of the C2S-Scale framework, illustrating the data corpus (>50M cells), scaling dimensions, cell sentence representation, and the three-stage training procedure (Pretrain -> SFT -> RL). |
| **Fig 2**  | Scaling laws analysis showing performance improvements in annotation and generation as a function of FLOPs/parameters. Demonstrates C2S-Scale 27B superiority over baselines in OOD settings. |
| **Fig 3**  | Natural language interpretation tasks. Shows performance in cell annotation, cluster captioning, and dataset summarization compared to general LLMs and expression-only models. |
| **Fig 4**  | Spatial reasoning results. Shows the model can predict spatial neighborhoods and niches by implicitly learning from multi-cell context windows and interaction databases (BioGRID, CellPhoneDB). |
| **Fig 5**  | Single-cell Question Answering (scQA). Demonstrates that RL (GRPO) significantly boosts reasoning capabilities compared to SFT alone and outperforms GPT-4o. |
| **Fig 6**  | Perturbation prediction benchmarks. Visualizes performance on Cytokine, L1000, and SciPlex3 datasets using scFID and correlation metrics. Shows improved generalization to unseen compounds. |
| **Fig 7**  | Virtual screening application. Workflow and experimental validation of **silmitasertib** as a context-specific modulator of antigen presentation (effective in low-IFN contexts). |

## Critical Analysis
### Strengths
- **Scalability**: Effectively demonstrates that biological data can leverage the massive infrastructure and scaling laws of standard LLMs without custom biological architectures.
- **Zero-Shot/OOD Generalization**: Strong performance on out-of-distribution tasks suggests the model learns transferable biological principles rather than just memorizing datasets.
- **Interpretability**: The native natural language interface allows for complex queries and explanations, bridging the gap between numerical data and biological literature.
- **Actionability**: Moving beyond benchmarks to an actual experimental discovery (Silmitasertib) validates the model's practical utility.

### Weaknesses
- **Computational Cost**: Processing "cell sentences" (thousands of tokens per cell) is computationally expensive compared to embedding-based models like [[01_Papers/scGPT|scGPT]], especially for inference.
- **Causal Attention Limitations**: The authors note that the left-to-right causal attention of standard LLMs may not perfectly model the bidirectional nature of gene regulatory networks (though they argue multi-cell context mitigates this).
- **Hallucination Risk**: As with all LLMs, generative tasks (like abstract summarization) carry a risk of hallucination, though the paper attempts to benchmark this.

### Questions
- How does the fixed context window limit the number of genes ($K$) that can be represented in a cell sentence, and does this result in the loss of low-expression but biologically relevant genes?
- Can this framework be efficiently extended to multi-omics (ATAC, Methylation) given the token length constraints?

## Connections
### Related Papers
- Cell2Sentence: The foundational method this paper scales up.
- [[01_Papers/scGPT|scGPT]] & [[01_Papers/Geneformer|Geneformer]]: Key baselines; expression-only foundation models using custom Transformer architectures.
- [[01_Papers/chemCPA|ChemCPA]]: Baseline for chemical perturbation prediction.
- Gemma-2: The base LLM architecture used for the largest models.

### Related Concepts
- [[02_Concepts/Cell Foundation Models|Foundation Models]]
- [[02_Concepts/scRNA-seq|Single-cell RNA sequencing]]
- Reinforcement Learning from Human Feedback (RLHF/RLAIF)
- [[02_Concepts/Spatial Transcriptomics|Spatial Transcriptomics]]

### Potential Applications
- **In Silico Drug Screening**: Identifying context-specific drug targets and responses without large-scale physical screening.
- **Virtual Cells**: Simulating cellular responses to perturbations (CRISPR, drugs, cytokines) for hypothesis generation.
- **Automated Annotation**: High-quality, text-explained annotation of new single-cell atlases.
- **Interactive Analysis**: Chat-based interfaces for biologists to query datasets (e.g., "What pathways are upregulated in this cluster?").

## Notes
- The introduction of **scFID** is a clever adaptation of FID to biology, using scGPT as the feature extractor instead of InceptionV3. This provides a distributional metric for generative quality.
- The use of [[02_Concepts/Group Relative Policy Optimization|GRPO]] eliminates the need for a critic network, stabilizing training for biological rewards.


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
