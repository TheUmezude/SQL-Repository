
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
 
 SELECT COUNT (column_1, column_2) 
 FROM table_name
 WHERE condition1 OR condition2 OR condition3;
 
 -- Example 1:
 SELECT COUNT (rental_rate) 
 FROM film
 WHERE rental_rate < 4.00; -- This counts all the rows of the 'rental_rate' column where the value of 'rental-rate' is lesser than 4.00.
 
 -- Example 2:
 SELECT (film_name) 
 FROM film
 WHERE film_name = 'Desperado'; -- This returns all the rows of 'film_name' column where the value of 'film_name' is 'Desperado'. Case sensitivity applies.
 -- Strings should always have single quotes.
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
 
 -- Example 4:
 SELECT * -- For some reason, when 'SELECT' is the only keyword, postgreSQL complains if the asterisk is placed in parenthesis. 
 FROM film
 WHERE rental_rate > 1 AND release_date = 2006; -- This returns all the rows of the 'film' table where the value of 'rental-rate' is greater than 1 and the 'release_date' is 2006.
 ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 
  -- The 'ORDER BY' keyword is used to sort the organization of rows based on a column value (ascending or descending order).
 SELECT (column1, column2) 
 FROM table_1
 ORDER BY column_1 ASC/DESC;
 
 -- Example 1:
 SELECT address, city_id FROM address
 ORDER BY city_id DESC; -- This returns the columns 'address' and 'city_id' from the table 'address'. 
 -- However, their order would be according to the descending order of the integer values in the 'city_id' column.
 -- If the 'ORDER BY' keyword is left blank, the items are automatically sorted in ascending order by default.
 -- NOTE that you can order by more than one colum contents (Precedence flows from left to right) -- You can also order by strings, floats* and integer data contents.
 
 -- Example 2:
 SELECT store_id, first_name, last_name FROM customer
 ORDER BY store_id DESC, first_name ASC; -- This returns the columns 'store_id', 'first_name' and 'last_name' from the table 'customer'.
 -- The columns are returned sorted in descending order for 'store_id' and ascending order for 'first_name' -- Precedence flows from left to right.
 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 
 -- The 'LIMIT' keyword allows for the number of rows returned to be limited -- such that the entire rows in the database associated with a particular query aren't returned.
 -- 'LIMIT' is usually combined with the 'ORDER' statement and usually is the last command to be executed.
 
 -- Example 1:
 SELECT * FROM payment
 ORDER BY payment_date ASC
 LIMIT 5; -- This would ordinarily have returned all the columns and rows associated with the 'payment' table, but with the 'LIMIT' keyword at the end, it returns just the top 5 row entries.
 
 -- Example 2:
 SELECT * FROM payment
 WHERE amount > 2.99
 ORDER BY payment_date ASC
 LIMIT 10; -- Returning the top 10 rows for all columns in the table 'payment' where the 'amount' column is greater than 2.99.

-- Example 3:
 SELECT * FROM payment
 LIMIT 1; -- An interesting way to get the general layout of a particular table, without printing out the entire database. Here, just the first row is returned.
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 
 -- The 'BETWEEN' keyword is used for getting results within a specified range. Can be used in place of combined comparison and logical operators. For instance:
 -- value >= low AND value <= high -- can be rewritten as -- value BETWEEN low AND high
 -- Certain instances may also require that you use a 'NOT BETWEEN' keyword for getting entries that don't exist between a specified range.
 -- The 'BETWEEN' keyword may also be used for dates, as long as the dates are formatted in the ISO 8601 format: 'YYYY-MM-DD'
 
 -- Example 1:
 SELECT * FROM payment
 WHERE amount BETWEEN 4.99 AND 9.99
 LIMIT 10; -- To return the first 10 rows from all the columns in the 'payment' table, where the amount exists between 4.99 and 9.99 i.e amount >= 4.99 AND <= 9.99
 
 -- Example 2:
 SELECT COUNT(*) FROM payment
 WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15'; -- Returns the total number of entries in the 'payment' table where the date exist between the specified dates.
 -- NOTE that unfortunately, the date system on SQL only goes up to the midnight time-stamp, so if time is above 00:00, it won't register, so always pay extra attention.
 -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
 
 -- The 'IN' operator may be used to create a condition that checks to see if a value is included in a list of multiple entries.
 
 -- Example 1:
 SELECT * FROM customer
 WHERE first_name IN ('Jared', 'Linda', 'Susan', 'Maria'); -- This returns all entries (rows & columns) where the 'first_name' column has entries similar to the initialized strings.
 -- NOTE that parenthesis must always be used. Also, strings must be inside the single quotes while numeric data types should be without single quotes.
 
 -- Example 2:
 SELECT * FROM customer
 WHERE first_name NOT IN ('Jared', 'Linda', 'Susan', 'Maria') -- This returns all entries (rows & columns) where the 'first_name' column has NO entries similar to the initialized strings.
 
 
 
 
 
 
 
