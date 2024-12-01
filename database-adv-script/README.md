# Understanding INNER JOIN in SQL

## Overview
The `INNER JOIN` clause in SQL is used to retrieve records that have matching values in two or more tables. It combines rows from the joined tables based on a related column, ensuring only rows that satisfy the join condition are included in the result set.

### Key Characteristics of INNER JOIN
- Returns only the rows where there is a match in both tables.
- Discards rows from either table if no matching record is found in the other.

![INNER JOIN Diagram](/database-adv-script/mysql-join-inner-join.png)

**Description**:  
This diagram illustrates the concept of an INNER JOIN using two intersecting circles.  
- The left circle represents **Table A**.  
- The right circle represents **Table B**.  
- The overlapping area represents the **Matching Rows**, which are retrieved in an INNER JOIN.  


---

## Syntax
```sql
SELECT columns
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
```
### Explanation:
- **SELECT columns**: Specifies the columns to retrieve.
- **table1 and table2**: The tables to join.
- **INNER JOIN**: Combines matching rows from both tables.
- **ON**: Defines the condition for matching rows.

---

### Example:

#### Tables:

**Users Table**  
| user_id | first_name | last_name | email              |  
|---------|------------|-----------|--------------------|  
| 1       | John       | Doe       | john@example.com   |  
| 2       | Jane       | Smith     | jane@example.com   |  
| 3       | Alice      | Johnson   | alice@example.com  |  

**Orders Table**  
| order_id | user_id | order_date | amount |  
|----------|---------|------------|--------|  
| 101      | 1       | 2024-01-01 | 50.00  |  
| 102      | 2       | 2024-01-02 | 75.00  |  
| 103      | 4       | 2024-01-03 | 100.00 |  

---

#### Query:

Retrieve all orders with user details:

```sql
    SELECT 
        Orders.order_id,
        Orders.order_date,
        Orders.amount,
        Users.first_name,
        Users.last_name,
        Users.email
    FROM 
        Orders
    INNER JOIN 
        Users 
    ON 
        Orders.user_id = Users.user_id;
```
### query 2
```sql
    SELECT 
        Users.user_id,
        Users.first_name,
        Users.last_name,
        Orders.order_id,
        Orders.order_date,
        Orders.amount
    FROM 
        Users
    INNER JOIN 
        Orders
    ON 
        Users.user_id = Orders.user_id;
```
### Result:

| user_id | first_name | last_name | order_id | order_date | amount |  
|---------|------------|-----------|----------|------------|--------|  
| 1       | John       | Doe       | 101      | 2024-01-01 | 50.00  |  
| 2       | Jane       | Smith     | 102      | 2024-01-02 | 75.00  |  

---

### Explanation:
- Only rows where `Users.user_id` matches `Orders.user_id` are included.

---

### Joining Multiple Tables:

You can join more than two tables by chaining multiple `INNER JOIN` clauses.

#### Query:  
Retrieve orders with user details and product names.

#### Tables:
- **Products**: Contains `product_id` and `product_name`.  
- **Orders**: Contains `order_id`, `user_id`, and `product_id`.

```sql
SELECT 
    Users.first_name,
    Users.last_name,
    Orders.order_id,
    Orders.amount,
    Products.product_name
FROM 
    Orders
INNER JOIN 
    Users
ON 
    Orders.user_id = Users.user_id
INNER JOIN 
    Products
ON 
    Orders.product_id = Products.product_id;
```

### Benefits of INNER JOIN:
- **Ensures Data Consistency**: Retrieves only related records.
- **Efficient Combination**: Combines data from multiple tables effectively.
- **Reduces Redundancy**: Leverages foreign keys to link tables.

---

### Common Use Cases:
1. **Retrieving Related Data**: Combining customer and order information.
2. **Reporting**: Creating comprehensive reports by combining datasets.
3. **Data Validation**: Identifying unmatched records using complementary `LEFT JOIN`.

---

### Tips and Best Practices:
1. **Use Aliases**: Simplify table and column references.

```sql
   SELECT u.first_name, o.amount
   FROM Users u
   INNER JOIN Orders o
   ON u.user_id = o.user_id;
```
### Tips and Best Practices:

1. **Optimize Indexing**:  
   Ensure columns used in the `ON` condition are indexed to improve join performance and reduce query execution time.

2. **Avoid Ambiguity**:  
   Explicitly qualify column names with table aliases to avoid confusion when multiple tables have identical column names.

---

### Advanced Concepts:

1. **Self-JOIN**:  
   Use `INNER JOIN` to join a table with itself, often for hierarchical or comparative data.

2. **Composite JOIN**:  
   Use multiple conditions in the `ON` clause to match rows based on more than one column.

```sql
   ON table1.column1 = table2.column1 
   AND table1.column2 = table2.column2;
```
3. **Subqueries with JOIN**:
Combine `INNER JOIN` with subqueries for complex data retrieval, such as filtering or aggregating data before joining.

# Understanding LEFT JOIN in SQL

