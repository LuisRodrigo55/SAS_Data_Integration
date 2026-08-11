/* Define configuration variables individually */
%let file_path = /path/to/your/directory/sample_data.xlsx;
%let output_dataset = imported_data;
%let excel_sheet = Sheet1;

/* Execute the IMPORT procedure 
   DATAFILE: Points to the input Excel file
   OUT: Saves the file to the temporary WORK library
   DBMS: Specifies the Excel file format (XLSX)
   REPLACE: Overwrites the dataset if it already exists in WORK
*/
proc import 
    datafile="&file_path"
    out=WORK.&output_dataset
    dbms=xlsx
    replace;
    
    sheet="&excel_sheet";
    getnames=yes; /* Uses the first row of the Excel sheet as variable names */
run;

/* Print the first 10 observations */
proc print data=WORK.&output_dataset(obs=10);
    title "Data Preview: WORK.&output_dataset";
run;
title;
