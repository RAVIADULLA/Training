### Azure Data Factory Data Flow Transformations

#### Using Employee and Department Datasets

#### Sample Datasets:

Employee Dataset

| EmployeeID | Name          | Age | DepartmentID | Salary |
| 1          | John Doe      | 30  | 101          | 50000  |
| 2          | Jane Smith    | 25  | 102          | 60000  |
| 3          | Alice Brown   | 28  | 101          | 55000  |
| 4          | Bob White     | 35  | 103          | 70000  |
| 5          | Charlie Green | 40  | 102          | 75000  |

Department Dataset

| DepartmentID | DepartmentName |
| 101          | HR             |
| 102          | IT             |
| 103          | Finance        |



### 1. Union Transformation

The Union transformation combines two datasets into one. Both datasets should have the same structure (same columns).

Use Case: Combine data from two departments, HR and IT.

Example:
We want to combine Employee data for HR (Department 101) and IT (Department 102).

```json
{
  "type": "Union",
  "inputs": ["HRData", "ITData"],
  "outputs": ["CombinedData"]
}
```



### 2. Join Transformation

The Join transformation is used to combine two datasets based on a common field (like SQL JOIN).

Use Case: Combine Employee and Department data based on `DepartmentID` to get Employee names along with their department names.

Example:
Joining Employee dataset with Department dataset on `DepartmentID`.

```json
{
  "type": "Join",
  "inputs": ["EmployeeData", "DepartmentData"],
  "joinType": "Inner",
  "on": "EmployeeData.DepartmentID == DepartmentData.DepartmentID",
  "outputs": ["JoinedEmployeeDepartment"]
}
```



### 3. Filter Transformation

The Filter transformation is used to remove records based on a condition.

Use Case: Find all employees who are over 30 years old.

Example:
Filter employees whose `Age > 30`.

```json
{
  "type": "Filter",
  "inputs": ["EmployeeData"],
  "condition": "Age > 30",
  "outputs": ["FilteredEmployees"]
}
```



### 4. Aggregate Transformation

The Aggregate transformation is used to group data and perform operations like `SUM`, `AVG`, `COUNT`, etc.

Use Case: Calculate the total salary by department.

Example:
Group by `DepartmentID` and calculate the sum of `Salary`.

```json
{
  "type": "Aggregate",
  "inputs": ["EmployeeData"],
  "groupBy": ["DepartmentID"],
  "aggregates": [
    {
      "aggregate": "Sum",
      "field": "Salary",
      "name": "TotalSalary"
    }
  ],
  "outputs": ["AggregatedSalary"]
}
```



### 5. Derived Column Transformation

The Derived Column transformation creates new columns based on expressions.

Use Case: Create a new column `SalaryIncrease` by increasing the salary by 10%.

Example:
Calculate `Salary  1.1` to add a 10% salary increase.

```json
{
  "type": "DerivedColumn",
  "inputs": ["EmployeeData"],
  "columns": [
    {
      "name": "SalaryIncrease",
      "expression": "Salary  1.1"
    }
  ],
  "outputs": ["EmployeeWithSalaryIncrease"]
}
```



### 6. Sort Transformation

The Sort transformation orders the dataset by one or more columns.

Use Case: Sort employees by `Salary` in descending order.

Example:
Sort Employee dataset by `Salary` from highest to lowest.

```json
{
  "type": "Sort",
  "inputs": ["EmployeeData"],
  "sorts": [
    {
      "column": "Salary",
      "order": "Descending"
    }
  ],
  "outputs": ["SortedEmployeeData"]
}
```



### 7. Lookup Transformation

The Lookup transformation allows you to enrich your dataset by looking up data from another source.

Use Case: Look up department names from the Department dataset based on `DepartmentID`.

Example:
Add `DepartmentName` to Employee dataset by matching `DepartmentID`.

```json
{
  "type": "Lookup",
  "inputs": ["EmployeeData"],
  "lookupSource": "DepartmentData",
  "key": "DepartmentID",
  "outputs": ["EmployeeWithDepartmentName"]
}
```



