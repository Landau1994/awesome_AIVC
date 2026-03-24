# Awesome AI Virtual Cell (AIVC) [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> A comprehensive knowledge base for studying AI-powered Virtual Cell models

## What is AI Virtual Cell?

AI Virtual Cells (AIVCs) are multi-scale, multimodal neural network models that simulate molecules, cells, and tissues across diverse states. They integrate:
- **Multi-omics data** (transcriptomics, proteomics, metabolomics)
- **Deep learning architectures** (transformers, GNNs, diffusion models)
- **Biological knowledge graphs**

> The momentum that has been built with LLMs has also led to the aspiration for [building the AI virtual cell (AIVC)](https://www.cell.com/cell/fulltext/S0092-8674\(24\)01332-1?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS0092867424013321%3Fshowall%3Dtrue) using multiple models to simulate the actions of molecules, cells, and tissues and enable understanding of their dynamic behavior. With the massive reference data accumulated from global initiatives over the past two decades, such as the Human Genome Project, the Human Cell Atlas, the Cancer Genome Atlas, ENCODE (Encyclopedia of DNA Elements), the Human Protein Atlas, and many others, there is no shortage of data for training machine learning models. The timeline for building the AIVC is unclear, but the optimism for its potential utility, [recently endorsed by more than 40 leading scientists](https://www.cell.com/cell/fulltext/S0092-8674\(24\)01332-1?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS0092867424013321%3Fshowall%3Dtrue), is palpable: "AIVC has the potential to revolutionize the scientific process, leading to future breakthroughs in biomedical research, personalized medicine, drug discovery, cell engineering, and programmable biology."

> With progress on so many fronts, we're seeing a takeoff for life science foundation models that are deepening our understanding of biomolecular structure, function, evolution, and interaction, along with the inner workings of cells. This has led some to equate digital biology to engineering. As [Jensen Huang, CEO of Nvidia, put it](https://x.com/antonioregalado/status/1732434327886053589): "For the first time in human history, biology has the opportunity to be engineering, not science." [Demis Hassabis of Google DeepMind](https://www.youtube.com/watch?v=nQKmVhLIGcs&list=PLqYmG7hTraZBwZQwCxzIlsyFxC3WKH_Ii&index=9) elaborates on this idea: "I call it an engineering science, because unlike the natural sciences, you have to build the artifact of interest first, and then, once you have it, you can use the scientific method to reduce it down and understand its components." Yet, it is important to remember, as Philip Ball opined in his book [How Life Works: A User's Guide to the New Biology](https://www.amazon.com/How-Life-Works-Users-Biology/dp/0226826686), that the language of life is far more complex than we fathom. He states, "Comparing life to a machine, a robot, a computer, sells it short." Going further, he writes that "life is a cascade of processes, each with a distinct integrity and autonomy, the logic of which has no parallel outside the living world." Ball may well be right, but we're beginning to see the ability of AI to deconvolute some of the utter complexity of the language of life—and there's much more to come.
> [Eric J. Topol, Science 2025 Learning the language of life with AI](https://www.science.org/doi/10.1126/science.adv4414)

## Vault Structure

> [!note]
> 
> awesome_AIVC/
> 
> ├── 00_Dashboard/     # Navigation and tracking
> 
> ├── 01_Papers/        # Paper notes (24 papers)
> 
> ├── 02_Concepts/      # Core concepts (20 concepts)
> 
> ├── 03_Models/        # Model architectures and comparisons
> 
> ├── 04_Datasets/      # Datasets and benchmarks
> 
> ├── 05_Tools/         # Software tools and libraries
> 
> ├── 06_Projects/      # Personal projects and experiments
> 
> ├── 07_People_Labs/   # Key researchers and institutions
> 
> ├── 08_Resources/     # Tutorials, courses, and links
> 
> └── Templates/        # Note templates

## Quick Links

- [[00_Dashboard/Dashboard|Main Dashboard]]
- [[00_Dashboard/Reading Queue|Reading Queue]]
- [[00_Dashboard/Learning Path|Learning Path]]
- [[03_Models/Index - Models|Models Index]]

---

## Papers (40)

### Foundation Models 

| Paper                                                                                        | Year | Key Innovation                                                |
| -------------------------------------------------------------------------------------------- | ---- | ------------------------------------------------------------- |
| [[01_Papers/Bunne 2024 - How to Build Virtual Cell\|AIVC Vision]]                            | 2024 | Roadmap paper                                                 |
| [[nature 2026 Advancing regulatory variant effect prediction with AlphaGenome\|AlphaGenome]] | 2026 | Unified deep learning model for regulatory variant prediction |
| [[01_Papers/scGPT\|scGPT]]                                                                   | 2024 | Gene tokenization, multi-task                                 |
| [[01_Papers/Geneformer\|Geneformer]]                                                         | 2023 | Rank-value encoding                                           |
| [[01_Papers/scFoundation\|scFoundation]]                                                     | 2024 | 100M params, read-depth aware                                 |
| [[01_Papers/UCE\|UCE]]                                                                       | 2024 | 650M params, 8 species, best zero-shot                        |
| [[01_Papers/scBERT\|scBERT]]                                                                 | 2022 | First BERT for single-cell                                    |
| [[01_Papers/CellPLM\|CellPLM]]                                                               | 2024 | Cells-as-tokens, 100x faster                                  |
| [[01_Papers/GeneCompass\|GeneCompass]]                                                       | 2024 | Knowledge-informed, cross-species                             |
| [[01_Papers/scPRINT\|scPRINT]]                                                               | 2025 | Zero-shot GRN inference                                       |
| [[01_Papers/Cell2Sentence\|Cell2Sentence]]                                                   | 2024 | Google/Yale, LLM approach, 27B                                |
| [[01_Papers/bioRxiv 2026 STACK In-Context Learning of Single-Cell Biology\|STACK]]           | 2026 | In-context learning for single-cell                           |

### Virtual Cell Modeling

| Paper | Year | Key Innovation |
|-------|------|----------------|
| [[01_Papers/Cell 2025 Human interpretable grammar encodes multicellular systems biology models to democratize virtual cell laboratories\|PhysiCell Grammar]] | 2025 | Human-interpretable grammar for ABMs |
| [[01_Papers/Cell 2026 Bringing the genetically minimal cell to life on a computer in 4D\|4DWCM]] | 2026 | 4D whole-cell model of minimal cell |
| [[01_Papers/nmeth 2026 stVCR spatiotemporal dynamics of single cells\|stVCR]] | 2026 | Spatiotemporal dynamics via dynamical OT |
### Self-Driving Laboratories

| Paper | Year | Key Innovation |
|-------|------|----------------|
| [[01_Papers/Cell 2026 LUMI-lab A foundation model-driven autonomous platform enabling discovery of ionizable lipid designs for mRNA delivery\|LUMI-lab]] | 2026 | FM-driven autonomous lab, mRNA delivery |

### Generative & Diffusion Models

| Paper | Year | Key Innovation |
|-------|------|----------------|
| [[01_Papers/arixv 2025 Scalable Single-Cell Gene Expression Generation with Latent Diffusion Models\|scLDM]] | 2025 | Latent diffusion for gene expression |
| [[01_Papers/arXiv 2026 Latent Causal Diffusions for Single-Cell Perturbation Modeling\|LCD]] | 2026 | Causal diffusion, perturbation |
| [[01_Papers/CFGen\|CFGen]] | 2024 | Flow matching in scVI latent space |

### Architecture & Set Processing

| Paper | Year | Key Innovation |
|-------|------|----------------|
| [[01_Papers/Perceiver\|Perceiver]] | 2021 | Cross-attention, input-size agnostic |
| [[01_Papers/SetTransformer\|Set Transformer]] | 2019 | ISAB, linear-complexity set processing |

### Perturbation Models

| Paper | Year | Key Innovation |
|-------|------|----------------|
| [[01_Papers/GEARS\|GEARS]] | 2023 | GNN + knowledge graph, multi-gene |
| [[01_Papers/CPA\|CPA]] | 2023 | Compositional VAE, drug combinations |
| [[01_Papers/scGen\|scGen]] | 2019 | Latent arithmetic (foundational) |
| [[01_Papers/scVI\|scVI]] | 2018 | VAE + negative binomial, foundational |
| [[01_Papers/CellOT\|CellOT]] | 2023 | Optimal transport, patient transfer |
| [[01_Papers/chemCPA\|chemCPA]] | 2022 | Novel drug prediction |
| [[01_Papers/State\|STATE]] | 2025 | Cross-context perturbation prediction |
| [[01_Papers/ncb 2025 Decoding heterogeneous single-cell perturbation responses\|PerturbNet]] | 2025 | Heterogeneous perturbation decoding |
| [[01_Papers/bioRxiv 2026 X-Cell Scaling Causal Perturbation Prediction Across Diverse Cellular Contexts via Diffusion Language Models\|X-Cell]] | 2026 | 4.9B diffusion LM, scaling laws |

### Benchmarking & Evaluation

| Paper | Year | Key Innovation |
|-------|------|----------------|
| [[01_Papers/GB 2025 Zero-shot evaluation reveals limitations of single-cell foundation models\|Zero-shot Eval]] | 2025 | Reveals scFM zero-shot limitations |
| [[01_Papers/nmeth 2025 Benchmarking algorithms for generalizable single-cell perturbation response prediction\|Perturbation Bench]] | 2025 | Benchmark of perturbation prediction |
| [[01_Papers/bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models\|scFM Bench]] | 2026 | Unified framework, 13 scFMs, 50+ datasets |
| [[01_Papers/bioRxiv 2026 Benchmarking zero-shot single-cell foundation model embeddings for cellular dynamics reconstruction\|Dynamics Bench]] | 2026 | Zero-shot FM embeddings for dynamics |
| [[01_Papers/bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies\|RNA Velocity Bench (17)]] | 2025 | 14 methods, 17 datasets |
| [[01_Papers/bioRxiv 2026 Benchmarking algorithms for RNA velocity inference\|RNA Velocity Bench (29)]] | 2026 | 29 methods, 176 datasets |
| [[01_Papers/bioRxiv 2026 Cell phenotypes in the biomedical literature a systematic analysis and text mining corpus\|CellLink]] | 2026 | Cell phenotype text mining corpus |

### Genomics & Variant Prediction

| Paper | Year | Key Innovation |
|-------|------|----------------|
| [[01_Papers/VariantFormer\|VariantFormer]] | 2025 | Hierarchical transformer, personalized expression |
| [[01_Papers/bioRxiv 2026 Practical utility of sequence-to-omics models for improving the reproducibility of genetic fine-mapping\|S2O Fine-mapping]] | 2026 | S2O models improve fine-mapping reproducibility |

### Drug Discovery & Therapeutics

| Paper | Year | Key Innovation |
|-------|------|----------------|
| [[01_Papers/Cell 2026 Deep-learning-based de novo discovery and design of therapeutics that reverse disease-associated transcriptional phenotypes\|GPS]] | 2026 | De novo therapeutic design, reverse disease phenotypes |

---

## Concepts (27)

### Foundation & Embeddings
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Single-Cell Embeddings|Single-Cell Embeddings]]
- [[02_Concepts/Transfer Learning Biology|Transfer Learning]]
- [[02_Concepts/Zero-shot Learning|Zero-shot Learning]]

