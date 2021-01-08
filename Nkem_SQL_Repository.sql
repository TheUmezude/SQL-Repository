
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

-- NOTE that you cannot use the 'SELECT DISTINCT' keyword with the * operator, as you cannot be finding unique information in all the rows of all the columns of the table. 
-- You should only use 'SELECT DISTINCT' with an actual column name from the table in question.





---------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------ The 'SELECT COUNT' keyword -----------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------
 
-- The 'SELECT COUNT' keyword is used to get the total number of rows from a particular column in a table.
-- Note that 'COUNT' is a type of aggregate function.
 
SELECT COUNT (column_name) FROM table_name; -- To query the total number of rows in the specified column of the table.
SELECT COUNT (*) FROM table_name; -- Query total number of rows from the columns of the specified table - Should typically be same like the above sample
 
SELECT COUNT (DISTINCT rental_rate) FROM film; -- To query the total number of distinct value rental_rate information in the specified database table, 'film'.
SELECT COUNT (DISTINCT (rental_rate)) FROM film; -- Same as above, just with extra parenthesis.

-- NOTE: If a database has more than one schema (A public schema and an internal schema (maybe called 'cd' in this case), to query the database with the 'SELECT' keyword, the tables would have the 'cd' schema in front of them.
-- For example:
SELECT * FROM cd.table_name1

SELECT * FROM cd.another_table
 
 
 
 
 
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

-- Example 2:
SELECT facid, SUM(slots) AS total_booked_slots
FROM cd.bookings
GROUP BY facid; -- Returns the column of facilities ID number, 'facid', and the total number (aggregated) of booked slots for the specific facility as 'total_booked_slots' column.

-- NOTE that, though the 'amount' column has now been renamed to 'total_transactions', if additional operations are to be performed on the values within, with a 'HAVING' statement for instance, the operations still have to be done in consideration of the original name of the columns.
 
 
 
 
 
----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------- JOINS -----------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------
 
-- Joins are used to relate information between several tables. It is able to find informaton unique to a group of tables, or even combine several tables into one big table. There are different types of 'JOIN' operators: Inner Joins, Full Outer Joins, Left Outer Join, Right Join, UNION


------ INNER JOINS 
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

-- Example 4:
SELECT customer.first_name, customer.last_name, customer.email, address.district FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'California'; -- Retrieving the names, and email addresses of customers in the database who live in distrit = California. The 'customer' table is intersected with the 'address' table, and a filter is performed to sift out the information for those resident in California.

-- Example 5:
-- Problem: A customer walks in and asks for all movies 'Nick Wahlberg' features in.
-- In your database, you have a table called 'actor' which has columns for the first and last name of eahc actor, along with the actor id. 
-- You have another table called 'film_actor' which has columns for the actor id and the film_id
-- You have a final table called 'film' which has columns for film title, film ID, film description, release year, etc.
-- We will be joinging three tables and extracting the information we need out of them.
SELECT film.title, actor.first_name, actor.last_name FROM film_actor
INNER JOIN actor
ON film_actor.actor_id = actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE actor.first_name = 'Nick' AND actor.last_name = 'Wahlberg'; -- Here, a join statement was performed on another join statement. Basically we have three separate sets and tried to find the intersection on them.

-- Example 6:
SELECT name, starttime 
FROM cd.facilities
INNER JOIN cd.bookings
ON cd.facilities.facid = cd.bookings.facid
WHERE cd.bookings.starttime >= '2012-09-21'
AND cd.bookings.starttime < '2012-09-22'
AND cd.facilities.name ILIKE '%Tennis Court%';
-- This returns the facility name 'name' and facility start times 'starttime' for the 'Tennis Court' facility open on the 21st of September, 2012. 



------ Outer Joins
-- 'Outer joins' are a little more complex than 'Inner joins', they also are of three different forms: 'FULL OUTER JOIN', 'LEFT OUTER JOIN', 'RIGHT OUTER JOIN'. 

------ FULL OUTER JOINS
-- In 'Full Outer Joins', SQL combines all tables indicated in the join statements, and by the matching values in the indicated columns as well, The resulting table must incorporate every item of the individual tables, and can be as large as both tables rows added together (if there aren't any matching information at all).
-- For cases where no information match between the two tables being joined, the area or aspect without the match would bear the 'NULL' data value.
-- For 'FULL OUTER JOINS', the joiner table and the joining table can be interchanged.
-- An example is shown below.

-- Example 1:
SELECT * FROM city
FULL OUTER JOIN country
ON city.country_id = country.country_id; -- Here, the 'city' and 'country' tables are being joined to each other. All the columns of both are being returned here, also, ALL the rows in both tables would be returned whether or not the row data in 'country_id' column match. For cases where the row data in the 'country_id' column do not match, the 'NULL' data value is printed out.
-- Think of it like a union of both tables, where NULL values would be filled up if the specified column row data do not match.

-- The 'FULL OUTER JOIN' can also be tweaked in-order to get the unique items in the tables being joined, such that any intersecting items are completely ignored. In- other words, it basically does the opposite of an intersection (INNER JOINS).
-- Example 2:
SELECT * FROM city
FULL OUTER JOIN country
ON city.country_id = country.country_id
WHERE city.last_update IS null OR country.last_update IS null; -- This returns a table where the unique items for each of the joining tables is shown. In-other words, it only returns the rows of the 'city' table where there is no intersection for 'country_id' with the 'country' table -- all 'NULL' on the 'country' table side for the 'last_update' row data of the column, and only returns the rows of the 'country' table where there is no intersection for 'country_id' with the 'city' table -- all 'NULL' on the 'city' table side for the 'last_update' row data of the column. 

-- NOTE that 'null' may be written as lower-case or upper-case 'NULL'.


------ LEFT OUTER JOINS
-- In 'LEFT OUTER JOINS', two tables are joined, but only the information on the joiner table (table with the FROM statement) is considered. In other words, it joins the two tables for only where there is a value on the joiner table.
-- As a reuslt of the operating procedure for 'LEFT OUTER JOINS', the joiner and joining table positions cannot be interchanged, as this would yield different results.
-- An example is shown below:

-- Example 1:
SELECT * FROM address
LEFT OUTER JOIN country
ON address.address_id = country.country_id; -- This returns a combined table for the places where there is a value on the joiner table, 'address', even if there is a NULL on the joining table.

-- The 'LEFT OUTER JOIN' can also be tweaked to give items that only exist on the joiner table, and exclude the items on the joiner table that have relations on the joining table.
-- An example is shown below:

-- Example 2:
SELECT * FROM address
LEFT OUTER JOIN country
ON address.address_id = country.country_id
WHERE country.country_id IS null; -- This returns a combined table for the places where there is a value on ONLY the joiner table, 'address'. Items on the joiner table that have relation with items on the joining table are not returned.


------ RIGHT OUTER JOINS
-- 'RIGHT OUTER JOINS' are just opposite to the 'LEFT OUTER JOINS'.
-- As a reuslt of the operating procedure for 'LEFT OUTER JOINS', the joiner and joining table positions cannot be interchanged, as this would yield different results.
-- An example is shown below:

-- Example 1:
SELECT * FROM address
RIGHT OUTER JOIN country
ON address.address_id = country.country_id; -- This returns a combined table for the places where there is a value on the joining table, 'country', even if there is a NULL on the joiner table, 'address'.

-- The 'RIGHT OUTER JOIN' can also be tweaked to give items that only exist on the joining table, and exclude the items on the joining table that have relations on the joiner table.
-- An example is shown below:

-- Example 2:
SELECT * FROM address
RIGHT OUTER JOIN country
ON address.address_id = country.country_id
WHERE address.address_id IS null; -- This returns a combined table for the places where there is a value on ONLY the joining table, 'country'. Items on the joining table that have relation with items on the joiner table are not returned.





----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------- UNIONS ----------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------

-- 'UNIONS' are used to unify information from two tables where there is similarity -- basically pasting them on-top each other. 
-- * For 'UNIONS' to work, the two tables being unified should have the same number of columns and same name on the columns.
-- For instance, consider a table1 with names of staff and the amount they were paid for the first month, and another table2 with names of staff and the amount they were paid in the second month. The both tables can be unified under an assumed unique customer name, and then the 'GROUP BY' function call can be used to calculate the total payment made to the aforementioned staff. The 'ORDER BY' function call could also instead be called to order the information.
-- The general syntax for 'UNION' is shown:
SELECT * FROM payment_data_January
UNION
SELECT * FROM payment_data_February;





----------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------- ADVANCED SQL COMMANDS ---------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------

-- There are 4 main time data-types in SQL. These data types are; TIME (Contains only time info), DATE (Contains only date info), TIMESTAMP (Contains date and time info), TIMESTAMPTZ (Contains date, time and timezone info). 
SHOW TIMEZONE -- Shows the timezone the particular database whas created in.
SELECT NOW() -- Shows the current time, date and timezone information.
SELECT TIMEOFDAY() -- Shows the current time, date and timezone information like in the prior, but this time, it shows it in string form for easier reading.
SELECT CURRENT_TIME -- Shows just time and timezone information.
SELECT CURRENT_DATE -- Shows just date information.

EXTRACT() -- Allows you to extract the year, month, day, week or quarter information from a time stamp
-- Example set1:
SELECT EXTRACT(MONTH FROM NOW());
SELECT EXTRACT(WEEK FROM NOW());
SELECT EXTRACT(MINUTE FROM CURRENT_TIME);
-- Example set2:
SELECT EXTRACT(MONTH FROM last_update) 
FROM actor; -- To extract the month information from the 'last_update' column of the 'actor' table

SELECT EXTRACT(YEAR FROM last_update) AS specific_year
FROM actor; -- To extract the year information from the 'last_update' column of the 'actor' table and rename it as 'specific_year'
-- Example set3:
SELECT COUNT(*)
FROM payment
WHERE EXTRACT(dow FROM payment_date) = 1; -- To extract the number of payments that occured on a Monday - 0 for Sunday, 1 for Monday, 2 for Tuesday, 3 for Wednesday etc.


AGE() -- Calculates and returns the current age given a timestamp
-- Example set1:
SELECT AGE(last_update) AS time_since_update
FROM actor; -- This returns the total time passed since the timestamp on the 'last_update' column, i.e, today's date minus the date on the timestamp.

SELECT EXTRACT(YEAR FROM AGE(last_update)) AS year_since_update
FROM actor; -- Combining the 'Extract' function with the 'Age' function to get only the number of years since the last update.


TO_CHAR() -- To convert data types to text. - Can be applied for timestamp formatting or more.
-- Examples:
SELECT TO_CHAR(NOW(), 'dd-mm-yyyy'); -- Converts the present time to the specified format.

SELECT TO_CHAR(125, '999'); -- Converts the integer value to a string form.

SELECT TO_CHAR(payment_date, 'Month-YYYY')
FROM payment; -- Converts the timestamp in 'payment_date' column from 'payment' table to the specified formatting.

SELECT TO_CHAR(payment_date, 'Month of YYYY')
FROM payment; -- Converts the timestamp in 'payment_date' column from 'payment' table to the specified formatting with the 'of' between -- such as: 'November of 2020'.

-- Example application:
SELECT memid, firstname, surname, joindate
FROM cd.members
WHERE (SELECT TO_CHAR(joindate, 'mm')) >= '09' AND (SELECT TO_CHAR(joindate, 'yyyy')) >= '2012';
-- To return the member ID ('memid'), 'firstname', 'surname' and 'joindate' of members of a club who joined after September, 2012. 

-- NOTE that there are more detailed documentations in the PostgreSQL documentation for the highlighted SQL commands.



------ MATHEMATICAL OPERATORS 
-- There are several mathematical operators available with the SQL syntax. Most of these mathematical operators can be found in the documentation page for Postgre SQL.
-- Examples:
SELECT rental_rate/replacement_cost AS Fraction
FROM film; -- Dividing the row data in 'rental_rate' column by those in 'replacement_cost', and saving the result under a new column 'Fraction'.
-- You can directly perform mathematical operations by calling the columns against themselves.
 
SELECT (rental_rate + replacement_cost) * 100
FROM film; -- Adding the row data in 'rental_rate' to that in 'replacement_cost', and saving the result under a new column 'Fraction'.

-- NOTE to always be careful when dealing with fractions. Divide by floating point numbers if you want to get values for the fraction division operations.


------ STRING FUNCTIONS AND OPERATORS
-- There are several string functions and operators available with the SQL syntax. Most of these can be found in the documentation page for Postgre SQL.
-- Examples:
SELECT length(title)
FROM film; -- To get the length of the string data in the rows of the column 'title' -- This could also be done with the UTF-8 encoding if you have non english string characters.

SELECT first_name || ' ' || last_name AS Full_Name
FROM customer; -- To concatenate the string data in the 'first_name' column of the 'customer' table to a white space, and then to the string data in the 'last_name' column. The results are saved under the 'Full_Name' column.

SELECT UPPER(first_name) || ' ' || UPPER(last_name) AS Full_Name
FROM customer; -- Does the same thing as the sample above, just that the names are returned in all capital form.

SELECT LEFT(first_name || last_name, 9) || '@mycompany.com' AS Created_Emails
FROM employees; -- This creates company custom email addresses for employees by concatenating the first name data from the 'first_name' column, the last name data from the 'last_name' column, cutting to ensure the totalt characters are not more than 9 letters in total with the 'LEFT' function, and then concatenating the '@mycompany.com' to the string. The results are saved in a new column titled 'Created_Emails'.





----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------- SUB-QUERY -------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------

-- Sub-Query allows you perform more complex queries. Essentially, a query is performed on the results of another query.
-- The syntax is usually straightforward, and involves two 'SELECT' statements.
-- Examples are shown below:

-- Example 1:
SELECT customer_id, amount AS Above_Average_amount, payment_date 
FROM payment
WHERE amount > (SELECT AVG(amount)
			   FROM payment); 
-- Here we are performing a query within another query. The first query is to return the row data in the columns, 'customer_id', 'amount' as 'Above_Average_amount' and 'payment_date'.
-- Second query is querying the first query using the filter 'WHERE', to sift out and return the earlier requested query for only the rows with 'amount' column row data greater than the average of all the amounts from the 'payment' table, still.
-- NOTE that since the subquery is acting on the main query, the subquery is performed first, and affects the eventual result of the main query.

-- Example 2: - Performing a subquery alongside an 'IN' statement.
-- The 'IN' operator is used in cases when the subquery would return more than a single value. In the first example, the subquery would be returning a single value, whereas, in the second example, the subquery would be returning a pool of values, hence, we have to peer 'IN'.
SELECT student, grade
FROM test_scores
WHERE student IN (SELECT student
				  FROM honor_roll_table);
-- Again, two queries are performed at the same instance.
-- The subquery selects the data in the 'student' column that exists in the 'honor_roll_table', and then moves on to select the data in the 'grade' column for those students. It returns two columns for 'student' and 'grade' for any student who appears in the data for the 'honor_roll_table'.

-- Example 3:
SELECT DISTINCT(film.film_id), film.title
FROM film
INNER JOIN inventory
ON film.film_id = inventory.film_id
WHERE inventory.film_id IN (SELECT inventory.film_id 
							FROM rental
							INNER JOIN inventory
							ON inventory.inventory_id = rental.inventory_id
							WHERE return_date BETWEEN '2005-05-29' AND '2005-05-30');
-- This is a very interesting example of subqueries with advanced SQL commands.
-- Here we have 3 tables, 'film', 'inventory' and 'rental'. The 'film' table and 'inventory' table have row data in a column called 'film_id', the 'rental' table does not have this.
-- The 'inventory' and 'rental' table have data in a column called 'inventory_id'. 
-- So now, we are to write a Query that returns the film titles of all movies that were rturned to the rental store between the dates 2005-05-29 and 2005-05-30. 
-- To do this we write a query inside a query. The subquery joins the 'inventory' table to the 'rental' table for same inventory_id values, and then it filters from the combined table, the 'film_id' for the films returned between the aforementioned dates.
-- The main query then joins the 'film' table to the 'inventory' table at the points where the both tables have matching 'film_id', but filtered such that the only values from the returned 'previously joined tables (inventory and rental) exist.

-- Example 4: Subquery with 'EXISTS()' function
-- The 'EXISTS()' function is generally used to check if any rows are returned with the subquery.
SELECT first_name, last_name
FROM customer
WHERE EXISTS(SELECT *
			FROM payment
			WHERE payment.customer_id = customer.customer_id
			AND payment.amount > 11); 
-- Using the 'EXISTS()' function to return the 'first_name' and 'last_name' columns for the 'customer' table if there is such an existence from the pool generated from where 'payment.customer_id' equals 'customer.customer_id' and 'payment.amount' is above 11.
-- This particular example is interesting because it doesn't need to be written in this way. It may be written differently, without the 'EXISTS()' function as:
SELECT customer.first_name, customer.last_name 
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
WHERE payment.amount > 11;





----------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------- SELF-JOIN -------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------

-- A 'SELF-JOIN' is a query in which a table is joined to itself -- usually for comparing values in a column of rows within the same table.
-- When using a 'SELF-JOIN', it is necessary to use an alias for the table, in-order to avoid ambiguity with table names.
-- The syntax is shown below:

SELECT tableA.col, tableB.col
FROM table1 AS tableA
JOIN table1 AS tableB -- Recall that Postgre treats an uninitialized 'JOIN' as 'INNER JOIN'.
ON tableA.some_col = tableB.other_col

-- This is particularly useful if for instance, there exists a table 'EMPLOYEES' containing three columns, 'employee_name', 'employee_id', 'pairing_id', and the data contained in the 'pairing_id' column corresponds to another employees 'employee_id'.
-- In other words, employees are being paired together. Originally the table would only show the ID of the employee they are being paired to. Hence, if you want the employees to know the names of who they are being paired to, you could use the 'SELF-JOIN' syntax to essentially return two columns with one containing 'employee_name' , and another containing the 'pair_name' for the employee they are paired to -- based on ID.
-- It is shown below:

-- Example 1:
SELECT emp.name, pair.name
FROM employees AS emp
INNER JOIN employees AS pair
ON emp.employee_id = pair.pair_id

-- Example 2:
SELECT film1.title, film2.title
FROM film AS film1
INNER JOIN film AS film2
ON film1.length = film2.length; -- Here, aliases of the 'film' table are created as 'film1' and 'film2'.
-- they are then joined together at the point where the alias 'film1' has a length equal to the alias 'film2'. You can think of it as selecting one data from 'film1', looping through and assigning datat that matches from the 'film2' table for as many as exist under the specified condition. 





----------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------- CREATING DATABASES AND TABLES ----------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------

------ DATA TYPES
-- BOOLEAN: True, False
-- CHARACTER: char, varchar & text
-- NUMERIC: integer, floating-point number
-- TEMPORAL: date, time, timestamp, interval
-- UUID - Universally Unique Identifiers
-- Array - Stores an array of strings, numbers, etc
-- JSON
-- Hstore key-value pair
-- network address
-- geometric data 

-- When creating databases and tables, one should pay careful consideration to the data types to be used for the data to be stored -- SQL documentation has more information. 
-- Always search for best practices online for how to store data. For instance, phone numbers should rather be stored as a 'varchar' and not an integer.


------ PRIMARY KEY [PK]
-- A 'Primary Key' is a column or group of columns used to uniquely identify a row in a table. Examples could be 'customer_id', 'student_id', 'member_id'. These are things that aren't duplicated.


------ FOREIGN KEY
-- A 'Foreign Key' is a field or group of fields in a table that uniquely identifies a row in another table.
-- A 'Foreign Key' is defined in a table that references to the 'Primary Key' of the other table.
-- The table that contains the 'Foreign Key' is called the 'referencing table' or 'child table'.
-- The table being referenced by the 'Foreign Key' is called the 'referenced table' or 'parent table'.

-- NOTE that 'Foreign Keys' are identified as constraints on a particular table. Where the 'Primary Keys' are highlighted with a single golden key symbol, the 'Foreign Keys' have an unhighlighted dual key.  


------ CONSTRAINTS
-- 'Constraints' are the rules enforced on data columns on table.
-- 'Constraints' are used to prevent invalid data from being entered into a database.
-- There are 'Column Constraints' and 'Table Constraints'

-- COMMON CONSTRAINTS are expounded, below -- Note that these constraints, as much as they can be applied on single columns, they can also be applied on entire tables as CONSTRAINT(column_1):
-- NOT NULL: Ensures that a column cannot have a NULL value - Such as ID numbers for students in a school.
-- UNIQUE: Ensures that all values in a column are different - Such as emails for customers in a database.
-- PRIMARY KEY
-- FOREIGN KEY
-- CHECK: Ensures that all values in a column satisfy certain conditions.
-- EXCLUSION: Ensures that if any two rows are compared on the specified column or expression using the specified operator, not all of these comparisons will return TRUE.


------------------------ The 'CREATE' keyword
-- Generally used to create tables, the syntax is shown below:
CREATE TABLE table_name(
	column_name1 TYPE column_constraint1,
	column_name2 TYPE column_constraint2,
	table_constraint, table_constraint
) INHERITS existing_table_name;

-- NOTE that if you have unique data that exists serially (i.e: 1,2,3,...), you would not be required to provide a value.

-- Example 1:
-- Creating a simple sample table in a database for 'brothers house'.
CREATE TABLE brothers_house( -- 'brothers_house' is the table name, here.
	brother_serial SERIAL PRIMARY KEY UNIQUE, -- First column titled 'brother_serial' is a SERIAL type (1,2,3,...), the constraints are PK and UNIQUE
	bro_name VARCHAR(50) NOT NULL, -- second column titled 'bro_name' is a VARCHAR type with allowable 50 characters, the constraint here is NOT NULL
	bro_age SMALLINT NOT NULL, -- Third column titled 'bro_age' is a SMALLINT type, the constraint here is NOT NULL
	bro_nationality VARCHAR(30) NOT NULL, -- Fourth column titled 'bro_nationality' is a VARCHAR type with allowable 30 characters, the constraint here is NOT NULL
	created_on TIMESTAMP NOT NULL -- Fifth column titled 'created_on' is a TIMESTAMP type, the constraint here is NOT NULL
); -- Notice I did not use any table constraints or inheritances, because these are optional.

-- Creating another simple table for school information in the Quebec province.
CREATE TABLE quebec_school(
	school_id SERIAL PRIMARY KEY UNIQUE,
	school_name VARCHAR(60) NOT NULL,
	school_city VARCHAR(30) NOT NULL
);

-- A third table is created, having foreign key references to the two previously created tables.
CREATE TABLE brothers_school(
	brother_serial SMALLINT REFERENCES brothers_house(brother_serial),
	school_id SMALLINT REFERENCES quebec_school(school_id),
	graduation_date TIMESTAMP
);



------------------------ The 'INSERT' keyword
-- The 'INSERT' keyword allows you to insert row data into created/existing tables.
-- The general syntax for this is shown below:
INSERT INTO table(column1, column2, ...)
VALUES
(value1, value2, ...),
(value3, value4, ...),...;

-- You may also insert row data into a table from another table. The syntax for this is shown below:
INSERT INTO table(column1, column2, ...)
SELECT columnA, columnB, ...
FROM another_table
WHERE condition;

-- Example 1:
-- Populating the prior created tables; 'brothers_house', 'quebec_school', 'brothers_school'
-- For 'brothers_house' table
INSERT INTO brothers_house(bro_name, bro_age, bro_nationality, created_on) -- Note that since I indicated that the 'brother_serial' column is of TYPE: SERIAL, it populates automatically (1,2,3,...).
VALUES
('Li Cheng', 28, 'Canada', CURRENT_DATE),
('Dunder Miffy', 21, 'Mexico', CURRENT_DATE),
('Paris Hilton', 67, 'Ireland', CURRENT_DATE);

-- For 'quebec_school' table
INSERT INTO quebec_school(school_name, school_city) -- Note that since I indicated that the 'school_id' column is of TYPE: SERIAL, it populates automatically (1,2,3,...).
VALUES
('Concordia University', 'Montreal'),
('McGill University', 'Montreal'),
('Universite de Montreal', 'Montreal'),
('Universite de Sherbrooke', 'Longueuil')

-- For 'brothers_school' table
INSERT INTO brothers_school(brother_serial, school_id, graduation_date)
VALUES
(1, 2, CURRENT_DATE), -- NOTE that since row data for 'brother_serial' and 'school_id' are referenced from prior two tables, an error would occur if a value that doesnt exist in them is entered.
(2, 4, CURRENT_DATE),
(3, 1, CURRENT_DATE);



------------------------ The 'UPDATE' keyword
-- The 'UPDATE' keyword allows for values in the columsn of a table to be changed.
-- The general syntax is shown below:
UPDATE table
SET column1 = value1,
    column2 = value2,...
WHERE condition;

-- Example 1:
UPDATE account
SET last_login = CURRENT_TIMESTAMP -- updating the data in the 'last_login' column with the current time.
WHERE last_login IS NULL; -- Adding a condition is totally up to you and you may decide if it is relevant or not.

-- Example 2:
UPDATE account
SET last_login = created_on -- updating the data in the 'last_login' column with the data from the 'created_on' column.
RETURNING account_id, last_login; -- This is optional, and allows for the rows that were updated to be returned.

-- Example 3:
UPDATE TableA
SET original_col = TableB.new_column
FROM TableB
WHERE TableA.id = TableB.id;



------------------------ The 'DELETE' keyword
-- The 'DELETE' keyword may be used to remove rows from a table.
-- A sample syntax is shown below:
DELETE FROM table1
WHERE row_id = 1;
 
-- Rows from a table may also be deleted based on relations to another table.
-- The syntax is shown below:
DELETE FROM table1
USING table2
WHERE table1.unique_id = table2.unique_id;
-- You may also add a 'RETURNING' call to see what was removed from the said table.

-- All rows in a particular table may also be deleted by using the syntax below:
DELETE FROM table1;
 
 
 
 
 
 
