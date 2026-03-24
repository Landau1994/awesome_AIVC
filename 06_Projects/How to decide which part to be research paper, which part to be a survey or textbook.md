---
title: "How to decide which part to be research paper, which part to be a survey or textbook"
aliases: [Academic Output Strategy, AIVC Publication Planning]
tags:
  - project
  - AIVC
  - research
  - publishing
status: planning
priority: High
start_date: 2026-03-25
end_date:
---

# How to decide which part to be research paper, which part to be a survey or textbook

## Objective
> What are you trying to achieve?
To establish a systematic decision-making framework for categorizing AI Virtual Cell (AIVC) knowledge and projects into **Original Research Papers**, **Survey/Review Articles**, or **Textbook/Tutorial Content**. This directly supports Phase 7 (Research & Publication) and Phase 8 (Academic Contribution & Scholarly Writing) of the [[00_Dashboard/Learning Path|Learning Path]].

## Background
- AIVC is a rapidly evolving, interdisciplinary field merging multi-omics data, deep learning architectures (Transformers, GNNs, Diffusion), and biological knowledge graphs.
- With the explosive growth of literature (e.g., the 40 core papers tracked in the `README`), there are three simultaneous demands in the community:
  1. **Frontier Breakthroughs**: Solving current limitations in foundation models (e.g., zero-shot generalization, causal perturbation).
  2. **Systematic Synthesis**: Horizontally comparing and benchmarking the flood of new models.
  3. **Educational Onboarding**: Lowering the barrier to entry for biologists and computer scientists entering the field.

## Approach
### Methods
Based on the phase divisions in the [[00_Dashboard/Learning Path|Learning Path]] and the vault's `README` structure, use the following criteria to decide the output type:

#### 1. Research Paper (Original Contribution)
- **When to choose**: When proposing a novel architecture, a new multi-modal integration method, or achieving SOTA results on a specific task (e.g., perturbation prediction, spatiotemporal dynamics).
- **Corresponding Phase**: Phase 7 (Research Implementation & Publication Ready).
- **Characteristics**: Requires rigorous experimental design, comparison against existing baselines (e.g., scGPT, UCE), and validation on large-scale datasets (e.g., Parse 1M, Replogle).
- **Potential Topics**: Addressing pain points highlighted in the README, such as "cross-species generalization," "causal perturbation via diffusion (e.g., X-Cell)," or "de novo drug design (e.g., GPS)."

#### 2. Survey / Review Article
- **When to choose**: When a subfield has accumulated significant literature but lacks a unified evaluation standard or taxonomy.
- **Corresponding Phase**: Phase 8 (Educational Content & Reviews).
- **Characteristics**: Does not require proposing a new model, but demands a novel taxonomy or a unified benchmarking framework.
- **Potential Topics**: 
  - Architectural comparisons of AIVC foundation models (Transformer vs. GNN vs. Diffusion).
  - Benchmarking single-cell perturbation prediction algorithms (referencing Perturbation Bench, scFM Bench).
  - A horizontal evaluation of RNA velocity inference methods (referencing RNA Velocity Bench 17/29).

#### 3. Textbook / Tutorial Content
- **When to choose**: When the knowledge is relatively mature, standardized, and serves as a prerequisite for entering the field.
- **Corresponding Phase**: Phase 1 (Foundations) to Phase 3 (Deep Learning for Biology).
- **Characteristics**: Focuses on clarity, pedagogy, and reproducibility. Usually accompanied by code examples (e.g., Scanpy tutorials, basic scVI implementations).
- **Potential Topics**:
  - The Central Dogma and single-cell sequencing basics.
  - Standard workflows for dimensionality reduction, clustering, and cell annotation.
  - Foundational applications of GNNs and Transformers in biology.