### Core Techniques
- [[02_Concepts/Transformers for Biology|Transformers for Biology]]
- [[02_Concepts/Graph Neural Networks|Graph Neural Networks]]
- [[02_Concepts/Generative Models|Generative Models]]
- [[02_Concepts/Flow Matching|Flow Matching]]
- [[02_Concepts/Variational Autoencoders|Variational Autoencoders]]
- [[02_Concepts/Optimal Transport|Optimal Transport]]
- [[02_Concepts/Disentangled Representations|Disentangled Representations]]
- [[02_Concepts/Latent Diffusion Models|Latent Diffusion Models]]
- [[02_Concepts/Diffusion Transformer|Diffusion Transformer]]
- [[02_Concepts/Classifier-Free Guidance|Classifier-Free Guidance]]
- [[02_Concepts/Exchangeability|Exchangeability]]

### Biology & Networks
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]
- [[02_Concepts/Gene Regulatory Networks|Gene Regulatory Networks]]
- [[02_Concepts/Knowledge Graphs|Knowledge Graphs]]
- [[02_Concepts/Cell State Transitions|Cell State Transitions]]
- [[02_Concepts/ATAC-seq|ATAC-seq]]

### Multi-modal & Spatial
- [[02_Concepts/Multi-modal Integration|Multi-modal Integration]]
- [[02_Concepts/Spatial Transcriptomics|Spatial Transcriptomics]]
- [[02_Concepts/Cell-Cell Communication|Cell-Cell Communication]]

