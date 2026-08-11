/* Define database connection variables individually */
%let pg_server   = localhost;       /* Specific host IP/URL */
%let pg_port     = 5432;            /* Default PostgreSQL port */
%let pg_database = my_database;
%let pg_user     = db_admin;
%let pg_password = my_secure_password;
%let pg_schema   = public;

/* 
  Assign a LIBNAME to the PostgreSQL database.
  Pgdb: The SAS libref (library reference). Max 8 characters.
  Postgres: Specifies the SAS/ACCESS engine for PostgreSQL.
  Server/port/database/user/password: Connection credentials.
  Schema: Points SAS to the correct schema within the database.
*/
libname pgdb postgres 
    server="&pg_server" 
    port=&pg_port 
    database="&pg_database" 
    user="&pg_user" 
    password="&pg_password"
    schema="&pg_schema";

/* This confirms if the connection is active */
proc datasets library=pgdb;
quit;

/* This can be replace with your specific code*/
/*
data WORK.local_data;
    set pgdb.table (obs=100);
run;
*/

libname pgdb clear;
