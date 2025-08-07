# Scenario: Using Azure Synpase Analytics, COPY Data from Source Azure Data Lake Gen2 to Sink Azure Data Lake Gen2

Solution:

## Source
- Type: Azure Data Lake / Azure Blob  
- Container: `raw`  
- Object:: emp.csv

## Sink
- Type: Azure Data Lake / Azure Blob  
- Container: `processed/output-from-synapse-copy-activity-employee`  
- Object: _(not specified)_

```
Pipeline → Copy Activity → Datasets → Linked Services

Linked Services -> Datasets -> Activity -> Pipeline
```

# LINKED SERVICES:
- Name of the Source Linked Service: `LSAzureDataLakeStorage`
- Name of the Sink Linked Service: `LSAzureDataLakeStorage`

# DATASETS:
- Source Dataset Name: `ds_source_adls_emp`
- Sink Dataset Name: `ds_sink_adls_emp`

# Pipeline Overview
- Pipeline Name: `cp-source-adls-sink-adls-emp-pipeline`

# ACTIVITY
- Activity Name: `cp-source-adls-sink-adls-emp-activiity`




