
/* Example of parsing  text files with non-standard delimiters (like bar(|) or tabs) 
into the SAS WORK library using the  INFILE statement. */

/* ------------------------Parsing a Pipe-Delimited (|) File --------------*/
/* Configuration variables*/
%let pipe_file_path = /path/to/your/pipe_data.txt;
%let pipe_out_data  = pipe_dataset;
%let pipe_delimiter = '|';

data WORK.&pipe_out_data;
    /* 
      INFILE Options:
       DLM= specifies the custom character separating the values.
       DSD treats consecutive delimiters as missing values and strips enclosing quotes from character data.
       TRUNCOVER prevents SAS from searching the next line when a record is shorter than expected.
       FIRSTOBS=2 tells SAS to skip the header row.
    */
    infile "&pipe_file_path" dlm=&pipe_delimiter dsd truncover firstobs=2;
    
    /* Prevents truncation */
    length EmployeeID 8 FullName $40 Department $30;
    
    input EmployeeID FullName $ Department $;
run;
/* ---------------------------------------------------------------------------*/

/* ------------------------Parsing a Tab-Delimited File---------------------- */
/* Configuration variables*/
%let tab_file_path = /path/to/your/tab_data.txt;
%let tab_out_data  = tab_dataset;
%let tab_delimiter = '09'x; /* Hexadecimal code for a Tab */

data WORK.&tab_out_data;
    infile "&tab_file_path" dlm=&tab_delimiter dsd truncover firstobs=2;
    
    length ProductID $10 ProductName $50 Price 8;
    
    input ProductID $ ProductName $ Price;
run;
/* ---------------------------------------------------------------------------*/


/*Print the result*/
proc print data=WORK.&pipe_out_data(obs=5);
    title "Data Preview: Pipe-Delimited Import";
run;

proc print data=WORK.&tab_out_data(obs=5);
    title "Data Preview: Tab-Delimited Import";
run;
title; /* Clear title */
