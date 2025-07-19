# Scenario: Using Azure Data Factory , COPY Data from Source Azure CosmosDB to Sink Azure Data Lake Gen2

Solution:

## Source : Azure CosmosDB
- Name of the CosmosDB Account  :       ssadcloudazcosmosdb
- Name of the Database          :       salesordersDB
- Name of the Container         :       salesordersC
- Partition Key                 :       

## Sink: Azure Data Lake Storage
- Name of the Data Lake         :        ssadcloudmainazdl
- Container                     :        processed/output-from-azcosmosdb
- Object                        :         _(not specified)_

```
Pipeline → Copy Activity → Datasets → Linked Services

Linked Services -> Datasets -> Activity -> Pipeline
```

# LINKED SERVICES:
- Name of the Source Linked Service         :       `LSAzureCosmosDB`
- Name of the Sink Linked Service           :       `LSAzureDataLakeStorage`

# DATASETS:
- Source Dataset Name                       :       `ds_source_azcosmosdb_orders`
- Sink Dataset Name                         :       `ds_sink_adls_orders`

# Pipeline Overview
- Pipeline Name: `cp-source-azcosmosdb-sink-adls-orders-pipeline`

# ACTIVITY
- Activity Name: `cp-source-azcosmosdb-sink-adls-orders-activiity`




