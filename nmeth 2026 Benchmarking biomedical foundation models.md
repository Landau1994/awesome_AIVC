---
title: Benchmarking biomedical foundation models
aliases: []
authors:
  - Julio Saez-Rodriguez
  - Philipp Sven Lars Schäfer
  - Nikolas Kalavros
  - Gustavo Stolovitzky
year: 2026
journal: Nature Methods
doi: 10.1038/s41592-026-03182-y
url: https://doi.org/10.1038/s41592-026-03182-y
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2026-10-23
date_read:
---

# Benchmarking biomedical foundation models

## Quick Summary
> This perspective article explores the epistemological and methodological challenges of evaluating biomedical foundation models (FMs). It argues that traditional task-specific benchmarking is insufficient to capture the breadth of these models, as such evaluations often measure "task affinity" rather than scientific generalization. The authors call for a unified, community-driven benchmarking ecosystem (e.g., the BEACON consortium) to address issues like metric misalignment, data leakage, lack of transparency, and the need for robust evaluation protocols that move beyond simple performance metrics toward evaluating genuine biological utility.

## Key Points
- FMs are "parameterized embodiments of the phenomena" rather than fundamental theories, necessitating a shift in how they are validated.
- Evaluation on finite downstream tasks often leads to the "streetlight effect," where models are optimized for specific metrics rather than capturing biological truth.
- Goodhart’s law is a major risk: as benchmarking metrics become targets, they cease to be reliable indicators of model capability.
- Evaluation of [[Agentic systems]] is increasingly complex, requiring assessment of reasoning, intermediate steps, and safety rather than just final output accuracy.
- There is an urgent need for "gated" data and community-standardized benchmarks to prevent data leakage and ensure reproducibility.
- The authors emphasize the need for a balanced approach: "shut up and calculate" (pragmatic utility) while also critically analyzing the epistemological value of FMs.

## Methods
### Data
- The paper discusses diverse data types used in biomedical FMs, including [[single-cell transcriptomics]], electronic health records ([[EHR]]), medical imaging, genomic sequences, and chemical/molecular structure data.

### Model Architecture
- The focus is on general-purpose FMs and their downstream application via [[fine-tuning]], [[prompting]], and [[transfer learning]].

### Training Strategy
- Discusses pretraining strategies like [[self-supervised learning]] and the use of broad, heterogeneous datasets to learn generic representations.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| N/A    | N/A   | N/A      |

*Note: This is a perspective/review article; it does not report primary quantitative experimental results.*

## Figures


| Figure | Description |
| ------ | ----------- |
| Fig 1  | A conceptual diagram showing the limitations of benchmarking FMs: evaluating a model on a narrow set of tasks provides only a limited view of its "representational landscape," much like judging an entire territory by visiting a single valley. |


## Critical Analysis
### Strengths
- Excellent articulation of the epistemological tension between machine learning utility and scientific discovery.
- Practical categorization of benchmarking challenges (e.g., metric misalignment, computational cost, transparency).
- Provides a clear vision for the future of the field through the creation of the BEACON (Benchmarking, Evaluation and assessment CONsortium) initiative.

### Weaknesses
- As a perspective paper, it does not provide new empirical benchmarks.
- The reliance on the "shut up and calculate" analogy might be polarizing for some researchers seeking a more formal scientific definition.

### Questions
- How can we define "partial credit" for complex, agentic scientific workflows without falling into circular reasoning?
- What are the concrete mechanisms to handle "n-of-1" scenarios in personalized medicine where no population-level ground truth exists?
- Will an inclusive consortium truly avoid the "streetlight effect" if the initial tasks are chosen by the current consensus of the field?

## Connections
### Related Papers
- [[AlphaFold 3]] (Ref. 3)
- [[EHRSHOT]] (Ref. 29)
- [[BioLLM]] (Ref. 62)
- [[CASP]] (Ref. 18)

### Related Concepts
- [[Foundation Models]]
- [[Goodhart's Law]]
- [[Epistemology]]
- [[Reproducibility]]
- [[Data Leakage]]

### Potential Applications
- [[Drug discovery]]
- [[Single-cell genomics]]
- [[Clinical decision-support]]
- [[Regulatory DNA analysis]]

## Notes
- The authors highlight the need for "living benchmarks" that adapt to the fast-moving field of AI.
- Emphasizes that "model drift" and "temporal drift" in medical datasets are critical factors often ignored in current benchmarks.