---
title: "How to measure the performance of an aivc-like model"
aliases: [AIVC Evaluation, scFM Benchmarking]
tags:
  - project
  - AIVC
  - evaluation
  - benchmarking
status: planning
priority: High
start_date: 2026-03-25
end_date:
---

# How to measure the performance of an aivc-like model

## Objective
> What are you trying to achieve?
To establish a comprehensive, multi-task evaluation framework for assessing the performance, generalizability, and biological fidelity of AI Virtual Cell (AIVC) and single-cell foundation models (scFMs) across diverse biological contexts.

## Background
- AI Virtual Cells (AIVCs) are multi-scale, multimodal neural networks designed to simulate molecules, cells, and tissues.
- Unlike traditional single-task models, AIVCs act as generalist biological AI (GBAI). Therefore, evaluating them requires a unified framework that tests multiple capabilities: [[02_Concepts/Zero-shot Learning|zero-shot]] inference, [[02_Concepts/Perturbation Prediction|perturbation prediction]], spatiotemporal dynamics, and cross-species generalization.
- Recent literature (e.g., [[01_Papers/GB 2025 Zero-shot evaluation reveals limitations of single-cell foundation models|Zero-shot Eval]]) highlights that while scFMs excel at certain tasks, their zero-shot reliability and out-of-distribution generalization still require rigorous benchmarking.

## Approach
### Methods
To fully evaluate an AIVC-like model, we must measure performance across several distinct biological tasks:

- **1. Cell Type Annotation (Zero-shot & Fine-tuned):**
  - **Metrics:** F1-score, Accuracy, Macro-AUC.
  - **Goal:** Assess how well the model's latent space separates distinct cell types without prior specific training on that dataset.
- **2. Perturbation Response Prediction:**
  - **Metrics:** Pearson/Spearman correlation (predicted vs. actual post-perturbation gene expression), Mean Squared Error (MSE), Directional Accuracy (for up/down-regulated genes).
  - **Goal:** Evaluate the model's causal understanding of genetic or chemical perturbations (e.g., CRISPR knockouts).
- **3. Gene Regulatory Network (GRN) Inference:**
  - **Metrics:** AUPRC (Area Under the Precision-Recall Curve), AUROC.
  - **Goal:** Measure the accuracy of inferred gene-gene interactions and regulatory edges.
- **4. Spatiotemporal Dynamics & RNA Velocity:**
  - **Metrics:** Cosine similarity of velocity vectors, Optimal Transport (OT) distances (e.g., Wasserstein distance between predicted and actual future cell states).
  - **Goal:** Test the model's ability to reconstruct cellular trajectories and dynamic state transitions.
- **5. Batch Integration / Batch Effect Removal:**
  - **Metrics:** ASW (Average Silhouette Width), iLISI (Integration Local Inverse Simpson's Index), cLISI (Cell-type LISI).
  - **Goal:** Ensure the model integrates multi-omics data across different sequencing batches while preserving biological variance.

### Models Used
*Baselines for comparison:*
- [[01_Papers/scGPT|scGPT]] (Transformer, multi-task)
- [[01_Papers/Geneformer|Geneformer]] (Transformer, rank-value encoding)
- [[01_Papers/UCE|UCE]] (Universal Cell Embedding, strong zero-shot baseline)
- [[01_Papers/GEARS|GEARS]] (GNN, specific to multi-gene perturbation)
- [[01_Papers/bioRxiv 2026 X-Cell Scaling Causal Perturbation Prediction Across Diverse Cellular Contexts via Diffusion Language Models|X-Cell]] (Diffusion LM for causal perturbation)

### Datasets
- **For Annotation/Integration:** [[04_Datasets/Parse 1M|Parse 1M]], [[04_Datasets/Tabula Sapiens 2.0|Tabula Sapiens 2.0]]
- **For Perturbation:** [[04_Datasets/Replogle|Replogle]] (Genome-wide CRISPRi screen)
- **For Dynamics:** [[04_Datasets/Dentate Gyrus|Dentate Gyrus]] (Neurogenesis, RNA velocity)

## Progress Log
### 2026-03-25
- [x] Defined core evaluation tasks (Annotation, Perturbation, GRN, Dynamics).
- [ ] Set up the unified benchmarking framework based on recent scFM Bench papers.
- [ ] Download Replogle and Tabula Sapiens 2.0 datasets.

## Results
### Experiments
| Model | Config | Cell Annotation (F1) | Perturbation (Pearson r) | GRN Inference (AUPRC) | Batch Integration (ASW) |
|-------|--------|----------------------|--------------------------|-----------------------|-------------------------|
| scGPT | Base   |                      |                          |                       |                         |
| UCE   | Zero-shot |                   |                          |                       |                         |
| GEARS | Fine-tuned | N/A              |                          | N/A                   | N/A                     |
| Ours  | v1.0   |                      |                          |                       |                         |

### Key Findings
- *(To be filled after running initial benchmarks)*

## Code Repository
- [Link to local benchmarking scripts / scverse ecosystem tools]

## Related Work
- [[01_Papers/bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models|scFM Bench]]
- [[01_Papers/nmeth 2025 Benchmarking algorithms for generalizable single-cell perturbation response prediction|Perturbation Bench]]
- [[01_Papers/bioRxiv 2026 Benchmarking zero-shot single-cell foundation model embeddings for cellular dynamics reconstruction|Dynamics Bench]]
- [[bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies|velocitybench]]
- [[01_Papers/Nat Biotechnol_2026_Generalist biological artificial intelligence in modeling the language of life|Generalist biological artificial intelligence in modeling the language of life]]

## Next Steps
- [ ] Implement the evaluation pipeline using `scverse` (Scanpy/Squidpy).
- [ ] Run zero-shot embedding extraction for our model and compare UMAPs against UCE and Geneformer.
- [ ] Evaluate causal perturbation predictions against the Replogle dataset.

## Notes
- **Crucial Consideration:** As noted in the GBAI review, foundation models sometimes fail to outperform simpler, specialized baselines on specific tasks. We must include simple baselines (e.g., mean expression prediction for perturbations) to prove true emergent capabilities.
- Ensure that the evaluation metrics account for the "black box" nature of generalist models by incorporating biological ground-truth validations where possible.