# Normalization Documentation

This document outlines the normalization process applied to the database for an Airbnb-like system, ensuring the schema adheres to **Third Normal Form (3NF)** for scalability, integrity, and performance.

---

## Purpose of Normalization

Normalization is a database design technique used to:

- **Minimize redundancy** 
- **Reduce dependency** 

This is achieved by organizing fields and tables systematically.

For this system, the normalization process was applied step-by-step:

### **1. First Normal Form (1NF)**

- Ensured all attributes are **atomic** (single-valued).
- Eliminated **repeating groups** within tables.

### **2. Second Normal Form (2NF)**

- Removed **partial dependencies**.
- Ensured every non-key attribute is **fully dependent** on the primary key.

### **3. Third Normal Form (3NF)**

- Addressed **transitive dependencies**.
- Ensured that non-key attributes do not depend on other non-key attributes.

---

This normalization approach enhances the **scalability**, **data integrity**, and **performance** of the database.

# Updated Normalization Process

This document outlines the detailed normalization steps for the **User** entity, ensuring it adheres to **Third Normal Form (3NF)** by applying structured checks and implementing necessary improvements.

---

## **1. User**

### **Original Schema (Before Normalization)**

| **Attribute**       | **Type**      | **Description**                                      |
|----------------------|---------------|------------------------------------------------------|
| `user_id` (PK)       | UUID          | Unique identifier for the user.                     |
| `first_name`         | VARCHAR       | User's first name.                                  |
| `last_name`          | VARCHAR       | User's last name.                                   |
| `email`              | VARCHAR       | User's email.                                       |
| `password_hash`      | VARCHAR       | Hashed password for security.                       |
| `phone_number`       | VARCHAR       | Contact phone number.                               |
| `profile_picture`    | ENUM          | Profile image URL.                                  |
| `role`               | ENUM          | User's role (guest, host, admin).                   |
| `created_at`         | TIME          | Timestamp of user creation.                         |
| `deleted_at`         | DATE          | Timestamp for soft deletion (optional).             |

---

### **Normalization Steps**

#### **1NF (First Normal Form)**

- **Requirement:** Ensure atomicity of attributes and no repeating groups.
- **Check:** 
  - Attributes are atomic (e.g., `first_name` and `last_name` are single-valued fields).  
  - No arrays or nested fields are present.  
- **Status:** The schema satisfies **1NF**.

---

#### **2NF (Second Normal Form)**

- **Requirement:** Ensure no partial dependencies exist (non-key attributes must depend on the whole primary key).
- **Check:** 
  - Primary Key: `user_id`.  
  - All attributes (`first_name`, `email`, etc.) depend directly and entirely on `user_id`.  
- **Status:** The schema satisfies **2NF**.

---

#### **3NF (Third Normal Form)**

- **Requirement:** Ensure no transitive dependencies exist (non-key attributes must not depend on other non-key attributes).
- **Check:** 
  - No transitive dependencies detected.  
  - Improvement Opportunity: Extract token management attributes into a separate `UserToken` table for better modularity.  
- **Status:** After creating the `UserToken` table, the schema satisfies **3NF**.

---

### **Normalized Schema (After 3NF)**

| **Attribute**       | **Type**      | **Description**                                      |
|----------------------|---------------|------------------------------------------------------|
| `user_id` (PK)       | UUID          | Unique identifier for the user.                     |
| `first_name`         | VARCHAR(50)   | User's first name.                                  |
| `last_name`          | VARCHAR(50)   | User's last name.                                   |
| `email`              | VARCHAR(100)  | User's email (unique).                              |
| `password_hash`      | VARCHAR(255)  | Hashed password for security.                       |
| `phone_number`       | VARCHAR(15)   | Contact phone number.                               |
| `profile_picture`    | VARCHAR(255)  | Optional profile image URL.                         |
| `role`               | ENUM          | User's role (guest, host, admin).                   |
| `created_at`         | TIME          | Timestamp of user creation.                         |
| `updated_at`         | TIME          | Timestamp of the last update.                       |
| `deleted_at`         | DATE          | Timestamp for soft deletion (optional).             |

---

### **New Tables Derived from Normalization**

#### **UserToken**

| **Attribute**       | **Type**      | **Description**                                      |
|----------------------|---------------|------------------------------------------------------|
| `token_id` (PK)      | UUID          | Unique identifier for the token.                    |
| `user_id` (FK)       | UUID          | Links to the user who owns the token.               |
| `token`              | VARCHAR(255)  | Token value (secure random string).                 |
| `token_expire_at`    | TIME          | Expiration timestamp for the token.                 |
| `token_type`         | ENUM          | Type of token (`email_verification`, `password_reset`). |
| `is_used`            | BOOLEAN       | Indicates whether the token was used.               |
| `created_at`         | TIME          | Timestamp of token creation.                        |
| `updated_at`         | TIME          | Timestamp of the last update.                       |
| `deleted_at`         | DATE          | Timestamp for soft deletion (optional).             |

---

# Updated Normalization Process for Reviews

This section details the normalization process for the **Review** entity, ensuring compliance with **Third Normal Form (3NF)** while improving clarity and auditability.

---

## **2. Review**

### **Original Schema (Before Normalization)**

