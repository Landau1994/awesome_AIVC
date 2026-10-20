---
title: "Methods and Data Resources"
tags: [reference, AIVC]
date_created: 2026-10-20
---

# Methods and Data Resources

These entries explain the resources named in the paper notes and provide primary or official entry points. They do not endorse a model ranking. Repository URLs may move; a blocked fetch does not establish that a resource is absent.

## Harmony

An integration method that adjusts a low-dimensional representation for specified batch covariates. Batch mixing must be checked alongside biological conservation.

Source: [original reference or official documentation](https://github.com/immunogenomics/harmony).

## SapBERT

A biomedical entity representation model trained by self-alignment of synonymous names. Embedding proximity supports candidate retrieval; it does not establish that every mention has a unique ontology match.

Source: [original reference or official documentation](https://aclanthology.org/2021.naacl-main.334/).

## MedCPT

A biomedical retrieval model family with separate query/article encoders and a reranking component. Use the appropriate encoder role.

Source: [original reference or official documentation](https://github.com/ncbi/MedCPT).

## BiomedBERT

Biomedical-domain pretrained BERT models, previously released under the PubMedBERT name. Check the exact checkpoint and training corpus.

Source: [original reference or official documentation](https://huggingface.co/microsoft/BiomedNLP-BiomedBERT-base-uncased-abstract-fulltext).

## Enformer

A sequence-to-functional-genomics model using long-range sequence information to predict genomic tracks.

Source: [original reference or official documentation](https://github.com/google-deepmind/deepmind-research/tree/master/enformer).

## Borzoi

A sequence model for predicting RNA-seq coverage and related genomic signals from DNA sequence.

Source: [original reference or official documentation](https://github.com/calico/borzoi).

## Sei

A sequence-based framework for predicting regulatory activities and grouping regulatory sequence patterns.

Source: [original reference or official documentation](https://github.com/FunctionLab/sei-framework).

## ESM2

ESM-2 is a protein language model family. In cell models, protein-derived representations can encode protein-coding genes; this is not a direct measurement of cellular expression.

Source: [original reference or official documentation](https://github.com/facebookresearch/esm).

## AlphaFold

AlphaFold2 predicts protein structure from sequence and evolutionary information. Its outputs require confidence and context checks.

Source: [original reference or official documentation](https://doi.org/10.1038/s41586-021-03819-2).

## AlphaFold 3

AlphaFold3 models biomolecular complexes with proteins, nucleic acids, ligands and other components. Binding pose prediction is not a direct binding-affinity measurement.

Source: [original reference or official documentation](https://doi.org/10.1038/s41586-024-07487-w).

## Boltz-1

Related Boltz biomolecular modeling releases. Their training, capabilities and benchmark scores differ; retain the version used in the source study.

Source: [original reference or official documentation](https://github.com/jwohlwend/boltz).

## Chai-1

A biomolecular structure prediction model; consult the repository for supported components, input constraints and release details.

Source: [original reference or official documentation](https://github.com/chaidiscovery/chai-lab).

## Protenix

A biomolecular structure modeling implementation. Published comparisons must identify the evaluated checkpoint and input protocol.

Source: [original reference or official documentation](https://github.com/bytedance/Protenix).

## HelixFold 3

HelixFold3 is part of the PaddleHelix biomolecular modeling ecosystem. Version-specific documentation defines supported tasks.

Source: [original reference or official documentation](https://github.com/PaddlePaddle/PaddleHelix).

## Uni-Mol

A molecular representation learning framework using three-dimensional structural information.

Source: [original reference or official documentation](https://github.com/deepmodeling/Uni-Mol).

## XGBoost

Gradient-boosted tree software, often used as a structured-data baseline. Performance depends on tuning and leakage-free splits.

Source: [original reference or official documentation](https://xgboost.readthedocs.io/en/stable/).

## SuSiE

A Bayesian variable-selection approach representing a sparse effect as a sum of single effects; used for fine-mapping credible sets.

Source: [original reference or official documentation](https://github.com/stephenslab/susieR).

## PolyFun

Functionally informed fine-mapping software that uses functional annotations to inform prior probabilities.

Source: [original reference or official documentation](https://github.com/omerwe/polyfun).

## SCREEN

The ENCODE portal for candidate cis-regulatory elements and their annotations. Candidate status is not experimental proof of regulatory function in every context.

Source: [original reference or official documentation](https://screen.encodeproject.org/).

## GTEx

The Genotype-Tissue Expression project links genetic variation with tissue-specific gene expression. Release, ancestry composition and tissue must be recorded.

Source: [original reference or official documentation](https://gtexportal.org/home/).

## TOPMed

The NHLBI Trans-Omics for Precision Medicine program provides genetic and multi-omic resources; individual datasets have distinct access conditions.

Source: [original reference or official documentation](https://topmed.nhlbi.nih.gov/).

## CELLxGENE

CELLxGENE Discover hosts curated single-cell data. Census provides programmatic access to versioned collections; pin the release for reproducibility.

Source: [original reference or official documentation](https://chanzuckerberg.github.io/cellxgene-census/).

## Human Cell Atlas

An international initiative to build reference maps of human cells. Its data portal contains multiple studies, not one fixed matrix.

Source: [original reference or official documentation](https://data.humancellatlas.org/).

## scBaseCount

An Arc Institute resource for consistently processed public single-cell count data. Use the documented release and metadata.

Source: [original reference or official documentation](https://github.com/ArcInstitute/arc-virtual-cell-atlas/blob/main/scBaseCount/README.md).

## Cell-Eval

Arc Institute software for evaluating predicted single-cell perturbation responses. Metrics, preprocessing and reference baselines must be specified.

Source: [original reference or official documentation](https://github.com/ArcInstitute/cell-eval).

## GLUE

Graph-linked unified embedding for integrating single-cell multi-omics data with a guidance graph.

Source: [original reference or official documentation](https://scglue.readthedocs.io/).

## scArches

Reference mapping with transfer learning in single-cell analysis. Mapping assumptions and query/reference overlap matter.

Source: [original reference or official documentation](https://docs.scarches.org/).

## Tangram

A method for mapping single-cell profiles to spatial measurements. A computational assignment is not direct observation of every cell’s location.

Source: [original reference or official documentation](https://github.com/broadinstitute/Tangram).

## scJoint

Transfer learning for integrating transcriptomic and chromatin-accessibility data.

Source: [original reference or official documentation](https://github.com/SydneyBioX/scJoint).

## scMultiSim

A simulator for multi-omic single-cell data; simulated truth is conditional on its generative assumptions.

Source: [original reference or official documentation](https://github.com/ZhangLabGT/scMultiSim).

## scVIDR

A framework for predicting cellular responses across perturbation conditions and doses; distinguish learned response transfer from causal identification.

Source: [original reference or official documentation](https://github.com/BhattacharyaLab/scVIDR).

## trVAE

A conditional variational autoencoder for transferring responses across conditions.

Source: [original reference or official documentation](https://github.com/theislab/trVAE).

## inVAE

An invariant-representation variational model for biological data. Identifiability depends on explicit modeling assumptions.

Source: [original reference or official documentation](https://github.com/theislab/inVAE).

## biolord

A disentangled representation framework that separates specified attributes from residual variation in biological data.

Source: [original reference or official documentation](https://github.com/nitzanlab/biolord).

## scTab

A tabular deep-learning approach for cell-type classification; supervised classification and frozen-embedding evaluation are different protocols.

Source: [original reference or official documentation](https://github.com/theislab/scTab).

## MAESTRO

A workflow for single-cell RNA/ATAC analysis and integration, including peak-to-gene activity calculations.

Source: [original reference or official documentation](https://github.com/liulab-dfci/MAESTRO).

## GENIE3

Gene-regulatory-network inference using ensembles of regression trees. Predicted edges are hypotheses, not automatically causal interactions.

Source: [original reference or official documentation](https://doi.org/10.1371/journal.pone.0012776).

## GRNBoost2

A gradient-boosting network-inference method distributed through Arboreto.

Source: [original reference or official documentation](https://arboreto.readthedocs.io/en/latest/).

## GO

An ontology and annotation resource for molecular function, biological process and cellular component. It is distinct from Cell Ontology.

Source: [original reference or official documentation](https://geneontology.org/).

## HGNC

The HUGO Gene Nomenclature Committee maintains approved human gene symbols and identifiers.

Source: [original reference or official documentation](https://www.genenames.org/).

## Ontology Access Kit

A software toolkit for accessing and working with ontology resources and mappings.

Source: [original reference or official documentation](https://incatools.github.io/ontology-access-kit/).

## PDB

The Protein Data Bank archive stores experimentally determined macromolecular structures. Predicted-structure databases are separate resources.

Source: [original reference or official documentation](https://www.wwpdb.org/).

## ZINC

A resource of commercially accessible small-molecule structures used in virtual screening. Database membership is not experimental efficacy evidence.

Source: [original reference or official documentation](https://zinc.docking.org/).

## BioGRID ORCS

The BioGRID Open Repository of CRISPR Screens aggregates screen-level results and metadata.

Source: [original reference or official documentation](https://orcs.thebiogrid.org/).

## LINCS L1000

An expression-profiling assay/resource measuring landmark genes and inferring additional signals. It is not a direct measurement of every transcript in every single cell.

Source: [original reference or official documentation](https://clue.io/).

## OpenProblems

Open Problems in Single-Cell Analysis develops standardized computational tasks and benchmarks; tasks have their own data and evaluation protocols.

Source: [original reference or official documentation](https://openproblems.bio/).

## PyTorch Lightning

Training orchestration for PyTorch. Use the documented API for the installed version.

Source: [original reference or official documentation](https://lightning.ai/docs/pytorch/stable/).

## FlashAttention

An exact-attention algorithm designed to reduce memory traffic; it does not make full attention mathematically linear in sequence length.

Source: [original reference or official documentation](https://github.com/Dao-AILab/flash-attention).

## hnswlib

An approximate-nearest-neighbor library based on hierarchical navigable small-world graphs. Recall depends on index and search parameters.

Source: [original reference or official documentation](https://github.com/nmslib/hnswlib).

## LAMMPS

A molecular simulation package; force fields, boundary conditions and numerical settings define the simulation’s scope.

Source: [original reference or official documentation](https://www.lammps.org/).

## Lattice Microbes

Software for stochastic reaction and reaction-diffusion simulations used in cellular modeling.

Source: [original reference or official documentation](https://github.com/Luthey-Schulten-Lab/Lattice_Microbes).

## PyLabRobot

Python software for laboratory automation and hardware integration. Hardware compatibility is device-specific.

Source: [original reference or official documentation](https://docs.pylabrobot.org/).

## PubTator

NCBI biomedical literature annotation/search tools for entities and relations. Automatically extracted annotations require review for downstream curation.

Source: [original reference or official documentation](https://www.ncbi.nlm.nih.gov/research/pubtator3/).

## TeamTat

A collaborative biomedical text-annotation tool.

Source: [original reference or official documentation](https://www.ncbi.nlm.nih.gov/research/bionlp/Tools/teamtat/).

## 10x Genomics

10x Genomics supplies single-cell and spatial assays; Visium is a spatial-transcriptomics product family whose resolution depends on the generation and processing.

Source: [original reference or official documentation](https://www.10xgenomics.com/platforms/visium).

## Stereo-seq

A spatial-transcriptomics technology using patterned DNA nanoball arrays. Capture features and final cell segmentation are different resolutions.

Source: [original reference or official documentation](https://doi.org/10.1016/j.cell.2022.04.003).

## seqFISH

Sequential fluorescence in situ hybridization measures spatial RNA patterns through repeated imaging rounds.

Source: [original reference or official documentation](https://doi.org/10.1038/nmeth.2892).

## Smart-seq2

A full-length single-cell RNA-seq protocol. Full-length coverage is distinct from unique-molecular-identifier counting.

Source: [original reference or official documentation](https://doi.org/10.1038/nmeth.2639).

## MELLODDY

A collaboration on federated learning for drug discovery, allowing joint modeling while keeping participating organizations’ raw data decentralized. It is not a single-cell atlas or one biological foundation model.

Source: [original platform paper](https://arxiv.org/abs/2210.08871).

## Seurat

An R toolkit for quality control, analysis and integration of single-cell data. Reproducible analyses should identify the Seurat version, assay representation and integration workflow.

Source: [Official Seurat documentation](https://satijalab.org/seurat/).

## Scanpy

A Python toolkit for single-cell analysis built around AnnData, covering preprocessing, visualization, clustering and other analysis steps.

Source: [Official Scanpy documentation](https://scanpy.readthedocs.io/en/stable/).

## bioRxiv

A preprint server for biology. A posted preprint is not equivalent to a journal-certified peer-reviewed article; retain the version and consult any linked publication.

Source: [bioRxiv explanation](https://www.biorxiv.org/content/what-unrefereed-preprint).

## ESMFold

A protein structure prediction method based on a protein language model, enabling prediction from a single sequence. Its scope differs from predicting an entire cell state.

Source: [Lin et al., Science 2023](https://doi.org/10.1126/science.ade2574).

## RoseTTAFold

A protein structure prediction network integrating sequence, inter-residue distance and three-dimensional coordinate representations.

Source: [Baek et al., Science 2021](https://doi.org/10.1126/science.abj8754).
