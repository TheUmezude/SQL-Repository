
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
 
 
 
------------------------------------------------- SQL Syntaxing ---------------------------------------------------------
 
----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ The 'SELECT' keyword ------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
-- The 'SELECT' keyword is the most common keyword used in SQL for retrieving information from a table. 'SELECT' is combined with other statement keywords to perform various complexity queries.
-- NOTE that a Database may contain several tables with their respective rows and columns.
-- A semi-colon at the end of a query line is used to denote the end of the query. It is good practice to include this always.
 
SELECT column_name FROM table_name; -- Grabbing data from one column for one specified table.
SELECT (column_name) FROM table_name; -- Same as example above - use of parenthesis may be useful at certain times.
 
SELECT column_1, column_4 FROM table_1; -- Grabbing data from two columns for one specified table.
 
SELECT * FROM table_1; -- Grab data from all the columns in the specified table



 
 
----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ The 'SELECT DISTINCT' keyword ---------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
 
-- The 'SELECT DISTINCT' keyword is used to get the unique information from a column of a table.
-- It is used especially if there may be multiple entries of that exact same information.
 
SELECT DISTINCT column_name FROM table_name; -- To get the unique or distinct information from a 'column_name' in 'table_name'.





---------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ The 'SELECT COUNT' keyword -----------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
 
-- The 'SELECT COUNT' keyword is used to get the total number of rows from a particular column in a table.
-- Note that 'COUNT' is a type of aggregate function.
 
SELECT COUNT (column_name) FROM table_name; -- To query the total number of rows in the specified column of the table.
SELECT COUNT (*) FROM table_name; -- Query total number of rows from the columns of the specified table - Should typically be same like the above sample
 
SELECT COUNT (DISTINCT rental_rate) FROM film; -- To query the total number of distinct value rental_rate information in the specified database table, 'film'.
SELECT COUNT (DISTINCT (rental_rate)) FROM film; -- Same as above, just with extra parenthesis.
 
 
 
 
 
----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ The 'SELECT WHERE' keyword ------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
 
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
 
 
 
 
 
----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ The 'ORDER BY' keyword ----------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
 
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
 
 
 
 
 
----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ The 'LIMIT' keyword -------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
 
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
 
 
 
 
 
----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ The 'BETWEEN' keyword -----------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
 
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
 
-- ** NOTE, to filter out just the dates and ignore time-stamps in cases where date and time-stamps are shown, you may call the function 'DATE()'
 
 
 
 
 
----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ The 'IN' operator ---------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
 
-- The 'IN' operator may be used to create a condition that checks to see if a value is included in a list of multiple entries.
 
-- Example 1:
SELECT * FROM customer
WHERE first_name IN ('Jared', 'Linda', 'Susan', 'Maria'); -- This returns all entries (rows & columns) where the 'first_name' column has entries similar to the initialized strings.
-- NOTE that parenthesis must always be used. Also, strings must be inside the single quotes while numeric data types should be without single quotes.
 
-- Example 2:
SELECT * FROM customer
WHERE first_name NOT IN ('Jared', 'Linda', 'Susan', 'Maria') -- This returns all entries (rows & columns) where the 'first_name' column has NO entries similar to the initialized strings.
 
 
 
 
 
----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ The 'LIKE' operator -------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
 
-- The 'LIKE' operator allows for pattern-matching queries to be made on a database -- for instance, finding all the customers whose names begin with 'A', or whose email addreses end with '@yahoo.com'
-- The matching however requires the use of 2 wildcard characters. The percent (%) that matches any sequence of characters or the underscore (_) that matches any single character.
-- Examples are shown below.
 
-- Example 1: 
SELECT * FROM film
WHERE title LIKE 'Ch%'; -- This returns all the columns of the 'film' table but only returns the rows associated with a 'title' column beginning with 'Ch'.
 
-- Example 2:
SELECT * FROM film
WHERE title LIKE '%its'; -- This returns all the columns of the 'film' table but only returns the rows associated with a 'title' column ending with 'its'.
 
-- NOTE the change in the position of the percent sign for instances of either beginning with or ending with.
-- NOTE also that the 'LIKE' keyword is case sensitive.
-- To avoid the case-sensitive requirement of the 'LIKE' keyword, 'ILIKE' may be used instead, as in the example below:
-- All the characters following after the specified character are referred to as 'wild-cards' as they could be any length and any arrangement of alphabets.
 
-- Example 3:
SELECT * FROM film
WHERE title ILIKE '%C'; -- Returns all the columns of the 'film' table but only returns the rows associated with a 'title' column ending with 'c' or 'C' (no case-sensitivity).
 
-- NOTE that you may mix-mash characters before and after the percent sign to indicate what the entry data should start and end with. -- For instance:
 
-- Example 4:
SELECT * FROM film
WHERE title LIKE 'Ap%e'; -- Returns all the columns of the 'film' table but only returns the rows associated with a 'title' column beginning with 'Ap' and ending with 'e' (case-sensitivity).
 
