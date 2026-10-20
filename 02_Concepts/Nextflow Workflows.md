---
title: "Nextflow: Bioinformatics Workflow Engine"
aliases: [Nextflow]
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
// Build scanalysis:v1 locally and put qc.py and cluster.py in project bin/.
process QualityControl {
    container 'scanalysis:v1'
    input:
    path h5ad
    output:
    path "${h5ad.baseName}_qc.h5ad"
    script:
    """
    python ${projectDir}/bin/qc.py --input ${h5ad} --output ${h5ad.baseName}_qc.h5ad
    """
}

process Clustering {
    container 'scanalysis:v1'
    input:
    path h5ad
    output:
    path "${h5ad.baseName}_clustered.h5ad"
    script:
    """
    python ${projectDir}/bin/cluster.py --input ${h5ad} --output ${h5ad.baseName}_clustered.h5ad
    """
}

workflow {
    input_files = channel.fromPath('*.h5ad')
    qc_results = QualityControl(input_files)
    Clustering(qc_results)
}
```

Run:
```bash
nextflow run analysis.nf -with-docker
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
- Run multiple models and datasets; cite the exact benchmark version for counts
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
A community providing curated Nextflow pipelines; nf-core is not an alias for Nextflow:
- `nf-core/rnaseq` - RNA-seq standard pipeline
- `nf-core/scrnaseq` - Single-cell RNA-seq
- `nf-core/sarek` - Variant calling
- Peer-reviewed, regularly updated

## Key Concepts

### Channels
Data streams between processes:
```groovy
// Within a workflow block, using the process definitions above:
workflow {
    data = channel.fromPath('*.h5ad')
    processed = QualityControl(data)
    Clustering(processed)
}
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
| Snakemake | Python-based workflow DSL | Implicit | Supported | Supported |
| WDL | Domain-specific | Explicit | ✅ | ✅✅ |
| Bash | Shell | Manual | Can invoke container engines | Manual scheduler integration |

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

**Last Updated**: 2026-10-20

## Verification (2026-10-20)

[Current Nextflow process/workflow syntax](https://nextflow.io/docs/latest/process.html); [DSL1 removal history](https://training.nextflow.io/latest/info/nxf_versions/). Examples were migrated to DSL2. Scripts and a built image must exist before execution; no full pipeline run was performed during this content audit.
