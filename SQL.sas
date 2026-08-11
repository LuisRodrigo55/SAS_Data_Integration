/* Define database connection variables individually */
%let db_server   = localhost;
%let db_port     = 5432;
%let db_database = my_database;
%let db_user     = db_admin;
%let db_password = my_secure_password;
%let db_schema   = public;

proc sql;
    /* Establish the Connection, SAS/ACCESS engine PostgreSQL*/
    connect to postgres (
        server="&db_server" 
        port=&db_port 
        database="&db_database" 
        user="&db_user" 
        password="&db_password"
    );

    /* Native SQL query pass to the database to pull the results*/
    create table WORK.high_value_customers as
    select * 
    from connection to postgres (
       
        SELECT 
            customer_id, 
            customer_name, 
            SUM(purchase_amount) AS total_spent
        FROM 
            &db_schema..sales_data
        WHERE 
            purchase_date >= CURRENT_DATE - INTERVAL '30 days'
        GROUP BY 
            customer_id, 
            customer_name
        HAVING 
            SUM(purchase_amount) > 10000
    );

    execute (
        CREATE TABLE &db_schema..etl_log (
            log_id SERIAL PRIMARY KEY,
            event_desc VARCHAR(100),
            event_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        )
    ) by postgres;

    /* Close the connection*/
    disconnect from postgres;
quit;

/*Print thee results*/
proc print data=WORK.high_value_customers(obs=10);
    title "Data Preview: Native SQL Query Results";
run;
title;
