---
title: Reading Queue
aliases: []
tags:
  - dashboard
  - reading
date_created: 2026-01-16
---

# Reading Queue

## Priority System
- P1: Must read - foundational papers
- P2: Important - key contributions
- P3: Nice to have - supporting material

## Unread Papers

```dataview
TABLE WITHOUT ID
    link(file.link, title) as Paper,
    authors as Authors,
    year as Year,
    priority as Priority
FROM "01_Papers"
WHERE status = "unread"
SORT priority ASC, date_added DESC
```

## Currently Reading

```dataview
TABLE WITHOUT ID
    link(file.link, title) as Paper,
    date_read as Started
FROM "01_Papers"
WHERE status = "reading"
```

## Recently Completed

```dataview
TABLE WITHOUT ID
    link(file.link, title) as Paper,
    rating as Rating,
    date_read as Completed
FROM "01_Papers"
WHERE status = "completed"
SORT date_read DESC
LIMIT 10
```

## Papers by Topic

### Foundation Models
```dataview
LIST
FROM "01_Papers"
WHERE contains(tags, "foundation-model")
```

### Perturbation Prediction
```dataview
LIST
FROM "01_Papers"
WHERE contains(tags, "perturbation")
```

### Single-Cell Analysis
```dataview
LIST
FROM "01_Papers"
WHERE contains(tags, "single-cell")
```

## Add New Paper

Use template: [[Templates/Paper Template]]
