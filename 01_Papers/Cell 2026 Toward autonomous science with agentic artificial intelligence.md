---
title: "Toward autonomous science with agentic artificial intelligence"
aliases: []
authors:
  - Lucie Y. Guo
  - Darren S.J. Ting
  - Xinyi Su
  - Alex Aliper
  - Alex Zhavoronkov
  - Daniel S.W. Ting
year: 2026
journal: Cell
doi: 10.1016/j.cell.2026.08.052
url: https://doi.org/10.1016/j.cell.2026.08.052
tags:
  - paper
  - AIVC
status: unread
rating:
date_added: 2026-05-15
date_read:
---

# Toward autonomous science with agentic artificial intelligence

## Quick Summary
> This perspective traces the evolution of biomedical AI from simple pattern recognition and generative modeling to the emergence of "agentic" AI systems capable of iterative hypothesis generation, experimental design, and data interpretation. The authors analyze three representative multi-agent architectures (Co-Scientist, Robin, and Biomni) and discuss the implications of shifting scientific workflows toward autonomous laboratories, highlighting critical challenges including model hallucinations, potential for dual-use misuse, reproducibility gaps, and the ongoing necessity of human-in-the-loop oversight.

## Key Points
- Biomedical AI has progressed through three stages: pattern recognition (2012–2020), generative modeling (2020–2025), and agentic AI (2023–present).
- Agentic systems use "test-time compute" to perform deliberation, self-critique, and iterative refinement rather than relying on a single forward pass.
- Architectures vary from multi-agent "tournaments" (Co-Scientist) to code-execution-based single agents (Biomni).
- Coupling AI reasoning with robotic experimental platforms is a proposed direction for autonomous laboratories. [[05_Tools/AI and Scientific Computing Reference#OpenClaw|OpenClaw]] is a general-purpose assistant/runtime; its role as a validated laboratory control layer was not established in this audit.
- Significant risks include the "illusion of consensus" among agents, bias reinforcement in scientific literature, and a lower barrier to entry for dual-use (misuse) of biological protocols.
- The authors propose tiered transparency standards for AI agents, arguing that the reasoning process—not just the final output—is essential for scientific publication.

## Methods
### Data
- Systems utilize literature mining (e.g., [[05_Tools/Methods and Data Resources#bioRxiv|bioRxiv]], scientific databases), retrieval-augmented planning, and curated biomedical execution environments (e.g., [[05_Tools/AI and Scientific Computing Reference#Biomni-E1|Biomni-E1]]).

### Model Architecture
- [[05_Tools/AI and Scientific Computing Reference#Multi-agent systems|Multi-agent systems]] (Co-Scientist, Robin) utilize specialized model instances for specific roles like hypothesis generation, literature review, and critique.
- [[05_Tools/AI and Scientific Computing Reference#AI agents|General-purpose AI agents]] (Biomni) utilize a code-as-action interface for dynamic workflow composition.
- Integration of large language models (LLMs) with robotic laboratory controllers.

### Training Strategy
- Training and adaptation differ across systems. Do not infer [[05_Tools/AI and Scientific Computing Reference#Reinforcement Learning from Human Feedback|Reinforcement Learning from Human Feedback]] (RLHF) from a report of reinforcement learning alone, or assume that every agent performs [[05_Tools/AI and Scientific Computing Reference#Online adaptation|online adaptation]].

## Results
| Metric | Value | Baseline |
|--------|-------|----------|
| Co-Scientist drug repurposing (AML) | KIRA6 IC50 about 10 nM in KG-1a versus 180 nM in TK6 (about 18-fold selectivity) | AML versus control cell line; not comparison with a standard drug |
| Robin RPE-cell experiments | Ripasudil and KL001 enhanced phagocytosis in vitro across an iterative screen | Experimental controls; no clinical efficacy conclusion |
| Biomni-R0 (32B vs 8B) | Reported 10% absolute improvement remains unverified in this audit | Benchmark and metric require primary-source confirmation |

## Figures


| Figure | Description |
| ------ | ----------- |
| Fig 1  | Anatomy of agentic scientific systems: comparison of Co-Scientist, Robin, and Biomni architectures. |
| Fig 2  | Evolution of AI-assisted science from pattern recognition toward fully autonomous laboratories (The Autonomy Spectrum). |
| Fig 3  | Risks and proposed safeguards of agentic AI across the scientific discovery cycle (Hallucinations, constrained reasoning, evaluation/reproducibility gaps). |


## Critical Analysis
### Strengths
- Provides a clear and timely taxonomy for the rapidly emerging field of agentic science.
- Offers a realistic balanced view, acknowledging the transformative potential of these tools while highlighting serious concerns regarding accountability and scientific integrity.
- Effectively identifies the "methodological gap" between AI-generated hypotheses and experimental validation.

### Weaknesses
- As a perspective paper, it lacks original data or head-to-head comparison of agents against a standardized, non-curated control group.
- The proposed "tiered transparency" remains conceptual and might be difficult to enforce across diverse industrial and academic settings.

### Questions
- Can current LLM architectures perform true "abductive" reasoning (generating novel foundational axioms), or are they structurally limited to recombining existing knowledge?
- How can the scientific community prevent "groupthink" if the majority of agentic systems are trained on a restricted set of foundation models?
- What happens to the development of human "scientific intuition" if the training of junior scientists relies increasingly on cognitive offloading to AI?

## Connections
### Related Papers
- [[05_Tools/Methods and Data Resources#AlphaFold|AlphaFold]], [[05_Tools/Methods and Data Resources#AlphaFold 3|AlphaFold 3]]
- [[05_Tools/Methods and Data Resources#RoseTTAFold|RoseTTAFold]]
- [[05_Tools/Methods and Data Resources#ESMFold|ESMFold]]
- [[05_Tools/AI and Scientific Computing Reference#Co-Scientist|Co-Scientist]] (Gottweis et al., 2026)
- [[05_Tools/AI and Scientific Computing Reference#Robin|Robin]] (Ghareeb et al., 2026)
- [[01_Papers/Science 2026 Autonomous biomedical research with an artificial intelligence agent|Biomni]] (Huang et al., 2026)

### Related Concepts
- [[02_Concepts/Self-Driving Laboratories|Autonomous laboratories]]
- [[05_Tools/AI and Scientific Computing Reference#Test-time compute|Test-time compute]]
- [[05_Tools/AI and Scientific Computing Reference#Dual-use research of concern (DURC)|Dual-use research of concern (DURC)]]
- [[05_Tools/AI and Scientific Computing Reference#Scientific reproducibility|Scientific reproducibility]]

### Potential Applications
- High-throughput drug repurposing.
- Automated hypothesis generation in complex biological systems (e.g., cell senescence).
- Rapid design and execution of synthetic biology protocols.

## Notes
-
## Verification scope (2026-10-20)

Metadata and broad scope match the [PubMed record](https://pubmed.ncbi.nlm.nih.gov/42753735/). Co-Scientist and Robin result wording was checked against their [Nature study](https://www.nature.com/articles/s41586-026-10644-y) and [Nature study](https://www.nature.com/articles/s41586-026-10652-y), respectively; Biomni-E1 terminology was checked against the [official repository](https://github.com/snap-stanford/Biomni). The perspective full text was not accessible: figure descriptions, historical stage boundaries, tiered-transparency attribution and the Biomni percentage remain provisional. These secondary summaries should be checked before quotation or reuse. The existing date_added field is retained as user provenance, not a publication date.
