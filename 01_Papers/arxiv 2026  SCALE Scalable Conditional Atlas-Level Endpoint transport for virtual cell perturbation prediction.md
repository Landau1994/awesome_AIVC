---
title: "SCALE: Scalable Conditional Atlas-Level Endpoint transport for virtual cell perturbation prediction"
aliases:
  - SCALE
authors:
  - Shuizhou Chen
  - Lang Yu
  - Kedu Jin
  - Songming Zhang
  - Hao Wu
  - Wenxuan Huang
  - Sheng Xu
  - Quan Qian
  - Qin Chen
  - Lei Bai
  - Siqi Sun
  - Zhangyang Gao
year: 2026
journal: arXiv preprint
doi: N/A
url: https://arxiv.org/abs/2603.17380v1
tags:
  - paper
  - AIVC
  - Virtual-Cell
  - Flow-Matching
  - Single-cell
status: unread
rating:
date_added: 2024-05-20
date_read:
---

# SCALE: Scalable Conditional Atlas-Level Endpoint transport for virtual cell perturbation prediction

## Quick Summary
> The paper introduces SCALE, a large-scale foundation model designed for virtual cell perturbation prediction that frames the task as conditional latent flow transport between control and perturbed cell populations. By combining a hierarchical set-aware encoder, endpoint-oriented flow matching (JiT), and a scalable BioNeMo-based infrastructure, SCALE overcomes the "mean-effect trap" of traditional autoencoders, achieving state-of-the-art performance on biologically grounded metrics (like DE gene overlap and PDCorr) across massive datasets like Tahoe-100M.

## Key Points
- Formulates single-cell perturbation prediction as a population-level conditional transport problem rather than direct cell-to-cell mapping.
- Utilizes a hierarchical set-aware latent encoder (gene-level LLaMA-style attention + DeepSets cell-level aggregation) to preserve single-cell heterogeneity and unordered set symmetries.
- Adopts an endpoint-oriented Joint Interpolation Transport (JiT) formulation (x-pred/x-loss), which proves more stable for learning perturbation-induced shifts than standard velocity-based flow matching.
- Implemented on a BioNeMo-based framework, delivering a 12.51× speedup in pretraining iteration throughput compared to prior SOTA pipelines.
- Evaluated on biologically meaningful metrics (DE Overlap, PDCorr) instead of solely average reconstruction (MSE), decoupling biological fidelity from baseline expression shifts.

## Methods
### Data
- **Tahoe-100M:** A giga-scale chemical perturbation benchmark (100M+ cells, 50 cancer cell lines, 1,100+ conditions).
- **PBMC:** A dense cytokine signaling perturbation dataset (12 donors, 90 conditions).
- **Replogle-Nadig:** A large-scale genetic CRISPRi perturbation dataset.
- All datasets were preprocessed by library size normalization, log(1+x) transformation, rescaling, and subsetting to the top 2,000 highly variable genes ([[HVGs]]).

### Model Architecture
- **Hierarchical Set-Aware Encoder:** Uses a shared LLaMA-style [[Transformer]] for gene-wise encoding within individual cells, followed by a [[DeepSets]] permutation-invariant layer to aggregate cell embeddings into a population-level summary.
- **Conditional JiT-based Velocity Field Network:** Injects perturbation, cell type, and batch conditions using a learnable seed attention mechanism.
- **Decoder:** Reconstructs the cell population in the expression space from the transported latent representation.

### Training Strategy
- **Autoencoding Objective:** Jointly optimizes point-wise reconstruction fidelity ([[MSE]]) and population-level distribution alignment ([[MMD]]) in the latent space.
- **Latent Transport Objective:** Trained using endpoint-oriented paired supervision under the JiT framework. The model directly predicts the final perturbed latent endpoint (x-pred) and optimizes the loss in the endpoint space (x-loss) rather than predicting intermediate velocity vectors.
- **Infrastructure:** Preprocessed data is stored in LMDB shards. Uses a [[BioNeMo]]-based distributed training stack with batch-aware sampling for highly imbalanced perturbation groups.

## Results
| Metric | Value (SCALE) | Baseline (STATE) | Dataset |
|--------|---------------|------------------|---------|
| PDCorr | 0.953 | 0.850 | Tahoe-100M |
| DE Overlap | 0.806 | 0.728 | Tahoe-100M |
| PDCorr | 0.979 | 0.796 | PBMC |
| DE Overlap | 0.810 | 0.512 | PBMC |
| PDCorr | 0.909 | 0.437 | Replogle |
| DE Overlap | 0.601 | 0.196 | Replogle |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of SCALE. (a) Conceptual formulation of virtual cell perturbation as conditional transport. (b) Architecture flow showing set encoder, condition velocity field, and decoder. |
| Fig 2  | SCALE module details. (a) Hierarchical set-aware encoder showing gene-wise self-attention and cell-wise aggregation. (b) Conditional JiT-based velocity field network mapping latent trajectories. |
| Fig 3  | Ablation studies showing the impact of condition pooling/fusion strategies, JiT training formulations (x-pred vs v-pred), and flow prior distributions on PDCorr and MSE. |

## Critical Analysis
### Strengths
- **Biological Focus:** Explicitly targets the recovery of differential expression ([[DEGs]]) and directional changes rather than blindly minimizing MSE, which often leads models into a "mean-effect trap."
- **Scalability:** The integration with BioNeMo and LMDB sharding allows the model to scale to atlas-level datasets (Tahoe-100M) efficiently, solving a major bottleneck in virtual cell modeling.
- **Robust Ablations:** Thoroughly investigates the mechanics of Flow Matching in this domain, demonstrating that direct endpoint prediction is more effective than standard velocity prediction for short/structured perturbation shifts.

### Weaknesses
- **Scaling Saturation:** The scaling study reveals that increasing model parameters from 184M to 280M yields negligible or slightly worse performance on strict biological metrics, suggesting current data diversity or formulation limits unbounded scaling benefits.
- **Metric Sensitivity:** The authors acknowledge that the strict [[Cell-Eval]] protocol is highly sensitive to implementation details (preprocessing, aggregation), complicating cross-paper comparisons.

### Questions
- Can SCALE effectively predict combinatorial (multi-gene or multi-drug) perturbation responses, or is it strictly bounded to the types of singular perturbations seen in the training sets?
- Would incorporating prior biological knowledge (e.g., gene regulatory networks) help push past the 184M parameter performance plateau?

## Connections
### Related Papers
- *Predicting cellular responses to perturbation across diverse contexts with State* (Adduri et al., 2025) - The primary baseline STATE.[[State]][[State|STATE]]
- *Perturbdiff: Functional diffusion for single-cell perturbation modeling* (Yuan et al., 2026) - Another major baseline evaluated in the paper.
- *CellFlow enables generative single-cell phenotype modeling with flow matching* (Klein et al., 2025).

### Related Concepts
- [[Virtual Cell]]
- [[Single-cell transcriptomics]]
- [[Flow Matching]]
- [[Optimal Transport]]
- [[Differential Expression]]

### Potential Applications
- *In silico* high-throughput drug screening.
- Mechanism-oriented screening for cancer therapeutics.
- Predicting cellular re-organization in response to novel cytokine therapies.

## Notes
-