-- The 'Like' operator can also be used with an underscore (_), to get matching data with only a character difference (like movie sequels), such as Tarzan 1, Tarzan 2.
 
-- Example 5:
SELECT * FROM film
WHERE film_name ILIKE 'Fast & Furious _'; -- This would return all columns of the 'film' table but only returns the rows that have 'Fast & Furious' followed by one extra character.
 
-- You can use multiple underscores to match the multiple characters after the initialized string.
-- You can combine underscores with percent signs for more intricate searches. For instance:
 
-- Example 6:
SELECT * FROM film
WHERE title ILIKE '__be%'; -- Returns all the columns of the 'film' table but only returns rows associated with a 'title' column starting with two wildcard characters (2 underscores), a 'be' character set, and then any other group of character number, arrangement and length.
 
-- As usual, you may also add the 'NOT' operator before the 'LIKE' operator to return results that deviate from the pattern. For instance:
 
-- Example 7:
SELECT * FROM film
WHERE title NOT LIKE '__be%'; -- Returns the opposite of the results gotten in Example 6.
 
 
 
 
 
----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ AGGREGATE FUNCTIONS -------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
 
-- Aggregate functions are functions that take in a lot of data and return a single output. Examples of aggregate function in SQL include:
AVG() -- To return the average of a set of values. value is a float and 'ROUND()' ay be used to set approximation precision.
COUNT() -- To return a value that describes the number of times an occurrence takes place.
MAX() -- To return the maximum value out of a set of values
MIN() -- To return the minimum value out of a set of values
SUM() -- To return the total of a set of values.
 
-- You can only call aggregate functions after the 'SELECT' clause or 'HAVING' clause.
 
-- Example 1:
SELECT MIN(replacement_cost) FROM film; -- To return the minimum value in the 'replacement_cost' column of the 'film' table.
 
SELECT MAX(replacement_cost) FROM film; -- To return the maximum value in the 'replacement_cost' column of the 'film' table.
 
SELECT MAX(replacement_cost), MIN(replacement_cost) FROM film; -- To return the maximum and minumum values in the 'replacement_cost' column of the 'film' table. Note that a single value is returned.
 
-- Example 2:
SELECT ROUND(AVG(replacement_cost), 4) FROM film; -- To return the average of all the values in the 'replacement_cost' column of the 'film' table, rounded to 4 decimal places
-- NOTE that the general syntax when using the 'ROUND()' function is: ROUND(parameter, precision)
 
-- Example 3:
SELECT SUM(replacement_cost) FROM film; -- Returns the total sum of all the parameters in the 'replacement_cost' column of the 'film' table.
 
 
 
 
 
----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ The 'GROUP BY' call -------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
 
-- The 'GROUP BY' call allows the analyst to perform a grouping (by likely aggregating) of data based on a category.
-- The general syntax can be shown below:
SELECT category_column1, category_column2, AGG(data_col)
FROM specified_table
GROUP BY category_column1, category_column2; -- Where 'AGG' is a specified aggregate function
 
-- An example can be shown below:
 
-- Example 1:
SELECT (rating), SUM(replacement_cost) 
FROM film
GROUP BY rating; -- Here the entire database is grouped based on the different rating categories and the sum of all the 'replacement_cost' values for those categories is returned as a table.
 
-- Example 2:
SELECT (rating), SUM(replacement_cost) 
FROM film
WHERE rating != 'G'
GROUP BY rating; -- Here some of the database is grouped based on the different rating categories and the sum of all the 'replacement_cost' values for those categories is returned as a table.
-- Unlike in the previous example, with the specification initiated by the 'WHERE' statement, rows with film rating as 'G' would be ignored.
-- NOTE that a 'GROUP BY' statement must only always follow either a 'FROM' or a 'WHERE' statement.
 
-- Example 3:
SELECT (rating, rental_rate), SUM(replacement_cost) 
FROM film
GROUP BY rating, rental_rate; 
-- Here the entire database is grouped first based on the different rating categories, then the pricing within those categories (rental_rate), and finally, the sum of all the 'replacement_cost' values for those categories is returned as a table.
 
-- Example 4:
SELECT (rating, rental_rate), SUM(replacement_cost) 
FROM film
GROUP BY rating, rental_rate
ORDER BY SUM(replacement_cost) ASC; -- Here the entire database is grouped first based on the different rating categories, then the pricing within those categories (rental_rate), and finally, the sum of all the 'replacement_cost' values for those categories is returned as a table.
-- The results are ordered by the values of the 'replacement_sum' parameter in ascending order.
 
 
 
 
 
----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ The 'HAVING' clause -------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
 
-- The 'HAVING' clause allows you to perform a filter on the aggregate function. 
-- In the previous example where aggregate functions are used alongside the 'GROUP BY' function, no filter can be performed on the columns being aggregated. The filter is only applicable to the column data outside the aggregate function. -- The 'HAVING' clause changes this.
-- An example is shown below:
 
