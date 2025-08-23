from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, avg, when, expr, rank
from pyspark.sql.window import Window

spark = SparkSession.builder.appName("ADFTransformations").getOrCreate()

# 1. DataFrame Creation
## Employee Data
employee_df = spark.read.csv('data/emp.csv',header=True,inferSchema=True)

## Department Data
department_df = spark.read.csv('data/dep.csv',header=True,inferSchema=True)

# 2. Select Pick specific columns.
selected_df = employee_df.select("emp_name", "salary")

# 3. Filter - Filter employees over salary 5000.
filtered_df = employee_df.filter(col("salary") > 50000)

# 4. Join - Join Employee with Department.
joined_df = employee_df.join(department_df, on="department_id", how="inner")

# 5. Aggregate - Sum of salaries per department.
aggregated_df = employee_df.groupBy("department_id").agg(sum("salary").alias("Totalsalary"))

# 6. Aggregate - Avg of salaries per department.
aggregated_df = employee_df.groupBy("department_id").agg(avg("salary").alias("AvgSalarybyDep"))

# 7. Derived Column - Add 10% increased salary.
derived_df = employee_df.withColumn("salaryIncrease", col("salary") * 1.1)

# 8. Select Pick specific columns.
selected_df = employee_df.select("Name", "department_id", "salary")

# 9. Sort - Sort employees by descending salary.
sorted_df = employee_df.orderBy(col("salary").desc())
aggregated_df = employee_df.groupBy("department_id").agg(avg("salary").alias("AvgSalarybyDep")).orderBy("department_id")

# 10. Lookup (Join) Same as #3: add department names to employee data.
lookup_df = employee_df.join(department_df, on="department_id", how="left")

# 11. Conditional Split - Split by age < 30 and >= 30.
junior_employees = employee_df.filter(col("salary")<5000)
senior_employees = employee_df.filter(col("salary")>50000)

# 12. # Pivot the data by 'department_id' and aggregate 'salary'
from pyspark.sql.functions import sum
pivot_df = employee_df.groupBy().pivot("department_id").agg(sum("salary"))

# 13. Copy Activity - Simulate copy by writing to file/database (e.g., parquet).
employee_df.write.mode("overwrite").parquet("/mnt/output/employee_data")

# 14. Union -Combine employees in HR and IT.
hr_df = employee_df.filter(col("department_id") == 101)
it_df = employee_df.filter(col("department_id") == 102)
union_df = hr_df.union(it_df)

# 15. Window - Rank employees by salary within department.
window_spec = Window.partitionBy("department_id").orderBy(col("salary").desc())
ranked_df = employee_df.withColumn("salaryRank", rank().over(window_spec))

# 16. Alter Row - Mark records for insert/update.
altered_df = employee_df.withColumn(
    "Operation",
    when(col("salary") < 60000, "Insert")
    .when(col("salary") >= 60000, "Update")
)

# 17. Sink - Simulate writing to Azure SQL or other sinks.
# For Azure SQL, use JDBC
employee_df.write \
    .format("jdbc") \
    .option("url", "jdbc:sqlserver://<server>:1433;databaseName=<db>") \
    .option("dbtable", "Employee") \
    .option("user", "<user>") \
    .option("password", "<password>") \
    .save()


# can you please explain about the parameterization and also performance tuning techniques 
 
# Query Partion
# For Each
AWS - AWS S3 - UNity Catalog -> AWS Keys !!!