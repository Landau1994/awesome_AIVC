---
title: "scPerturb: Single-Cell Perturbation Database"
aliases: [scPerturb, sc-Perturb]
tags:
  - dataset
  - perturbation
  - single-cell
  - AIVC
date_created: 2026-03-25
status: draft
---

# scPerturb: Single-Cell Perturbation Database

scPerturb harmonizes public perturbation–response datasets. The 2024 resource paper includes 44 datasets with transcriptomic, protein or chromatin-accessibility readouts and describes E-distance and E-tests for comparing cell populations.

## Perturbation mechanisms

Dataset-specific interventions include CRISPRi knockdown, CRISPRa activation, CRISPR knockout and chemical treatments. These mechanisms are not interchangeable. Controls, metadata fields, replicates, doses and timing vary by study.

## Access

- [Author portal](https://www.sanderlab.org/scPerturb/)
- [RNA/protein data archive](https://doi.org/10.5281/zenodo.7041848)
- [ATAC data archive](https://doi.org/10.5281/zenodo.7058381)
- [Official code and current maintenance guidance](https://github.com/sanderlab/scPerturb)

## Evaluation cautions

A high correlation between raw expression means can reflect shared baseline expression. Include control/mean and linear baselines, effect-size metrics and distributional measures, and split by the intended generalization unit. Observed control and perturbed cells are usually unpaired; do not pass their rows as if they were matched before/after observations. The previous generic `model.fit` example did not implement this distinction and has been removed.

## Related notes

- [[02_Concepts/Perturbation Prediction]]
- [[04_Datasets/Replogle]]
- [[01_Papers/GEARS]] and [[01_Papers/CPA]]

## Source and verification

[Peidli et al., Nature Methods (2024)](https://doi.org/10.1038/s41592-023-02144-y). Checked 2026-10-20: resource scope and access. No universal >0.90 accuracy threshold or model ranking is implied.
