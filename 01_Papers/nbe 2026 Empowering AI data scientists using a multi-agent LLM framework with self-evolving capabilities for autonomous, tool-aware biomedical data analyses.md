---
title: Empowering AI data scientists using a multi-agent LLM framework with self-evolving capabilities for autonomous, tool-aware biomedical data analyses
aliases:
  - BioMedAgent
authors:
  - Dechao Bu
  - Jingbo Sun
  - Kun Li
  - Zihao He
  - Wei Huang
  - Jinlin Hu
  - Shanshan Zhang
  - Shuangshuang Lei
  - Peipei Huo
  - Zhihao Wang
  - Sheng Wang
  - Tao Wang
  - Kai Gao
  - Yang Wu
  - Lianhe Zhao
  - Kai Wang
  - Gen Li
  - Huan Song
  - Yang Jin
  - Kang Zhang
  - Runsheng Chen
  - Yi Zhao
year: 2026
journal: Nature Biomedical Engineering
doi: 10.1038/s41551-026-01634-6
url: https://doi.org/10.1038/s41551-026-01634-6
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2025-05-14
date_read:
---

# Empowering AI data scientists using a multi-agent LLM framework with self-evolving capabilities for autonomous, tool-aware biomedical data analyses

## Quick Summary
> This paper introduces "BioMedAgent," a multi-agent, tool-aware LLM framework designed to automate complex, multistep biomedical data analysis workflows. The system features a three-phase collaborative process—Planning, Coding, and Execution—and incorporates an interactive exploration (IE) algorithm for automated code repair and a memory retrieval (MR) algorithm that allows the agent to self-evolve by recording, reusing, and refining successful past experiences. Validated on the newly developed BioMed-AQA benchmark (327 tasks), BioMedAgent achieved a 77% success rate, significantly outperforming existing LLM-based agents, and demonstrated robust generalization on the BixBench dataset.

## Key Points
- Introduces BioMedAgent, an "AI data scientist" framework for autonomous biomedical research.
- Utilizes a multi-agent architecture (Planner, Programmer, Executor, and Tool Manager) to break down complex tasks.
- Employs an [[Interactive Exploration]] (IE) algorithm that enables agents to iteratively exchange feedback, repair code, and navigate complex, multistep workflows.
- Implements a [[Memory Retrieval]] (MR) algorithm with Continuous Memory Accumulation (CMA) or Iterative Memory Forgetting (IMF) to ensure the system self-evolves through experiential learning.
- Introduces BioMed-AQA, a manually curated benchmark covering five key areas: Omics (O), Precision Medicine (P), Machine Learning (M), Statistics (S), and Data Visualization (V).
- Combines [[Local Tool Usage]] (LTU) with [[Custom Tool Code]] (CTC) generation, allowing dynamic adaptation to specialized software without needing predefined configurations for every task.

## Methods
### Data
- BioMed-AQA: A comprehensive benchmark of 327 manually curated biomedical tasks.
- Data sources: Simulated genomics/proteomics datasets, bioinformatics tool tutorials, and literature-derived data.
- Evaluation categories: Omics (O, n=96), Precision medicine (P, n=18), Machine learning (M, n=59), Statistical analysis (S, n=58), and Data visualization (V, n=96).

### Model Architecture
- The framework coordinates three main agents:
    - **Planner**: Interprets user requirements and selects tools.
    - **Programmer**: Generates code based on tool documentation and dependencies.
    - **Executor**: Executes code and performs automated unit tests.
- **Tool Manager**: Bridges the gap by maintaining a workspace of specialized [[Bioinformatics]] tools and [[APIs]].

### Training Strategy
- Self-evolving via [[Retrieval-Augmented Generation]] (RAG) and iterative memory management.
- Uses semantic similarity to query past experiences (tool selection, workflows, code fragments).
- Employs an "Iterative Memory Forgetting" (IMF) strategy to prune outdated records and maintain efficiency.

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Overall Success Rate | 77% | 46% (ChatGPT-4o) |
| Omics (O) Success | 94% | N/A |
| Precision Medicine (P) Success | 78% | N/A |
| Machine Learning (M) Success | 90% | N/A |
| Statistical Analysis (S) Success | 59% | N/A |
| Data Visualization (V) Success | 65% | N/A |

## Figures

| Figure | Description |
| ------ | ----------- |
| Fig 1  | Overview of the BioMedAgent framework (Planning, Coding, Execution, IE, MR) and the BioMed-AQA benchmark structure. |
| Fig 2  | Performance analysis including category-specific success rates, comparison with baselines (GPT-4o, etc.), and robustness to expert prompt rephrasing. |

## Critical Analysis
### Strengths
- Highly flexible tool-integration mechanism (LTU + CTC) prevents reliance on a fixed "pre-defined" toolset.
- Strong autonomous repair capabilities via the IE algorithm improve success rates significantly.
- High-quality benchmark dataset provided (BioMed-AQA) facilitates future research and reproducibility.
- Demonstrates effective "self-evolving" capability that improves performance over learning rounds.

### Weaknesses
- Performance in the Statistical (S) category remains lower than in other categories, likely due to fundamental LLM limitations in complex table processing.
- Increased complexity in the multi-agent system may introduce potential computational bottlenecks or latency during execution.
- Susceptible to "hallucinations" common in LLM architectures, particularly when tracking intermediate results in long, multistep workflows.

### Questions
- How effective is the memory update strategy when faced with conflicting information from different successful workflows?
- Could a "human-in-the-loop" verification be integrated into the IE/MR phases for highly critical clinical applications?

## Connections
### Related Papers
- BixBench (Mitchener et al., 2025)
- AutoBA (Zhou et al., 2024)
- CellAgent (Xiao et al., 2024)
- BioChatter (Lobentanzer et al., 2025)

### Related Concepts
- [[LLM Agents]]
- [[Bioinformatics Automation]]
- [[Autonomous Scientific Research]]
- [[Retrieval-Augmented Generation]]

### Potential Applications
- Automated omics data analysis (genomics, transcriptomics).
- Real-time clinical decision support systems.
- Streamlined pathology image segmentation and classification.
- Accelerated drug discovery and biomarker identification.

## Notes
-