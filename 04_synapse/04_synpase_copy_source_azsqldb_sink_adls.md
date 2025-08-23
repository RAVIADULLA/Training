# Scenario: Using Azure Data Factory , COPY Data from Source Azure SQL Database to Sink Azure Data Lake Gen2

Solution:

## Source : Azure SQL Database
- Name of the Server            :       ssadcloudmainsqlserverr
- Name of the Database          :       ssadcloudmainsqldb
- Name of the Admin             :       ssadcloud/Password1
- Name of the Table1            :       Employee
- Name of the Table2            :       Department

## Sink: Azure Data Lake Storage
- Name of the Data Lake         :        ssadcloudmainazdl
- Container                     :        processed/output-from-synapse-azsqldb
- Object                        :         _(not specified)_

```
Pipeline → Copy Activity → Datasets → Linked Services

Linked Services -> Datasets -> Activity -> Pipeline
```

# LINKED SERVICES:
- Name of the Source Linked Service         :       `LSAzureSqlDatabase`
- Name of the Sink Linked Service           :       `LSAzureDataLakeStorage`

# DATASETS:
- Source Dataset Name                       :       `ds_source_azsqldb_emp`
- Source Dataset Name                       :       `ds_source_azsqldb_dep`
- Sink Dataset Name                         :       `ds_sink_adls_emp_with_dep`

# Pipeline Overview
- Pipeline Name: `df-source-azsqldb-sink-adls-emp-pipeline`

# ACTIVITY
- Activity Name: `cp-source-azsqldb-sink-adls-emp-activiity`

# DATAFLOW:
- Name of the DataFlow: emp_with_dep_dataflow