### Applications
- [[02_Concepts/Drug Discovery|Drug Discovery]]
- [[02_Concepts/Molecular Representations|Molecular Representations]]
- [[02_Concepts/Self-Driving Laboratories|Self-Driving Laboratories]]

---

## Model Comparison

### By Capability

| Task                        | Best Models                       |
| --------------------------- | --------------------------------- |
| Cell annotation (zero-shot) | UCE, Geneformer                   |
| Perturbation prediction     | X-Cell, GEARS, scGPT, CPA, STATE |
| Gene network inference      | scPRINT, GeneCompass              |
| Cross-species               | UCE (8 species), GeneCompass      |
| Novel drug prediction       | chemCPA, GPS                      |
| Spatiotemporal dynamics     | stVCR                             |
| Speed                       | CellPLM (100x faster)             |

### By Architecture

| Type | Models |
|------|--------|
| Transformers | scGPT, Geneformer, scFoundation, UCE, STACK, VariantFormer, Gemini |
| GNN | GEARS |
| VAE | CPA, scGen, scVI, PerturbNet |
| Optimal Transport | CellOT, stVCR |
| Diffusion | scLDM, LCD, X-Cell |
| Flow Matching | CFGen |
| LLM | Cell2Sentence, Gemini |
| Set Processing | Perceiver, Set Transformer |
| Whole-Cell Simulation | 4DWCM, PhysiCell |

