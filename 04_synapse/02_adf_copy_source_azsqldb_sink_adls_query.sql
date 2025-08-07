-- This is auto-generated code
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://ssadcloudmainazdl.dfs.core.windows.net/processed/output-from-azsqldb/dbo.Employee.parquet',
        FORMAT = 'PARQUET'
    ) AS [result]