| **Attribute**       | **Type**      | **Description**                                      |
|----------------------|---------------|------------------------------------------------------|
| `review_id` (PK)     | UUID          | Unique identifier for the review.                   |
| `property_id` (FK)   | UUID          | Links to the reviewed property.                     |
| `user_id` (FK)       | UUID          | Links to the user who wrote the review.             |
| `rating`             | INT           | Review rating (1-5).                                |
| `comment`            | TEXT          | Review comment text.                                |
| `review_type`        | ENUM          | Review type (`guest`, `host`).                      |
| `created_at`         | TIME          | Timestamp of review creation.                       |
| `deleted_at`         | TIME          | Timestamp for soft deletion (optional).             |

---

### **Normalization Steps**

#### **1NF (First Normal Form)**

- **Requirement:** Ensure atomicity of attributes and no repeating groups.
- **Check:** 
  - Attributes like `rating` and `comment` are single-valued and atomic.  
  - No arrays or repeating fields are present.  
- **Status:** The schema satisfies **1NF**.

---

#### **2NF (Second Normal Form)**

- **Requirement:** Ensure no partial dependencies exist (non-key attributes must depend on the whole primary key).
- **Check:** 
  - Primary Key: `review_id`.  
  - All attributes (`property_id`, `rating`, etc.) fully depend on `review_id`.  
- **Status:** The schema satisfies **2NF**.

---

#### **3NF (Third Normal Form)**

- **Requirement:** Ensure no transitive dependencies exist (non-key attributes must not depend on other non-key attributes).
- **Check:** 
  - No transitive dependencies detected.  
  - **Improvement Opportunity:** Retain attributes like `review_type` for clarity and add `updated_at` for improved auditing.  
- **Status:** Schema finalized to meet **3NF** with enhancements for clarity and auditability.

---

### **Normalized Schema (After 3NF)**

| **Attribute**       | **Type**      | **Description**                                      |
|----------------------|---------------|------------------------------------------------------|
| `review_id` (PK)     | UUID          | Unique identifier for the review.                   |
| `property_id` (FK)   | UUID          | Links to the reviewed property.                     |
| `user_id` (FK)       | UUID          | Links to the user who wrote the review.             |
| `rating`             | INT           | Review rating (1-5).                                |
| `comment`            | TEXT          | Review comment text.                                |
| `review_type`        | ENUM          | Review type (`guest`, `host`).                      |
| `created_at`         | TIME          | Timestamp of review creation.                       |
| `updated_at`         | TIME          | Timestamp of the last update.                       |
| `deleted_at`         | TIME          | Timestamp for soft deletion (optional).             |

---
# Updated Normalization Process for Properties

This section outlines the normalization process for the **Property** entity, ensuring compliance with **Third Normal Form (3NF)**. The process includes creating a separate **Location** table to eliminate redundancy and enhance scalability.

---

## **3. Property**

### **Original Schema (Before Normalization)**

| **Attribute**            | **Type**     | **Description**                                       |
|---------------------------|--------------|-------------------------------------------------------|
| `property_id` (PK)        | UUID         | Unique identifier for the property.                  |
| `host_id` (FK)            | UUID         | Links to the user hosting the property.              |
| `name`                   | TEXT         | Property name.                                       |
| `description`            | TEXT         | Property description.                                |
| `location`               | VARCHAR      | Property location.                                   |
| `pricepernight`          | DECIMAL      | Price per night for the property.                   |
| `availability_status`    | ENUM         | Property availability (`available`, `unavailable`).  |
| `created_at`             | TIME         | Timestamp of property creation.                     |
| `updated_at`             | TIME         | Timestamp of the last update.                       |
| `deleted_at`             | DATE         | Timestamp for soft deletion (optional).             |

---

### **Normalization Steps**

#### **1NF (First Normal Form)**

- **Requirement:** Ensure atomicity of attributes and no repeating groups.
- **Check:** 
  - Attributes like `description` and `pricepernight` are single-valued and atomic.  
  - No arrays or repeating groups are present.  
- **Status:** The schema satisfies **1NF**.

---

#### **2NF (Second Normal Form)**

- **Requirement:** Ensure no partial dependencies exist (non-key attributes must depend on the whole primary key).
- **Check:** 
  - Primary Key: `property_id`.  
  - All attributes (`host_id`, `name`, `pricepernight`, etc.) fully depend on `property_id`.  
- **Status:** The schema satisfies **2NF**.

---

#### **3NF (Third Normal Form)**

- **Requirement:** Ensure no transitive dependencies exist (non-key attributes must not depend on other non-key attributes).
- **Check:** 
  - Issue: The `location` attribute contains data that can be shared among multiple properties.  
  - **Improvement:** Extract `location` into a separate **Location** table and replace it with a foreign key `location_id` to eliminate redundancy.  
- **Status:** The schema satisfies **3NF** after normalizing `location`.

---

### **Normalized Schema (After 3NF)**

