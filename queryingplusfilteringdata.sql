# create a new database db_sql_tutorial
DROP DATABASE IF EXISTS db_sql_tutorial;
CREATE DATABASE db_sql_tutorial;
USE db_sql_tutorial;

# create table customers
DROP TABLE IF EXISTS db_sql_tutorial.customers;
CREATE TABLE db_sql_tutorial.customers (
  customer_id INT(10) NOT NULL AUTO_INCREMENT,
  first_name  VARCHAR(50) NOT NULL,
  last_name   VARCHAR(50) NOT NULL,
  country     VARCHAR(50) NULL,
  score       INT(32) NULL,
  PRIMARY KEY (customer_id ));

# Insert customers data
INSERT INTO db_sql_tutorial.customers VALUES (1,'Maria', 'Cramer ', 'Germany',350);
INSERT INTO db_sql_tutorial.customers VALUES (2,'John','Steel','USA', 900);
INSERT INTO db_sql_tutorial.customers VALUES (3,'Georg',' Pipps ', 'UK', 750);
INSERT INTO db_sql_tutorial.customers VALUES (4,'Martin','Müller','Germany', 500);
INSERT INTO db_sql_tutorial.customers VALUES (5,'Peter','Franken','USA', NULL);

# create table orders
DROP TABLE IF EXISTS db_sql_tutorial.orders;
CREATE TABLE db_sql_tutorial.orders (
  order_id    INT(10) NOT NULL AUTO_INCREMENT,
  customer_id INT(10) NOT NULL,
  order_date  DATE  NULL,
  quantity    INT(32) NULL,
  PRIMARY KEY (order_id));

# Insert orders data
INSERT INTO db_sql_tutorial.orders VALUES (1001,1,'2021-01-11',250);
INSERT INTO db_sql_tutorial.orders VALUES (1002,2,'2021-04-05',1150);
INSERT INTO db_sql_tutorial.orders VALUES (1003,3,'2021-06-18',500);
INSERT INTO db_sql_tutorial.orders VALUES (1004,6,'2021-08-31',750);

# create table employees
DROP TABLE IF EXISTS db_sql_tutorial.employees;
CREATE TABLE db_sql_tutorial.employees (
  emp_id      INT(10) NOT NULL AUTO_INCREMENT,
  first_name  VARCHAR(50) NOT NULL,
  last_name   VARCHAR(50) NOT NULL,
  emp_country VARCHAR(50) NULL,
  salary      INT(32) NULL,
  PRIMARY KEY (emp_id ));

# Insert employees data
INSERT INTO db_sql_tutorial.employees VALUES (1,'John', 'Steel', 'USA', 55000);
INSERT INTO db_sql_tutorial.employees VALUES (2,'Ann', 'Labrune', 'France', 75000);
INSERT INTO db_sql_tutorial.employees VALUES (3,'Marie', 'Bertrand', 'Brazil', 75000);
INSERT INTO db_sql_tutorial.employees VALUES (4,'Georg', 'Afonso', 'UK', 75000);
INSERT INTO db_sql_tutorial.employees VALUES (5,'Marie', 'Steel', 'UK', 75000);

# QUERYING DATA
USE db_sql_tutorial
;

SELECT *
FROM customers
;

SELECT *
FROM orders
;

SELECT *
FROM employees
;

SELECT 
	first_name,
    country
FROM customers
;

# SELECT *
# FROM orders
;

SELECT 
	order_id,
    quantity
FROM orders
;

# As default SELECT doesn't remove duplicate in the result
# DISTINCT ; removes duplicate data in the result set

SELECT *
FROM customers
;

SELECT DISTINCT
country
FROM customers
;

# As default SELECT doesn't sort the result in any (particular) order
# Retrieve all customers where the result is sorted by score (smallest first)

SELECT *
FROM customers
ORDER BY
score ASC
;

# Retrieve all customers where the result is sorted by score (highest first)
SELECT *
FROM customers
ORDER BY
score DESC
;

# WHERE
# filters rows based on specific conditions 

# tsk.1
# List ONLY german customers

SELECT *
FROM customers
;
SELECT *
FROM customers
WHERE country = 'Germany'  
;

