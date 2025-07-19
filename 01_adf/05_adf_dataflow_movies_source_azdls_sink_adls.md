# Scenario: Using Azure Data Factorys Mapping DataFlow Acitivity handle [Data Movment/Data Transformation] from Source Azure Data Lake Gen2 to Sink Azure Data Lake Gen2

Solution:

## Source : Azure Data Lake Storage Gen2
- Name of the Data Lake         :       ssadcloudmainazdl
- Name of the Container         :       mainc
- Name of the Object Path       :       raw
- Name of the Movies Object     :       moviesDB.csv

## Sink: Azure Data Lake Storage Gen2
- Name of the Data Lake         :        ssadcloudmainazdl
- Name of the Container         :        processed/output-from-dataflow-movies
- Name of the Object            :         _(not specified)_

```
Pipeline → Dataflows Activity → Datasets → Linked Services

Linked Services -> Datasets -> Dataflows Activity -> Pipeline
```

# LINKED SERVICES:
- Name of the Source Linked Service         :       `LSAzureDataLakeStorage`
- Name of the Sink Linked Service           :       `LSAzureDataLakeStorage`

# DATASETS:
- Source Dataset Name                       :       `ds_source_adls_df_movies`
- Sink Dataset Name                         :       `ds_sink_adls_df_movies`

# DATAFLOW:
Name of the Dataflow                        :         `dataflow_source_adls_sink_adls_movies`

# PIPELINES
- Pipeline Name: `dataflow-source-adls-sink-adls-movies-pipeline`

# DATAFLOW ACTIVITY
- Activity Name: `dataflow-source-adls-sink-adls-movies-activiity`