## Overview
The `LEFT JOIN` clause in SQL is used to retrieve all records from the left table (table1) and the matching records from the right table (table2). If there is no match, the result will still include the records from the left table, with `NULL` values for the columns from the right table.

### Key Characteristics of LEFT JOIN
- Includes all rows from the left table.
- Includes matching rows from the right table where the condition is met.
- Fills unmatched rows from the right table with `NULL`.
![INNER JOIN Diagram](/database-adv-script/mysql-join-left-join.png)
---

## Syntax
```sql
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;
```
### Explanation:
- **SELECT columns**: Specifies the columns to retrieve.
- **table1 and table2**: The tables to join.
- **LEFT JOIN**: Combines all rows from `table1` with matching rows from `table2`.
- **ON**: Defines the condition for matching rows.

---

### Example:

#### Tables:

**Property Table**  
| property_id | name        | description             | price_per_night | availability_status |  
|-------------|-------------|-------------------------|------------------|----------------------|  
| P1          | Cozy Cabin  | A lovely mountain cabin | 120.00           | available            |  
| P2          | Beach House | Relaxing beachside stay | 200.00           | available            |  

**Review Table**  
| review_id | property_id | rating | comment              | reviewed_by |  
|-----------|-------------|--------|----------------------|-------------|  
| R1        | P1          | 5      | Amazing experience!  | guest       |  
### Query:
Retrieve all properties and their reviews, including properties with no reviews:

```sql
SELECT 
    Property.property_id,
    Property.name AS property_name,
    Property.description AS property_description,
    Property.price_per_night,
    Property.availability_status,
    Review.review_id,
    Review.rating,
    Review.comment,
    Review.reviewed_by
FROM 
    Property
LEFT JOIN 
    Review
ON 
    Property.property_id = Review.property_id;
```
### Result:

| property_id | property_name  | property_description      | price_per_night | availability_status | review_id | rating | comment            | reviewed_by |  
|-------------|----------------|---------------------------|-----------------|---------------------|-----------|--------|--------------------|-------------|  
| P1          | Cozy Cabin     | A lovely mountain cabin   | 120.00          | available           | R1        | 5      | Amazing experience! | guest       |  
| P2          | Beach House    | Relaxing beachside stay   | 200.00          | available           | NULL      | NULL   | NULL               | NULL        |  

---

### Explanation:
- **Property P1**: Has a review, so data from both tables are included.
- **Property P2**: Has no review, so `NULL` values are shown for the `Review` columns.

---

### Benefits of LEFT JOIN:
- **Ensures all rows from the left table are included**, even if unmatched.
- **Ideal for identifying missing relationships** (e.g., properties without reviews).
- **Provides a complete dataset** by combining related and unrelated records.

---

### Common Use Cases:
- **Data Completeness**: Retrieve all customers and their orders, even if some customers have no orders.
- **Error Reporting**: Identify entities with missing associated data.
- **Auditing**: Highlight discrepancies between datasets.
### Tips and Best Practices:

- **Always Specify the Join Condition**:  
```sql
  ON table1.column = table2.column
```
### This ensures only relevant matches are considered.

### Use Aliases for Clarity:
```sql
SELECT p.name, r.comment
FROM Property p
LEFT JOIN Review r
ON p.property_id = r.property_id;
```
### NULL Handling:
### Use COALESCE to replace NULL values with default values.
```sql
    SELECT 
        p.name,
        COALESCE(r.comment, 'No reviews') AS review_comment
    FROM Property p
    LEFT JOIN Review r
    ON p.property_id = r.property_id;
```
### Advanced Concepts:

- **Chaining Joins**:  
  Combine multiple tables using `LEFT JOIN`.  
```sql
  SELECT 
      p.name, 
      r.rating, 
      u.first_name AS reviewer_name
  FROM Property p
  LEFT JOIN Review r ON p.property_id = r.property_id
  LEFT JOIN User u ON r.user_id = u.user_id;
```
- **Filtering Results**:  
  Use `WHERE` to filter the results after the join.  
```sql
  SELECT * 
  FROM Property p
  LEFT JOIN Review r
  ON p.property_id = r.property_id
  WHERE r.rating IS NULL;
```
![LEFT JOIN Diagram WHERE NULL](/database-adv-script/mysql-join-left-join-only-rows-in-the-left-table.png)

- This retrieves properties with no reviews.

## Common Pitfalls

- **Filtering on Right Table**:  
  Adding conditions for the right table in the `WHERE` clause can unintentionally convert a `LEFT JOIN` to an `INNER JOIN`. Use conditions in the `ON` clause instead, or ensure the filtering logic respects `NULL` values.

  **Incorrect**:
```sql
  WHERE Review.rating = 5
```
**Correct**:
```sql

WHERE Review.rating = 5 OR Review.rating IS NULL
```
- Overuse of `LEFT JOIN:` Avoid unnecessary `LEFT JOIN` operations if all data is expected to match. Use `INNER JOIN` for better performance in such cases.