| **Attribute**            | **Type**     | **Description**                                       |
|---------------------------|--------------|-------------------------------------------------------|
| `property_id` (PK)        | UUID         | Unique identifier for the property.                  |
| `host_id` (FK)            | UUID         | Links to the user hosting the property.              |
| `name`                   | TEXT         | Property name.                                       |
| `description`            | TEXT         | Property description.                                |
| `price_per_night`        | DECIMAL      | Price per night for the property.                   |
| `availability_status`    | ENUM         | Property availability (`available`, `unavailable`).  |
| `location_id` (FK)       | UUID         | Links to the **Location** table.                    |
| `created_at`             | TIME         | Timestamp of property creation.                     |
| `updated_at`             | TIME         | Timestamp of the last update.                       |
| `deleted_at`             | DATE         | Timestamp for soft deletion (optional).             |

---

### **New Tables Derived from Normalization**

#### **Location**

| **Attribute**            | **Type**     | **Description**                                       |
|---------------------------|--------------|-------------------------------------------------------|
| `location_id` (PK)        | UUID         | Unique identifier for the location.                  |
| `latitude`               | DECIMAL      | Latitude coordinate.                                 |
| `longitude`              | DECIMAL      | Longitude coordinate.                                |
| `city`                   | VARCHAR(100) | City name.                                           |
| `state`                  | VARCHAR(100) | State or region.                                     |
| `country`                | VARCHAR(100) | Country name.                                        |

---

### **Key Improvements**

1. **Eliminated Redundancy:** 
   - The `location` attribute is extracted into a shared **Location** table, reducing duplication.
   - Properties in the same location can reference a single record in the **Location** table.

2. **Enhanced Scalability:** 
   - The **Location** table supports detailed geographic data, including latitude and longitude for mapping applications.
---

# Updated Normalization Process for Bookings

This section outlines the normalization of the **Booking** entity, ensuring it complies with **Third Normal Form (3NF)**. The normalization separates lifecycle, financial, and cancellation-specific data for clarity and scalability.

---

## **4. Booking**

### **Original Schema (Before Normalization)**

| **Attribute**            | **Type**     | **Description**                                       |
|---------------------------|--------------|-------------------------------------------------------|
| `booking_id` (PK)         | UUID         | Unique identifier for the booking.                   |
| `property_id` (FK)        | UUID         | Links to the booked property.                        |
| `user_id` (FK)            | UUID         | Links to the user who made the booking.              |
| `start_date`              | DATE         | Start date of the booking.                           |
| `end_date`                | DATE         | End date of the booking.                             |
| `total_price`             | DECIMAL      | Total price of the booking.                          |
| `status`                  | ENUM         | Status of the booking (`pending`, `confirmed`, `cancelled`). |
| `cancel_reason`           | TEXT         | Reason for cancellation (optional).                  |
| `created_at`              | TIME         | Timestamp of booking creation.                       |
| `updated_at`              | TIME         | Timestamp of the last update.                        |
| `deleted_at`              | DATE         | Timestamp for soft deletion (optional).              |

---

### **Normalization Steps**

#### **1NF (First Normal Form)**

- **Requirement:** Ensure atomicity of attributes and no repeating groups.
- **Check:** 
  - Attributes like `start_date`, `end_date`, and `total_price` are atomic, with no arrays or repeating fields.
  - There are no multi-valued attributes or nested structures.
- **Status:** The schema satisfies **1NF**.

---

#### **2NF (Second Normal Form)**

- **Requirement:** Ensure no partial dependencies exist (non-key attributes must depend on the whole primary key).
- **Check:** 
  - Primary Key: `booking_id`.  
  - All attributes (`property_id`, `user_id`, `start_date`, etc.) fully depend on `booking_id`.  
- **Status:** The schema satisfies **2NF**.

---

#### **3NF (Third Normal Form)**

- **Requirement:** Ensure no transitive dependencies exist (non-key attributes must not depend on other non-key attributes).
- **Check:** 
  - Issue: Attributes like `cancel_reason` and `status` represent different concepts:
    - `cancel_reason` only applies to cancelled bookings, leading to null values for non-cancelled ones.  
    - `status` combines lifecycle state and payment state into one attribute, reducing clarity.  
  - **Improvement:** 
    - Extract cancellation-specific data (`cancel_reason`, `cancelled_by`, etc.) into a separate **BookingCancellation** table.  
    - Split `status` into two fields:
      - `booking_status`: Tracks the lifecycle state (`pending`, `confirmed`, `cancelled`).  
      - `payment_status`: Tracks payment state (`pending`, `paid`, `failed`).  

---

### **Normalized Schema (After 3NF)**

#### **Booking Table**

| **Attribute**            | **Type**     | **Description**                                       |
|---------------------------|--------------|-------------------------------------------------------|
| `booking_id` (PK)         | UUID         | Unique identifier for the booking.                   |
| `property_id` (FK)        | UUID         | Links to the booked property.                        |
| `user_id` (FK)            | UUID         | Links to the user who made the booking.              |
| `start_date`              | DATE         | Start date of the booking.                           |
| `end_date`                | DATE         | End date of the booking.                             |
| `total_price`             | DECIMAL      | Total price of the booking.                          |
| `booking_status`          | ENUM         | Booking lifecycle status (`pending`, `confirmed`, `cancelled`). |
| `payment_status`          | ENUM         | Payment status (`in progress`, `paid`, `failed`).        |
| `created_at`              | TIME         | Timestamp of booking creation.                       |
| `updated_at`              | TIME         | Timestamp of the last update.                        |
| `deleted_at`              | DATE         | Timestamp for soft deletion (optional).              |

