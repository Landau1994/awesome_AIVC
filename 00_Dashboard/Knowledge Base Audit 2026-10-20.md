---
title: Knowledge Base Audit 2026-10-20
tags: [audit, AIVC]
date_created: 2026-10-20
---

# Knowledge Base Audit — 20 October 2026

The vault has been checked for missing links, bibliographic identity, central scientific claims and consistency between paper notes, concepts and indexes. Corrections and new reference entries are in English. This is a source-based editorial audit, not a reproduction of the studies or a claim that every numerical detail has been verified.

## Coverage and link completion

The initial snapshot contained **157 Markdown files**, including **85 paper notes**, **45 concept notes** and **4 templates**. Two paper notes imported during the work were also checked. Sixteen supporting notes and this report were added, bringing the snapshot to **176 files**, including **87 paper notes**. Hidden application files and the `copilot` conversation folder were excluded. Templates retain their intentional placeholders.

| Check | Initial snapshot | Final snapshot |
|---|---:|---:|
| Unresolved internal target spellings | 383 | 0 |
| Occurrences of those unresolved targets | 562 | 0 |
| Empty source fields or empty links in content notes | 25 | 0 |
| YAML parsing errors in content notes | 0 | 0 |

Missing targets were connected to existing notes where they referred to the same subject. Other targets now point to sourced concept notes or specific headings in reference pages. Display labels and table links were retained or corrected. Aliases that did not correspond to real files were replaced with resolvable targets.

Six conference-paper records use explicit `doi: null` with a `doi_status` explanation and an official proceedings URL: [[01_Papers/CellPLM|CellPLM]], [[01_Papers/CFGen|CFGen]], [[01_Papers/LangCell|LangCell]], [[01_Papers/Perceiver|Perceiver]], [[01_Papers/SetTransformer|Set Transformer]] and [[01_Papers/veloVAE|veloVAE]]. This means no article DOI was confirmed on the selected official record; it does not assert that a DOI can never exist. Identifiers were not invented to fill these fields.

## Major content corrections

| Area | Correction and location |
|---|---|
| Incorrect paper identity | [[01_Papers/ncb 2025 Decoding heterogeneous single-cell perturbation responses\|Decoding heterogeneous single-cell perturbation responses]] had been attributed to “PerturbNet” with an unrelated DOI and unsupported architecture/results. It now describes Song et al.’s perturbation-response score, with DOI `10.1038/s41556-025-01626-9`. The unsupported comparison in chemCPA and catalog entries were also corrected. |
| Paper versions and metadata | Corrected DOI, URL, authors, venue or year where primary records differed. [[01_Papers/Cell2Sentence\|C2S-Scale]] is distinguished from the earlier Cell2Sentence paper; [[01_Papers/UCE\|UCE preprint]] is distinguished from its later journal article. Preprint revisions and journal versions are identified in the relevant notes. |
| Model mechanisms | [[01_Papers/CPA\|CPA]] and [[01_Papers/chemCPA\|chemCPA]] use compositional autoencoder formulations; their catalog entries no longer describe them as ordinary VAEs. Drug-combination prediction is distinguished from genetic-combination prediction. |
| RNA velocity and metrics | Corrected the unspliced/spliced kinetic equations in [[02_Concepts/RNA Velocity\|RNA Velocity]] and [[02_Concepts/Splicing_Kinetics\|Splicing Kinetics]]. A CBDir cosine value of 0.28 is not 28% classification accuracy. Removed unsupported generic performance tables from several method notes. |
| Dataset identity | [[04_Datasets/Replogle\|Replogle]] is a CRISPRi knockdown resource. [[04_Datasets/Parse 1M\|Parse 1M]] in scLDM is a single-donor subset of the 10-million-cell cytokine dataset. [[04_Datasets/Tabula Sapiens 2.0\|Tabula Sapiens 2.0]] contains over 1.1 million cells; the roughly 500,000-cell figure belongs to the original release. |
| Benchmark interpretation | Corrected or qualified dataset counts, metrics and evaluation scope in the AssayBench, CellLink, RNA velocity, scLDM and foundation-model benchmark notes. The COVID-19 F1 result is an infection-status classification result, not general cell-type annotation. |
| Unsupported rankings | Removed blanket “best,” speed and superiority claims from catalogs. Frozen UCE embeddings are distinguished from reference-label classification. Set Transformer’s ISAB complexity is stated as O(nm), linear in input size only for fixed inducing-point count. |
| Conflicting source counts | [[01_Papers/GeneCompass\|GeneCompass]] now records that the source’s headline corpus count and enumerated human/mouse counts differ. The index uses “100M+” with this qualification. |
| Ontologies and causal claims | Corrected Cell Ontology examples and entity-linking scope. Prediction, perturbation association and causal identification are distinguished in the concepts and research plans. |
| Software examples | Replaced unsupported Dynverse Python usage with the documented R ecosystem. Corrected selected Scanpy, embedding, workflow and container examples; installation guidance points to version-aware documentation. |
| New agentic-science note | [[01_Papers/Cell 2026 Toward autonomous science with agentic artificial intelligence\|Agentic-science perspective]] now distinguishes KIRA6 cell-line selectivity from a comparison with a standard drug. Robin’s iterative screen is not described as “2 hits from 30.” Biomni-E1 is a curated execution environment, not a biological simulation. |
| New single-cell review | [[01_Papers/MC 2026 Emerging frontiers for AI in single-cell genomics\|Molecular Cell review]] has verified bibliographic identity and sourced method links. EpiAgent is categorized as a chromatin model: its core input is tokenized accessibility, not raw nucleotide sequence. |

