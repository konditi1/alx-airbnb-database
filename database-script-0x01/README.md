# Data Definition Language (DDL)

A robust, efficient, scalable, and optimized **Data Definition Language (DDL)** is essential for designing and maintaining your Airbnb-like database. Follow this structured approach to implement a high-quality DDL:

---

## 1. Steps to Follow

### **Step 1: Define the Requirements**
- Identify what data the table needs to store.
- Map relationships between the table and other entities (e.g., foreign keys).
- Determine constraints like required fields, uniqueness, and data dependencies.

### **Step 2: Design the Schema**
- Select appropriate data types for each attribute.
- Consider precision for numbers, length for text, and timezone support for timestamps.
- Normalize the table to at least **3NF** to eliminate redundancy.

### **Step 3: Apply Constraints**
- Define **primary keys** to uniquely identify each record.
- Add **foreign keys** to enforce relationships between tables.
- Use constraints like `NOT NULL`, `UNIQUE`, and `CHECK` to ensure data validity.

### **Step 4: Add Indexes**
- Identify frequently queried fields and create indexes to optimize searches.
- Add composite indexes for multi-column queries (e.g., `WHERE user_id = ? AND property_id = ?`).
- Use unique indexes where applicable (e.g., coupon codes).

### **Step 5: Handle Scalability**
Plan for future growth:
- Use **UUID** for primary keys to prevent collisions in distributed systems.
- Design flexible schemas (e.g., `ENUM` fields should allow for adding values).

### **Step 6: Implement Soft Deletions**
- Add a `deleted_at` column for soft deletions to preserve historical data.

### **Step 7: Optimize Relationships**
- Define cascading actions for `ON DELETE` and `ON UPDATE` to maintain referential integrity.
- Use join tables for many-to-many relationships.

### **Step 8: Test and Validate**
- Populate the table with sample data to validate constraints.
- Test queries to ensure indexes improve performance.
- Simulate larger datasets to check for scalability.

---

## 2. Conditions/Factors to Consider

### **Data Integrity**
- Use constraints to prevent invalid or duplicate data (e.g., unique coupon codes).
- Use foreign keys to maintain relationships between entities.

### **Performance**
- Optimize read and write operations with appropriate indexing.
- Avoid over-indexing, as it can slow down write-heavy operations.

### **Scalability**
Plan for future expansions:
- Use scalable data types (e.g., `VARCHAR` instead of fixed `CHAR` for text).
- Avoid hardcoding business logic in `ENUM` fields; consider lookup tables instead.

### **Security**
- Use hashing for sensitive fields (e.g., passwords).
- Ensure fields like emails are unique to avoid conflicts.

### **Auditability**
- Include timestamp fields (`created_at`, `updated_at`) to track changes.
- Use `deleted_at` for soft deletion to maintain data history.

### **Business Rules**
- Implement rules directly in the schema where possible:
  - Example: `CHECK` constraints for valid ranges (e.g., ratings between 1 and 5).

---

## 3. Checklist to Authenticate Success

| **Task**                | **Status** |
|--------------------------|------------|
| **Data Integrity**       | ✅ Ensure all constraints (`PK`, `FK`, `NOT NULL`, `UNIQUE`) are correctly defined. |
| **Normalization**        | ✅ Verify that the table adheres to at least **3NF**. |
| **Appropriate Data Types** | ✅ Select data types that balance efficiency and accuracy. |
| **Indexing**             | ✅ Add indexes for frequently queried columns, and avoid over-indexing. |
| **Referential Integrity** | ✅ Ensure foreign keys maintain relationships with cascading actions as needed. |
| **Soft Deletion**         | ✅ Include a `deleted_at` column for logical deletions. |
| **Scalability**           | ✅ Use scalable key types (e.g., `UUID`) and allow room for growth. |
| **Performance Testing**   | ✅ Test queries to validate indexes improve performance. |
| **Business Rule Enforcement** | ✅ Use constraints like `CHECK` and `DEFAULT` to enforce rules. |
| **Security**              | ✅ Protect sensitive fields (e.g., hashed passwords). |
| **Auditability**          | ✅ Include `created_at` and `updated_at` timestamps for tracking. |

---

By following these steps and considerations, your DDL will ensure a high-performing and scalable database optimized for your application's needs.

---


# Indexing

**Indexing** is a powerful tool for optimizing database performance. Properly designed indexes can drastically improve query efficiency but must be used judiciously to avoid potential downsides like slowing down write operations. Below is a systematic approach to mastering indexing.

---

## 1. Steps to Follow

### **Step 1: Analyze Query Patterns**
- Identify the most frequent queries in your application.
- Pay attention to the columns used in:
  - `WHERE` clauses.
  - `JOIN` conditions.
  - `ORDER BY` and `GROUP BY` clauses.
  - `SELECT DISTINCT`.

### **Step 2: Choose Index Types**
Select the appropriate type of index based on the use case:
- **Single-Column Index**: For queries on a single column.
- **Composite Index**: For queries involving multiple columns.
- **Unique Index**: To enforce uniqueness and optimize lookups.
- **Full-Text Index**: For text-heavy columns requiring search functionality.

### **Step 3: Avoid Over-Indexing**
- Avoid creating indexes on every column—indexes consume storage and can slow down insert, update, and delete operations.

### **Step 4: Test Index Impact**
- Use tools like `EXPLAIN` or `EXPLAIN ANALYZE` to measure query performance before and after adding indexes.
- Test how indexes affect read-heavy and write-heavy workloads.

### **Step 5: Monitor Index Usage**
- Regularly monitor your database to identify unused or poorly performing indexes.
- Remove redundant indexes that do not contribute to performance.

### **Step 6: Maintain Index Health**
- Periodically rebuild indexes to optimize storage and performance.
- For databases like PostgreSQL, analyze and vacuum indexes as part of regular maintenance.

### **Step 7: Consider Scalability**
- Ensure your indexing strategy scales with data growth.
- Design indexes for partitioned tables if your database uses sharding or horizontal scaling.

---

## 2. Conditions/Factors to Consider

### **Query Characteristics**
- Identify columns most frequently used in queries.
- Check for queries with sorting, grouping, or filtering that could benefit from indexing.

### **Index Selectivity**
- **Selectivity** measures how many distinct values a column has relative to the total rows.
  - High selectivity (e.g., user IDs) benefits greatly from indexing.
  - Low selectivity (e.g., boolean fields) might not benefit much.

### **Data Distribution**
- Skewed distributions (e.g., many `NULL`s or duplicates) can affect index efficiency.
- Avoid indexing highly repetitive data, as it reduces the index's effectiveness.

### **Read vs. Write Balance**
- For **read-heavy workloads**, prioritize indexing to optimize `SELECT` queries.
- For **write-heavy workloads**, minimize indexing to avoid performance degradation during inserts and updates.

### **Index Type Suitability**
- **B-Tree Index**: Best for equality and range queries (e.g., `=`, `<`, `>`, `BETWEEN`).
- **Hash Index**: Best for exact match queries (e.g., `=`).
- **Full-Text Index**: Best for text search and retrieval.
- **Clustered Index**: Reorders the table's physical data to match the index for faster access.

### **Multi-Column Indexes**
- Ensure the order of columns in composite indexes matches query patterns.
  - Example: An index on `(user_id, property_id)` optimizes:
    ```sql
    SELECT * FROM Booking WHERE user_id = ? AND property_id = ?;
    ```
  - But does not optimize:
    ```sql
    SELECT * FROM Booking WHERE property_id = ?;
    ```

### **Index Storage and Maintenance**
- Indexes consume storage space; ensure your database can accommodate them.
- Understand the overhead of maintaining indexes during data modifications.

---

## 3. Checklist to Authenticate Indexing Success