#### **BookingCancellation Table**

| **Attribute**            | **Type**     | **Description**                                       |
|---------------------------|--------------|-------------------------------------------------------|
| `cancellation_id` (PK)    | UUID         | Unique identifier for the cancellation.              |
| `booking_id` (FK)         | UUID         | Links to the cancelled booking.                      |
| `cancelled_by`            | ENUM         | Who cancelled the booking (`guest`, `host`).         |
| `cancel_reason`           | TEXT         | Reason for cancellation.                             |
| `cancel_fee`              | DECIMAL      | Cancellation fee (if applicable).                    |
| `cancel_at`               | TIME         | Timestamp of cancellation.                           |
| `deleted_at`              | DATE         | Timestamp for soft deletion (optional).              |

---

### **Key Improvements**

1. **Separated Cancellation Data:** 
   - Cancellation-specific data like `cancel_reason` and `cancelled_by` is moved to the **BookingCancellation** table.  
   - This prevents storing null values for non-cancelled bookings and organizes data more logically.  

2. **Clearer Status Representation:** 
   - The single `status` attribute is split into `booking_status` and `payment_status`, allowing for distinct tracking of lifecycle and financial states.  

3. **Enhanced Scalability and Auditing:** 
   - Adding separate tables and attributes (like `cancel_fee` and `cancelled_by`) improves the schema's ability to handle future changes and detailed reporting.  

---

# Updated Normalization Process for Payments

This section outlines the normalization of the **Payment** entity, focusing on separating payment methods into their own table for improved scalability, consistency, and flexibility.

---

## **5. Payment**

### **Original Schema (Before Normalization)**

| **Attribute**          | **Type**     | **Description**                                       |
|-------------------------|--------------|-------------------------------------------------------|
| `payment_id` (PK)       | UUID         | Unique identifier for the payment.                   |
| `booking_id` (FK)       | UUID         | Links to the associated booking.                     |
| `amount`               | DECIMAL      | Total payment amount.                                |
| `payment_method`        | ENUM         | Payment method used (`credit_card`, `paypal`, etc.). |
| `transaction_id`        | VARCHAR      | Transaction ID provided by the payment gateway.      |
| `status`                | ENUM         | Payment status (`pending`, `completed`, `failed`).   |
| `payment_date`          | TIME         | Date and time the payment was made.                  |
| `created_at`            | TIME         | Timestamp of payment creation.                       |
| `updated_at`            | TIME         | Timestamp of the last update.                        |
| `deleted_at`            | DATE         | Timestamp for soft deletion (optional).              |

---

### **Normalization Steps**

#### **1NF (First Normal Form)**

- **Requirement:** Ensure atomicity of attributes and no repeating groups.
- **Check:**
  - Attributes like `amount`, `transaction_id`, and `status` are single-valued and atomic.
  - There are no arrays or repeating groups in the schema.
- **Status:** The schema satisfies **1NF**.

---

#### **2NF (Second Normal Form)**

- **Requirement:** Ensure no partial dependencies exist (non-key attributes must depend on the entire primary key).
- **Check:**
  - Primary Key: `payment_id`.  
  - All attributes (`amount`, `payment_method`, `transaction_id`, etc.) fully depend on `payment_id`.  
- **Status:** The schema satisfies **2NF**.

---

#### **3NF (Third Normal Form)**

- **Requirement:** Ensure no transitive dependencies exist (non-key attributes must not depend on other non-key attributes).
- **Check:** 
  - Issue: The `payment_method` attribute represents a concept that can be normalized into a separate **PaymentMethod** table for better scalability.  
  - **Improvement:**
    - Extract `payment_method` into a new **PaymentMethod** table, replacing it with a `pay_method_id` foreign key in the Payment table.  
    - This ensures the schema can accommodate additional metadata (e.g., transaction fees, currency conversions) without redundancy.  

---

### **Normalized Schema (After 3NF)**

#### **Payment Table**

| **Attribute**          | **Type**     | **Description**                                       |
|-------------------------|--------------|-------------------------------------------------------|
| `payment_id` (PK)       | UUID         | Unique identifier for the payment.                   |
| `booking_id` (FK)       | UUID         | Links to the associated booking.                     |
| `amount`               | DECIMAL      | Total payment amount.                                |
| `pay_method_id` (FK)    | UUID         | Links to the PaymentMethod table.                    |
| `transaction_id`        | VARCHAR(100) | Transaction ID provided by the payment gateway.      |
| `status`                | ENUM         | Payment status (`pending`, `completed`, `failed`).   |
| `payment_date`          | TIME         | Date and time the payment was made.                  |
| `created_at`            | TIME         | Timestamp of payment creation.                       |
| `updated_at`            | TIME         | Timestamp of the last update.                        |
| `deleted_at`            | DATE         | Timestamp for soft deletion (optional).              |

---

#### **PaymentMethod Table**

