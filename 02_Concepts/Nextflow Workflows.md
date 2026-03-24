---
title: "Nextflow: Bioinformatics Workflow Engine"
aliases: [Nextflow, nf-core]
tags:
  - tool
  - workflow
  - pipeline
  - reproducibility
  - bioinformatics
date_created: 2026-03-25
status: draft
---

# Nextflow: Bioinformatics Workflow Engine

## Overview

**Nextflow** is a workflow orchestration engine designed for bioinformatics pipelines. It enables:
- Portable, scalable analysis
- Simple syntax for complex workflows
- Integration with Docker/Singularity containers
- Automatic parallelization and resource management

## Why Nextflow for Single-Cell Analysis?

✅ **Container Integration**: Run each step in Docker/Singularity
✅ **Portability**: Same workflow on laptop, HPC, cloud
✅ **Reproducibility**: Version all tools + workflow
✅ **Scalability**: Automatically parallelize across cores/nodes
✅ **Simplicity**: Write workflows as code

## Nextflow Basics

### Simple Workflow Example

```groovy
// Define input data
input_files = Channel.fromPath('*.h5ad')

// Process 1: QC
process QualityControl {
    container 'scanpy:latest'

    input:
    file(h5ad) from input_files

    output:
    file("${h5ad.baseName}_qc.h5ad") into qc_results

    script:
    """
    python qc.py --input $h5ad --output ${h5ad.baseName}_qc.h5ad
    """
}

// Process 2: Clustering
process Clustering {
    container 'scanpy:latest'

    input:
    file(h5ad) from qc_results

    output:
    file("${h5ad.baseName}_clustered.h5ad") into final_results

    script:
    """
    python cluster.py --input $h5ad --output ${h5ad.baseName}_clustered.h5ad
    """
}
```

Run:
```bash
nextflow run analysis.nf
# Automatically parallelizes across all inputs!
```

## Single-Cell Applications

### 1. scRNA-seq Processing Pipeline
```
Raw FASTQ → Alignment → Quantification → QC → Normalization → Clustering
```
Each step in its own container, parallelized across samples.

### 2. Multi-Model Benchmarking
[[bioRxiv 2026 A unified framework enables accessible deployment and comprehensive benchmarking of single-cell foundation models|Benchmarking framework]] uses Nextflow to:
- Run 13 models on 50+ datasets
- Each model in own container
- Automatic resource allocation
- Reproducible results

### 3. Cross-Batch Integration
```
Batch1 → QC → Normalization ─→ Integration → Clustering
Batch2 → QC → Normalization ─→ (parallelized)
Batch3 → QC → Normalization ─→
```

## Advantages

✅ **Write Once, Run Anywhere**: Same code on different systems
✅ **Implicit Parallelization**: No manual job submission
✅ **Container Support**: Seamless Docker/Singularity integration
✅ **Resumable**: Restart from failed steps
✅ **Reportable**: Generate execution reports
✅ **Versioned Workflows**: Publish with papers

## Ecosystem

### nf-core
Central repository of curated bioinformatics workflows:
- `nf-core/rnaseq` - RNA-seq standard pipeline
- `nf-core/scrnaseq` - Single-cell RNA-seq
- `nf-core/sarek` - Variant calling
- Peer-reviewed, regularly updated

## Key Concepts

### Channels
Data streams between processes:
```groovy
// Create channel from files
data = Channel.fromPath('*.h5ad')

// Processes consume and emit channels
process A { input: file from data output: file into processed }
process B { input: file from processed output: file into results }
```

### Operators
Transform data:
```groovy
Channel.fromPath('*.h5ad')
    .filter { it.size() > 100 }  // Filter small files
    .map { it.baseName }          // Extract names
    .set { filtered_names }       // Save to variable
```

## Configuration Management

### Profiles
Different configs for different environments:

```groovy
// config file
profiles {
    local {
        process.executor = 'local'
        process.cpus = 4
    }
    hpc {
        process.executor = 'slurm'
        process.queue = 'default'
        process.cpus = 16
    }
    cloud {
        process.executor = 'awsbatch'
        process.container = 'myrepo/image:latest'
    }
}
```

Run with: `nextflow run workflow.nf -profile hpc`

## Best Practices

1. **Use containers**: Everything in Docker/Singularity
2. **Define resources**: CPUs, memory per process
3. **Version your workflow**: Git + git tags
4. **Document parameters**: What does each input do?
5. **Generate reports**: HTML execution summaries

## Integration with Other Tools

- **Git**: Version control for workflows
- **Conda**: Alternative to containers (less reproducible)
- **GitHub**: Publish and share workflows
- **Snakemake**: Alternative workflow engine (different philosophy)

## Related Tools

- [[02_Concepts/Docker Containerization|Docker]] - Containerization
- [[02_Concepts/Singularity Containerization|Singularity]] - HPC containers
- Snakemake - Alternative workflow engine
- WDL - Workflow Description Language (Cromwell)

## Comparison with Alternatives

| Tool | Syntax | Parallelization | Containers | HPC Support |
|------|--------|-----------------|-----------|-------------|
| **Nextflow** | Groovy | Implicit | ✅ | ✅✅✅ |
| Snakemake | Python | Implicit | ⚠️ | ✅✅ |
| WDL | Domain-specific | Explicit | ✅ | ✅✅ |
| Bash | Bash | Manual | ❌ | ⚠️ |

## Resources

- Official: https://www.nextflow.io/
- nf-core: https://nf-co.re/
- Documentation: Excellent and well-maintained
- Community: Growing bioinformatics community

## See Also

- Workflow best practices
- Container orchestration
- Reproducible computational biology

---

**Last Updated**: 2026-03-25