| **Task**                    | **Status**                                                                     |
|-----------------------------|--------------------------------------------------------------------------------|
| **Query Analysis**          | ✅ Identify frequent queries and key columns for indexing.                     |
| **Index Type Selection**    | ✅ Choose the appropriate index type (single, composite, unique, full-text).   |
| **High Selectivity Columns** | ✅ Ensure indexed columns have high selectivity for better efficiency.         |
| **Avoid Low-Value Indexes** | ✅ Avoid indexing columns with low cardinality (e.g., boolean fields).         |
| **Test Index Performance**  | ✅ Use `EXPLAIN` or `EXPLAIN ANALYZE` to verify performance improvements.       |
| **Impact on Write Operations** | ✅ Evaluate the impact of indexes on insert, update, and delete operations.   |
| **Index Health Maintenance** | ✅ Periodically rebuild and analyze indexes for optimal performance.            |
| **Scalability**             | ✅ Ensure the indexing strategy supports future data growth.                   |
| **Composite Indexes Optimization** | ✅ Verify the column order in multi-column indexes matches query patterns. |
| **Redundant Index Cleanup** | ✅ Identify and drop redundant or unused indexes.                              |
| **Space Considerations**    | ✅ Ensure the database can handle the storage space required for indexes.      |

---

# User Table DDL

## Step 1: Define the User Table

The following DDL creates the `User` table with robust constraints and optimized design for scalability and data integrity:

```sql
CREATE TABLE User (
    user_id UUID PRIMARY KEY, -- Unique identifier for the user
    first_name VARCHAR(50) NOT NULL, -- User's first name
    last_name VARCHAR(50) NOT NULL, -- User's last name
    email VARCHAR(100) NOT NULL UNIQUE, -- User's email, must be unique
    password_hash VARCHAR(255) NOT NULL, -- Securely hashed password
    phone_number VARCHAR(15) NOT NULL, -- User's contact number
    profile_picture VARCHAR(255), -- Optional profile picture URL
    role ENUM('guest', 'host', 'admin') NOT NULL DEFAULT 'guest', -- User role, defaults to 'guest'
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Automatically set on creation
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Auto-updated on modification
    deleted_at DATE DEFAULT NULL -- For soft deletion
);
```
## Explanation of the DDL

### **Primary Key**
- `user_id` is the primary key, using a UUID for globally unique identifiers.

### **Data Integrity**
- `NOT NULL` constraints ensure critical fields cannot be left empty:
  - `first_name`
  - `last_name`
  - `email`
  - `password_hash`
  - `phone_number`
- The `email` field has a **UNIQUE constraint** to prevent duplicate registrations.

### **Default Values**
- The `role` field defaults to `'guest'` for new users.
- **Timestamps**:
  - `created_at` is automatically set to the current timestamp upon creation.
  - `updated_at` is auto-updated whenever the record is modified.

### **Soft Deletion**
- The `deleted_at` column allows for soft deletions, marking a user as deleted without physically removing their record, thereby preserving historical data.

---

## Benefits of the Design

### **Global Uniqueness**
- Using `UUID` as the primary key ensures no conflicts in distributed systems.

### **Data Validation**
- Critical fields are enforced with `NOT NULL` and `UNIQUE` constraints.

### **Scalability**
- The design supports future growth with flexible fields (e.g., `VARCHAR` for text).

### **Security**
- Passwords are stored as securely hashed values in the `password_hash` field.

### **Auditability**
- Timestamps (`created_at`, `updated_at`, `deleted_at`) provide a complete history of record changes and deletions.
---

# Step 2: Analyzing Query Patterns for User Table
In this step, we'll categorize the typical queries that are made against the **User** table based on frequency and importance. By analyzing these query patterns, we can prioritize indexing efforts to improve performance for the most critical operations.

---

## Common Queries for User Table

### High-Frequency Queries:
1. **Login/Search by Email:**
   - **Description:** Used frequently during the authentication process when users log in or search for an account based on their email address.
   - **Example Query:**
     ```sql
     SELECT * FROM User WHERE email = 'user@example.com';
     ```
   - **Recommended Indexing:** An index on the `email` column will significantly speed up this query.
   
2. **Fetch User by ID:**
   - **Description:** This query is used to retrieve user details, for example, when displaying profile pages or managing user sessions.
   - **Example Query:**
     ```sql
     SELECT * FROM User WHERE user_id = '123e4567-e89b-12d3-a456-426614174000';
     ```
   - **Recommended Indexing:** The `user_id` column should be indexed as it's the primary key and used frequently for direct lookups.

---

### Medium-Frequency Queries:
1. **Retrieve Users by Role:**
   - **Description:** Used for admin views or analytics, where users are grouped by their role (e.g., host, guest, admin).
   - **Example Query:**
     ```sql
     SELECT * FROM User WHERE role = 'host';
     ```
   - **Recommended Indexing:** An index on the `role` column can help speed up this query, especially if the `role` field has a limited set of distinct values (e.g., 'host', 'admin', 'guest').

---

### Low-Frequency Queries:
1. **Retrieve Recently Registered Users:**
   - **Description:** Often used in admin dashboards or reporting to fetch users who signed up within a specific date range.
   - **Example Query:**
     ```sql
     SELECT * FROM User WHERE created_at > '2024-01-01';
     ```
   - **Recommended Indexing:** An index on the `created_at` column will optimize queries filtering by registration date, especially if the dataset grows large.

2. **Fetch Soft-Deleted Users:**
   - **Description:** Used for auditing, recovery, or administrative tasks when fetching users that have been soft-deleted (i.e., flagged but not fully removed).
   - **Example Query:**
     ```sql
     SELECT * FROM User WHERE deleted_at IS NOT NULL;
     ```
   - **Recommended Indexing:** Indexing the `deleted_at` column helps optimize this query, especially if soft-deletion is used frequently in the application.

---

## Prioritizing Queries for Indexing

| **Query**                              | **Frequency** | **Columns to Index** |
|----------------------------------------|---------------|----------------------|
| Login/Search by Email                  | High          | `email`              |
| Fetch User by ID                       | High          | `user_id` (Primary Key) |
| Retrieve Users by Role                 | Medium        | `role`               |
| Retrieve Recently Registered Users     | Low           | `created_at`         |
| Fetch Soft-Deleted Users               | Low           | `deleted_at`         |

---

## Indexing Strategy:

- **High-Priority Indexes:**
  - **`email`**: Essential for login and search functionalities. An index here improves the speed of authentication and account lookups.
  - **`user_id` (Primary Key)**: Ensures fast access to user records by their unique ID, especially for profile views or session management.

- **Medium-Priority Indexes:**
  - **`role`**: While less frequently queried, indexing the `role` column helps efficiently filter users based on their roles for admin purposes or analytics.

- **Low-Priority Indexes:**
  - **`created_at`**: Indexing this column helps with reporting or fetching recently registered users, but it's not as frequently used as the other queries.
  - **`deleted_at`**: Optimizes queries for soft-deleted user records, which may not be as common but are useful for auditing and recovery.

---
# Refined Indexing Summary

| **Index Name**             | **Column(s)**     | **Type**           | **Priority** | **Action**                                                                 |
|----------------------------|-------------------|--------------------|--------------|---------------------------------------------------------------------------|
| **PRIMARY KEY**             | `user_id`         | Clustered Index    | High         | Automatically created.                                                   |
| **idx_user_email**          | `email`           | Unique Index       | High         | Implement immediately. <br> `CREATE UNIQUE INDEX IF NOT EXISTS idx_user_email ON User(email);` |
| **idx_user_role**           | `role`            | Single-Column Index| Medium       | Optional—add later if needed.                                             |
| **idx_user_created_at**     | `created_at`      | Single-Column Index| Low          | Optional—add later if needed.                                             |
| **idx_user_deleted_at**     | `deleted_at`      | Single-Column Index| Low          | Optional—add later if needed.                                             |