-- Example 1:
SELECT (rating, rental_rate), SUM(replacement_cost) 
FROM film
WHERE rating != 'G'
GROUP BY rating, rental_rate
HAVING SUM(replacement_cost) BETWEEN 1000 AND 1300
ORDER BY SUM(replacement_cost) ASC; -- Here, the results are first grouped based on the rating for all ratings not equal to 'G' (Filter applied here with 'WHERE'), the 'ratings' are further grouped based on values in 'rental_rate', the results from this are then subjected to a filter on the aggregate (with the 'HAVING' clause', where only results with an aggregate between 1000 and 1300 are returned.
-- NOTE that SQL processes lines of code in sequence, hence the position of particular function calls is very important. The 'WHERE' keyword was placed before the 'GROUP BY' call for the initial operation on the 'rating' column. the 'HAVING' clause was placed immediately below the 'GROUP BY' call, because its supposed to perform the operation on the results of the aggregate function.
-- NOTE also, when using the 'HAVING' clause, it should be used alongside the aggregate function call on a column, and not just the column itself.
 
-- Example 2:
SELECT (customer_id, staff_id), SUM(amount) 
FROM payment
WHERE staff_id = 2
GROUP BY customer_id, staff_id
HAVING SUM(amount) > 100 -- This returns the 'customer_id' of customers who have spent above $100 in total payment transactions with the staff member with 'staff_id' of 2.
 
-- Another way to write this, in such a way that only the 'customer_id' column shows (without being intersected with the 'staff_id') could be:
SELECT (customer_id), SUM(amount) 
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100 -- This returns similar results as the example shown prior, above. 
-- Notice that despite the fact that 'staff_id' 2 didn't appear around either the 'SELECT' or 'GROUP BY' keyword, it could still be applied for initializing the filter.
 
 
 
 
 
----------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ The 'AS' clause -----------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
 
-- The 'AS' clause can be used for creating an alias of a column on a table. Its syntax is shown below:
SELECT column1 AS new_column
FROM table1;
-- Another:
SELECT COUNT(amount) AS number_of_transactions
FROM table1; -- Think of it as a way to rename tables -- renaming helps for readability, especially if collaborators would be reviewing your work.
 
-- Example 1:
SELECT customer_id, SUM(amount) AS total_transactions
FROM payment
GROUP BY customer_id; -- With this, a 3rd party reader of the code would be able to tell that when the two columns appear side by side, the aggregated 'amount' column would be represented by 'total_transactions'. 
-- NOTE that, though the 'amount' column has now been renamed to 'total_transactions', if additional operations are to be performed on the values within, with a 'HAVING' statement for instance, the operations still have to be done in consideration of the original name of the columns.
 
 
 
 
 
----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------- JOINS -----------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
 
-- Joins are used to relate information between several tables. It is able to find informaton unique to a group of tables, or even combine several tables into one big table. There are different types of 'JOIN' operators: Inner Joins, Full Outer Joins, Left Outer Join, Right Join, UNION

------ Inner Joins 
-- These are similar to intersections. The tables or table columns in question may be assumed to be a set that holds data, and performing an inner join on these sets, finds the information that exists in both the set parameters being considered here. The general syntax is shown below:
SELECT * FROM TableA
INNER JOIN TableB
ON TableA.col_match = TableB.col_match; -- At the 'ON' keyword, we are essentially saying check for the column 'col_match' in 'TableA', compare its row data values to the column 'col_match' in 'TableB'. The full-stop between the table name and the column name is only to specify where the particular column should be referenced from.
-- An example is shown below:

-- Example 1:
SELECT * FROM city
INNER JOIN country
ON city.country_id = country.country_id; -- Here, both tables, 'city' and 'country' are looked over, the row data in the 'country_id' column of the 'city' table is cross-matched with the row data in the 'country_id' column of the 'country' table. For any match between them, the entire rows are taken and merged in precedence from the joiner table 'city' to the joining table 'country', and all the columns in both are returned.

-- Example 2:
SELECT city, country FROM city
INNER JOIN country
ON city.country_id = country.country_id; -- Similar to example 1, but here, only two columns are returned from the newly merged table. The 'city' colum which was extracted from the 'city' table, and the 'country' column which was extracted from the 'country' table.

-- Switching around which table is the joiner and which is the joining doesn't really matter for an 'Inner Join' since it's a symmetrical intersection operation.

-- Example 3:
SELECT city.city, country, country.last_update FROM city
INNER JOIN country
ON city.country_id = country.country_id; -- This returns three columns. The first two columns are same first two columns from example 2; city.city = city (just a way of specifying which table it should be taking the column from -- useful in situations where tables being joined have some identical column names). The third column is from the country table (i.e country.last_update), and is specifically saying that the column 'last_update' should be taken from the table 'country'.

-- NOTE that PostgreSQL would treat an uninitialized 'JOIN' keyword as an 'INNER JOIN'.
 
 
 
 
 
 
 
 
 
 
 