| **Attribute**          | **Type**     | **Description**                                       |
|-------------------------|--------------|-------------------------------------------------------|
| `pay_method_id` (PK)    | UUID         | Unique identifier for the payment method.            |
| `name`                 | VARCHAR(50)  | Name of the payment method (`credit_card`, `paypal`, etc.). |
| `transaction_fee`       | DECIMAL      | Fee charged by the payment method.                   |
| `currency_conversion`   | DECIMAL      | Conversion rate for multi-currency transactions.     |
| `created_at`            | TIME         | Timestamp of method creation.                        |
| `updated_at`            | TIME         | Timestamp of the last update.                        |
| `deleted_at`            | DATE         | Timestamp for soft deletion (optional).              |

---

### **Key Improvements**

1. **Separation of Payment Method:**
   - The `payment_method` attribute was moved to the **PaymentMethod** table.
   - This separation reduces redundancy and simplifies adding new payment methods or modifying metadata.

2. **Scalability and Flexibility:**
   - The **PaymentMethod** table enables support for:
     - Additional payment methods.
     - Metadata like transaction fees or currency conversion rates.
   - This design ensures the schema can scale with business requirements.

3. **Enhanced Referential Integrity:**
   - Using `pay_method_id` as a foreign key enforces consistency and traceability for payment methods.  

4. **Improved Reporting and Analytics:**
   - Detailed metadata in the **PaymentMethod** table supports better insights into payment behaviors (e.g., total fees, popular payment methods).
---

# Normalized Schema for Messaging System

This section details the normalization of the **Message** entity, with a focus on conversation management and scalability for multi-user participation.

---

## **6. Message**

### **Original Schema (Before Normalization)**

| **Attribute**          | **Type**     | **Description**                                       |
|-------------------------|--------------|-------------------------------------------------------|
| `message_id` (PK)       | UUID         | Unique identifier for the message.                   |
| `sender_id` (FK)        | UUID         | Links to the user who sent the message.              |
| `recipient_id` (FK)     | UUID         | Links to the user who received the message.          |
| `message_body`          | TEXT         | The content of the message.                          |
| `sent_at`               | TIME         | Timestamp when the message was sent.                 |
| `read_at`               | TIME         | Timestamp when the message was read (optional).      |
| `deleted_at`            | DATE         | Timestamp for soft deletion (optional).              |

---

### **Normalization Steps**

#### **1NF (First Normal Form)**

- **Requirement:** Ensure atomicity of attributes and no repeating groups.
- **Check:**
  - Attributes such as `message_body`, `sent_at`, `read_at`, and `sender_id` are single-valued and atomic.
  - There are no arrays or repeating groups in the schema.
- **Status:** The schema satisfies **1NF**.

---

#### **2NF (Second Normal Form)**

- **Requirement:** Ensure no partial dependencies exist (non-key attributes must depend on the entire primary key).
- **Check:** 
  - Primary Key: `message_id`.  
  - All attributes (`sender_id`, `recipient_id`, `message_body`, etc.) fully depend on `message_id`.  
- **Status:** The schema satisfies **2NF**.

---

#### **3NF (Third Normal Form)**

- **Requirement:** Ensure no transitive dependencies exist (non-key attributes must not depend on other non-key attributes).
- **Issue:** 
  - While there are no direct transitive dependencies, the schema can be improved by introducing **conversation management** to group messages logically.
  - **Improvement:** Add a `conversation_id` column to link messages to a specific conversation. Create a new **Conversation** table to manage conversations, and a **ConversationParticipant** table to track participants.

---

### **Normalized Schema (After 3NF)**

#### **Message Table**

| **Attribute**          | **Type**     | **Description**                                       |
|-------------------------|--------------|-------------------------------------------------------|
| `message_id` (PK)       | UUID         | Unique identifier for the message.                   |
| `conversation_id` (FK)  | UUID         | Links to the **Conversation** table.                 |
| `sender_id` (FK)        | UUID         | Links to the user who sent the message.              |
| `recipient_id` (FK)     | UUID         | Links to the user who received the message.          |
| `message_body`          | TEXT         | The content of the message.                          |
| `sent_at`               | TIME         | Timestamp when the message was sent.                 |
| `read_at`               | TIME         | Timestamp when the message was read (optional).      |
| `deleted_at`            | DATE         | Timestamp for soft deletion (optional).              |

---

#### **Conversation Table (New)**

| **Attribute**          | **Type**     | **Description**                                       |
|-------------------------|--------------|-------------------------------------------------------|
| `conversation_id` (PK)  | UUID         | Unique identifier for the conversation.              |
| `booking_id` (FK)       | UUID         | Links to the **Booking** table (optional, if the conversation is related to a booking). |
| `created_at`            | TIME         | Timestamp of conversation creation.                  |
| `updated_at`            | TIME         | Timestamp of the last update.                        |
| `deleted_at`            | DATE         | Timestamp for soft deletion (optional).              |

---

#### **ConversationParticipant Table (New Join Table)**

| **Attribute**          | **Type**     | **Description**                                       |
|-------------------------|--------------|-------------------------------------------------------|
| `conversation_id` (FK)  | UUID         | Links to the **Conversation** table.                 |
| `user_id` (FK)          | UUID         | Links to the **User** table (participant).           |
| `joined_at`             | TIME         | Timestamp when the user joined the conversation.     |
| `is_active`             | BOOLEAN      | Indicates whether the user is still active in the conversation. |

---

### **Key Improvements**

1. **Conversation Management:**
   - Messages are grouped under a **Conversation**, identified by `conversation_id`.  
   - This allows logical grouping of messages, making it easier to manage and query related messages.  