---

## Indexing Actions:

1. **PRIMARY KEY (`user_id`)**:
   - **Type**: Clustered Index
   - **Priority**: High
   - **Action**: Automatically created by the database as the primary key for fast lookups of users by their unique ID.

2. **idx_user_email**:
   - **Type**: Unique Index
   - **Priority**: High
   - **Action**: Implement immediately to optimize login and search by email functionality.
   - **SQL Command**:
     ```sql
     CREATE UNIQUE INDEX IF NOT EXISTS idx_user_email ON User(email);
     ```

3. **idx_user_role**:
   - **Type**: Single-Column Index
   - **Priority**: Medium
   - **Action**: Optional—add this index if queries involving user roles (e.g., fetching users by role) become more frequent or important over time.

4. **idx_user_created_at**:
   - **Type**: Single-Column Index
   - **Priority**: Low
   - **Action**: Optional—add this index later if there’s a need to query users by registration date frequently (e.g., for admin dashboards or reports).

5. **idx_user_deleted_at**:
   - **Type**: Single-Column Index
   - **Priority**: Low
   - **Action**: Optional—add this index if fetching soft-deleted users becomes more common for audits or recovery tasks.

---

# UserToken Table DDL

Here’s the DDL to create the UserToken table, following the schema you’ve provided:
```sql
  CREATE TABLE IF NOT EXISTS
UserToken (
    token_id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES User(user_id) ON DELETE CASCADE,
    token VARCHAR(255) NOT NULL,
    token_expire_at TIMESTAMP NOT NULL,
    token_type ENUM("email_verification", "password_reset") NOT NULL,
    is_used BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);
```

### Explanation of the Fields and Constraints:

- **token_id (PK):**
  - UUID: Ensures that each token has a unique identifier.
  - Primary Key: Guarantees that each token has a unique entry in the table.

- **user_id (FK):**
  - UUID: Foreign key linking the token to the corresponding user. It’s a foreign key that connects to the `user_id` in the User table.
  - On Delete Cascade: Ensures that if a user is deleted, all associated tokens are also deleted (important for cleanup).

- **token:**
  - VARCHAR(255): The value of the token, typically a secure random string.
  - NOT NULL: Ensures every token has a value.

- **token_expire_at:**
  - TIMESTAMP: The expiration time of the token.
  - NOT NULL: It’s important to have an expiration time for security reasons (e.g., tokens should expire after a certain period).

- **token_type:**
  - ENUM: The type of token (e.g., email verification, password reset).
  - NOT NULL: This field is essential to define the token's use case, and it's required for every token.

- **is_used:**
  - BOOLEAN: Indicates whether the token has been used or not. It helps track if the token has been activated.
  - DEFAULT FALSE: Defaults to FALSE since the token is unused initially.

- **created_at and updated_at:**
  - TIMESTAMP: Automatically managed by the database.
  - DEFAULT CURRENT_TIMESTAMP: Ensures the token creation time is automatically set.
  - ON UPDATE CURRENT_TIMESTAMP: Automatically updates the `updated_at` field when a record is modified.

- **deleted_at:**
  - DATE: Allows soft deletion of tokens. If a token is no longer needed or has expired, you can mark it as deleted without physically removing it.
  - DEFAULT NULL: Default value is NULL, which means the token is not deleted unless explicitly marked.
---

# Query Analysis and Categorization for the UserToken Table

## Step 2: Analyze Query Patterns (Including Step 3: Categorize Queries)

### High-Priority Queries

These are critical for the core functionality of the system.

#### 1. Validate Token for Password Reset or Email Verification

**Query:**
```sql
SELECT * FROM UserToken 
WHERE token = 'secure_random_string' AND token_expire_at > NOW() AND is_used = FALSE;
```
**Purpose:**
- Validate that a token is valid (not expired and not used).
- Critical for secure operations like password reset and email verification.

---

### Fetch Tokens by User

**Query:**
```sql
SELECT * FROM UserToken 
WHERE user_id = '123e4567-e89b-12d3-a456-426614174000';
```
**Purpose:**
- Retrieve all tokens associated with a specific user.
- Useful for administrative purposes or debugging.

---

## Medium-Priority Queries

These queries are less frequent but still important.

---

### Check Expired Tokens

**Query:**
```sql
SELECT * FROM UserToken 
WHERE token_expire_at <= NOW();
```
**Purpose:**
- Identify expired tokens for cleanup or logging.
- Helps maintain database performance by removing stale records.

---

### List All Tokens of a Specific Type

**Query:**
```sql
SELECT * FROM UserToken 
WHERE token_type = 'password_reset';
```
**Purpose:**
- Retrieve all tokens of a specific type (e.g., all password reset tokens).
- Useful for reporting or analytics.

---

## Low-Priority Queries

These queries are rare and used mainly for administrative purposes.

### Fetch Soft-Deleted Tokens

**Query:**
```sql
SELECT * FROM UserToken 
WHERE deleted_at IS NOT NULL;
```
**Purpose:**
- Retrieve tokens marked as deleted for auditing or recovery.
- Rarely used but necessary for compliance in some cases.

---

### Find Recently Created Tokens

**Query:**
```sql
SELECT * FROM UserToken 
WHERE created_at > '2024-01-01';
```
**Purpose:**
- Track tokens created in a specific time frame (e.g., for analytics or monitoring).

---

## Query Categorization Summary

| **Priority**    | **Query**                          | **Columns to Index**            |
|-----------------|------------------------------------|---------------------------------|
| **High Priority**| Validate token for reset/verification | token, token_expire_at, is_used |
|                 | Fetch tokens by user               | user_id                         |
| **Medium Priority** | Check expired tokens              | token_expire_at                 |
|                 | List tokens by type                | token_type                      |
| **Low Priority** | Fetch soft-deleted tokens          | deleted_at                      |
|                 | Find recently created tokens       | created_at                      |
---

## Indexing for UserToken Table

```sql
-- composite index for token validation
CREATE INDEX IF NOT EXISTS idx_token_validation ON UserToken (token, token_expire_at, is_used);

-- index for fetching tokens by user
CREATE INDEX IF NOT EXISTS idx_user_tokens ON UserToken (user_id);
```
## Review Table Schema

The `Review` table stores customer feedback on properties within the Airbnb-like system. Each review is tied to a **property** and a **user**, and includes a **rating**, **comment**, and **timestamps** for creation and updates.

### Key Constraints:

1. **Primary Key (`review_id`)**:
   - A unique identifier for each review, ensuring that each record in the `Review` table is distinct.

2. **Foreign Keys (`property_id`, `user_id`)**:
   - `property_id` links to the `Property` table, ensuring that each review is associated with a valid property.
   - `user_id` links to the `User` table, ensuring that reviews are linked to valid users.
   - Both foreign keys are defined with `ON DELETE CASCADE`, meaning if a property or user is deleted, all related reviews are automatically deleted.

3. **Check on Rating**:
   - The `rating` column is restricted to integer values between **1 and 5** using the `CHECK` constraint, ensuring that only valid ratings are accepted.

4. **Timestamps**:
   - `created_at` is automatically set to the current timestamp when a review is created, ensuring we always know when the review was submitted.
   - `updated_at` automatically updates with the current timestamp whenever a review is modified, helping track changes over time.
   - `deleted_at` allows for **soft deletion** of reviews without actually removing the record from the database. If a review is deleted, this column will store the timestamp of deletion.

---
# Reviews table

