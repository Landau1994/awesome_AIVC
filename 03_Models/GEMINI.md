---
title: Gemini
aliases:
  - Google Gemini
  - Gemini Pro
  - Gemini Ultra
  - Gemini Flash
tags:
  - model
  - LLM
  - multimodal
type: Multimodal Large Language Model
source_paper: "Gemini: A Family of Highly Capable Multimodal Models"
url: https://arxiv.org/abs/2312.11805
year: 2023
organization: Google DeepMind
status: active
date_added: 2026-01-18
---

# Gemini

## Overview
> Gemini is a family of multimodal large language models developed by Google DeepMind, designed to be natively multimodal and capable of understanding and processing information across text, code, images, audio, and video.

## Architecture
Gemini models are built on top of Transformer decoders, optimized for performance across different scales (Ultra, Pro, Flash, Nano).
```mermaid
graph TD
    Text[Text Input] --> Encoder[Multimodal Encoder]
    Image[Image Input] --> Encoder
    Audio[Audio Input] --> Encoder
    Video[Video Input] --> Encoder
    Encoder --> Transformer[Transformer Decoder]
    Transformer --> Output[Multimodal Output]
```

## Input/Output
### Input
- **Type**: Text, Image, Audio, Video, Code
- **Format**: Tokens, Pixel data, Spectrograms
- **Example**: "Describe this video of a cell dividing."

### Output
- **Type**: Text, Code
- **Format**: Tokens
- **Example**: Detailed biological description or Python script for analysis.

## Key Features
- **Native Multimodality**: Built from the ground up to reason across various modalities.
- **Long Context Window**: Support for up to millions of tokens in certain versions.
- **Efficiency**: Optimized for different tiers of hardware, from mobile (Nano) to data centers (Ultra).

## Performance
| Task | Dataset | Metric | Score |
|------|---------|--------|-------|
| General Reasoning | MMLU | Accuracy | 90.0% (Gemini 1.0 Ultra; uncertainty-routed chain-of-thought) |
| Coding | HumanEval | Pass@1 | 74.4% (Gemini 1.0 Ultra; 0-shot, instruction-tuned) |

## Training Details
- **Data**: Large-scale multimodal and multilingual dataset.
- **Hardware**: Google TPU v4 and v5e.
- **Time**: Not specified here; do not infer a duration without a source.

## Usage
Available via Google AI Studio, Vertex AI, and the Gemini API.

## Strengths & Limitations
### Strengths
- Exceptional multimodal reasoning.
- Strong performance on complex coding and math tasks.
- Large context window allows for processing massive documents or videos.

### Limitations
- Potential for hallucinations typical of LLMs.
- Proprietary model with restricted access to weights.

## Related Models
- [[05_Tools/AI and Scientific Computing Reference#GPT-4|GPT-4]]
- [[05_Tools/AI and Scientific Computing Reference#Claude 3|Claude 3]]

## Notes
- Frequently used as a backend for AI-assisted research and coding tools.

## Version scope and sources

The table records the [Gemini 1.0 technical report](https://arxiv.org/html/2312.11805v3), not the current Gemini product lineup. Ultra/Pro/Nano were the original sizes; Flash and million-token context are described in the later [Gemini 1.5 report](https://arxiv.org/abs/2403.05530). Capabilities, available modalities and limits are version-specific. The architecture diagram is schematic, not a disclosure of the complete implementation. Checked 2026-10-20.