### 8. Select Transformation

The Select transformation is used to pick specific columns from the dataset.

Use Case: Select only `Name`, `DepartmentID`, and `Salary` columns from the Employee dataset.

Example:
Choose specific columns from Employee dataset.

```json
{
  "type": "Select",
  "inputs": ["EmployeeData"],
  "columns": ["Name", "DepartmentID", "Salary"],
  "outputs": ["SelectedEmployeeColumns"]
}
```



### 9. Conditional Split Transformation

The Conditional Split transformation splits the data into multiple outputs based on conditions.

Use Case: Split employees into two groups: `YoungEmployees` (Age < 30) and `OlderEmployees` (Age >= 30).

Example:
Create two outputs based on age.

```json
{
  "type": "ConditionalSplit",
  "inputs": ["EmployeeData"],
  "conditions": [
    {
      "name": "YoungEmployees",
      "condition": "Age < 30"
    },
    {
      "name": "OlderEmployees",
      "condition": "Age >= 30"
    }
  ],
  "outputs": ["YoungEmployees", "OlderEmployees"]
}
```



### 10. Pivot Transformation

The Pivot transformation turns row data into columns.

Use Case: Pivot employee data to show salaries for each department.

Example:
Pivot data to create columns for each `DepartmentID` with total `Salary`.

```json
{
  "type": "Pivot",
  "inputs": ["EmployeeData"],
  "pivotColumn": "DepartmentID",
  "pivotValues": ["101", "102", "103"],
  "aggregates": [
    {
      "aggregate": "Sum",
      "field": "Salary",
      "name": "TotalSalary"
    }
  ],
  "outputs": ["PivotedSalaryData"]
}
```



### 11. Flatten Transformation

The Flatten transformation is used to unroll nested structures into a flat format.

Use Case: Flatten an array of employee projects into a flat list (if employees had a `Projects` array).

Example:
Flatten the `Projects` array for each employee.

```json
{
  "type": "Flatten",
  "inputs": ["EmployeeData"],
  "flattenedColumn": "Projects",
  "outputs": ["FlattenedEmployeeProjects"]
}
```



### 12. Copy Activity Transformation

The Copy activity is used to copy data from one dataset to another.

Use Case: Copy employee data to a destination storage or database.

Example:
Copy Employee data to a database.

```json
{
  "type": "Copy",
  "inputs": ["EmployeeData"],
  "outputs": ["EmployeeDatabase"]
}
```



### 13. Window Transformation

The Window transformation is used for window functions, like ranking or calculating moving averages.

Use Case: Rank employees by `Salary` within each department.

Example:
Rank employees based on `Salary` within their `DepartmentID`.

```json
{
  "type": "Window",
  "inputs": ["EmployeeData"],
  "partitionBy": ["DepartmentID"],
  "orderBy": ["Salary"],
  "windowFunctions": [
    {
      "function": "Rank",
      "field": "Salary",
      "name": "SalaryRank"
    }
  ],
  "outputs": ["EmployeeWithRank"]
}
```



### 14. Alter Row Transformation

The Alter Row transformation is used to specify row-level operations (Insert, Update, Delete).

Use Case: Mark employee data for insert or update based on salary change.

Example:
Insert new records or update existing ones based on salary changes.

```json
{
  "type": "AlterRow",
  "inputs": ["EmployeeData"],
  "conditions": [
    {
      "operation": "Insert",
      "condition": "Salary < 60000"
    },
    {
      "operation": "Update",
      "condition": "Salary >= 60000"
    }
  ],
  "outputs": ["AlteredEmployeeData"]
}
```



### 15. Sink Transformation

The Sink transformation writes the final data to a destination (e.g., a database or file storage).

Use Case: Write transformed employee data to an Azure SQL database.

Example:
Write the final dataset to an \\Azure SQL Database


\\.

```json
{
  "type": "Sink",
  "inputs": ["EmployeeData"],
  "destination": "AzureSQLDatabase",
  "outputs": ["FinalEmployeeOutput"]
}