```sql
CREATE TABLE IF NOT EXISTS Review (
    review_id UUID PRIMARY KEY, -- Unique identifier for the review.
    property_id UUID NOT NULL REFERENCES Property(property_id) ON DELETE CASCADE, -- Links to the Property table, cascading on delete.
    user_id UUID NOT NULL REFERENCES User(user_id) ON DELETE CASCADE, -- Links to the User table, cascading on delete.
    review_type ENUM('guest', 'host') NOT NULL, -- Specifies the review type (guest or host).
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5), -- Ensures that the rating is an integer between 1 and 5.
    comment TEXT, -- Stores the text of the review.
    reviewed_by ENUM('host', 'guest')
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Timestamp when the review was created.
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Timestamp when the review was last updated, automatically set on update.
    deleted_at TIMESTAMP DEFAULT NULL -- Timestamp for soft deletion of the review, set to NULL by default.
);

```

This table is essential for managing user feedback, supporting features like review display, moderation, and analysis in the Airbnb-like platform.

### Example Query:

To fetch all reviews for a specific property:

```sql
SELECT * FROM Review WHERE property_id = 'property_uuid';
```
# Review Table Breakdown and Constraints

| Attribute     | Type         | Constraint                                               | Reason for Constraint                                                                                                                                         |
|---------------|--------------|----------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| review_id     | UUID         | PRIMARY KEY                                              | Ensures that each review has a unique identifier. This is necessary for data integrity and efficient query access.                                           |
| property_id   | UUID         | NOT NULL, REFERENCES Property(property_id) ON DELETE CASCADE | Establishes a foreign key relationship to the Property table. The `ON DELETE CASCADE` ensures that if a property is deleted, all associated reviews are also deleted. |
| user_id       | UUID         | NOT NULL, REFERENCES User(user_id)     | Establishes a foreign key relationship to the User table. |
| review_type   | ENUM         | NOT NULL, CHECK (review_type IN ('guest', 'host'))        | Specifies the type of review, either 'guest' or 'host'. Helps distinguish between guest and host reviews for the property.                                  |
| rating        | INT          | NOT NULL, CHECK (rating BETWEEN 1 AND 5)                   | Ensures data integrity by restricting ratings to values between 1 and 5. This avoids invalid ratings in the system.                                           |
| comment       | TEXT         | NULLABLE                                                  | Allows the user to leave a comment, but it's optional, so it can be left as NULL if no comment is provided.                                                  |
| reviewed_by   | UUID         | NOT NULL, REFERENCES User(user_id)                        | Establishes a foreign key relationship to the User table to identify who reviewed the property. Ensures the reviewer is a valid user.                          |
| created_at    | TIMESTAMP    | NOT NULL, DEFAULT CURRENT_TIMESTAMP                        | Automatically captures the time when the review was created. Helps with tracking when reviews are submitted.                                                  |
| updated_at    | TIMESTAMP    | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Automatically tracks updates. It captures when the review is modified and ensures the timestamp is refreshed on update.                                       |
| deleted_at    | TIMESTAMP    | DEFAULT NULL                                              | Allows soft deletion of reviews by setting a timestamp when a review is deleted, but not removing the record from the database.                               |


---

# Property table

```sql
CREATE TABLE IF NOT EXISTS Property (
    property_id UUID PRIMARY KEY, -- Unique identifier for the property
    host_id UUID NOT NULL REFERENCES User(user_id) ON DELETE CASCADE, -- Links to the User table
    name VARCHAR(255) NOT NULL, -- Property name with a length constraint
    description TEXT, -- Detailed property description
    price_per_night DECIMAL(10, 2) NOT NULL, -- Price per night with precision
    availability_status ENUM('available', 'unavailable') NOT NULL, -- Property availability status
    location_id UUID NOT NULL REFERENCES Location(location_id), -- Links to the Location table
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Auto-set timestamp of creation
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Auto-update timestamp of the last modification
    deleted_at TIMESTAMP DEFAULT NULL -- Soft deletion timestamp
);
```

# Property Table Breakdown and Constraints

| Attribute           | Type             | Constraint                                                      | Reason for Constraint                                                                                          |
|---------------------|------------------|-----------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| **property_id**     | UUID             | PRIMARY KEY                                                     | Ensures that each property has a unique identifier.                                                          |
| **host_id**         | UUID             | NOT NULL, REFERENCES User(user_id) ON DELETE CASCADE            | Establishes a foreign key relationship to the User table, linking the property to a valid host. Ensures referential integrity. |
| **location_id**     | UUID             | NOT NULL, REFERENCES Location(location_id)                      | Establishes a foreign key relationship to the Location table, ensuring location data is normalized and reusable. |
| **name**            | VARCHAR(255)     | NOT NULL                                                       | Requires a name for every property. Helps users identify the property.                                       |
| **description**     | TEXT             | NULLABLE                                                       | Stores optional descriptive information about the property.                                                  |
| **price_per_night** | DECIMAL(10, 2)   | NOT NULL                                                       | Stores monetary values with precision for consistent pricing data.                                           |
| **availability_status** | ENUM         | NOT NULL                                                       | Restricts values to "available" or "unavailable," ensuring valid availability states for properties.         |
| **created_at**      | TIMESTAMP        | NOT NULL, DEFAULT CURRENT_TIMESTAMP                            | Automatically tracks the creation timestamp of the property.                                                 |
| **updated_at**      | TIMESTAMP        | NOT NULL, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP | Tracks the last modification timestamp. Ensures accurate update tracking.                                    |
| **deleted_at**      | TIMESTAMP        | DEFAULT NULL                                                   | Allows soft deletion by marking the record with a timestamp when logically deleted.                          |

# Property Table Indexing

| **Priority**          | **Index Name**       | **Column(s)**          | **Type**           | **Purpose**                                                      | **Query Example**                                                                                   | **DDL Statement**                                                    |
|------------------------|----------------------|-------------------------|--------------------|------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| **High-Priority**      | `idx_host_id`        | `host_id`              | Single-Column      | Optimizes queries filtering properties by host.                 | `SELECT * FROM Property WHERE host_id = 'host_uuid';`                                               | `CREATE INDEX IF NOT EXISTS idx_host_id ON Property (host_id);`       |
|                        | `idx_location_id`    | `location_id`          | Single-Column      | Speeds up queries retrieving properties by location.            | `SELECT * FROM Property WHERE location_id = 'location_uuid';`                                       | `CREATE INDEX IF NOT EXISTS idx_location_id ON Property (location_id);` |
|                        | `idx_availability`   | `availability_status`  | Single-Column      | Ensures fast access to properties based on availability.        | `SELECT * FROM Property WHERE availability_status = 'available';`                                   | `CREATE INDEX IF NOT EXISTS idx_availability ON Property (availability_status);` |
|                        | `idx_price`          | `price_per_night`      | Single-Column      | Improves range queries for properties within specific prices.   | `SELECT * FROM Property WHERE price_per_night BETWEEN 50.00 AND 150.00;`                            | `CREATE INDEX IF NOT EXISTS idx_price ON Property (price_per_night);` |

| **Medium-Priority**    | `idx_created_at`     | `created_at`           | Single-Column      | Optimizes queries filtering properties by creation date.        | `SELECT * FROM Property WHERE created_at > '2024-01-01';`                                           | `CREATE INDEX IF NOT EXISTS idx_created_at ON Property (created_at);` |
|                        | `idx_name`           | `name`                 | Full-Text Index    | Supports partial searches on property names.                   | `SELECT * FROM Property WHERE name LIKE '%beach%';`                                                 | `CREATE FULLTEXT INDEX IF NOT EXISTS idx_name ON Property (name);`    |