Primary evidence for the most consequential attribution corrections is available in the [Song et al. article](https://www.nature.com/articles/s41556-025-01626-9), [Co-Scientist study](https://www.nature.com/articles/s41586-026-10644-y), [Robin study](https://www.nature.com/articles/s41586-026-10652-y) and [Biomni repository](https://github.com/snap-stanford/Biomni). Other corrected notes contain their own sources.

## Reference navigation

- [[02_Concepts/Methods and Metrics Glossary|Methods and metrics]] and [[02_Concepts/Biological Context Glossary|biological context]] explain short technical terms.
- [[05_Tools/Methods and Data Resources|Methods and data resources]] identifies software, atlases, assays and biological databases.
- [[05_Tools/Additional Model References|Additional model references]] and [[05_Tools/RNA Velocity Methods Reference|RNA velocity methods]] identify methods lacking standalone paper notes.
- [[05_Tools/AI and Scientific Computing Reference|AI and scientific computing]] distinguishes model families, scientific agents and general computing concepts.
- [[08_Resources/Foundational Methods References|Foundational references]] supplies original methods and dataset citations.
- New core notes cover [[02_Concepts/Batch Correction|batch correction]], [[02_Concepts/Causal Inference|causal inference]], [[02_Concepts/Differential Expression|differential expression]], [[02_Concepts/Dimensionality Reduction|dimensionality reduction]], [[02_Concepts/Generalization|generalization]], [[02_Concepts/Maximum Mean Discrepancy|MMD]], [[02_Concepts/Self-Supervised Learning|self-supervised learning]] and [[02_Concepts/Single-Cell Analysis|single-cell analysis]].

## Verification limits and remaining evidence gaps

Publication records, abstracts, accessible full text, author repositories and official documentation were used. Verification notes state the scope for each reviewed paper. A valid DOI or matching title establishes identity; it does not validate every sentence in a reading note.

| Remaining gap | How to use the affected material |
|---|---|
| Detailed numerical tables, figure descriptions and hyperparameters across paper notes | Treat details outside the stated verification scope as provisional. Before citing a number, check the exact source version, table/panel, dataset split and metric. |
| Two papers imported during the audit | Their metadata and broad scope were confirmed, but their full text was inaccessible. The agentic-science note’s figure descriptions, historical stage boundaries, tiered-transparency attribution and Biomni 10% claim remain provisional. The Molecular Cell review’s BioCiteTrace percentages, figures and individual rankings remain provisional. |
| Preprint versus final-paper differences | Keep the selected version with each claim. Do not transfer a result, cell count or architecture detail between revisions without checking it. |
| Executable examples | All 15 Python code blocks passed syntax parsing. Scientific dependencies, datasets, GPU workloads and experiments were not executed. R, Nextflow, shell and container examples were reviewed against documentation where applicable, not run end to end. |
| External-link availability | Sources were checked through accessible publisher, preprint and official pages. An automated HTTP sweep could not run because shell network access was unavailable; this report does not certify that every external URL returns a successful response from every network. A blocked fetch was not treated as evidence that a paper or resource is absent. |
| User provenance and project plans | Existing reading status, ratings and date-added fields were retained. Some imported date-added values predate publication; these are user provenance, not validated publication dates. Unspecified project results and repositories were left explicitly unspecified. |

Final structural validation checked 1,739 internal links, including 380 heading links, along with YAML, empty source/link fields, table structure, wiki-link escaping, code fences and English consistency. No remaining failures were found in the audited snapshot. The Markdown diff also passes whitespace checks. A comparison with the original tracked files confirmed that status, rating, date_added and date_read values were preserved.
