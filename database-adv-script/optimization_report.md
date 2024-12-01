# Query Performance Optimization
### Overview

- This task involves writing a SQL query that retrieves all bookings along with user details, property details, and payment details. We will analyze the query's performance using EXPLAIN, identify any inefficiencies, and then refactor the query to reduce execution time by optimizing joins and using indexing strategies.

## Task Breakdown
1. Initial Query: Retrieving All Bookings with User, Property, and Payment Details

- The goal of the initial query is to retrieve detailed information about bookings, users, properties, and payments. The query should join the relevant tables and return all relevant details.
SQL Query (Initial Query):
```sql
-- Initial query to retrieve all bookings with user, property, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.price_per_night,
    p.availability_status,
    pm.payment_id,
    pm.status,
    pm.amount AS payment_amount
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id
INNER JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pm ON b.booking_id = pm.booking_id;
```
2. ## Analyze Query Performance Using EXPLAIN

- Once the initial query is written, we will analyze its execution plan using the EXPLAIN keyword. This helps us understand how MySQL plans to execute the query, what indexes are being used (if any), and whether there are any inefficiencies like full table scans.
### SQL Query (EXPLAIN)
```sql
-- EXPLAIN for analyzing the query execution plan
EXPLAIN 
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.price_per_night,
    p.availability_status,
    pm.payment_id,
    pm.status,
    pm.amount AS payment_amount
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id
INNER JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pm ON b.booking_id = pm.booking_id;
```
# Explanation of EXPLAIN Output:

    Type: The type of join used (e.g., ALL indicates a full table scan).
    Possible Keys: Lists the indexes MySQL could potentially use.
    Key: Shows the index MySQL is actually using for the query.
    Rows: The number of rows MySQL expects to examine.
    Extra: Additional information, such as whether MySQL is using a temporary table or filesort.

- By analyzing this output, we can identify areas for improvement, such as missing indexes or inefficient join types.
3. ## Refactor the Query to Improve Performance

Based on the results from the EXPLAIN analysis, we will refactor the query to improve performance. Potential optimizations may include:

    Reducing Unnecessary Joins: If certain data is not required, remove unnecessary joins to reduce the complexity of the query.
    Using Indexes: Add indexes on frequently used columns (such as user_id, property_id, and booking_id) to speed up join operations.
    Filtering Early: Apply any filtering conditions early (e.g., excluding canceled bookings) to reduce the size of intermediate result sets.

Refactored Query:
```sql
-- Refactored query with optimizations for better performance
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.price_per_night,
    p.availability_status,
    pm.payment_id,
    pm.status AS payment_status,
    pm.amount AS payment_amount
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id
INNER JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    (
        SELECT booking_id, payment_id, status, amount
        FROM Payment
        WHERE status IS NOT NULL
    ) pm ON b.booking_id = pm.booking_id    
WHERE 
    b.booking_status != 'canceled';
```
### Refactoring Steps:

    Subquery Optimization: The subquery filters the Payment table to only include payments with a non-null status. This reduces unnecessary rows during the join.
    Early Filtering: The WHERE clause filters out canceled bookings, reducing the number of rows being processed in subsequent steps.

4. ### EXPLAIN Plan for Refactored Query

- After refactoring the query, we will run the EXPLAIN command again to compare the performance improvements. The new execution plan should ideally show fewer rows being examined, the use of indexes, and more efficient join types.
SQL Query with EXPLAIN (Refactored Query):
```sql
-- EXPLAIN for the refactored query
EXPLAIN 
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.price_per_night,
    p.availability_status,
    pm.payment_id,
    pm.status AS payment_status,
    pm.amount AS payment_amount
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id
INNER JOIN  
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    (
        SELECT booking_id, payment_id, status, amount
        FROM Payment
        WHERE status IS NOT NULL  
    ) pm ON b.booking_id = pm.booking_id    
WHERE 
    b.booking_status != 'canceled';
``