| **Low-Priority**       | `idx_deleted_at`     | `deleted_at`           | Single-Column      | Enables retrieval of soft-deleted properties for auditing.      | `SELECT * FROM Property WHERE deleted_at IS NOT NULL;`                                              | `CREATE INDEX IF NOT EXISTS idx_deleted_at ON Property (deleted_at);` |
|                        | `idx_updated_at`     | `updated_at`           | Single-Column      | Optimizes queries fetching recently updated properties.         | `SELECT * FROM Property WHERE updated_at > '2024-02-01';`                                           | `CREATE INDEX IF NOT EXISTS idx_updated_at ON Property (updated_at);` |

---

# location table
```sql
CREATE TABLE IF NOT EXISTS Location (
    location_id UUID PRIMARY KEY,
    latitude DECIMAL(10, 7) NOT NULL,
    longitude DECIMAL(10, 7) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100), 
    country VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);
```
# Query Patterns and Indexing

## Query Patterns

| **Purpose**                                   | **Query Example**                                                                                         |
|-----------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| Fetch properties in a specific city           | `SELECT * FROM Location WHERE city = 'San Francisco';`                                                   |
| Fetch locations by latitude/longitude range   | `SELECT * FROM Location WHERE latitude BETWEEN 37.7 AND 37.8 AND longitude BETWEEN -122.5 AND -122.4;`    |

## Indexing Strategy

| **Priority**       | **Index Name**    | **Column(s)**          | **Type**           | **Purpose**                                              | **Query Example**                                                                                 | **DDL Statement**                                                         |
|---------------------|-------------------|-------------------------|--------------------|----------------------------------------------------------|---------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| **High-Priority**   | `idx_city_country`| `city, country`        | Composite Index    | Optimizes queries filtering locations by city and country.| `SELECT * FROM Location WHERE city = 'San Francisco' AND country = 'USA';`                       | `CREATE INDEX IF NOT EXISTS idx_city_country ON Location (city, country);`  |
|                     | `idx_lat_long`    | `latitude, longitude`  | Composite Index    | Improves geospatial queries filtering by coordinates.     | `SELECT * FROM Location WHERE latitude BETWEEN 37.7 AND 37.8 AND longitude BETWEEN -122.5 AND -122.4;` | `CREATE INDEX IF NOT EXISTS idx_lat_long ON Location (latitude, longitude);` |
---

# table for booking
```sql
CREATE TABLE IF NOT EXISTS Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL REFERENCES Property(property_id) ON DELETE CASCADE,
    user_id UUID NOT NULL REFERENCES User(user_id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL, 
    total_price DECIMAL(10, 2) NOT NULL, 
    booking_status ENUM('pending', 'confirmed', 'cancelled') NOT NULL DEFAULT 'pending',
    payment_status ENUM('in_progress', 'paid', 'failed') NOT NULL DEFAULT 'in_progress',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);
```
# Indexing Strategy

| **Priority**        | **Index Name**       | **Column(s)**          | **Type**           | **Purpose**                                                | **Query Example**                                                                                     | **DDL Statement**                                                      |
|----------------------|----------------------|-------------------------|--------------------|------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| **High-Priority**    | `idx_property_id`    | `property_id`          | Single-Column      | Optimizes queries fetching bookings by property.           | `SELECT * FROM Booking WHERE property_id = 'property_uuid';`                                          | `CREATE INDEX IF NOT EXISTS idx_property_id ON Booking (property_id);` |
|                      | `idx_user_id`        | `user_id`              | Single-Column      | Speeds up queries retrieving bookings by user.             | `SELECT * FROM Booking WHERE user_id = 'user_uuid';`                                                  | `CREATE INDEX IF NOT EXISTS idx_user_id ON Booking (user_id);`         |
|                      | `idx_booking_status` | `booking_status`       | Single-Column      | Ensures fast access to bookings based on their status.     | `SELECT * FROM Booking WHERE booking_status = 'confirmed';`                                           | `CREATE INDEX IF NOT EXISTS idx_booking_status ON Booking (booking_status);` |

# Medium-Priority Indexes

| **Index Name**         | **Column(s)**          | **Type**           | **Purpose**                                           | **Query Example**                                                                                     | **DDL Statement**                                                             |
|-------------------------|------------------------|---------------------|-------------------------------------------------------|--------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| `idx_start_end_date`    | `start_date, end_date` | Composite Index     | Optimizes queries filtering bookings within a date range. | `SELECT * FROM Booking WHERE start_date >= '2024-01-01' AND end_date <= '2024-12-31';`                | `CREATE INDEX IF NOT EXISTS idx_start_end_date ON Booking (start_date, end_date);` |
| `idx_payment_status`    | `payment_status`       | Single-Column       | Speeds up queries filtering by payment status.        | `SELECT * FROM Booking WHERE payment_status = 'paid';`                                                | `CREATE INDEX IF NOT EXISTS idx_payment_status ON Booking (payment_status);`       |

# Low-Priority Indexes

| **Index Name**      | **Column(s)**  | **Type**       | **Purpose**                                          | **Query Example**                                                                                     | **DDL Statement**                                                      |
|----------------------|----------------|----------------|------------------------------------------------------|--------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| `idx_deleted_at`     | `deleted_at`   | Single-Column  | Enables retrieval of soft-deleted bookings for auditing. | `SELECT * FROM Booking WHERE deleted_at IS NOT NULL;`                                                 | `CREATE INDEX IF NOT EXISTS idx_deleted_at ON Booking (deleted_at);`   |
| `idx_updated_at`     | `updated_at`   | Single-Column  | Optimizes queries fetching recently updated bookings.   | `SELECT * FROM Booking WHERE updated_at > '2024-02-01';`                                              | `CREATE INDEX IF NOT EXISTS idx_updated_at ON Booking (updated_at);`   |
---

# bookingCancelation table
```sql
CREATE TABLE IF NOT EXISTS BookingCancellation (
    cancellation_id UUID PRIMARY KEY, 
    booking_id UUID NOT NULL REFERENCES Booking(booking_id) ON DELETE CASCADE,
    cancelled_by ENUM('guest', 'host') NOT NULL, 
    cancel_reason TEXT,
    cancel_fee DECIMAL(10, 2) DEFAULT 0.00,
    cancel_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);
```
# Indexing Strategy for BookingCancellation

| **Priority**       | **Index Name**      | **Column(s)**   | **Type**       | **Purpose**                                         | **Query Example**                                                                         | **DDL Statement**                                                        |
|---------------------|---------------------|-----------------|----------------|-----------------------------------------------------|------------------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| **High-Priority**   | `idx_booking_id`    | `booking_id`    | Single-Column  | Optimizes queries fetching cancellations by booking. | `SELECT * FROM BookingCancellation WHERE booking_id = 'booking_uuid';`                   | `CREATE INDEX IF NOT EXISTS idx_booking_id ON BookingCancellation (booking_id);`       |
|                     | `idx_cancelled_by`  | `cancelled_by`  | Single-Column  | Speeds up queries filtering cancellations by user role. | `SELECT * FROM BookingCancellation WHERE cancelled_by = 'guest';`                        | `CREATE INDEX IF NOT EXISTS idx_cancelled_by ON BookingCancellation (cancelled_by);`   |

# Indexing Strategy for BookingCancellation

## Medium-Priority Indexes

| **Index Name**      | **Column(s)**  | **Type**       | **Purpose**                                         | **Query Example**                                                                          | **DDL Statement**                                                      |
|----------------------|----------------|----------------|-----------------------------------------------------|-------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| `idx_cancel_fee`     | `cancel_fee`   | Single-Column  | Optimizes queries filtering cancellations by fee amount. | `SELECT * FROM BookingCancellation WHERE cancel_fee > 50.00;`                              | `CREATE INDEX IF NOT EXISTS idx_cancel_fee ON BookingCancellation (cancel_fee);`      |
| `idx_cancel_at`      | `cancel_at`    | Single-Column  | Improves filtering cancellations by date range.    | `SELECT * FROM BookingCancellation WHERE cancel_at BETWEEN '2024-01-01' AND '2024-12-31';` | `CREATE INDEX IF NOT EXISTS idx_cancel_at ON BookingCancellation (cancel_at);`        |

