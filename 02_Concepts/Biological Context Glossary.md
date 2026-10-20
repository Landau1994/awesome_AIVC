---
title: "Biological Context Glossary"
tags: [reference, AIVC]
date_created: 2026-10-20
---

# Biological Context Glossary

Context definitions for interpreting data and models. Cell-line names and technology names are not complete experimental specifications. Follow the linked study for release, donor, clone, dose and processing details.

## CRISPR screens

CRISPR screens perturb genes or regulatory elements and measure a phenotype. Cas9 knockout, dCas9-mediated CRISPRi repression and CRISPRa activation are distinct interventions.

Source: [original reference or official documentation](https://doi.org/10.1016/j.cell.2016.11.038).

## Cellular Heterogeneity

Variation among cells in type, state and measured molecular profiles. Technical variation and biological variation must be distinguished in analysis.

Source: [original reference or official documentation](https://www.sc-best-practices.org/).

## Expression Quantitative Trait Loci (eQTL)

An eQTL is a genetic locus statistically associated with expression variation. Sequence-to-omics models predict molecular measurements from sequence; their predictions do not by themselves identify causal variants.

Source: [original reference or official documentation](https://doi.org/10.1126/science.aaz1776).

## Fine-mapping

Fine-mapping assesses which variants may explain an association. PIP is a model-dependent posterior inclusion probability, not an experimental confirmation of causality.

Source: [original reference or official documentation](https://github.com/stephenslab/susieR).

## HBE

Human bronchial epithelial cells, a cellular context. This abbreviation alone does not identify donor, immortalization, culture conditions or supplier.

Source: [original reference or official documentation](https://www.atcc.org/products/pcs-300-010).

## HepG2

A human liver-tumor-derived cell line used in molecular and drug-response studies. It is not equivalent to primary adult hepatocytes.

Source: [original reference or official documentation](https://www.atcc.org/products/hb-8065).

## Jurkat

A human T-cell leukemia cell-line family; clone and authentication matter when combining datasets.

Source: [original reference or official documentation](https://www.atcc.org/products/tib-152).

## K562

A human leukemia-derived cell line widely used for perturbation screens; a result in K562 is not automatically transferable to primary blood cells.

Source: [original reference or official documentation](https://www.atcc.org/products/ccl-243).

## THP-1

A human monocytic leukemia cell line. Differentiation treatment and culture state affect the response being modeled.

Source: [original reference or official documentation](https://www.atcc.org/products/tib-202).

## hTERT-RPE1

A telomerase-immortalized human retinal pigment epithelial cell line used in cellular screening.

Source: [original reference or official documentation](https://www.atcc.org/products/crl-4000).

## Ai9 mice

A Cre-dependent tdTomato reporter mouse line. Reporter activation measures the relevant recombination/readout under the study’s protocol, not all aspects of delivery efficacy.

Source: [original reference or official documentation](https://www.jax.org/strain/007909).

## Induced Pluripotent Stem Cells (iPSCs)

Somatic cells reprogrammed to a pluripotent state. Reprogramming method, line and differentiation protocol matter for downstream phenotypes.

Source: [original reference or official documentation](https://doi.org/10.1016/j.cell.2007.11.019).

## Lipid Nanoparticles

Lipid nanoparticles can carry nucleic-acid cargo. Ionizable lipids change charge with pH; cellular uptake, escape from endosomes, cargo release and expression are distinct stages.

Source: [original reference or official documentation](https://doi.org/10.1038/s41578-021-00358-0).

## MC3

DLin-MC3-DMA and SM-102 are different ionizable lipids used as reference formulations in delivery studies. Their formulations and payloads must be specified; they are not interchangeable controls.

Source: [original reference or official documentation](https://doi.org/10.1038/s41578-021-00358-0).

## bromination

Bromination introduces bromine into a molecule. In the LUMI-lab note it refers to specific lipid design modifications; effects depend on chemical position and formulation, not merely the presence of bromine.

Source: [original reference or official documentation](https://doi.org/10.1016/j.cell.2026.01.012).

## Microphysiological Systems (MPS)

Experimental systems that reproduce selected tissue functions. Organ-on-chip systems are one class of MPS, and validation is specific to the biological function and application.

Source: [original reference or official documentation](https://doi.org/10.1038/s41573-020-0079-3).

## genome

The genome is the genetic material; the epigenome describes context-dependent chromatin and chemical regulatory states; the proteome is the protein complement in a specified biological context. These layers are not interchangeable measurements.

Source: [original reference or official documentation](https://www.genome.gov/genetics-glossary).

## cellular morphology

Morphology describes cellular form and organization. The tumor microenvironment includes surrounding cells, extracellular material and signals; morphology alone does not identify all molecular interactions.

Sources: [NCI morphology definition](https://www.cancer.gov/publications/dictionaries/cancer-terms/def/morphology); [NCI tumor microenvironment definition](https://www.cancer.gov/publications/dictionaries/cancer-terms/def/tumor-microenvironment).

## protein structures

Protein structure describes three-dimensional organization, while interactions describe molecular associations. Protein engineering alters sequence or design to pursue a function; a predicted structure is not sufficient functional validation.

Sources: [Worldwide Protein Data Bank](https://www.wwpdb.org/); [Nobel Prize scientific background on directed evolution](https://www.nobelprize.org/uploads/2018/10/advanced-chemistryprize-2018.pdf).

## Cryo-electron tomography

Three-dimensional imaging from a tilt series of cryogenically preserved specimens. It provides structural evidence with method-specific limits on resolution and identification.

Source: [original reference or official documentation](https://doi.org/10.1016/j.cell.2022.06.034).

## Multiome

Joint measurement of multiple molecular modalities from the same cell or nucleus. In common RNA/ATAC workflows, gene expression and chromatin accessibility are paired; the assay and sample unit must be specified.

Source: [Official assay description](https://www.10xgenomics.com/products/epi-multiome).

## Regulatory Genomics

Study of how genomic sequences, chromatin and regulatory factors control gene expression. A predicted regulatory connection requires separate evidence before it can be treated as a causal mechanism.

Source: [NHGRI Genomics of Gene Regulation](https://www.genome.gov/Funded-Programs-Projects/Genomics-of-Gene-Regulation).