### Models Used
*Select reference models based on the output type:*
- **For Research (SOTA Baselines)**: [[01_Papers/bioRxiv 2026 X-Cell Scaling Causal Perturbation Prediction Across Diverse Cellular Contexts via Diffusion Language Models|X-Cell]], [[01_Papers/Cell2Sentence|Cell2Sentence]], [[01_Papers/nmeth 2026 stVCR spatiotemporal dynamics of single cells|stVCR]]
- **For Surveys (Categorization Targets)**: [[01_Papers/scGPT|scGPT]], [[01_Papers/Geneformer|Geneformer]], [[01_Papers/UCE|UCE]], [[01_Papers/GEARS|GEARS]]
- **For Textbooks (Educational Examples)**: [[01_Papers/scVI|scVI]] (Foundational VAE), [[01_Papers/scGen|scGen]] (Foundational latent arithmetic)

### Datasets
*Select datasets based on the output type:*
- **For Research / Benchmarks**: [[04_Datasets/Parse 1M|Parse 1M]] (Large-scale pre-training), [[04_Datasets/Replogle|Replogle]] (Genome-wide CRISPRi perturbation testing)
- **For Textbooks / Tutorials**: [[04_Datasets/Dentate Gyrus|Dentate Gyrus]] (Classic small dataset for demonstrating RNA velocity and neurogenesis trajectories)

## Progress Log
### 2026-03-25
- [x] Established the academic output classification framework based on Learning Path Phases 7 & 8.
- [ ] Evaluated current personal progress (Currently at Intermediate 🟡 level: mastered foundations and single-cell analysis).
- [ ] Determine the first academic output goal (Recommendation: Start by reproducing a Benchmark or writing a Mini-Review on a specific subfield).

## Results
### Experiments
| Output Type | Potential Topic / Config | Expected Result / Target Venue |
|-------------|--------------------------|--------------------------------|
| Tutorial | Single-cell basic analysis workflow based on Scanpy | Publish to GitHub / Personal Blog as an open-source educational contribution |
| Survey | Zero-shot capability evaluation of single-cell foundation models (scFMs) | Synthesize Benchmarking papers from README; submit to Briefings in Bioinformatics |
| Research | Cross-cell-line perturbation prediction combining Knowledge Graphs and Diffusion Models | Run on Replogle dataset, outperform GEARS/CPA baselines; submit to NeurIPS CompBio or Nature Methods |

### Key Findings
- **Textbook content** should be strictly limited to mature concepts found in the `02_Concepts` folder (e.g., [[02_Concepts/Single-Cell Embeddings|Single-Cell Embeddings]]).
- **Survey content** should heavily leverage the `Model Comparison` tables in the README (categorizing by capability and architecture).
- **Research papers** must directly target the model flaws and limitations revealed in recent Benchmarking papers (e.g., [[01_Papers/GB 2025 Zero-shot evaluation reveals limitations of single-cell foundation models|Zero-shot Eval]]).

## Code Repository
- [ ] Create `awesome-aivc-tutorials` repository (for Textbook/Tutorial code).
- [ ] Create `aivc-benchmark-review` repository (for unified evaluation code used in Surveys).

## Related Work
- **Survey/Vision Example**: [[01_Papers/Bunne 2024 - How to Build Virtual Cell|AIVC Vision]]
- **Benchmarking Example**: [[01_Papers/bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models|scFM Bench]]
- **Curriculum Planning**: [[00_Dashboard/Learning Path|Learning Path]]

## Next Steps
- [ ] **Short-term (1-2 weeks)**: Complete Phase 5 (Perturbation Modeling) in the Learning Path, as this is currently the most viable direction for producing a Research Paper.
- [ ] **Medium-term (1 month)**: Select 3 papers from the `Benchmarking & Evaluation` section of the README for deep reading to find an angle for a Survey.
- [ ] **Long-term (3 months)**: Prepare a Research-level model proposal targeting the Arc Institute Virtual Cell Challenge.

## Notes
- Do not attempt to solve everything (e.g., multi-omics integration *and* spatial transcriptomics) in a single Research Paper. AIVC is incredibly complex; Research Papers should be "narrow and deep," while Surveys and Textbooks should be "broad and comprehensive."
- Actively participate in open-source communities (like scVI-tools). This helps transition your Tutorials into widely recognized Textbook-level content.