## Low-Priority Indexes

| **Index Name**      | **Column(s)**  | **Type**       | **Purpose**                                         | **Query Example**                                                                          | **DDL Statement**                                                      |
|----------------------|----------------|----------------|-----------------------------------------------------|-------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| `idx_deleted_at`     | `deleted_at`   | Single-Column  | Enables retrieval of soft-deleted cancellations for auditing. | `SELECT * FROM BookingCancellation WHERE deleted_at IS NOT NULL;`                          | `CREATE INDEX IF NOT EXISTS idx_deleted_at ON BookingCancellation (deleted_at);`      |
---

# payment table
```sql
CREATE TABLE IF NOT EXISTS Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL REFERENCES Booking(booking_id) ON DELETE CASCADE,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount > 0),
    pay_method_id UUID NOT NULL REFERENCES PaymentMethod(pay_method_id),
    transaction_id VARCHAR(100) UNIQUE NOT NULL,
    status ENUM('pending', 'completed', 'failed') DEFAULT 'pending', 
    payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);
```
# Indexing Strategy for Payment

## High-Priority Indexes

| **Index Name**   | **Column(s)**  | **Type**       | **Purpose**                                      | **Query Example**                                           | **DDL Statement**                                             |
|-------------------|----------------|----------------|--------------------------------------------------|-------------------------------------------------------------|---------------------------------------------------------------|
| `idx_booking_id`  | `booking_id`   | Single-Column  | Optimizes queries fetching payments by booking. | `SELECT * FROM Payment WHERE booking_id = 'booking_uuid';`  | `CREATE INDEX IF NOT EXISTS idx_booking_id ON Payment (booking_id);` |
| `idx_status`      | `status`       | Single-Column  | Speeds up queries filtering payments by status. | `SELECT * FROM Payment WHERE status = 'completed';`         | `CREATE INDEX IF NOT EXISTS idx_status ON Payment (status);`         |

## Medium-Priority Indexes

| **Index Name**       | **Column(s)**     | **Type**       | **Purpose**                                     | **Query Example**                                                              | **DDL Statement**                                                       |
|-----------------------|-------------------|----------------|-------------------------------------------------|--------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| `idx_pay_method_id`   | `pay_method_id`  | Single-Column  | Optimizes queries filtering payments by payment method. | `SELECT * FROM Payment WHERE pay_method_id = 'method_uuid';`                   | `CREATE INDEX IF NOT EXISTS idx_pay_method_id ON Payment (pay_method_id);` |
| `idx_payment_date`    | `payment_date`   | Single-Column  | Improves filtering payments by date range.     | `SELECT * FROM Payment WHERE payment_date BETWEEN '2024-01-01' AND '2024-12-31';` | `CREATE INDEX IF NOT EXISTS idx_payment_date ON Payment (payment_date);`   |

## Low-Priority Indexes

| **Index Name**    | **Column(s)**  | **Type**       | **Purpose**                                     | **Query Example**                                             | **DDL Statement**                                                |
|--------------------|----------------|----------------|-------------------------------------------------|----------------------------------------------------------------|------------------------------------------------------------------|
| `idx_deleted_at`   | `deleted_at`   | Single-Column  | Enables retrieval of soft-deleted payments for auditing. | `SELECT * FROM Payment WHERE deleted_at IS NOT NULL;`          | `CREATE INDEX IF NOT EXISTS idx_deleted_at ON Payment (deleted_at);` |

# payment method table
```sql
CREATE TABLE IF NOT EXISTS PaymentMethod (
    pay_method_id UUID PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    transaction_fee DECIMAL(5, 2) NULL DEFAULT 0.00,
    currency_conversion DECIMAL(5, 2) NOT NULL DEFAULT 1.00, 
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);
```
# Query Patterns and Indexing for PaymentMethod

## High-Priority Queries

| **Index Name**  | **Column(s)**  | **Type**       | **Purpose**                                     | **Query Example**                                         | **DDL Statement**                                                |
|------------------|----------------|----------------|-------------------------------------------------|-----------------------------------------------------------|------------------------------------------------------------------|
| `idx_name`       | `name`         | Single-Column  | Speeds up queries for specific payment methods. | `SELECT * FROM PaymentMethod WHERE name = 'paypal';`       | `CREATE INDEX IF NOT EXISTS idx_name ON PaymentMethod (name);`   |

## Medium-Priority Queries

| **Index Name**          | **Column(s)**      | **Type**       | **Purpose**                                   | **Query Example**                                          | **DDL Statement**                                                       |
|--------------------------|--------------------|----------------|-----------------------------------------------|------------------------------------------------------------|---------------------------------------------------------------------------|
| `idx_transaction_fee`    | `transaction_fee` | Single-Column  | Optimizes queries filtering methods by transaction fees. | `SELECT * FROM PaymentMethod WHERE transaction_fee < 2;`   | `CREATE INDEX IF NOT EXISTS idx_transaction_fee ON PaymentMethod (transaction_fee);` |

## Low-Priority Queries

| **Index Name**   | **Column(s)**  | **Type**       | **Purpose**                                   | **Query Example**                                          | **DDL Statement**                                                |
|-------------------|----------------|----------------|-----------------------------------------------|------------------------------------------------------------|------------------------------------------------------------------|
| `idx_deleted_at`  | `deleted_at`   | Single-Column  | Enables retrieval of soft-deleted methods for auditing. | `SELECT * FROM PaymentMethod WHERE deleted_at IS NOT NULL;` | `CREATE INDEX IF NOT EXISTS idx_deleted_at ON PaymentMethod (deleted_at);` |
---

# message table
```sql
CREATE TABLE IF NOT EXISTS Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL REFERENCES User(user_id) ON DELETE CASCADE,
    recipient_id UUID NOT NULL REFERENCES User(user_id) ON DELETE CASCADE,
    message_body TEXT NOT NULL, 
    sent_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    read_at TIMESTAMP DEFAULT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);
```
# Query Patterns and Indexing for Message

## High-Priority Queries

| **Index Name**   | **Column(s)**   | **Type**       | **Purpose**                                 | **Query Example**                                      | **DDL Statement**                                              |
|-------------------|-----------------|----------------|---------------------------------------------|--------------------------------------------------------|----------------------------------------------------------------|
| `idx_sender`      | `sender_id`     | Single-Column  | Optimizes fetching messages sent by a user. | `SELECT * FROM Message WHERE sender_id = 'user_uuid';` | `CREATE INDEX IF NOT EXISTS idx_sender ON Message (sender_id);` |
| `idx_recipient`   | `recipient_id`  | Single-Column  | Optimizes fetching messages received by a user. | `SELECT * FROM Message WHERE recipient_id = 'user_uuid';` | `CREATE INDEX IF NOT EXISTS idx_recipient ON Message (recipient_id);` |

## Medium-Priority Queries

| **Index Name**  | **Column(s)**  | **Type**       | **Purpose**                                  | **Query Example**                                  | **DDL Statement**                                              |
|------------------|----------------|----------------|----------------------------------------------|----------------------------------------------------|----------------------------------------------------------------|
| `idx_sent_at`    | `sent_at`      | Single-Column  | Optimizes retrieval of messages by time.     | `SELECT * FROM Message WHERE sent_at > '2024-01-01';` | `CREATE INDEX IF NOT EXISTS idx_sent_at ON Message (sent_at);` |

## Low-Priority Queries

