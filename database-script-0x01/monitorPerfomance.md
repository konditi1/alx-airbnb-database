
# Monitoring Performance

## Step 1: Use EXPLAIN to Analyze Query Execution Plans

The `EXPLAIN` statement helps you analyze how your database is executing a query and whether it is using indexes to optimize performance.

### How EXPLAIN Works:

- `EXPLAIN` will show you the execution plan of a query.
- It tells you whether indexes are used, and if so, how efficiently the database is using them.

### Example: Using EXPLAIN for Queries on the User Table

Let’s start by testing the performance of queries that should benefit from the unique index on the email column.

#### 1. Test Login Query (Search by Email)

To check if the email index is being used when retrieving a user by their email address:

```sql
EXPLAIN SELECT * FROM User WHERE email = 'user@example.com';
```

**Expected Output:**

| id  | select_type | table | type  | possible_keys  | key             | key_len | ref   | rows | Extra         |
|-----|-------------|-------|-------|----------------|-----------------|---------|-------|------|---------------|
| 1   | SIMPLE      | User  | ref   | idx_user_email | idx_user_email  | 102     | const | 1    | Using where   |

- **key**: `idx_user_email` — Indicates the index on the `email` column is being used.
- **type**: `ref` — The query is using an index to reference rows. `ALL` would mean a full table scan, which is less efficient.
- **rows**: The number of rows the database is scanning. For unique queries, this value should be low (usually 1).

#### 2. Test User Retrieval by ID (Primary Key Query)

Since `user_id` is the primary key, it automatically has a clustered index. Querying by `user_id` should be efficient:

```sql
EXPLAIN SELECT * FROM User WHERE user_id = '123e4567-e89b-12d3-a456-426614174000';
```

**Expected Output:**

| id  | select_type | table | type  | possible_keys | key      | key_len | ref   | rows | Extra        |
|-----|-------------|-------|-------|---------------|----------|---------|-------|------|--------------|
| 1   | SIMPLE      | User  | const | PRIMARY       | PRIMARY  | 16      | const | 1    | Using where  |

- **key**: `PRIMARY` — Indicates the primary key is being used to retrieve the record.
- **type**: `const` — The most efficient type because it means the query is referencing a single constant value.
- **rows**: The value should be 1, since the primary key is unique.

## Step 2: Use EXPLAIN ANALYZE (for Advanced Performance Analysis)

Some databases (like PostgreSQL) offer `EXPLAIN ANALYZE`, which actually runs the query and provides a more detailed analysis of query execution, including actual times taken.

Example:

```sql
EXPLAIN ANALYZE SELECT * FROM User WHERE email = 'user@example.com';
```

This command will return not only the execution plan but also the time taken to execute the query and how many rows were processed. This can be helpful for identifying performance bottlenecks.

## Step 3: Check Query Performance on Large Datasets

If your database has a substantial amount of data, you should also test your indexes on larger datasets to ensure they continue to perform efficiently.

- Simulate a larger dataset by inserting more sample users.
- Run queries again and observe if the indexes still provide a noticeable performance improvement.

For instance:

```sql
-- Insert sample data for testing
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    ('123e4567-e89b-12d3-a456-426614174000', 'John', 'Doe', 'john@example.com', 'hashedpassword', '1234567890', 'guest'),
    -- Insert more rows...
    ;
```

Then, run the same queries (e.g., `SELECT * FROM User WHERE email = 'john@example.com'`) and verify that the execution time remains fast.

## Step 4: Monitor Index Usage with Database Tools

Many modern databases have tools to monitor index usage, which help identify unused indexes or indexes that are not providing benefits.

- **PostgreSQL**: Use `pg_stat_user_indexes` to check index usage:

```sql
SELECT * FROM pg_stat_user_indexes WHERE relname = 'User';
```

- **MySQL**: Use `SHOW INDEXES` to see all indexes on the table:

```sql
SHOW INDEXES FROM User;
```

These tools will give you insights into which indexes are being used most frequently and whether there are any redundant or unused indexes that you can drop to save resources.

## Step 5: Refine Indexing Strategy Based on Findings

- If indexes are being used effectively (e.g., low rows and efficient execution plans), continue as planned.
- If a query isn't using indexes or is still performing poorly, consider:
    - **Rebuilding indexes**: Use `REINDEX` (PostgreSQL) or `OPTIMIZE TABLE` (MySQL) if needed.
    - **Adding missing indexes**: For frequently queried fields that are not yet indexed.
    - **Removing redundant indexes**: If certain indexes aren’t helping performance and are slowing down write operations.