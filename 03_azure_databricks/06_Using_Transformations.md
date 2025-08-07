from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum, avg, when, expr, rank
from pyspark.sql.window import Window

spark = SparkSession.builder.appName("ADFTransformations").getOrCreate()

# 1. DataFrame Creation
## Employee Data
employee_data = [
    (1, "John Doe", 30, 101, 50000),
    (2, "Jane Smith", 25, 102, 60000),
    (3, "Alice Brown", 28, 101, 55000),
    (4, "Bob White", 35, 103, 70000),
    (5, "Charlie Green", 40, 102, 75000)
]
employee_df = spark.createDataFrame(employee_data, ["EmployeeID", "Name", "Age", "DepartmentID", "Salary"])

## Department Data
department_data = [
    (101, "HR"),
    (102, "IT"),
    (103, "Finance")
]
department_df = spark.createDataFrame(department_data, ["DepartmentID", "DepartmentName"])


# 2. Union -Combine employees in HR and IT.
hr_df = employee_df.filter(col("DepartmentID") == 101)
it_df = employee_df.filter(col("DepartmentID") == 102)
union_df = hr_df.union(it_df)

# 3. Join - Join Employee with Department.
joined_df = employee_df.join(department_df, on="DepartmentID", how="inner")

# 4. Filter - Filter employees over age 30.
filtered_df = employee_df.filter(col("Age") > 30)

# 5. Aggregate -Sum of salaries per department.
aggregated_df = employee_df.groupBy("DepartmentID").agg(sum("Salary").alias("TotalSalary"))

# 6. Derived Column - Add 10% increased salary.
derived_df = employee_df.withColumn("SalaryIncrease", col("Salary") * 1.1)

# 7. Sort - Sort employees by descending salary.
sorted_df = employee_df.orderBy(col("Salary").desc())

# 8. Lookup (Join) Same as #3: add department names to employee data.
lookup_df = employee_df.join(department_df, on="DepartmentID", how="left")

# 9. Select Pick specific columns.
selected_df = employee_df.select("Name", "DepartmentID", "Salary")

# 10. Conditional Split - Split by age < 30 and >= 30.
young_employees = employee_df.filter(col("Age") < 30)
older_employees = employee_df.filter(col("Age") >= 30)

# 11. Pivot - Pivot DepartmentID to columns and sum salaries.
pivot_df = employee_df.groupBy().pivot("DepartmentID").agg(sum("Salary"))

# 12. Flatten -Simulate flattening a nested structure (e.g., array of projects).

# 13. Copy Activity - Simulate copy by writing to file/database (e.g., parquet).
employee_df.write.mode("overwrite").parquet("/mnt/output/employee_data")

# 14. Window - Rank employees by salary within department.
window_spec = Window.partitionBy("DepartmentID").orderBy(col("Salary").desc())
ranked_df = employee_df.withColumn("SalaryRank", rank().over(window_spec))

# 15. Alter Row - Mark records for insert/update.
altered_df = employee_df.withColumn(
    "Operation",
    when(col("Salary") < 60000, "Insert")
    .when(col("Salary") >= 60000, "Update")
)

# 16. Sink - Simulate writing to Azure SQL or other sinks.
# For Azure SQL, use JDBC
employee_df.write \
    .format("jdbc") \
    .option("url", "jdbc:sqlserver://<server>:1433;databaseName=<db>") \
    .option("dbtable", "Employee") \
    .option("user", "<user>") \
    .option("password", "<password>") \
    .save()