| **Index Name**   | **Column(s)**  | **Type**       | **Purpose**                                   | **Query Example**                                          | **DDL Statement**                                              |
|-------------------|----------------|----------------|-----------------------------------------------|------------------------------------------------------------|----------------------------------------------------------------|
| `idx_deleted_at`  | `deleted_at`   | Single-Column  | Enables retrieval of soft-deleted messages.  | `SELECT * FROM Message WHERE deleted_at IS NOT NULL;`      | `CREATE INDEX IF NOT EXISTS idx_deleted_at ON Message (deleted_at);` |
---

# notification table
```sql
CREATE TABLE IF NOT EXISTS Notification (
    notification_id UUID PRIMARY KEY,
    user_id UUID NOT NULL REFERENCES User(user_id) ON DELETE CASCADE,
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    event_type ENUM('booking_confirmation', 'payment_update', 'general_alert') NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expiration_time TIMESTAMP DEFAULT NULL,
    deleted_at TIMESTAMP DEFAULT NULL
);
```
# Query Patterns and Indexing for Notification Table

## High-Priority Queries

| **Index Name**   | **Column(s)**   | **Type**       | **Purpose**                                     | **Query Example**                                      | **DDL Statement**                                              |
|-------------------|-----------------|----------------|-------------------------------------------------|--------------------------------------------------------|----------------------------------------------------------------|
| `idx_user_id`     | `user_id`       | Single-Column  | Optimizes queries filtering notifications by user. | `SELECT * FROM Notification WHERE user_id = 'user_uuid';` | `CREATE INDEX IF NOT EXISTS idx_user_id ON Notification (user_id);` |
| `idx_is_read`     | `is_read`       | Single-Column  | Speeds up queries filtering unread notifications. | `SELECT * FROM Notification WHERE is_read = FALSE;`      | `CREATE INDEX IF NOT EXISTS idx_is_read ON Notification (is_read);` |

## Medium-Priority Queries

| **Index Name**        | **Column(s)**       | **Type**       | **Purpose**                                     | **Query Example**                                          | **DDL Statement**                                              |
|------------------------|---------------------|----------------|-------------------------------------------------|------------------------------------------------------------|----------------------------------------------------------------|
| `idx_event_type`       | `event_type`       | Single-Column  | Optimizes queries filtering by event type.     | `SELECT * FROM Notification WHERE event_type = 'booking_confirmation';` | `CREATE INDEX IF NOT EXISTS idx_event_type ON Notification (event_type);` |
| `idx_expiration_time`  | `expiration_time`  | Single-Column  | Supports queries filtering by expiration time. | `SELECT * FROM Notification WHERE expiration_time < NOW();` | `CREATE INDEX IF NOT EXISTS idx_expiration_time ON Notification (expiration_time);` |
---
# Coupon Table Schema

- The Coupon table stores details about promotional discounts provided within the Airbnb-like system. It allows linking coupons to either users or properties, and defines a unique code, discount type, and validity period for each coupon.

```sql
CREATE TABLE IF NOT EXISTS Coupon (
    coupon_id UUID PRIMARY KEY,
    user_id UUID REFERENCES User(user_id) ON DELETE CASCADE,
    property_id UUID REFERENCES Property(property_id) ON DELETE CASCADE,
    code TEXT NOT NULL UNIQUE,
    description TEXT,
    discount_type ENUM('percentage', 'fixed_amount') NOT NULL,
    discount_amount DECIMAL(10, 2) NOT NULL,
    max_no_uses INT NOT NULL,
    valid_from TIMESTAMP NOT NULL,
    valid_to TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);
```
# Key Constraints for Coupon Table

- **Primary Key (`coupon_id`)**:
  - Uniquely identifies each coupon in the system, ensuring no duplicate entries.

- **Foreign Keys (`user_id`, `property_id`)**:
  - Links the coupon to a specific User or Property, indicating whether the coupon is user-specific or property-specific.
  - Both `user_id` and `property_id` use `ON DELETE CASCADE`, ensuring that when a user or property is deleted, the associated coupons are also removed.

- **Coupon Code Uniqueness**:
  - The `code` column is unique, preventing duplication of coupon codes in the system.
  - Ensures that each coupon code is only used once.

- **Discount Type and Amount**:
  - `discount_type` restricts the discount type to either **percentage** or **fixed amount**.
  - `discount_amount` defines the value of the discount, ensuring the discount applied is valid.

- **Validity**:
  - `valid_from` and `valid_to` ensure that the coupon is only valid within the specified time frame.

- **Timestamps**:
  - `created_at` and `updated_at` track when the coupon was created and last updated, which is useful for auditing and managing the coupon lifecycle.

- **Soft Deletion**:
  - `deleted_at` enables soft deletion of coupons, allowing a coupon to be marked as deleted without removing the record entirely from the database.
# Indexing Strategy for Coupon Table

### High-Priority Indexes
| **Index Name**     | **Column(s)**         | **Type**         | **Purpose**                                    | **Query Example**                                                                                   | **DDL Statement**                                                                                 |
|---------------------|-----------------------|------------------|------------------------------------------------|-----------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| `idx_user_id`       | `user_id`            | Single-Column    | Optimizes queries filtering coupons by user.   | `SELECT * FROM Coupon WHERE user_id = 'user_uuid';`                                                | `CREATE INDEX IF NOT EXISTS idx_user_id ON Coupon (user_id);`                                    |
| `idx_property_id`   | `property_id`        | Single-Column    | Optimizes queries filtering coupons by property. | `SELECT * FROM Coupon WHERE property_id = 'property_uuid';`                                        | `CREATE INDEX IF NOT EXISTS idx_property_id ON Coupon (property_id);`                            |
| `idx_validity`      | `valid_from, valid_to` | Composite Index  | Speeds up queries fetching valid coupons.      | `SELECT * FROM Coupon WHERE valid_from <= NOW() AND valid_to >= NOW();`                            | `CREATE INDEX IF NOT EXISTS idx_validity ON Coupon (valid_from, valid_to);`                      |

### Medium-Priority Indexes
| **Index Name**      | **Column(s)**        | **Type**         | **Purpose**                                    | **Query Example**                                                                                   | **DDL Statement**                                                                                 |
|---------------------|----------------------|------------------|------------------------------------------------|-----------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| `idx_discount_type` | `discount_type`     | Single-Column    | Optimizes queries filtering coupons by discount type. | `SELECT * FROM Coupon WHERE discount_type = 'percentage';`                                         | `CREATE INDEX IF NOT EXISTS idx_discount_type ON Coupon (discount_type);`                        |

### Low-Priority Indexes
| **Index Name**      | **Column(s)**        | **Type**         | **Purpose**                                    | **Query Example**                                                                                   | **DDL Statement**                                                                                 |
|---------------------|----------------------|------------------|------------------------------------------------|-----------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|
| `idx_deleted_at`    | `deleted_at`        | Single-Column    | Enables efficient retrieval of soft-deleted coupons. | `SELECT * FROM Coupon WHERE deleted_at IS NOT NULL;`                                               | `CREATE INDEX IF NOT EXISTS idx_deleted_at ON Coupon (deleted_at);`                              |
---

# CouponUsage Table Schema

The `CouponUsage` table tracks when and by which user a coupon was used, and optionally, which property or booking the coupon was applied to.

## Attributes

- **`coupon_usage_id` (PK, UUID):**
  - Unique identifier for each usage of the coupon.

- **`coupon_id` (FK, UUID):**
  - Links to the `Coupon` table, ensuring each entry corresponds to a valid coupon.

- **`user_id` (FK, UUID):**
  - Links to the `User` table to identify which user used the coupon.

- **`property_id` (FK, UUID):**
  - Links to the `Property` table (optional).
  - Relevant if the coupon is property-specific. Can be `NULL` if not applicable.

- **`booking_id` (FK, UUID):**
  - Links to the `Booking` table.
  - Populated if the coupon is used in the context of a booking.