2. **Support for Multi-User Conversations:**
   - The **ConversationParticipant** table supports multi-user conversations, tracking which users are part of each conversation.  
   - Users can be dynamically added or removed from conversations.  

3. **Flexible Messaging:**
   - The `Conversation` table links to the **Booking** table when conversations are tied to bookings, adding contextual relevance.  
   - Sender and recipient details remain in the **Message** table for individual message tracking.  

4. **1NF Compliance:**
   - Multi-user participation is handled through the **ConversationParticipant** table, avoiding arrays or nested fields.  

5. **Scalability:**
   - The design scales well for systems where conversations may involve multiple participants and a large volume of messages.
   - Additional features, like conversation archiving or participant roles, can be added without major schema changes.

### **I WILL NOT IMPLEMENT THE SUGGESTION FOR NOW BUT KEEP IT FOR FUTURE REFERENCE**
---

# Normalized Schema for Notification System

This section documents the normalization of the **Notification** entity, with a focus on categorization, query optimization, and managing time-sensitive notifications.

---

## **7. Notification**

### **Original Schema (Before Normalization)**

| **Attribute**          | **Type**     | **Description**                                       |
|-------------------------|--------------|-------------------------------------------------------|
| `notification_id` (PK)  | UUID         | Unique identifier for the notification.              |
| `user_id` (FK)          | UUID         | Links to the **User** table (the recipient of the notification). |
| `message`              | TEXT         | The content or message of the notification.          |
| `is_read`              | BOOLEAN      | Indicates whether the notification has been read.    |
| `created_at`           | TIME         | Timestamp when the notification was created.         |
| `expiration_time`      | TIME         | Time when the notification expires (optional).       |

---

### **Normalization Steps**

#### **1NF (First Normal Form)**

- **Requirement:** Ensure atomicity of attributes and no repeating groups.
- **Check:**
  - All attributes (`message`, `is_read`, `created_at`, `expiration_time`) are atomic and single-valued.
  - No arrays or nested fields exist.
- **Status:** The schema satisfies **1NF**.

---

#### **2NF (Second Normal Form)**

- **Requirement:** Ensure no partial dependencies exist (non-key attributes must depend on the entire primary key).
- **Check:**
  - Primary Key: `notification_id`.
  - All attributes depend entirely on `notification_id` without any partial dependencies.
- **Status:** The schema satisfies **2NF**.

---

#### **3NF (Third Normal Form)**

- **Requirement:** Ensure no transitive dependencies exist (non-key attributes must not depend on other non-key attributes).
- **Issue:** 
  - While there are no transitive dependencies, the schema can be improved for better categorization and management by introducing an `event_type` field.
  - **Improvement:** Add an `event_type` column to categorize notifications based on their purpose, such as `booking_confirmation`, `payment_update`, or `system_alert`. This enables better querying and organization of notifications.

---

### **Normalized Schema (After 3NF)**

#### **Notification Table**

| **Attribute**          | **Type**     | **Description**                                       |
|-------------------------|--------------|-------------------------------------------------------|
| `notification_id` (PK)  | UUID         | Unique identifier for the notification.              |
| `user_id` (FK)          | UUID         | Links to the **User** table (the recipient of the notification). |
| `message`              | TEXT         | The content or message of the notification.          |
| `is_read`              | BOOLEAN      | Indicates whether the notification has been read.    |
| `created_at`           | TIME         | Timestamp when the notification was created.         |
| `expiration_time`      | TIME         | Time when the notification expires (optional).       |
| `event_type`           | ENUM         | Categorizes the type of notification (`booking_confirmation`, `payment_update`, etc.). |

---

### **Key Improvements**

1. **Introduction of `event_type`:**
   - Enables the categorization of notifications, making it easier to query and display notifications based on their type.
   - Examples: `booking_confirmation`, `payment_failed`, `system_alert`.

2. **Enhanced Querying:**
   - With the `event_type` field, you can filter and organize notifications more efficiently, e.g., show only `payment_update` notifications in a user dashboard.

3. **Time-Sensitive Notifications:**
   - The `expiration_time` attribute handles time-sensitive notifications, ensuring that expired notifications are excluded from user interfaces and queries.

---

### **Summary of Improvements**

- **Atomic Fields:** The schema ensures compliance with 1NF by maintaining single-valued fields.
- **No Partial Dependencies:** All attributes fully depend on the primary key, satisfying 2NF.
- **Categorization:** Adding the `event_type` field ensures compliance with 3NF by improving organization and scalability.
- **Expiration Handling:** The `expiration_time` field ensures better management of time-sensitive notifications.

---

### **Future Scalability**

This design supports future requirements such as:
- Adding priority levels (e.g., high, medium, low) for notifications.
- Extending notification types by adding new `event_type` values.
- Managing bulk notifications efficiently by linking them to events or campaigns.

---

# Normalized Schema for Coupon System

This section documents the normalization of the **Coupon** entity, focusing on eliminating redundancy, ensuring scalability, and enforcing constraints.

---

## **8. Coupon**

### **Original Schema (Before Normalization)**

