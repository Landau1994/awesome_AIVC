# Awesome AI Virtual Cell (AIVC) [![Awesome](https://awesome.re/badge.svg)](https://awesome.re)

> A comprehensive knowledge base for studying AI-powered Virtual Cell models

## What is AI Virtual Cell?

AI Virtual Cells (AIVCs) are multi-scale, multimodal neural network models that simulate molecules, cells, and tissues across diverse states. They integrate:
- **Multi-omics data** (transcriptomics, proteomics, metabolomics)
- **Deep learning architectures** (transformers, GNNs, diffusion models)
- **Biological knowledge graphs**

> The momentum that has been built with LLMs has also led to the aspiration for [building the AI virtual cell (AIVC)](https://www.cell.com/cell/fulltext/S0092-8674\(24\)01332-1?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS0092867424013321%3Fshowall%3Dtrue) using multiple models to simulate the actions of molecules, cells, and tissues and enable understanding of their dynamic behavior. With the massive reference data accumulated from global initiatives over the past two decades, such as the Human Genome Project, the Human Cell Atlas, the Cancer Genome Atlas, ENCODE (Encyclopedia of DNA Elements), the Human Protein Atlas, and many others, there is no shortage of data for training machine learning models. The timeline for building the AIVC is unclear, but the optimism for its potential utility, [recently endorsed by more than 40 leading scientists](https://www.cell.com/cell/fulltext/S0092-8674\(24\)01332-1?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS0092867424013321%3Fshowall%3Dtrue), is palpable: “AIVC has the potential to revolutionize the scientific process, leading to future breakthroughs in biomedical research, personalized medicine, drug discovery, cell engineering, and programmable biology.”
> 
> With progress on so many fronts, we’re seeing a takeoff for life science foundation models that are deepening our understanding of biomolecular structure, function, evolution, and interaction, along with the inner workings of cells. This has led some to equate digital biology to engineering. As [Jensen Huang, CEO of Nvidia, put it](https://x.com/antonioregalado/status/1732434327886053589): “For the first time in human history, biology has the opportunity to be engineering, not science.” [Demis Hassabis of Google DeepMind](https://www.youtube.com/watch?v=nQKmVhLIGcs&list=PLqYmG7hTraZBwZQwCxzIlsyFxC3WKH_Ii&index=9) elaborates on this idea: “I call it an engineering science, because unlike the natural sciences, you have to build the artifact of interest first, and then, once you have it, you can use the scientific method to reduce it down and understand its components.” Yet, it is important to remember, as Philip Ball opined in his book [How Life Works: A User’s Guide to the New Biology](https://www.amazon.com/How-Life-Works-Users-Biology/dp/0226826686), that the language of life is far more complex than we fathom. He states, “Comparing life to a machine, a robot, a computer, sells it short.” Going further, he writes that “life is a cascade of processes, each with a distinct integrity and autonomy, the logic of which has no parallel outside the living world.” Ball may well be right, but we’re beginning to see the ability of AI to deconvolute some of the utter complexity of the language of life—and there’s much more to come.
> [Eric J. Topol, Science 2025 Learning the language of life with AI](https://www.science.org/doi/10.1126/science.adv4414)

## Vault Structure


> [!note]
> 
> awesome_AIVC/
> 
> ├── 00_Dashboard/     # Navigation and tracking
> 
> ├── 01_Papers/        # Paper notes (`$= dv.pages('"01_Papers"').length` papers)
> 
> ├── 02_Concepts/      # Core concepts (`$= dv.pages('"02_Concepts"').length` concepts)
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
> 

## Quick Links

- [[00_Dashboard/Dashboard|Main Dashboard]]
- [[00_Dashboard/Reading Queue|Reading Queue]]
- [[00_Dashboard/Learning Path|Learning Path]]
- [[03_Models/Index - Models|Models Index]]

---

## Papers (`$= dv.pages('"01_Papers"').length`)

### Foundation Models 

| Paper                                                             | Year | Key Innovation                         |
| ----------------------------------------------------------------- | ---- | -------------------------------------- |
| [[01_Papers/Bunne 2024 - How to Build Virtual Cell\|AIVC Vision]] | 2024 | Roadmap paper                          |
| [[01_Papers/scGPT\|scGPT]]                                        | 2024 | Gene tokenization, multi-task          |
| [[01_Papers/Geneformer\|Geneformer]]                              | 2023 | Rank-value encoding                    |
| [[01_Papers/scFoundation\|scFoundation]]                          | 2024 | 100M params, read-depth aware          |
| [[01_Papers/UCE\|UCE]]                                            | 2024 | 650M params, 8 species, best zero-shot |
| [[01_Papers/scBERT\|scBERT]]                                      | 2022 | First BERT for single-cell             |
| [[01_Papers/CellPLM\|CellPLM]]                                    | 2024 | Cells-as-tokens, 100x faster           |
| [[01_Papers/GeneCompass\|GeneCompass]]                            | 2024 | Knowledge-informed, cross-species      |
| [[01_Papers/scPRINT\|scPRINT]]                                    | 2025 | Zero-shot GRN inference                |
| [[01_Papers/Cell2Sentence\|Cell2Sentence]]                        | 2024 | Google/Yale, LLM approach, 27B         |

### Perturbation Models 

| Paper | Year | Key Innovation |
|-------|------|----------------|
| [[01_Papers/GEARS\|GEARS]] | 2023 | GNN + knowledge graph, multi-gene |
| [[01_Papers/CPA\|CPA]] | 2023 | Compositional VAE, drug combinations |
| [[01_Papers/scGen\|scGen]] | 2019 | Latent arithmetic (foundational) |
| [[01_Papers/CellOT\|CellOT]] | 2023 | Optimal transport, patient transfer |
| [[01_Papers/chemCPA\|chemCPA]] | 2022 | Novel drug prediction |

---

## Concepts (`$= dv.pages('"02_Concepts"').length`)

### Foundation & Embeddings
- [[02_Concepts/Cell Foundation Models|Cell Foundation Models]]
- [[02_Concepts/Single-Cell Embeddings|Single-Cell Embeddings]]
- [[02_Concepts/Transfer Learning Biology|Transfer Learning]]
- [[02_Concepts/Zero-shot Learning|Zero-shot Learning]]

### Core Techniques
- [[02_Concepts/Transformers for Biology|Transformers for Biology]]
- [[02_Concepts/Graph Neural Networks|Graph Neural Networks]]
- [[02_Concepts/Generative Models|Generative Models]]
- [[02_Concepts/Variational Autoencoders|Variational Autoencoders]]
- [[02_Concepts/Optimal Transport|Optimal Transport]]
- [[02_Concepts/Disentangled Representations|Disentangled Representations]]

### Biology & Networks
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]
- [[02_Concepts/Gene Regulatory Networks|Gene Regulatory Networks]]
- [[02_Concepts/Knowledge Graphs|Knowledge Graphs]]
- [[02_Concepts/Cell State Transitions|Cell State Transitions]]

### Multi-modal & Spatial
- [[02_Concepts/Multi-modal Integration|Multi-modal Integration]]
- [[02_Concepts/Spatial Transcriptomics|Spatial Transcriptomics]]
- [[02_Concepts/Cell-Cell Communication|Cell-Cell Communication]]

### Applications
- [[02_Concepts/Drug Discovery|Drug Discovery]]
- [[02_Concepts/Molecular Representations|Molecular Representations]]

---

## Model Comparison

### By Capability

| Task                        | Best Models                  |
| --------------------------- | ---------------------------- |
| Cell annotation (zero-shot) | UCE, Geneformer              |
| Perturbation prediction     | GEARS, scGPT, CPA            |
| Gene network inference      | scPRINT, GeneCompass         |
| Cross-species               | UCE (8 species), GeneCompass |
| Novel drug prediction       | chemCPA                      |
| Speed                       | CellPLM (100x faster)        |

### By Architecture

| Type | Models |
|------|--------|
| Transformers | scGPT, Geneformer, scFoundation, UCE |
| GNN | GEARS |
| VAE | CPA, scGen, scVI |
| Optimal Transport | CellOT |
| LLM | Cell2Sentence |

---

## External Resources

- [Cell Paper: How to Build the Virtual Cell with AI](https://www.cell.com/cell/fulltext/S0092-8674(24)01332-1)
- [Arc Institute Virtual Cell Challenge](https://arcinstitute.org/news/virtual-cell-challenge-2025)
- [Nature: Three Data Pillars for Virtual Cells](https://www.nature.com/articles/s41422-025-01101-y)
- [Google: C2S-Scale Research Blog](https://research.google/blog/teaching-machines-the-language-of-biology-scaling-large-language-models-for-next-generation-single-cell-analysis/)
- [Awesome Foundation Model Single-Cell Papers](https://github.com/OmicsML/awesome-foundation-model-single-cell-papers)

---

## Contributing

Add new notes using the templates in `/Templates/`:
- `Paper Template.md` - For paper reading notes
- `Concept Template.md` - For theoretical concepts
- `Model Template.md` - For model documentation
- `Project Template.md` - For tracking projects

---

## Stats


| Category  | Count                                 |
| --------- | ------------------------------------- |
| Papers    | `$= dv.pages('"01_Papers"').length`   |
| Concepts  | `$= dv.pages('"02_Concepts"').length` |
| Templates | `$= dv.pages('"Templates"').length`   |

---

## Changelog

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
