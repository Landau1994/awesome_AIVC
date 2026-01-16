---
title: Dashboard
aliases: [Home, Index]
tags:
  - dashboard
  - MOC
date_created: 2026-01-16
---

# AI Virtual Cell Study Dashboard

## Overview Stats

```dataview
TABLE WITHOUT ID
    length(filter(rows, (r) => r.status = "unread")) as "Unread",
    length(filter(rows, (r) => r.status = "reading")) as "Reading",
    length(filter(rows, (r) => r.status = "completed")) as "Completed"
FROM "01_Papers"
WHERE contains(tags, "paper")
GROUP BY true
```

## Recently Added Papers

```dataview
TABLE authors, year, status
FROM "01_Papers"
WHERE contains(tags, "paper")
SORT date_added DESC
LIMIT 10
```

## Active Projects

```dataview
TABLE status, priority, start_date
FROM "06_Projects"
WHERE contains(tags, "project") AND status != "completed"
SORT priority ASC
```

## Reading Queue

```dataview
LIST
FROM "01_Papers"
WHERE status = "unread" OR status = "reading"
SORT date_added DESC
LIMIT 5
```

## Quick Navigation

### By Topic
- [[02_Concepts/Cell Foundation Models|Foundation Models]]
- [[02_Concepts/Perturbation Prediction|Perturbation Prediction]]
- [[02_Concepts/Single-Cell Analysis|Single-Cell Analysis]]
- [[02_Concepts/Gene Regulatory Networks|Gene Regulatory Networks]]
- [[02_Concepts/Drug Discovery|Drug Discovery Applications]]

### By Model Type
- [[03_Models/Index - Models|All Models]]
- Transformers: scGPT, Geneformer, scFoundation
- GNNs: CellProphet, GRN models
- Diffusion: Cell state transition models

### Key Datasets
- [[04_Datasets/Index - Datasets|All Datasets]]
- Single-cell atlases (CELLxGENE, HCA)
- Perturbation screens (Perturb-seq)
- Benchmark datasets

## Learning Path

### Phase 1: Foundations
- [ ] Single-cell biology basics
- [ ] Deep learning fundamentals
- [ ] Graph neural networks

### Phase 2: Core Papers
- [ ] [[01_Papers/Bunne 2024 - How to Build Virtual Cell|How to Build the Virtual Cell with AI]]
- [ ] [[01_Papers/scGPT|scGPT]]
- [ ] [[01_Papers/Geneformer|Geneformer]]

### Phase 3: Advanced Topics
- [ ] Multi-modal integration
- [ ] Perturbation modeling
- [ ] Clinical translation

### Phase 4: Hands-on
- [ ] Reproduce key experiments
- [ ] Build custom models
- [ ] Contribute to open source

## Tags Overview

```dataview
TABLE WITHOUT ID
    link(file.link, file.name) as Note,
    join(file.tags, ", ") as Tags
FROM ""
WHERE file.tags
SORT file.name ASC
LIMIT 20
```

## Recent Activity

```dataview
TABLE file.mtime as "Modified"
FROM ""
WHERE file.name != "Dashboard"
SORT file.mtime DESC
LIMIT 10
```
