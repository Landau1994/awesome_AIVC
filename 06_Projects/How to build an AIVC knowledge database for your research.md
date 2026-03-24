---
title: How to build an AIVC knowledge database for your research
aliases:
  - Set Maintain AIVC Knowledge
tags:
  - project
  - AIVC
  - knowledge-management
status: planning
priority: High
start_date: 2026-03-25
end_date:
---

# How to build an AIVC knowledge database for your research

## Objective
> What are you trying to achieve?
To construct a comprehensive, scalable, and highly organized Obsidian knowledge base (an "Awesome AIVC" vault) that tracks the rapidly evolving landscape of AI Virtual Cell models, multi-omics datasets, core biological concepts, and foundational papers.

## Background
- The momentum behind Large Language Models (LLMs) has sparked a massive initiative to build the AI Virtual Cell (AIVC)—a multi-scale, multimodal neural network capable of simulating molecules, cells, and tissues.
- With the explosion of life science foundation models (scFMs) and massive reference datasets (Human Cell Atlas, ENCODE, etc.), researchers face information overload.
- A structured knowledge database is essential to map out deep learning architectures (Transformers, GNNs, Diffusion), track state-of-the-art benchmarks, and connect biological knowledge graphs to computational methods.

## Approach
### Methods
- **Vault Structuring:** Organize the database into numbered, distinct directories to separate concerns:
  - `00_Dashboard/` for navigation, learning paths, and reading queues.
  - `01_Papers/` for literature notes.
  - `02_Concepts/` for theoretical foundations (e.g., Flow Matching, Optimal Transport).
  - `03_Models/` for architecture documentation and capability comparisons.
  - `04_Datasets/` for tracking training and benchmarking data.
- **Standardization:** Use dedicated templates (`Paper Template.md`, `Concept Template.md`, `Model Template.md`) to ensure consistent metadata (tags, authors, year, key innovations) across all entries.
- **Dynamic Tracking:** Utilize the Dataview plugin to automatically aggregate statistics (e.g., counting papers, concepts, and models) and generate dynamic tables for model comparisons (by capability and architecture).

### Models Used
*Key architectures to track in the database:*
- [[01_Papers/scGPT|scGPT]] (Transformer)
- [[01_Papers/Geneformer|Geneformer]] (Transformer)
- [[01_Papers/UCE|UCE]] (Universal Cell Embedding)
- [[01_Papers/GEARS|GEARS]] (Graph Neural Network)
- [[01_Papers/bioRxiv 2026 X-Cell Scaling Causal Perturbation Prediction Across Diverse Cellular Contexts via Diffusion Language Models|X-Cell]] (Diffusion Language Model)
- [[01_Papers/Cell2Sentence|Cell2Sentence]] (LLM)

### Datasets
*Core datasets to index for model training and benchmarking:*
- [[04_Datasets/Parse 1M|Parse 1M]] (Large-scale benchmark)
- [[04_Datasets/Tabula Sapiens 2.0|Tabula Sapiens 2.0]] (Human cross-tissue atlas)
- [[04_Datasets/Replogle|Replogle]] (Genome-wide CRISPRi screen)
- [[04_Datasets/Dentate Gyrus|Dentate Gyrus]] (RNA velocity)

## Progress Log
### 2026-03-25
- [x] Defined the 9-folder vault structure (00_Dashboard to 08_Resources).
- [x] Created the main README dashboard with model comparison tables.
- [ ] Populate the `/Templates/` folder with standardized markdown templates.
- [ ] Import the initial batch of 40 foundational papers.

## Results
### Experiments
| Experiment | Config | Result |
|------------|--------|--------|
| Dataview Integration | Querying `#paper` and `#model` tags | Successfully auto-generates vault statistics |
| Model Categorization | Grouping by Architecture vs. Capability | Clearer identification of SOTA models for specific tasks (e.g., UCE for zero-shot) |
| Literature Mapping | Linking papers to `02_Concepts` | Created a functional knowledge graph connecting theory to application |

### Key Findings
- Organizing models by both **Architecture** (e.g., VAE, Diffusion, Flow Matching) and **Capability** (e.g., Perturbation prediction, Gene network inference) makes it significantly easier to identify gaps in the current research landscape.
- Maintaining a dedicated Benchmarking & Evaluation section (e.g., tracking `scFM Bench` and `Perturbation Bench`) is critical, as zero-shot evaluation often reveals limitations in heavily hyped foundation models.

## Code Repository
- [Awesome Foundation Model Single-Cell Papers](https://github.com/OmicsML/awesome-foundation-model-single-cell-papers)
- [Link to your local/private GitHub sync for this Obsidian Vault]

## Related Work
- [[01_Papers/Bunne 2024 - How to Build Virtual Cell|AIVC Vision]] (Roadmap paper for the field)
- [[00_Dashboard/Learning Path|Learning Path]] (Internal guide for onboarding to AIVC concepts)
- [Eric J. Topol, Science 2025: Learning the language of life with AI](https://www.science.org/doi/10.1126/science.adv4414)

## Next Steps
- [ ] Set up the `.gitignore` to protect sensitive local data (`Private/`, `Secrets/`, Copilot API keys).
- [ ] Review the 7 newly added Benchmarking & Evaluation papers to update the model comparison tables.
- [ ] Expand the `02_Concepts` folder to include more details on Multi-modal Integration and Spatial Transcriptomics.

## Notes
- Remember to use the `DataviewJS` block on the main dashboard to keep a live count of all papers, concepts, datasets, and models.
- Keep the "Reading Queue" in the `00_Dashboard` updated weekly to manage the high volume of new preprints in this fast-moving field.