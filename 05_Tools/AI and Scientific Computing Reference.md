---
title: "AI and Scientific Computing Reference"
tags: [reference, AIVC]
date_created: 2026-10-20
---

# AI and Scientific Computing Reference

Sources identify the systems and concepts named in the vault. Availability, pricing, limits and the latest model generation are outside this reference’s scope. A product name alone is insufficient to reproduce a scientific benchmark.

## AI agents

An agent combines a model with a workflow for selecting actions, using tools and evaluating intermediate results. Report the complete system, allowed tools and human involvement when evaluating autonomy.

Source: [original reference or official documentation](https://arxiv.org/abs/2210.03629).

## APIs

Application programming interfaces expose defined operations and inputs/outputs to software. Successful API calls do not by themselves validate the scientific interpretation of returned data.

Source: [original reference or official documentation](https://spec.openapis.org/oas/latest.html).

## Bioinformatics

Computational and statistical study of biological data and systems, covering data processing, modeling and inference. These broad fields are not individual model architectures.

Source: [original reference or official documentation](https://ocw.mit.edu/courses/6-047-computational-biology-fall-2015/).

## LLMs

Large language models learn distributions over token sequences. Scientific use requires separate evaluation of factuality, tool execution and biological validity.

Source: [original reference or official documentation](https://arxiv.org/abs/2005.14165).

## LLM Benchmarking

LLM evaluation must specify tasks, prompts, data contamination controls and uncertainty. Model-based judging is a fallible measurement procedure and should be checked against independent references.

Source: [original reference or official documentation](https://arxiv.org/abs/2306.05685).

## GPT-4

The OpenAI model family described in the GPT-4 technical report. Historical experiments must specify the actual snapshot rather than substitute a current model.

Source: [original reference or official documentation](https://arxiv.org/abs/2303.08774).

## GPT-4.1

A named OpenAI model generation; reproduce a paper using its stated snapshot, tools and settings.

Source: [original reference or official documentation](https://openai.com/index/gpt-4-1/).

## GPT-5.2

GPT-5.2 is a model family. “GPT-5.2 Agent” in a benchmark denotes a configured system, not a complete specification of a separate architecture.

Source: [original reference or official documentation](https://openai.com/index/introducing-gpt-5-2/).

## GPT-5.4

A named OpenAI model generation. This reference identifies the model mentioned in notes, without extending its general benchmarks to biological tasks.

Source: [original reference or official documentation](https://openai.com/index/introducing-gpt-5-4/).

## Claude 3

The Claude 3 family includes distinct model variants. Record the exact variant and snapshot used in an experiment.

Source: [original reference or official documentation](https://www.anthropic.com/news/claude-3-family).

## Gemini 3 Pro

A specific Gemini generation. It must not be conflated with the 2023 Gemini 1.0 report summarized in the model note.

Source: [original reference or official documentation](https://storage.googleapis.com/deepmind-media/Model-Cards/Gemini-3-Pro-Model-Card.pdf).

## Qwen3.5

A Qwen model family with multiple configurations; architecture, checkpoint and modality support are variant-specific.

Source: [original reference or official documentation](https://huggingface.co/Qwen/Qwen3.5-397B-A17B).

## text-embedding-3-large

An embedding model that maps text into vectors for tasks such as retrieval. Similarity scores alone do not verify biomedical entity identity.

Source: [original reference or official documentation](https://openai.com/index/new-embedding-models-and-api-updates/).

## AlphaEvolve

A system combining language-model proposals with automated evaluation and evolutionary search for algorithmic improvement.

Source: [original reference or official documentation](https://deepmind.google/discover/blog/alphaevolve-a-gemini-powered-coding-agent-for-designing-advanced-algorithms/).

## BioNeMo

NVIDIA’s biomolecular AI software ecosystem. It encompasses tools and model components rather than one fixed single-cell foundation model.

Source: [original reference or official documentation](https://docs.nvidia.com/bionemo-framework/latest/).

## AutoML

AutoML automates selected model-development choices. Tabular deep learning applies neural models to table-structured features; neither implies automatic biological validation.

Source: [original reference or official documentation](https://www.automl.org/book/).

## Explainable AI

Interpretability methods examine associations between model behavior, inputs and internal representations. A model-level mechanism should not be equated with an experimentally established biological mechanism.

Source: [original reference or official documentation](https://arxiv.org/abs/1703.01365).

## Muon

An optimizer for neural-network matrix parameters using orthogonalized momentum updates. Its benefits depend on the training regime and implementation.

Source: [original reference or official documentation](https://github.com/KellerJordan/Muon).

## Geometric sketching

A subsampling method designed to preserve geometric coverage of large single-cell datasets; it is not ordinary random sampling.

Source: [original reference or official documentation](https://doi.org/10.1016/j.cels.2019.05.003).

## Biomni-E1

A curated biomedical execution environment containing tools, databases and software dependencies. It supports code-based agent actions; it is not a simulated biological world.

Source: [Biomni repository](https://github.com/snap-stanford/Biomni).

## Co-Scientist

A multi-agent system for generating, critiquing and refining scientific hypotheses. The reported KIRA6 result concerns selectivity between AML and control cell lines; it is not a clinical efficacy comparison.

Source: [Gottweis et al., 2026](https://www.nature.com/articles/s41586-026-10644-y).

## Robin

A scientific agent system combining literature review, hypothesis generation and data analysis with experiments performed by researchers. Its RPE-cell experiments do not establish clinical efficacy for dry age-related macular degeneration.

Source: [Ghareeb et al., 2026](https://www.nature.com/articles/s41586-026-10652-y).

## OpenClaw

An open-source general-purpose AI assistant and runtime. Its repository does not by itself establish validated integration with robotic biomedical laboratories.

Source: [Official repository](https://github.com/openclaw/openclaw).

## Multi-agent systems

Systems in which multiple agent instances coordinate roles such as proposal, review and ranking. Agreement between agents is not independent experimental confirmation. Co-Scientist is one scientific example.

Source: [Co-Scientist primary study](https://www.nature.com/articles/s41586-026-10644-y).

## Reinforcement Learning from Human Feedback

RLHF uses human preference information to guide model optimization, often through a learned reward model. Reinforcement learning based on executable task rewards is not automatically RLHF.

Source: [Ouyang et al., 2022](https://arxiv.org/abs/2203.02155).

## Online adaptation

Updating model behavior using data encountered after deployment. Parameter updates, memory updates and prompt revision are different mechanisms. Test-time training is one specific approach, not a property of every scientific agent.

Source: [Sun et al., ICML 2020](https://proceedings.mlr.press/v119/sun20b.html).

## Test-time compute

Computation spent during inference on activities such as search, generating candidates and verification. More inference computation can improve some tasks but does not guarantee correctness.

Source: [Snell et al., 2024](https://arxiv.org/abs/2408.03314).

## Scientific reproducibility

Computational reproducibility requires enough information to reconstruct the analysis, including input data, code, dependencies, parameters and provenance. Experimental replication is an additional question.

Source: [Sandve et al., 2013](https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1003285).

## Dual-use research of concern (DURC)

A research-governance concept concerning beneficial research whose knowledge or products could also be misused to cause serious harm. This entry identifies the concern discussed in the agentic-science perspective; it does not summarize jurisdiction-specific policy.

Source: [Agentic-science perspective record](https://pubmed.ncbi.nlm.nih.gov/42753735/).