| **Attribute**          | **Type**     | **Description**                                       |
|-------------------------|--------------|-------------------------------------------------------|
| `coupon_id` (PK)        | UUID         | Unique identifier for the coupon.                    |
| `user_id` (FK)          | UUID         | Links to the **User** table (optional, for user-specific coupons). |
| `property_id` (FK)      | UUID         | Links to the **Property** table (optional, for property-specific coupons). |
| `code`                 | TEXT         | Unique code for the coupon.                          |
| `description`          | TEXT         | Description of the coupon.                           |
| `discount_type`        | ENUM         | Type of discount (`percentage`, `fixed_amount`).      |
| `discount_amount`      | DECIMAL      | Discount value (e.g., 20% or $50).                   |
| `max_no_uses`          | INT          | Maximum number of uses allowed for the coupon.       |
| `current_no_uses`      | INT          | Tracks the current number of uses.                   |
| `valid_from`           | TIME         | Start time of the coupon’s validity.                 |
| `valid_to`             | TIME         | End time of the coupon’s validity.                   |
| `created_at`           | TIME         | Timestamp when the coupon was created.               |
| `updated_at`           | TIME         | Timestamp of the last update.                        |
| `deleted_at`           | DATE         | Timestamp for soft deletion (optional).              |

---

### **Normalization Steps**

#### **1NF (First Normal Form)**

- **Requirement:** Ensure atomicity of attributes and no repeating groups.
- **Check:**
  - All attributes (`code`, `discount_amount`, `valid_from`, etc.) are single-valued and atomic.
  - No arrays or nested fields exist.
- **Status:** The schema satisfies **1NF**.

---

#### **2NF (Second Normal Form)**

- **Requirement:** Ensure no partial dependencies exist.
- **Check:**
  - Primary Key: `coupon_id`.
  - All non-key attributes (`discount_amount`, `valid_from`, etc.) depend entirely on `coupon_id`.
- **Status:** The schema satisfies **2NF**.

---

#### **3NF (Third Normal Form)**

- **Requirement:** Ensure no transitive dependencies exist.
- **Issue:** 
  - The `current_no_uses` field can be dynamically calculated by counting entries in a new **CouponUsage** table. Storing it directly introduces redundancy and violates 3NF.
- **Improvement:**
  - Remove `current_no_uses` from the **Coupon** table and move tracking of coupon usage to the **CouponUsage** table.

---

### **Normalized Schema (After 3NF)**

#### **Coupon Table**

| **Attribute**          | **Type**     | **Description**                                       |
|-------------------------|--------------|-------------------------------------------------------|
| `coupon_id` (PK)        | UUID         | Unique identifier for the coupon.                    |
| `user_id` (FK)          | UUID         | Links to the **User** table (optional, for user-specific coupons). |
| `property_id` (FK)      | UUID         | Links to the **Property** table (optional, for property-specific coupons). |
| `code`                 | TEXT         | Unique code for the coupon.                          |
| `description`          | TEXT         | Description of the coupon.                           |
| `discount_type`        | ENUM         | Type of discount (`percentage`, `fixed_amount`).      |
| `discount_amount`      | DECIMAL      | Discount value (e.g., 20% or $50).                   |
| `max_no_uses`          | INT          | Maximum number of uses allowed for the coupon.       |
| `valid_from`           | TIME         | Start time of the coupon’s validity.                 |
| `valid_to`             | TIME         | End time of the coupon’s validity.                   |
| `created_at`           | TIME         | Timestamp when the coupon was created.               |
| `updated_at`           | TIME         | Timestamp of the last update.                        |
| `deleted_at`           | DATE         | Timestamp for soft deletion (optional).              |

---

#### **CouponUsage Table (New Table)**

| **Attribute**          | **Type**     | **Description**                                       |
|-------------------------|--------------|-------------------------------------------------------|
| `coupon_usage_id` (PK)  | UUID         | Unique identifier for the coupon usage.              |
| `coupon_id` (FK)        | UUID         | Links to the **Coupon** table.                       |
| `user_id` (FK)          | UUID         | Links to the **User** table (the user using the coupon). |
| `property_id` (FK)      | UUID         | Links to the **Property** table (optional, for property-specific coupons). |
| `booking_id` (FK)       | UUID         | Links to the **Booking** table (if the coupon is used for a booking). |
| `used_at`              | TIME         | Timestamp when the coupon was used.                  |

---

### **Key Improvements**

1. **Moved `current_no_uses` to CouponUsage:**
   - Tracking the number of coupon uses in a separate table avoids redundancy and ensures compliance with 3NF.
   - The total number of uses can now be dynamically calculated via a query.

2. **Improved Flexibility:**
   - The **CouponUsage** table links to the **User**, **Property**, and **Booking** tables, supporting user-specific, property-specific, and booking-specific coupon applications.

3. **Added Constraint for Unique Use:**
   - A unique constraint is added to the **CouponUsage** table:
     ```sql
     UNIQUE (coupon_id, booking_id);
     ```
   - Ensures that a coupon cannot be used more than once for the same booking.

4. **Validity Tracking:**
   - The `valid_from` and `valid_to` fields in the **Coupon** table allow precise control over coupon validity, preventing misuse of expired coupons.

---

### **Summary of Improvements**

