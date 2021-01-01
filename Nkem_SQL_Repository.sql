
/* 
Database is a collection of related information -- Particularly useful when dealing with large amounts of data.

Databases can handle significantly more data than systems like excel.

DATABASE MANAGEMENT SYSTEMS
- Makes it easy to manage large amounts of data.
- Can quickly combine different datasets.
- Handles the security and integrity of the data.
- Handles backups of the data.
- Handles importing and exporting data.
- Handles concurrency.
- Interacts with software applications -- Applications made in varying programming languages. Such as 'amazon.com' interacting with the Amazon database management system to make changes to the Amazon database.


C.R.U.D - Create . Read/Retrieve . Update . Delete -- 4 major operations done with a database.


1) Relational Database (SQL) [Example: MySQL, postgreSQL]-- Most popular. Arranges data in rows and columns with unique key identifiers. -- Like excel spreadsheet with conventional tables, arrays, tuples. Relational databases make use of a structured query language (SQL) as the standard library that interacts with them.

2) Non-relational Database (NoSQL) [Example: MongoDB, dynamoDB] -- Data is not stored in conventional rows and columns. Mapping methods (Key-value) storage methods are used, graph storage, document storage [like 'Javascript Object Notation (JSON)', XML], flexible table storage. -- Like dictionaries. Non-relational Databases do not feature standard languages for interacting with them.

*/


/*
DATABASE QUERY: Requests made to 'Database Management Systems (DBMS)' in-order to retrieve specific information. The more complex the database layout/schema, the more tricky the query has to be.

It is generally good practice to capitalize the keywords used in an SQL query, as this helps separate the keywords from the remaineder of the text; such as file names and all. -- One interesting way to go about it may be to use both keywords and file names/path in lower-case if your IDE supports syntax highlighting, then later update the keywords to upper-case when either exporting your queries or collaborating on them.
 */
 
 
 
 ------------------------------------------------------------------------------------------- SQL Syntaxing -------------------------------------------------------------------------------------------
 
 
 -- The 'SELECT' keyword is the most common keyword used in SQL for retrieving information from a table. 'SELECT' is combined with other statement keywords to perform various complexity queries.
 -- NOTE that a Database may contain several tables with their respective rows and columns.
 -- A semi-colon at the end of a query line is used to denote the end of the query. It is good practice to include this always.
 
 SELECT column_name FROM table_name; -- Grabbing data from one column for one specified table.
 SELECT (column_name) FROM table_name; -- Same as example above - use of parenthesis may be useful at certain times.
 
 SELECT column_1, column_4 FROM table_1; -- Grabbing data from two columns for one specified table.
 
 SELECT * FROM table_1; -- Grab data from all the columns in the specified table
------------------------------------------------------------------------------------------------------------------------------------------------------------- 
 
 
 -- The 'SELECT DISTINCT' keyword is used to get the unique information from a column of a table.
 -- It is used especially if there may be multiple entries of that exact same information.
 
 SELECT DISTINCT column_name FROM table_name; -- To get the unique or distinct information from a 'column_name' in 'table_name'.
 -------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 
 -- The 'SELECT COUNT' keyword is used to get the total number of rows from a particular column in a table.
 
 SELECT COUNT (column_name) FROM table_name; -- To query the total number of rows in the specified column of the table.
 SELECT COUNT (*) FROM table_name; -- Query total number of rows from the columns of the specified table - Should typically be same like the above sample
 
 SELECT COUNT (DISTINCT rental_rate) FROM film; -- To query the total number of distinct value rental_rate information in the specified database table, 'film'.
 SELECT COUNT (DISTINCT (rental_rate)) FROM film; -- Same as above, just with extra parenthesis.
 ---------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 
 -- The 'SELECT WHERE' keyword allows the query writer to select the conditions on columns for the rows to be returned.
 -- The syntax for using conditioning is shown below
 
 SELECT COUNT (column_name) 
 FROM table_name
 WHERE conditions;
 
 -- Example 1:
 SELECT COUNT (rental_rate) 
 FROM film
 WHERE rental_rate < 4.00; -- This counts all the rows of the 'rental_rate' column where the value of 'rental-rate' is lesser than 4.00.
 
 -- Example 2:
 SELECT (film_name) 
 FROM film
 WHERE film_name = 'Desperado'; -- This selects all the rows of 'film_name' column where the value of 'film_name' is 'Desperado'.
 /*
 Comparison operators:
 < less than
 > greater than
 = Equal to
 <= less than or equal to
 >= greater than or equal to
 <> or != not equal to
 */
 -- Logical operators can be combined with comparison operators to give more functionality. Logical operators include: AND, OR, NOT
 
 -- Example 3:
 SELECT COUNT (rental_rate) 
 FROM film
 WHERE rental_rate > 1 AND rental_rate < 4; -- This counts all the rows of the 'rental_rate' column where the value of 'rental-rate' is greater than 1 and lesser than 4.00.
 
 
 
 
 
 
 