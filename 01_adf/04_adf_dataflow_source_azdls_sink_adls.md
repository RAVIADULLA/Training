# Scenario: Using Azure Data Factory , DataFlow Acitivity [Data Movment/Data Transformation] from Source Azure Data Lake Gen2 to Sink Azure Data Lake Gen2

Solution:

## Source : Azure Data Lake Storage Gen2
- Name of the Data Lake         :       ssadcloudmainazdl
- Name of the Container         :       raw
- Name of the Employee Object   :       emp.csv
- Name of the Department Object :       dep.csv


## Sink: Azure Data Lake Storage Gen2
- Name of the Data Lake         :        ssadcloudmainazdl
- Name of the Container         :        processed/output-from-dataflow-emp-with-dep
- Name of the Object            :         _(not specified)_

```
Pipeline → Dataflows Activity → Datasets → Linked Services

Linked Services -> Datasets -> Dataflows Activity -> Pipeline
```

# LINKED SERVICES:
- Name of the Source Linked Service         :       `LSAzureDataLakeStorage`
- Name of the Sink Linked Service           :       `LSAzureDataLakeStorage`

# DATASETS:
- Source Dataset1 Name                       :       `ds_source_adls_df_emp`
- Source Dataset2 Name                       :       `ds_source_adls_df_dep`
- Sink Dataset Name                          :       `ds_sink_adls_df_empwithdep`

# Name of the Dataflow
Name of the Dataflow                        :         dataflow_source_adls_sink_adls_empwithdep

# Pipeline Overview
- Pipeline Name: `dataflow-source-adls-sink-adls-empwithdep-pipeline`

# ACTIVITY
- Activity Name: `dataflow-source-adls-sink-adls-empwithdep-activiity`




