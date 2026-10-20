---
title: "Cell phenotypes in the biomedical literature: a systematic analysis and text mining corpus"
aliases:
  - CellLink
authors:
  - Noam H. Rotenberg
  - Robert Leaman
  - Rezarta Islamaj
  - Helena Kuivaniemi
  - Gerard Tromp
  - Brian Fluharty
  - Savannah Richardson
  - Caroline Eastwood
  - Matthew Diller
  - Bingfang Xu
  - Ajith V. Pankajam
  - David Osumi-Sutherland
  - Zhiyong Lu
  - Richard H. Scheuermann
year: 2026
journal: bioRxiv
doi: 10.64898/2026.02.11.705457
url: https://doi.org/10.64898/2026.02.11.705457
tags:
  - paper
  - AIVC
  - benchmarking
status: unread
rating:
date_added:
date_read:
---

# Cell phenotypes in the biomedical literature: a systematic analysis and text mining corpus

> [!info] Verification scope — 2026-10-20
> [Source record](https://pmc.ncbi.nlm.nih.gov/articles/PMC12918994/). Checked the corpus counts, IAA definitions and NER/EL distinctions against the source tables. The old claim of 2,765 source articles was a misread of the JNLPBA unique-mention count in Table 2. Full experimental replication and all supplementary claims were outside this pass.

## Quick Summary
> The authors introduce [[bioRxiv 2026 Cell phenotypes in the biomedical literature a systematic analysis and text mining corpus|CellLink]], a manually annotated corpus containing over 22,000 mentions of human and mouse cell populations derived from recent biomedical literature (2019–2024). This resource captures the shift in terminology driven by single-cell technologies, distinguishing between specific cell phenotypes, heterogeneous populations, and vague populations, while linking them to the [[02_Concepts/Cell Ontology|Cell Ontology]] (CL). The paper demonstrates the corpus's utility by benchmarking NLP models (including BiomedBERT and GPT-5) on [[02_Concepts/Named Entity Recognition|Named Entity Recognition]] and [[02_Concepts/Entity Linking|Entity Linking]] tasks, analyzing cell naming motifs, and using the data to refine the chondrocyte branch of the Cell Ontology.

## Key Points
- Creation of the [[bioRxiv 2026 Cell phenotypes in the biomedical literature a systematic analysis and text mining corpus|CellLink]] corpus: 3,005 excerpts with 22,362 annotations focusing on naturally occurring human and mouse cells.
- Detailed annotation schema distinguishing **Cell Phenotypes** (82.8%), **Heterogeneous Cell Populations** (7.2%), and **Vague Cell Populations** (10.0%).
- Annotations are linked to [[02_Concepts/Cell Ontology|Cell Ontology]] (CL) terms as either **exact** or **related** matches, capturing novel cell types not yet in the ontology.
- Identification of 14 naming motifs (e.g., molecular signature, anatomical context) showing how naming conventions vary by lineage and technology (e.g., scRNA-seq).
- [[05_Tools/Methods and Data Resources#BiomedBERT|BiomedBERT]] models fine-tuned on CellLink outperform large language models ([[05_Tools/AI and Scientific Computing Reference#GPT-4.1|GPT-4.1]], [[05_Tools/AI and Scientific Computing Reference#GPT-5.2|GPT-5.2]]) on Named Entity Recognition (NER).
- An agentic AI approach using [[05_Tools/AI and Scientific Computing Reference#GPT-5.2|GPT-5.2]] outperforms embedding-based models ([[05_Tools/Methods and Data Resources#SapBERT|SapBERT]], [[05_Tools/Methods and Data Resources#MedCPT|MedCPT]]) on Entity Linking (EL) tasks.
- Practical application: The corpus was used to identify gaps in the CL, leading to the expansion and restructuring of the chondrocyte hierarchy.

## Methods
### Data
- **Source**: PubMed articles published between 2019 and 2024, filtered for single-cell genomics terms and human/mouse focus.
- **Selection**: Automated passage selection using MeSH clusters to balance topic representativeness with rare entity enrichment (temperature scaling).
- **Annotation**: Performed by four experienced biologists using [[05_Tools/Methods and Data Resources#TeamTat|TeamTat]]. The process involved three rounds: independent annotation, independent resolution, and collaborative resolution.
- **Volume**: 22,362 annotations across 3,005 passages, containing 1,251 unique linked CL identifiers.

### Model Architecture
- **NER**:
    - [[05_Tools/Methods and Data Resources#BiomedBERT|BiomedBERT]]: Fine-tuned independently for each entity type.
    - [[05_Tools/AI and Scientific Computing Reference#GPT-4.1|GPT-4.1]] and [[05_Tools/AI and Scientific Computing Reference#GPT-5.2|GPT-5.2]]: Prompted for few-shot recognition of all three entity types.
- **Entity Linking (EL)**:
    - Embedding models: [[05_Tools/Methods and Data Resources#SapBERT|SapBERT]], [[05_Tools/Methods and Data Resources#MedCPT|MedCPT-Query-Encoder]], and OpenAI's [[05_Tools/AI and Scientific Computing Reference#text-embedding-3-large|text-embedding-3-large]].
    - Agentic AI: A custom agent using [[05_Tools/AI and Scientific Computing Reference#GPT-5.2|GPT-5.2]] and the [[05_Tools/Methods and Data Resources#Ontology Access Kit|Ontology Access Kit]] to query the CL via the Ontology Lookup Service.

### Training Strategy
- **Data Split**: The corpus was split into training (50.0%), validation (16.7%), and testing (33.3%) sets using an iterative hill-climbing approach to balance MeSH clusters and entity types.
- **NER**: Fine-tuning performed on the training set; evaluated on the test set. Comparison with models trained on legacy corpora ([[02_Concepts/Entity Linking|AnatEM]], [[02_Concepts/Entity Linking|BioID]], [[02_Concepts/Entity Linking|CRAFT]], [[02_Concepts/Entity Linking|JNLPBA]]).
- **EL**: Evaluated on ground truth mentions from the test set.

## Results
NER exact F1 requires both span and entity type to match. EL uses gold mentions and ontology identifiers; its F1 is not end-to-end extraction accuracy. See source Tables 4–5.

| Metric | Value | Baseline/Comparison |
|--------|-------|----------|
| **NER (Exact F1) - Cell Phenotype** | **0.874** (BiomedBERT) | 0.612 (GPT-4.1), 0.568 (GPT-5.2) |
| **NER (Exact F1) - Heterogeneous** | **0.703** (BiomedBERT) | 0.240 (GPT-4.1), 0.257 (GPT-5.2) |
| **EL (F1) - Exact Matches Only, overall** | 0.892 ([[05_Tools/AI and Scientific Computing Reference#GPT-5.2\|GPT-5.2 Agent]]) | 0.842 ([[05_Tools/Methods and Data Resources#SapBERT\|SapBERT]]), 0.821 ([[05_Tools/Methods and Data Resources#MedCPT\|MedCPT]]) |
| **EL (F1) - All IDs, overall** | **0.782** ([[05_Tools/AI and Scientific Computing Reference#GPT-5.2\|GPT-5.2 Agent]]) | 0.718 ([[05_Tools/Methods and Data Resources#SapBERT\|SapBERT]]), 0.714 ([[05_Tools/Methods and Data Resources#MedCPT\|MedCPT]]) |
| **Cross-corpus NER, CellLink evaluation set (Table 3)** | **0.88** (trained on CellLink) | 0.52 (BioID), 0.59 (CRAFT), 0.66 (JNLPBA) |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Growth of single-cell genomics literature and vocabulary shifts (word clouds) from 2000-2018 vs 2019-2025. |
| Fig 2  | Example of CellLink annotations illustrating the three entity types (phenotype, heterogeneous, vague) and linking types (exact, related). |
| Fig 3  | Comparison of CellLink's coverage of the [[02_Concepts/Cell Ontology\|Cell Ontology]] (CL) against other corpora (BioID, CRAFT) by lineage and hierarchy depth. |
| Fig 4  | Analysis of [[05_Tools/Methods and Data Resources#SapBERT\|SapBERT]] cosine similarity scores as a predictor of entity linking accuracy and match type (exact vs related). |
| Fig 5  | Expansion of the chondrocyte branch in the CL, showing new terms added based on CellLink evidence (e.g., regulatory chondrocyte). |

## Critical Analysis
### Strengths
- **Relevance**: Addresses a critical gap created by the explosion of scRNA-seq data, where existing corpora (like CRAFT or BioID) are outdated regarding cell nomenclature.
- **Granularity**: The distinction between "exact" and "related" matches is novel and highly practical for biocuration, allowing the capture of "long tail" concepts not yet in ontologies.
- **Annotation process**: Iterative adjudication addresses ambiguous spans and concepts. Round-one agreement was 0.69 F1 for exact spans and exact identifiers; overlapping-span agreement with merged entity labels was 0.96. These measure different levels of agreement (Supplementary Table 4).
- **Benchmarking**: Provides a realistic comparison between fine-tuned BERT models and modern LLMs, showing that smaller, fine-tuned models still excel at specific extraction tasks.

### Weaknesses
- **Computation Cost**: The agentic EL approach using [[05_Tools/AI and Scientific Computing Reference#GPT-5.2|GPT-5.2]] is significantly slower and more expensive than embedding-based methods, despite better performance.
- **Scope**: Limited to human and mouse; excludes experimentally modified cells (though this was a design choice to focus on natural biology).
- **Ambiguity**: "Related" matches are subjective and depend on the state of the ontology at the time of annotation.

### Questions
- How scalable is the manual annotation process for keeping up with the exponential growth of single-cell literature?
- Can the "related" matches be automatically clustered to suggest specific new ontology terms without human intervention?

## Connections
### Related Papers
- [[02_Concepts/Entity Linking|AnatEM]] corpus (Pyysalo et al., 2014)
- [[02_Concepts/Entity Linking|BioID]] corpus (Arighi et al., 2017)
- [[02_Concepts/Entity Linking|CRAFT]] corpus (Verspoor et al., 2012)
- [[05_Tools/Methods and Data Resources#SapBERT|SapBERT]] (Liu et al., 2021) for biomedical entity linking.

### Related Concepts
- [[Named Entity Recognition]] (NER)
- [[Entity Linking]] (EL)
- [[02_Concepts/Cell Ontology|Cell Ontology]] (CL)
- [[02_Concepts/scRNA-seq|Single-Cell RNA-Seq]] (scRNA-seq)
- [[Biocuration]]

### Potential Applications
- Automated metadata enrichment for single-cell atlases (e.g., [[05_Tools/Methods and Data Resources#Human Cell Atlas|Human Cell Atlas]]).
- Assisting ontology curators in identifying and defining new cell types.
- Improving search recall for specific cell phenotypes in tools like [[05_Tools/Methods and Data Resources#PubTator|PubTator]].
- Constructing knowledge graphs connecting cell types to genes, diseases, and tissues.

## Notes
- The preprint was posted on 13 February 2026. Model names alone do not establish whether a source is future-dated.
- The "naming motif" analysis provides interesting linguistic insights, such as the heavy use of "CD" markers in hematopoietic cells vs. morphological descriptions in neurons.