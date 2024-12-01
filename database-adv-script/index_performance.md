# High-Usage Columns Analysis

To optimize your **User**, **Booking**, and **Property** tables, it’s crucial to identify columns frequently used in SQL operations such as `WHERE`, `JOIN`, and `ORDER BY`. These columns are often candidates for indexing to improve query performance.

---

## 1. User Table

| Column      | Usage Scenarios                                                 | Notes                                               |
|-------------|-----------------------------------------------------------------|----------------------------------------------------|
| `user_id` (PK) | Used in `JOIN` clauses with `Booking` and `Review` tables.     | Primary key, indexed automatically.                |
| `email`       | Used in `WHERE` clauses for user lookups during login or validation. | Add a unique index for fast lookups.               |
| `role`        | Used in `WHERE` clauses to filter by user roles (e.g., guest, host, admin). | Use an index for faster filtering.                 |
| `created_at`  | Used in `ORDER BY` clauses to sort users by registration date. | Consider an index if frequently used in sorting.   |

---

## 2. Booking Table

| Column        | Usage Scenarios                                              | Notes                                               |
|---------------|--------------------------------------------------------------|----------------------------------------------------|
| `booking_id` (PK) | Used in unique record identification.                      | Primary key, indexed automatically.                |
| `user_id` (FK)    | Used in `JOIN` clauses with the `User` table and in `WHERE` clauses to retrieve bookings by user. | Add an index to optimize joins and lookups.        |
| `property_id` (FK) | Used in `JOIN` clauses with the `Property` table and in filtering by property. | Add an index to optimize joins and lookups.        |
| `start_date`      | Used in `WHERE` clauses for filtering active bookings within date ranges. | Add an index for efficient range queries.          |
| `end_date`        | Used similarly to `start_date` in range filtering.         | Can be included in a composite index with `start_date`. |
| `status`          | Used in `WHERE` clauses to filter by booking status (e.g., confirmed, cancelled). | Index may improve filtering speed.                 |

---

## 3. Property Table

| Column               | Usage Scenarios                                                      | Notes                                               |
|-----------------------|----------------------------------------------------------------------|----------------------------------------------------|
| `property_id` (PK)    | Used in `JOIN` clauses with `Booking` and `Review` tables.           | Primary key, indexed automatically.                |
| `location_id` (FK)    | Used in `JOIN` clauses with a `Location` table (if normalized) and in filtering by location. | Index may improve join efficiency.                 |
| `price_per_night`     | Used in `WHERE` clauses for filtering properties by price range.     | Consider indexing for range queries.               |
| `availability_status` | Used in `WHERE` clauses to filter properties by availability (e.g., available, unavailable). | Indexing can improve filtering speed.              |
| `name`               | Used in `WHERE` clauses for keyword searches or in sorting (`ORDER BY`). | Full-text indexing might be useful for searches.   |

# Recommendations for Database Optimization

## Summary Table

| **Category**       | **Recommendation**                                                                 |
|---------------------|-------------------------------------------------------------------------------------|
| **Indexes**         | - Add indexes to high-usage columns (e.g., `user_id`, `property_id`, `start_date`, `status`).<br>- Use composite indexes for columns queried together (e.g., `start_date` and `end_date` in the `Booking` table). |
| **Full-Text Search**| - Consider full-text indexing for string-based columns such as `name` and `email` if used in keyword searches. |
| **Partitioning**    | - For large tables, consider partitioning by date (e.g., `created_at` or `start_date`) to improve performance for date-based queries. |
| **Query Analysis**  | - Regularly monitor query patterns to ensure indexes align with actual usage.<br>- Use tools like `EXPLAIN` or query analysis tools to identify bottlenecks. |

## Details

- **Indexes**: Indexing high-usage columns enhances query performance, particularly for `WHERE`, `JOIN`, and `ORDER BY` operations.
- **Composite Indexes**: Combining frequently paired columns into a composite index (e.g., `start_date` and `end_date`) reduces query processing time.
- **Full-Text Search**: Efficiently handle keyword searches on text-heavy columns like `name` and `email` using full-text indexing.
- **Partitioning**: Break large tables into manageable partitions, such as by date, to optimize queries that filter by time range.
- **Query Analysis**: Periodic review of query patterns ensures indexes remain effective. Leverage tools like `EXPLAIN` to diagnose and optimize query plans.

# Analyzing Query Without Indexes

To understand how a query is executed without indexes, you can use the `EXPLAIN` statement to analyze the query execution plan.

### Query Example

```sql
EXPLAIN
SELECT * 
FROM Booking
WHERE user_id = 'U1';
```
### Look at the Execution Plan:
- `Type`: The type of join used (e.g., ALL indicates a full table scan).
- `Possible Keys`: Lists the indexes MySQL could use.
- `Key`: Shows the index MySQL is actually using (if any).
- `Rows`: The number of rows MySQL expects to examine.
### Interpretation:
- If there is no index on user_id, the plan may show ALL as the type, meaning a full table scan is being performed, which can be inefficient for large datasets.
| id | select_type | table   | type | possible_keys | key  | key_len | ref | rows  | Extra       |
|----|-------------|---------|------|----------------|------|---------|-----|-------|-------------|
| 1  | SIMPLE      | Booking | ALL  | NULL           | NULL | NULL    | NULL | 10000 | Using where |

