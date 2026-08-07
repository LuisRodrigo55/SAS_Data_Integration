# SAS Data Integration Guide

SAS is able to read all the data you need. Whether you are dealing with a simple text file or querying a massive enterprise data warehouse, SAS provides specialized tools and engines to connect, read, and manipulate that data.

These are the main categories in which we can classify the data:

### 1. Raw and Delimited Data Files
These files are formatted in extensions such as `.csv`, `.txt`, `.tsv`, and `.dat`.

* **Integration Method:** This is typically handled using the SAS `DATA` step combined with the `INFILE` and `INPUT` statements. `INFILE` points to the physical file location and defines the delimiter, while `INPUT` defines the variables, their data types, and how they should be read.

### 2. PC Files and Software Formats
These are your standard desktop files like Microsoft Excel (`.xlsx`), Access, and formats from other software like SPSS (`.sav`) and Stata (`.dta`).

* **Integration Method:** We usually bring these in using `PROC IMPORT`. This procedure checks the file to figure out the data types and automatically creates a SAS dataset. Another way is using the `LIBNAME` statement with the `XLSX` engine, which lets SAS treat an Excel workbook just like a regular database library.

### 3. Relational Databases and Cloud Platforms
Thanks to SAS/ACCESS engines, SAS can connect directly to over 60 databases, data warehouses, and cloud platforms. This covers everything from traditional databases like Oracle and PostgreSQL to cloud environments like Snowflake or Google BigQuery.

* **Integration Method:** The standard way is mapping a `LIBNAME` statement to the specific database engine. This lets SAS read database tables exactly like native SAS datasets. If you need better performance, you can use Explicit SQL Pass-Through to send the queries and data processing directly to the database server.

---

## Example Scripts

In this repository, you'll find a set of example scripts demonstrating how to handle these different data sources in practice. 

| Script Name | What it does | Key SAS Statements |
|---|---|---|
| `Read_CSV.sas` | Reads raw, comma-separated data with missing values. | `DATA`, `INFILE`, `INPUT`, `DSD` |
| `Import_Excel.sas` | Automatically imports PC files into the `WORK` library. | `PROC IMPORT`, `DBMS=XLSX` |
| `Libname_Excel.sas` | Queries Excel directly without a formal import step. | `LIBNAME ... XLSX` |
| `Custom_Delimiters.sas` | Parses pipe (`\|`) or tab-delimited text files. | `INFILE ... DLM=` |
| `RDBMS_Connection.sas` | Connects to a relational database like PostgreSQL. | `LIBNAME ... POSTGRES` |
| `SQL.sas` | Sends native SQL queries directly to a database engine. | `PROC SQL`, `CONNECT TO` |
