---
title: Additional Model References
tags: [reference, AIVC, models, tools]
date_verified: 2026-10-20
---

# Additional Model References

These entries identify models and tools cited elsewhere in the vault. Verification covers publication identity and core method descriptions from original papers or author-maintained resources. It does not independently reproduce benchmark results. A shared name does not make model versions or evaluation settings interchangeable.

## GenePert

A regularized regression predictor of perturbation effects using GenePT embeddings of gene descriptions. It predicts expression changes from representations of the perturbed genes; it is not itself a graph neural network or a cell foundation model. Mean-response prediction does not establish recovery of a full heterogeneous cell distribution.

Sources: [Chen and Zou, 2024 preprint](https://doi.org/10.1101/2024.10.27.620513); [official implementation](https://github.com/zou-group/GenePert).

## GREmLN

Gene Regulatory Embedding-based Large Neural model, a transcriptomics foundation model incorporating molecular-graph structure into attention through graph signal processing. The checked March 2026 revision remains a preprint. Graph-informed embeddings and reverse-perturbation benchmarks do not by themselves establish causal regulatory relationships.

Sources: [original preprint, version 3](https://pmc.ncbi.nlm.nih.gov/articles/PMC13060794/); [official repository](https://github.com/czi-ai/GREmLN).

## scELMo

Uses language-model-derived biological embeddings for single-cell analysis, extending the gene-description embedding approach associated with GenePT. The journal article is **Embeddings from language models are good learners for single-cell data analysis**, Patterns (2026). Distinguish a frozen embedding analysis from downstream models trained for a particular task.

Sources: [journal DOI](https://doi.org/10.1016/j.patter.2025.101431); [official code and citation](https://github.com/HelloWorldLTY/scELMo); [2023 preprint](https://doi.org/10.1101/2023.12.07.569910).

## scPRAM

Predicts single-cell perturbation responses using attention over latent representations. Training-cell perturbation information supplies the values for a query cell's inferred perturbation vector. Transfer to a new cell context is not equivalent to prediction for an entirely unseen molecular intervention.

Sources: [original Bioinformatics article, 2024](https://doi.org/10.1093/bioinformatics/btae265); [full text](https://pmc.ncbi.nlm.nih.gov/articles/PMC11076148/); [official repository](https://github.com/jiang-q19/scPRAM).

## scPreGAN

A deep generative approach combining representation learning and adversarial generation to predict perturbed single-cell expression. The original article is **scPreGAN, a deep generative model for predicting the response of single-cell expression to perturbation**, Bioinformatics (2022). Its generalization claims must be interpreted with the cell-type and condition splits used in each experiment.

Sources: [original article DOI](https://doi.org/10.1093/bioinformatics/btac357); [publication record](https://pubmed.ncbi.nlm.nih.gov/35639705/).

## scouter

The publication styles the method **Scouter**. It combines control-cell expression with language-model embeddings of perturbed genes to predict genetic-perturbation responses. The paper evaluates single- and two-gene perturbations; generalization within a biological condition should not be conflated with arbitrary cross-cell-type transfer.

Source: [Scouter predicts transcriptional responses to genetic perturbations with large language model embeddings, Nature Computational Science](https://doi.org/10.1038/s43588-025-00912-8).

## scDiffEq

A neural stochastic differential-equation framework for learning drift and diffusion in cell-state dynamics. It uses time-resolved population data to model trajectories; it is not interchangeable with a spliced/unspliced RNA-velocity estimator. A learned stochastic trajectory is a model-based reconstruction rather than direct tracking of every sequenced cell.

Sources: [Learning cell dynamics with neural differential equations, Nature Machine Intelligence](https://doi.org/10.1038/s42256-025-01150-3); [official documentation](https://www.scdiffeq.com/).

## SALT

**Salt** is the additive combinatorial-perturbation baseline introduced in **Season combinatorial intervention predictions with Salt & Peper**. It estimates combined intervention effects using single-intervention effects. Its additive assumption supplies a useful baseline, but cannot express arbitrary genetic interactions. SALT in this vault refers to this method; the acronym is not unique across science.

Source: [Gaudelet et al., 2024 original paper](https://arxiv.org/abs/2404.16907).

## PEPER

**Peper** extends Salt with a learned nonlinear correction for pairwise genetic-perturbation responses. It should not be described as a purely linear baseline. The correction depends on training coverage, so an advantage in selected combination splits does not imply universal extrapolation to unobserved genes or higher-order combinations.

Source: [Season combinatorial intervention predictions with Salt & Peper](https://arxiv.org/abs/2404.16907).

## Nicheformer

A transformer foundation model trained on dissociated and spatial transcriptomics from human and mouse. SpatialCorpus-110M combines more than 57 million dissociated and 53 million spatial cells. The paper evaluates spatial labels and neighborhood composition, including supervised linear probes and fine-tuning. Predicting spatial context from expression is not measurement of a cell's original physical coordinates.

Source: [Nicheformer: a foundation model for single-cell and spatial omics, Nature Methods 2025](https://doi.org/10.1038/s41592-025-02814-z).

## AIDO

**AI-Driven Digital Organism** names GenBio AI's multiscale modeling program and model family, rather than one fixed checkpoint. Its components cover different biological modalities; component-specific claims need their own paper, version and evaluation. The overall vision is not evidence that a complete organism has been simulated.

Sources: [authors' AIDO perspective](https://genbio.ai/research/AIDO.pdf); [official model-family explanation](https://genbio.ai/aido-multiscale-foundation-models/).

## Tabula

In the foundation-model context, **TABULA** is the tabular single-cell model presented at NeurIPS 2025, combining gene reconstruction, cell contrastive learning and federated training. A 2026 follow-up extends its biological applications. It is distinct from the Tabula Sapiens/Muris atlas datasets and unrelated similarly named general tabular models. Federated training avoids centralizing raw data but is not, by itself, a formal privacy guarantee.

Sources: [author-maintained NeurIPS 2025 paper page](https://www.devo-evo.com/papers/tabula_neurips/); [2026 follow-up preprint](https://arxiv.org/abs/2607.19400).

## SpatialAgent

The spatial-biology agent by Wang and colleagues combines language models, analysis tools and task planning for spatial-omics workflows. The August 2026 preprint revision describes a Plan–Act–Conclude architecture, retrieval and verification modules. Results depend on the agent version, available tools and datasets. This entry does not refer to the unrelated visual-geometry agent with the same name.

Sources: [original preprint, version 2](https://www.biorxiv.org/content/10.1101/2025.04.03.646459v2); [official implementation](https://github.com/Genentech/SpatialAgent). Use the preprint's DOI: the repository's inherited BibTeX contains inconsistent date digits.

## BioDiscoveryAgent

An LLM agent for selecting genetic-perturbation experiments in a feedback loop, supported by literature/gene search and critique tools. It is an experimental-design system rather than a pretrained expression-response simulator. Retrospective screen-based evaluation and prospective experimental discovery should be distinguished.

Sources: [original preprint](https://arxiv.org/abs/2405.17631); [ICLR 2025 paper](https://openreview.net/forum?id=HAwZGLcye3); [official implementation](https://github.com/snap-stanford/BioDiscoveryAgent).

## CRISPR-GPT

An LLM agent system that supports gene-editing experiment design and analysis using domain information and external tools. The original paper reports selected experimental demonstrations; it does not validate every generated design or replace experiment-specific assessment. Published online in July 2025, with the journal issue dated 2026; a publisher correction is linked on the article page.

Source: [CRISPR-GPT for agentic automation of gene-editing experiments, Nature Biomedical Engineering](https://doi.org/10.1038/s41551-025-01463-z).

## scANVI

Single-cell ANnotation using Variational Inference is a semi-supervised extension of scVI for integrating transcriptomic datasets and transferring cell-state labels. It uses available annotations during learning and estimates label probabilities. Integration may remove biological differences if batches and biology are confounded; label transfer depends on the reference labels and coverage.

Sources: [Probabilistic harmonization and annotation of single-cell transcriptomics data with deep generative models, Molecular Systems Biology 2021](https://doi.org/10.15252/msb.20209620); [official scvi-tools documentation](https://docs.scvi-tools.org/en/latest/user_guide/models/scanvi.html).

## TranscriptFormer

A family of autoregressive generative models jointly modeling gene identities and expression counts across species. The largest training collection contains up to 112 million cells from 12 species; checkpoints differ in species coverage and size. Cross-species benchmarks support transfer in tested settings, rather than unrestricted generalization to every organism or disease.

Sources: [TranscriptFormer: A generative cell atlas across 1.5 billion years of evolution, Science 2026](https://doi.org/10.1126/science.aec8514); [original 2025 preprint](https://doi.org/10.1101/2025.04.25.650731); [official implementation](https://github.com/czi-ai/transcriptformer).

## SIMBA

A graph-embedding framework that co-embeds cells and features, including genes, accessible chromatin regions and sequence features, in a shared space. It supports multimodal integration and feature interpretation. Co-embedding proximity describes learned associations and does not independently establish causal regulatory interactions. The article appeared online in 2023 and in a 2024 journal issue.

Sources: [SIMBA: single-cell embedding along with features, Nature Methods](https://doi.org/10.1038/s41592-023-01899-8); [original full text](https://pmc.ncbi.nlm.nih.gov/articles/PMC11166568/).

## scDFM

Distributional Flow Matching is a conditional generative model for post-perturbation expression distributions, presented at ICLR 2026. It combines flow matching with population-level distribution alignment. Its generated flow is a statistical transport process; without additional evidence, it should not be interpreted as a measured biological time course or individual-cell lineage.

Sources: [original paper](https://arxiv.org/abs/2602.07103); [ICLR 2026 paper](https://openreview.net/pdf?id=QSGanMEcUV); [authors' publication page](https://ai4s.lab.westlake.edu.cn/publications/).

## scBasset

A convolutional neural-network approach to modeling single-cell chromatin accessibility from genomic DNA sequence. It uses sequence-dependent accessibility predictions to learn cell representations and investigate regulatory features. Predicted motif effects are model-based estimates, not direct measurements of transcription-factor binding or causal activity.

Sources: [scBasset: sequence-based modeling of single-cell ATAC-seq using convolutional neural networks, Nature Methods 2022](https://doi.org/10.1038/s41592-022-01562-8); [author correction concerning benchmark-method citations](https://doi.org/10.1038/s41592-022-01754-2).

## GET

The **general expression transformer** learns regulatory representations from chromatin accessibility and sequence-derived motif information, then predicts expression after training with paired accessibility and expression information. The original work spans 213 human cell types. This is not an RNA-only cell-embedding model, and the use of sequence features should not be confused with a generic raw-DNA language model.

Sources: [A foundation model of transcription across human cell types, Nature 2025](https://doi.org/10.1038/s41586-024-08391-z); [official implementation](https://github.com/GET-Foundation/get_model).

## EpiAgent

A single-cell epigenomics foundation model that tokenizes chromatin accessibility over candidate cis-regulatory elements into cell sentences and learns with bidirectional attention. It supports representation learning, annotation and adapted perturbation tasks. Its core input is a tokenized accessibility profile, rather than nucleotide sequence. It is distinct from unrelated epidemiology or inscription-restoration systems with the same name.

Sources: [EpiAgent: foundation model for single-cell epigenomics, Nature Methods 2025](https://doi.org/10.1038/s41592-025-02822-z); [official implementation and preprocessing description](https://github.com/xy-chen16/EpiAgent).