- **Atomic Fields:** All attributes are atomic, satisfying **1NF**.
- **No Partial Dependencies:** Attributes are fully dependent on the primary key, satisfying **2NF**.
- **No Transitive Dependencies:** Tracking coupon usage separately eliminates redundancy, satisfying **3NF**.
- **Scalability:** The schema supports future enhancements, such as adding coupon campaigns or integrating with promotional events.

---

### **Future Scalability**

This design supports:
- Extending coupon types by adding new `discount_type` values.
- Adding advanced reporting on coupon usage trends.
- Implementing campaign-specific constraints or usage limits.

---

# Normalized Schema for PropertyImages Table

This section documents the normalization of the **PropertyImages** entity to ensure data integrity, eliminate redundancy, and improve functionality.

---

## **Original Schema (Before Normalization)**

| **Attribute**       | **Type**  | **Description**                                          |
|----------------------|-----------|----------------------------------------------------------|
| `image_id` (PK)      | UUID      | Unique identifier for the image.                        |
| `property_id` (FK)   | UUID      | Links to the **Property** table.                        |
| `image_url`          | TEXT      | URL or file path of the image.                          |
| `caption`            | TEXT      | Optional description or caption for the image.          |
| `created_at`         | TIME      | Timestamp of image creation.                            |
| `updated_at`         | TIME      | Timestamp of the last update.                           |
| `deleted_at`         | DATE      | Timestamp for soft deletion (optional).                 |

---

## **Normalization Steps**

### **1NF (First Normal Form)**

- **Requirement:** Ensure atomicity of attributes and no repeating groups.
- **Check:**
  - Each attribute holds a single, atomic value (e.g., `image_url` and `caption` are single values per row).
  - No multi-valued fields or arrays exist.
- **Status:** The schema satisfies **1NF**.

---

### **2NF (Second Normal Form)**

- **Requirement:** Ensure no partial dependencies exist.
- **Check:**
  - Primary Key: `image_id`.
  - All non-key attributes (`image_url`, `caption`, `created_at`, etc.) depend fully on the primary key `image_id` and describe the image.
- **Status:** The schema satisfies **2NF**.

---

### **3NF (Third Normal Form)**

- **Requirement:** Ensure no transitive dependencies exist.
- **Check:**
  - All attributes are directly dependent on the primary key `image_id`.
  - There are no attributes dependent on non-primary key attributes.
- **Status:** The schema satisfies **3NF**.

---

### **Enhanced Schema for Clarity and Usability**

While the schema satisfies 3NF, the following enhancements are proposed to improve clarity and functionality:

1. **Add `image_type` Field:**
   - Purpose: Categorize images based on their use (e.g., main, gallery, thumbnail).
   - Benefit: Enables better organization and display logic for property images.

2. **Rename `caption` to `alt_text`:**
   - Purpose: Align the schema with web accessibility standards.
   - Benefit: Alt text provides better accessibility for screen readers and fallback content if an image fails to load.

---

## **Normalized Schema (After 3NF)**

### **PropertyImages Table**

| **Attribute**       | **Type**  | **Description**                                          |
|----------------------|-----------|----------------------------------------------------------|
| `image_id` (PK)      | UUID      | Unique identifier for the image.                        |
| `property_id` (FK)   | UUID      | Links to the **Property** table.                        |
| `image_url`          | TEXT      | URL or file path of the image.                          |
| `alt_text`           | TEXT      | Optional descriptive text for the image (for accessibility or clarification). |
| `image_type`         | ENUM      | Type of the image (`main`, `gallery`, `thumbnail`).      |
| `created_at`         | TIME      | Timestamp of image creation.                            |
| `updated_at`         | TIME      | Timestamp of the last update.                           |
| `deleted_at`         | DATE      | Timestamp for soft deletion (optional).                 |

---

## **Key Improvements**

### 1. **Image Type**

- **Added Field:** `image_type`.
- **Purpose:** Classify images based on their role in the system:
  - `main`: The primary image for the property.
  - `gallery`: Additional images for the property's listing.
  - `thumbnail`: Smaller images used in search results or previews.
- **Benefit:** Simplifies display logic by categorizing images for specific purposes.

---

### 2. **Alt Text for Accessibility**

- **Change:** Renamed `caption` to `alt_text`.
- **Purpose:**
  - Improve alignment with web accessibility standards.
  - Provide textual descriptions of images for users relying on screen readers.
  - Serve as fallback content when an image fails to load.
- **Benefit:** Enhances user experience and adheres to best practices.

---

### 3. **Soft Deletion**

- **Field:** `deleted_at`.
- **Purpose:**
  - Allow marking an image as deleted without physically removing it from the database.
  - Preserve historical data and support recovery if needed.
- **Benefit:** Ensures data retention and flexibility in image management.

---

### **Summary**

- **Atomic Attributes:** All fields are atomic, satisfying **1NF**.
- **Full Dependence on PK:** Non-key attributes depend fully on `image_id`, satisfying **2NF**.
- **No Transitive Dependencies:** No redundancy or dependencies on non-key attributes, satisfying **3NF**.
- **Enhanced Usability:**
  - Added `image_type` for categorization.
  - Renamed `caption` to `alt_text` for accessibility.
  - Retained `deleted_at` for soft deletion.
- **Scalability:** The enhanced schema supports future requirements, such as adding new image types or accessibility features.
---
