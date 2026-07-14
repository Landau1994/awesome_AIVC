---
title: Autonomous biomedical research with an artificial intelligence agent
aliases:
  - Biomni
authors:
  - Kexin Huang
  - Serena Zhang
  - Hanchen Wang
  - Yuanhao Qu
  - Yingzhou Lu
  - Ryan Li
  - Yusuf Roohani
  - Lin Qiu
  - Shiyi Cao
  - Gavin Li
  - Junze Zhang
  - Di Yin
  - Rick Wierenga
  - Deniz Kavi
  - Sherry Liu
  - Tianwei She
  - Shruti Marwaha
  - Jennefer N. Carter
  - Xin Zhou
  - Matthew T. Wheeler
  - Jonathan A. Bernstein
  - Mengdi Wang
  - Peng He
  - Jingtian Zhou
  - Michael P. Snyder
  - Le Cong
  - Aviv Regev
  - Jure Leskovec
year: 2026
journal: Science
doi: 10.1126/science.adz4351
url: https://www.science.org/doi/10.1126/science.adz4351
tags:
  - paper
  - AIVC
  - - - AI-Agent
  - - - Biomedical-Research
status: unread
rating:
date_added: 2026-07-09
date_read:
---

# Autonomous biomedical research with an artificial intelligence agent

## Quick Summary
> The paper introduces "Biomni," a general-purpose biomedical AI agent capable of autonomously executing diverse research tasks. By constructing a unified action space—integrating 150 tools, 105 software packages, and 59 databases—Biomni utilizes an LLM-based architecture to plan and execute complex, code-driven workflows without predefined templates. The system demonstrates expert-level performance across tasks including bioinformatics analysis, rare disease diagnosis, molecular cloning, and wet-lab hardware orchestration, significantly shortening analysis times while maintaining high accuracy.

## Key Points
- **Unified Action Space**: Created an environment (Biomni-E1) based on 2,500 research papers, enabling the agent to interact with a broad array of standard tools, databases, and programming languages (Python, R, CLI).
- **Agentic Architecture**: Biomni-A1 uses retrieval-augmented planning and code execution to translate natural language queries into multi-step, executable workflows.
- **Expert-Level Generalization**: Achieved 57% accuracy on benchmarks (Biomni-Eval1), outperforming specialized agents and base models like Claude Sonnet 4.5.
- **Reinforcement Learning**: Introduced Biomni-R0 (RL-trained models) to optimize task success, demonstrating consistent improvement over teacher models across specialized tasks.
- **Real-World Validation**: Validated the agent's ability to autonomously perform complex multi-omics analysis, design experimental protocols for cloning (verified by wet-lab output), and optimize protein thermostability.
- **Automation**: Bridged the "dry-lab" to "wet-lab" gap by integrating with [[PyLabRobot]] to execute liquid-handling protocols on physical hardware.

## Methods
### Data
- 2,500 biomedical research papers for action discovery.
- Wearable sensor data (Fitbit) from the COVID-19 physiological response cohort.
- Multi-omics datasets (snRNA-seq, snATAC-seq) of the developing human skeleton.

### Model Architecture
- **Biomni-A1**: A general-purpose agent scaffold using LLM-based reasoning, retrieval-augmented planning, and code-based execution.
- **Biomni-R0**: Fine-tuned versions of the Qwen3 model, further optimized using Reinforcement Learning (RL) via expert-annotated rewards.

### Training Strategy
- Action discovery via LLM parsing of literature.
- Distillation from frontier models (Claude 4 Sonnet) followed by RL for domain-specific fine-tuning.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Benchmark Accuracy (Biomni-Eval1) | 57% | 30% (Claude 4.5) |
| Rare Disease Diagnosis Time | ~3 min | >110 min (Expert) |
| GWAS Locus Analysis Time | ~4 min | ~90 min (Expert) |
| Protein Stability Improvement | -4.108 kcal/mol | N/A |

## Figures


| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of the unified biomedical action space and agent environment (Biomni-E1). |
| Fig 2  | Performance evaluation on benchmarks, expert-level tasks, and RL improvement. |
| Fig 3  | Real-world application in wearable data analysis and multi-omics transcriptional regulation. |
| Fig 4  | Cloning benchmark results and wet-lab validation via CRISPR-based experimental design. |
| Fig 5  | Protein optimization pipeline and integration with lab robotics (PyLabRobot). |


## Critical Analysis
### Strengths
- Highly flexible, generalist design that avoids hardcoding workflows.
- Strong validation in real-world settings, including wet-lab execution of protocols.
- Effective use of code as a "universal interface" for scientific tools and data.
- Transparency in methodology and open-source approach for reproducible science.

### Weaknesses
- Performance is uneven across the diverse landscape of biomedical tasks; still struggles with complex biological synthesis requiring high-level expert judgment.
- Dependence on the foundational LLM's inherent reasoning capabilities, which limits "zero-shot" performance on entirely novel experimental techniques.
- Biosecurity risks regarding automated literature synthesis and protocol generation are acknowledged but remain a significant concern.

### Questions
- To what extent can this agent scale to domains outside of current academic publication trends (e.g., highly proprietary or obscure sub-fields)?
- How does the "code as interface" approach handle legacy software that lacks modern APIs or documentation?

## Connections
### Related Papers
- [[CRISPR-GPT]]
- [[BioDiscoveryAgent]]
- [[SpatialAgent]]
- [[CellAgent]]
- [[AlphaFold-2]]

### Related Concepts
- [[Agentic AI]]
- [[Bioinformatics]]
- [[Reinforcement Learning]]
- [[Multi-Omics]]
- [[Protein Engineering]]
- [[Laboratory Automation]]

### Potential Applications
- Automated drug repurposing and target identification.
- Accelerated experimental design for synthetic biology.
- Real-time physiological monitoring and health intervention via wearable integration.

## Notes
-