# tsk.2
# Find all cusomers whose score is higher than 500

SELECT *
FROM customers
WHERE score > 500
;

SELECT *
FROM customers
WHERE score < 500
;

SELECT *
FROM customers
WHERE score <= 500
;

SELECT *
FROM customers
;

# WHERE Operators

# Comparison Operators
# = EQUAL
# != <> NOT EQUAL
# > GREATER THAN
# < LESS THAN
# => GREATER THAN OR EQUAL TO
# <= LESS THAN OR EQUAL TO

# Logical Operators
# AND : Return True if both conditions are true
# OR : Return True if one of conditions is true
# NOT : Reverse the result of any Boolean operator
# IN : Return True if a value is in a set of values
# BETWEEN : Return True if a value falls within a specific range
# LIKE : Return True if a value matches a pattern

# (NOTE: SOUNDS LIKE operator to return results that sound like a given word)
 
# Comparison Operators : compares two values and returns TRUE or FALSE

# tsk.3
# Find all customers whose score is less than 500

SELECT *
FROM customers
WHERE score < 500
;

# tsk.4 
# Find all customers whose score is greater than or equal to 500

SELECT *
FROM customers
WHERE score >= 500
;

# tsk.5
# Find all customers whose score is less than or equal to 500

SELECT *
FROM customers
WHERE score <= 500
;

# tsk.6
# Find all non-German customers

SELECT *
FROM customers
WHERE country != 'Germany'
;

# tsk.7 
# Find all non-British customers

SELECT *
FROM customers
WHERE country != 'UK'
;

# Logical Operators

SELECT *
FROM customers
;

SELECT * 
FROM customers
WHERE score >= 500
AND 
country != 'UK'
;

SELECT *
FROM customers
WHERE score >= 500
OR 
country = 'Germany'
;

# tsk.1
# Find all customers who come from Germany and whose score is less than 400

SELECT *
FROM customers
WHERE country = 'Germany'
AND
score < 400
;

# tsk.2
# Find all customers who come from Germany OR whose score is less than 400

SELECT *
FROM customers
WHERE country = 'Germany'
OR 
score < 400
;

# tsk.3
# Find all customers whose score is NOT less than 400

SELECT *
FROM customers
WHERE NOT score < 400
;

------------

# tsk.4 Find all customers whose score falls in the range between 100 and 500

SELECT *
FROM customers
WHERE score BETWEEN 100 AND 500
;

# viz. best practice is generally to use ">= AND <=" instead of "BETWEEN"

SELECT *
FROM customers
WHERE score >= 100 AND score <= 500
;

# tsk.1 
# Find all customers whose ID is equal to 1, 2 or 5

SELECT *
FROM customers
WHERE customer_id IN (1,2,5)
;

# tsk.2
# Find all customers whose score is equal to either 350 or 500

SELECT *
FROM customers
WHERE score IN (350,500)
;

# tsk. 3/4
# Variations of the above, except with 'OR' instead

SELECT *
FROM customers WHERE score = 500
OR score = 350
;

SELECT *
FROM customers WHERE customer_id = 1
OR customer_id = 2
OR customer_id = 5
;

# (%) = matches anything
# i.e. To find names that begin with 'Z' ; Z%
# To find names that end with 'z' ; %z
# (capitalization sensitive)
# To find names containing the 'x' ; %x%
# To find names containing 'x' at the 4th position ; ___x%

# tsk. 5 
# Find names that begin with 'M'

SELECT *
FROM customers
WHERE first_name 
LIKE 'M%'
;

# tsk. 6
# Find names that end with 'n'

SELECT *
FROM customers
WHERE first_name
LIKE '%n'
;

# tsk. 7 
# Find names containing the 'r'

SELECT *
FROM customers
WHERE first_name 
LIKE '%r%'
;

# +
SELECT *
FROM customers
WHERE last_name
LIKE '%r%' 
;

# tsk. 8
# Find names containing 'r' at the third position

SELECT *
FROM customers
WHERE first_name
LIKE '__r%'
;

#+ 
SELECT *
FROM customers
WHERE last_name
LIKE '__r%'
;