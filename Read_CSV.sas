/*SAS Data Integration Guide: Reading CSV Data with Missing Values */

/*This step creates a new SAS dataset called 'Employee_Data' */

DATA Employee_Data;
    /* DATALINES tells SAS the data is inline.*/
    /* DSD (Delimiter-Sensitive Data) is crucial for CSV integration because it:*/
    /* 1. Sets the default delimiter to a comma.*/
    /* 2. Treats two consecutive commas as a missing value.*/
    /* 3. Strips enclosing quotes from text values.*/
    
    INFILE DATALINES DSD;
    INPUT EmployeeID Name $ Department $ Salary;
    
    /* Notice the missing department for Jane (consecutive commas) and the missing salary for Bob (trailing comma). */
    DATALINES;
101,"Smith, John",IT,75000
102,Jane Doe,,82000
103,Bob Smith,HR,
104,"Alice Jones",Finance,95000
;
RUN;

/* Print of the dataset to verify the integration */
PROC PRINT DATA=employee_data;
    TITLE "Employee Data Integration Result";
RUN;