- **`used_at` (TIME):**
  - Timestamp of when the coupon was used.
- **`UNIQUE` (coupon_id, user_id)**
  - To Ensures a user can only use a coupon once

  ```sql
    CREATE TABLE IF NOT EXISTS CouponUsage (
      coupon_usage_id UUID PRIMARY KEY,
      coupon_id UUID NOT NULL REFERENCES Coupon(coupon_id) ON DELETE CASCADE,
      user_id UUID NOT NULL REFERENCES User(user_id) ON DELETE CASCADE,
      property_id UUID REFERENCES Property(property_id) ON DELETE SET NULL,
      booking_id UUID REFERENCES Booking(booking_id) ON DELETE CASCADE,
      used_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
      UNIQUE (coupon_id, user_id)  -- Ensures a user can only use a coupon once
  );
  ```
  # Key Constraints for `CouponUsage` Table

- **Primary Key (`coupon_usage_id`):**
  - Ensures each coupon usage record is unique and identifiable.

- **Foreign Keys:**
  - `coupon_id` references the `Coupon` table, ensuring the coupon is valid.
  - `user_id` references the `User` table, ensuring the coupon is used by a valid user.
  - `property_id` and `booking_id` are optional:
    - If applicable, these foreign keys ensure the coupon is applied to a valid property or booking.
  - **ON DELETE CASCADE:** 
    - Ensures that if the referenced record is deleted (e.g., a coupon or booking), the coupon usage record is automatically deleted to maintain referential integrity.

- **Unique Constraint (`coupon_id`, `user_id`):**
  - Prevents a user from using the same coupon more than once, ensuring fair use.
# Indexing Strategy for `CouponUsage` Table

## High-Priority Indexes

| **Index Name**       | **Column(s)**               | **Type**         | **Purpose**                                                      | **Query Example**                                                                                  | **DDL Statement**                                                                                          |
|-----------------------|----------------------------|------------------|------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| `idx_coupon_user`     | `coupon_id, user_id`       | Composite Index  | Optimizes queries checking if a user has used a coupon.         | `SELECT * FROM CouponUsage WHERE coupon_id = 'coupon_uuid' AND user_id = 'user_uuid';`             | `CREATE INDEX IF NOT EXISTS idx_coupon_user ON CouponUsage (coupon_id, user_id);`                         |
| `idx_coupon_booking`  | `coupon_id, booking_id`    | Composite Index  | Optimizes queries retrieving coupon usage for specific bookings. | `SELECT * FROM CouponUsage WHERE coupon_id = 'coupon_uuid' AND booking_id = 'booking_uuid';`       | `CREATE INDEX IF NOT EXISTS idx_coupon_booking ON CouponUsage (coupon_id, booking_id);`                   |
| `idx_coupon_property` | `coupon_id, property_id`   | Composite Index  | Optimizes queries retrieving coupon usage for specific properties. | `SELECT * FROM CouponUsage WHERE coupon_id = 'coupon_uuid' AND property_id = 'property_uuid';`     | `CREATE INDEX IF NOT EXISTS idx_coupon_property ON CouponUsage (coupon_id, property_id);`                 |

## Medium-Priority Indexes

| **Index Name**        | **Column(s)**  | **Type**       | **Purpose**                                           | **Query Example**                                                                 | **DDL Statement**                                                                            |
|------------------------|----------------|----------------|-------------------------------------------------------|-----------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| `idx_coupon_used_at`   | `used_at`      | Single-Column  | Optimizes queries filtering coupon usage by the date it was used. | `SELECT * FROM CouponUsage WHERE used_at > '2024-01-01';`                          | `CREATE INDEX IF NOT EXISTS idx_coupon_used_at ON CouponUsage (used_at);`                   |

## Low-Priority Indexes

| **Index Name**         | **Column(s)**  | **Type**       | **Purpose**                                           | **Query Example**                                                                 | **DDL Statement**                                                                            |
|-------------------------|----------------|----------------|-------------------------------------------------------|-----------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| `idx_coupon_deleted_at`| `deleted_at`   | Single-Column  | Enables retrieval of soft-deleted coupon usages for auditing purposes. | `SELECT * FROM CouponUsage WHERE deleted_at IS NOT NULL;`                        | `CREATE INDEX IF NOT EXISTS idx_coupon_deleted_at ON CouponUsage (deleted_at);`             |
---

# image table
```sql
CREATE TABLE IF NOT EXISTS PropertyImages (
    image_id UUID PRIMARY KEY,
    property_id UUID NOT NULL REFERENCES Property(property_id) ON DELETE CASCADE,
    image_url TEXT NOT NULL,
    alt_text TEXT,
    image_type ENUM('main', 'gallery', 'thumbnail') NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);
```
# Indexing Strategy for `PropertyImages` Table

## High-Priority Indexes

| **Index Name**    | **Column(s)**   | **Type**        | **Purpose**                                                             | **Query Example**                                                            | **DDL Statement**                                                                            |
|--------------------|-----------------|-----------------|-------------------------------------------------------------------------|------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| `idx_property_id`  | `property_id`   | Single-Column   | Optimizes queries retrieving all images for a specific property.        | `SELECT * FROM PropertyImages WHERE property_id = 'property_uuid';`         | `CREATE INDEX IF NOT EXISTS idx_property_id ON PropertyImages (property_id);`              |
| `idx_image_type`   | `image_type`    | Single-Column   | Speeds up queries fetching images by type (main, gallery, thumbnail).   | `SELECT * FROM PropertyImages WHERE image_type = 'main';`                   | `CREATE INDEX IF NOT EXISTS idx_image_type ON PropertyImages (image_type);`                |

## Medium-Priority Indexes

| **Index Name**     | **Column(s)**   | **Type**        | **Purpose**                                                             | **Query Example**                                                            | **DDL Statement**                                                                            |
|---------------------|-----------------|-----------------|-------------------------------------------------------------------------|------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| `idx_created_at`    | `created_at`    | Single-Column   | Optimizes queries fetching recently added images.                       | `SELECT * FROM PropertyImages WHERE created_at > '2024-01-01';`             | `CREATE INDEX IF NOT EXISTS idx_created_at ON PropertyImages (created_at);`                 |

## Low-Priority Indexes

| **Index Name**      | **Column(s)**   | **Type**        | **Purpose**                                                             | **Query Example**                                                            | **DDL Statement**                                                                            |
|----------------------|-----------------|-----------------|-------------------------------------------------------------------------|------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| `idx_deleted_at`     | `deleted_at`    | Single-Column   | Enables retrieval of soft-deleted images for auditing.                  | `SELECT * FROM PropertyImages WHERE deleted_at IS NOT NULL;`                | `CREATE INDEX IF NOT EXISTS idx_deleted_at ON PropertyImages (deleted_at);`                |

## Explanation for Indexing Choices

1. **`idx_property_id` (High-Priority)**:  
   - **Purpose**: Frequently used in queries to fetch all images for a specific property.  
   - **Impact**: Greatly improves performance when retrieving images associated with a given property.

2. **`idx_image_type` (High-Priority)**:  
   - **Purpose**: Supports queries that filter images by type (e.g., main, gallery, thumbnail).  
   - **Impact**: Speeds up fetching categorized images, such as listing only main images or thumbnails.

3. **`idx_created_at` (Medium-Priority)**:  
   - **Purpose**: Useful for retrieving images added after a certain date, such as for recent uploads.  
   - **Impact**: Ensures efficient filtering by creation date.

4. **`idx_deleted_at` (Low-Priority)**:  
   - **Purpose**: Facilitates retrieval of soft-deleted records for auditing or restoration tasks.  
   - **Impact**: Improves performance for queries involving `deleted_at` filtering.

 