---

## Datasets (7)

| Dataset | Type | Description |
|---------|------|-------------|
| [[04_Datasets/COVID-19\|COVID-19]] | scRNA-seq | COVID-19 immune response |
| [[04_Datasets/Dentate Gyrus\|Dentate Gyrus]] | scRNA-seq | Neurogenesis, RNA velocity |
| [[04_Datasets/Human Lung Cell Atlas\|Human Lung Cell Atlas]] | scRNA-seq | Lung reference atlas |
| [[04_Datasets/Parse 1M\|Parse 1M]] | scRNA-seq | 1M cells, large-scale benchmark |
| [[04_Datasets/Replogle\|Replogle]] | [[02_Concepts/Perturb-seq\|Perturb-seq]] | Genome-wide CRISPRi screen |
| [[04_Datasets/Tabula Muris\|Tabula Muris]] | scRNA-seq | Mouse cross-tissue atlas |
| [[04_Datasets/Tabula Sapiens 2.0\|Tabula Sapiens 2.0]] | scRNA-seq | Human cross-tissue atlas |

---

## External Resources

- [Cell Paper: How to Build the Virtual Cell with AI](https://www.cell.com/cell/fulltext/S0092-8674(24)01332-1)
- [Arc Institute Virtual Cell Challenge](https://arcinstitute.org/news/virtual-cell-challenge-2025)
- [Nature: Three Data Pillars for Virtual Cells](https://www.nature.com/articles/s41422-025-01101-y)
- [Google: C2S-Scale Research Blog](https://research.google/blog/teaching-machines-the-language-of-biology-scaling-large-language-models-for-next-generation-single-cell-analysis/)
- [Awesome Foundation Model Single-Cell Papers](https://github.com/OmicsML/awesome-foundation-model-single-cell-papers)
- https://virtualcellmodels.cziscience.com/models

---

## Contributing

Add new notes using the templates in `/Templates/`:
- `Paper Template.md` - For paper reading notes
- `Concept Template.md` - For theoretical concepts
- `Model Template.md` - For model documentation
- `Project Template.md` - For tracking projects

---

## Stats

```dataviewjs
const papers = dv.pages('#paper').length;
const concepts = dv.pages('#concept').length;
const datasets = dv.pages('#dataset').length;
const models = dv.pages('#model').length;
const templates = dv.pages('#template').length;

dv.table(["Category", "Count"], [
  ["Papers", papers],
  ["Concepts", concepts],
  ["Datasets", datasets],
  ["Models", models],
  ["Templates", templates+4]
]);
```

---

## Changelog

### 2026-03-24 - Major Paper Tables Update & New Sections

**New Papers Added (4):**
- [[01_Papers/bioRxiv 2026 X-Cell Scaling Causal Perturbation Prediction Across Diverse Cellular Contexts via Diffusion Language Models|X-Cell]]: 4.9B diffusion language model with perturbation scaling laws
- [[01_Papers/nmeth 2026 stVCR spatiotemporal dynamics of single cells|stVCR]]: Spatiotemporal dynamics reconstruction via dynamical optimal transport
- [[01_Papers/Cell 2026 Deep-learning-based de novo discovery and design of therapeutics that reverse disease-associated transcriptional phenotypes|GPS]]: De novo therapeutic design reversing disease transcriptional phenotypes
- [[01_Papers/bioRxiv 2026 Benchmarking zero-shot single-cell foundation model embeddings for cellular dynamics reconstruction|Dynamics Bench]]: Zero-shot FM embeddings benchmark for cellular dynamics

**Previously Unlisted Papers Now in Tables (11):**
- STACK, STATE, PerturbNet, VariantFormer, S2O Fine-mapping, CellLink
- Zero-shot Eval, Perturbation Bench, scFM Bench, RNA Velocity Bench (17), RNA Velocity Bench (29)

**New Paper Sections:**
- Benchmarking & Evaluation (7 papers)
- Genomics & Variant Prediction (2 papers)
- Drug Discovery & Therapeutics (1 paper)

**Updated Model Comparison:**
- By Capability: added X-Cell, STATE, GPS, stVCR
- By Architecture: added STACK, VariantFormer, PerturbNet, stVCR, X-Cell

**Updated Statistics:**
- Papers: 40 (previously 36)

### 2026-03-17 - Generative Models, Datasets & Concepts Expansion

**New Papers Added (4):**
- [[01_Papers/CFGen|CFGen]]: Flow matching in scVI latent space for single-cell generation
- [[01_Papers/Perceiver|Perceiver]]: Cross-attention based input-size agnostic architecture
- [[01_Papers/SetTransformer|Set Transformer]]: ISAB for linear-complexity permutation-invariant set processing
- [[01_Papers/scVI|scVI]]: Foundational VAE with negative binomial likelihood for scRNA-seq

**New Concepts Added (5):**
- [[02_Concepts/ATAC-seq|ATAC-seq]]: Chromatin accessibility assay
- [[02_Concepts/Classifier-Free Guidance|Classifier-Free Guidance]]: Conditional generation technique
- [[02_Concepts/Diffusion Transformer|Diffusion Transformer]]: DiT architecture
- [[02_Concepts/Exchangeability|Exchangeability]]: Permutation invariance in statistics
- [[02_Concepts/Latent Diffusion Models|Latent Diffusion Models]]: Diffusion in latent space

**New Datasets Section Added (7):**
- COVID-19, Dentate Gyrus, Human Lung Cell Atlas, Parse 1M, Replogle, Tabula Muris, Tabula Sapiens 2.0

**Updated Statistics:**
- Papers: 36 (previously 32)
- Concepts: 27 (previously 22)
- Datasets: 7 (new section)
- Models: 2 (unchanged)

### 2026-02-16 - RNA Velocity and Benchmarking Papers Added

**New Papers Added (4):**
- bioRxiv 2025 Benchmarking RNA velocity methods across 17 independent studies
- bioRxiv 2026 Benchmarking algorithms for RNA velocity inference
- bioRxiv 2026 Cell phenotypes in the biomedical literature a systematic analysis and text mining corpus
- bioRxiv 2026 Practical utility of sequence-to-omics models for improving the reproducibility of genetic fine-mapping

**Updated Statistics:**
- Papers: 28 (previously 24)
- Concepts: 20 (unchanged)
- Models: 2 (unchanged)

### 2026-01-30 - Highlighted AlphaGenome Paper

**Highlighted Important Paper:**
- [[nature 2026 Advancing regulatory variant effect prediction with AlphaGenome|AlphaGenome]]: Added to Foundation Models section as a key paper for regulatory variant effect prediction with unified deep learning approach.

**Updated Statistics:**
- Papers: 24 (previously 24)
- Concepts: 20 (previously 20)
- Models: 2 (previously 2)

### 2026-01-30 - Content Update

**New Papers Added (9):**
- AlphaGenome
- arXiv 2026 Latent Causal Diffusions for Single-Cell Perturbation Modeling
- bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models
- bioRxiv 2026 STACK In-Context Learning of Single-Cell Biology
- GB 2025 Zero-shot evaluation reveals limitations of single-cell foundation models
- ncb 2025 Decoding heterogeneous single-cell perturbation responses
- nmeth 2025 Benchmarking algorithms for generalizable single-cell perturbation response prediction
- State.md
- VariantFormer.md

**Updated Statistics:**
- Papers: 24 (previously 15)
- Concepts: 20 (previously 20)
- Models: 2 (previously 1)

### 2026-01-18 - Privacy & Multimodal Update

**New Model:**
- [[03_Models/GEMINI|Gemini]]: Added documentation for Google's multimodal LLM family.

**Privacy & Security:**
- Enhanced `.gitignore` to protect sensitive local data:
    - Dedicated `Private/` and `Secrets/` folders for non-synced notes.
    - Support for `*.private.md` file suffix for ad-hoc private notes.
    - Protected Copilot plugin API keys and conversation history.
    - Explicitly ignored Obsidian `.trash/` folder.

### 2026-01-16 - Initial Release

**Papers Added (15):**
- Foundation Models (10): AIVC Vision, scGPT, Geneformer, scFoundation, UCE, scBERT, CellPLM, GeneCompass, scPRINT, Cell2Sentence
- Perturbation Models (5): GEARS, CPA, scGen, CellOT, chemCPA

**Concepts Added (20):**
- Foundation & Embeddings: Cell Foundation Models, Single-Cell Embeddings, Transfer Learning, Zero-shot Learning
- Core Techniques: Transformers for Biology, Graph Neural Networks, Generative Models, VAEs, Optimal Transport, Disentangled Representations
- Biology & Networks: Perturbation Prediction, Gene Regulatory Networks, Knowledge Graphs, Cell State Transitions
- Multi-modal & Spatial: Multi-modal Integration, Spatial Transcriptomics, Cell-Cell Communication
- Applications: Drug Discovery, Molecular Representations

**Infrastructure:**
- Obsidian vault with Dataview, Excalidraw, Git plugins
- Dashboard with dynamic queries
- Learning path (6 phases)
- Reading queue with priority system
- Templates for papers, concepts, models, projects
- Model comparison index