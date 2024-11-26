# **Requirements for the Airbnb-like System**

## **1. Introduction**
This document outlines the requirements for an Airbnb-like system, including user management, property listings, booking, payment processing, reviews, messaging, notifications, and promotional discounts. This system is designed to enable hosts and guests to interact, manage bookings, payments, and receive notifications of important events.

---

## **2. Entities and Relationships**

### **2.1. Entities**
The system consists of the following primary entities:

- **User**  
- **Property**  
- **Booking**  
- **Payment**  
- **Review**  
- **Message**  
- **Notification**  
- **Coupons/Discounts**  
- **PropertyImages**  

### **2.2. Relationships**
The cardinality of relationships between these entities is as follows:

| **From Entity**  | **To Entity**   | **Cardinality** |
|------------------|-----------------|-----------------|
| User             | Property        | 1:N             |
| User             | Booking         | 1:N             |
| User             | Review          | 1:N             |
| User             | Message         | 1:N             |
| User             | Notification    | 1:N             |
| Property         | Booking         | 1:N             |
| Property         | Review          | 1:N             |
| Property         | PropertyImages  | 1:N             |
| Booking          | Payment         | 1:1             |
| Coupons          | User            | 1:N             |
| Coupons          | Property        | 1:N             |

---

## **3. Entities Overview and Key Attributes**

### **3.1. User**
The `User` entity represents the platform users, including guests, hosts, and admins.

#### **Key Attributes:**
- `user_id (PK, UUID)`  
- `first_name (VARCHAR(50), NOT NULL)`  
- `last_name (VARCHAR(50), NOT NULL)`  
- `email (VARCHAR(100), UNIQUE, NOT NULL)`  
- `password_hash (VARCHAR(255), NOT NULL)`  
- `phone_number (VARCHAR(15), NOT NULL)`  
- `role (ENUM('guest', 'host', 'admin'), DEFAULT 'guest')`  
- `profile_picture (VARCHAR(255), NULL)`  
- `email_verified (BOOLEAN, DEFAULT FALSE)`  
- `verification_token (VARCHAR(255) NULL)`  
- `created_at (DATETIME, DEFAULT CURRENT_TIMESTAMP)`  
- `updated_at (DATETIME, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)`  
- `deleted_at (DATETIME, NULL)`  

### **3.2. Property**
The `Property` entity represents the properties listed by hosts.

#### **Key Attributes:**
- `property_id (PK, UUID)`  
- `host_id (FK, UUID REFERENCES User(user_id))`  
- `name (VARCHAR(100), NOT NULL)`  
- `description (TEXT, NULL)`  
- `location (VARCHAR(255), NOT NULL)`  
- `price_per_night (DECIMAL(10,2), NOT NULL)`  
- `max_guests (INT, DEFAULT 1)`  
- `availability_status (ENUM('available', 'unavailable'), DEFAULT 'available')`  
- `latitude (DECIMAL(10,8), NULL)`  
- `longitude (DECIMAL(11,8), NULL)`  
- `city (VARCHAR(100), NULL)`  
- `state (VARCHAR(100), NULL)`  
- `country (VARCHAR(100), NULL)`  
- `images (JSON, NULL)`  
- `created_at (DATETIME, DEFAULT CURRENT_TIMESTAMP)`  
- `updated_at (DATETIME, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)`  
- `deleted_at (DATETIME, NULL)`  

### **3.3. Booking**
The `Booking` entity represents a guest’s reservation of a property.

#### **Key Attributes:**
- `booking_id (PK, UUID)`  
- `user_id (FK, UUID REFERENCES User(user_id))`  
- `property_id (FK, UUID REFERENCES Property(property_id))`  
- `start_date (DATE, NOT NULL)`  
- `end_date (DATE, NOT NULL)`  
- `total_price (DECIMAL(10,2), NOT NULL)`  
- `payment_status (ENUM('pending', 'paid', 'failed'), DEFAULT 'pending')`  
- `status (ENUM('pending', 'confirmed', 'cancelled'), DEFAULT 'pending')`  
- `cancellation_reason (TEXT, NULL)`  
- `created_at (DATETIME, DEFAULT CURRENT_TIMESTAMP)`  
- `updated_at (DATETIME, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)`  
- `deleted_at (DATETIME, NULL)`  

### **3.4. Payment**
The `Payment` entity tracks payments made for bookings.

#### **Key Attributes:**
- `payment_id (PK, UUID)`  
- `booking_id (FK, UUID REFERENCES Booking(booking_id))`  
- `amount (DECIMAL(10,2), NOT NULL)`  
- `payment_method (ENUM('credit_card', 'paypal', 'bank_transfer'), NOT NULL)`  
- `transaction_id (VARCHAR(100), UNIQUE, NOT NULL)`  
- `status (ENUM('pending', 'completed', 'failed'), DEFAULT 'pending')`  
- `currency (VARCHAR(3), DEFAULT 'USD')`  
- `processor (ENUM('stripe', 'paypal', 'bank_transfer') NOT NULL)`  
- `payment_date (DATETIME, DEFAULT CURRENT_TIMESTAMP)`  
- `created_at (DATETIME, DEFAULT CURRENT_TIMESTAMP)`  
- `updated_at (DATETIME, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)`  
- `deleted_at (DATETIME, NULL)`  

### **3.5. Review**
The `Review` entity represents ratings and comments left by users (guests or hosts).

#### **Key Attributes:**
- `review_id (PK, UUID)`  
- `user_id (FK, UUID REFERENCES User(user_id))`  
- `property_id (FK, UUID REFERENCES Property(property_id))`  
- `rating (INT, CHECK(rating BETWEEN 1 AND 5))`  
- `comment (TEXT, NULL)`  
- `cleanliness_rating (INT, CHECK(cleanliness_rating BETWEEN 1 AND 5))`  
- `communication_rating (INT, CHECK(communication_rating BETWEEN 1 AND 5))`  
- `review_type (ENUM('guest', 'host'), NOT NULL)`  
- `created_at (DATETIME, DEFAULT CURRENT_TIMESTAMP)`  
- `updated_at (DATETIME, DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)`  
- `deleted_at (DATETIME, NULL)`  

### **3.6. Message**
The `Message` entity allows users to communicate with each other.

#### **Key Attributes:**
- `message_id (PK, UUID)`  
- `sender_id (FK, UUID REFERENCES User(user_id))`  
- `recipient_id (FK, UUID REFERENCES User(user_id))`  
- `message_body (TEXT, NOT NULL)`  
- `sent_at (DATETIME, DEFAULT CURRENT_TIMESTAMP)`  
- `read_at (DATETIME, NULL)`  
- `message_type (ENUM('booking', 'inquiry', 'general') DEFAULT 'general')`  
- `attachments (JSON, NULL)`  
- `deleted_at (DATETIME, NULL)`  

### **3.7. Notification**
The `Notification` entity tracks notifications sent to users.

#### **Key Attributes:**
- `notification_id (PK, UUID)`  
- `user_id (FK, UUID REFERENCES User(user_id))`  
- `message (TEXT, NOT NULL)`  
- `notification_type (ENUM('system', 'booking', 'promotion') DEFAULT 'system')`  
- `priority (ENUM('low', 'medium', 'high') DEFAULT 'medium')`  
- `is_read (BOOLEAN, DEFAULT FALSE)`  
- `created_at (DATETIME, DEFAULT CURRENT_TIMESTAMP)`  
- `deleted_at (DATETIME, NULL)`  

### **3.8. Coupons**
The `Coupons` entity manages promotional discounts.

#### **Key Attributes:**
- `coupon_id (PK, UUID)`  
- `code (VARCHAR(50), UNIQUE, NOT NULL)`  
- `description (TEXT, NULL)`  
- `discount_type (ENUM('percentage', 'fixed_amount') NOT NULL)`  
- `discount_value (DECIMAL(10, 2), NOT NULL)`  
- `max_uses (INT DEFAULT NULL)`  
- `current_uses (INT DEFAULT 0)`  
- `user_id (FK, UUID NULL REFERENCES User(user_id))`  
- `property_id (FK, UUID NULL REFERENCES Property(property_id))`  
- `valid_from (DATETIME DEFAULT CURRENT_TIMESTAMP)`  
- `valid_to (DATETIME NOT NULL)`  
- `created_at (DATETIME DEFAULT CURRENT_TIMESTAMP)`  
- `updated_at (DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP)`  
- `deleted_at (DATETIME NULL)`  

### **3.9. PropertyImages**
The `PropertyImages` entity stores images associated with properties.

#### **Key Attributes:**
- `image_id (PK, UUID)`  
- `property_id (FK, UUID REFERENCES Property(property_id))`  
- `image_url (VARCHAR(255))`  
- `created_at (DATETIME, DEFAULT CURRENT_TIMESTAMP)`  

---

## **4. Functional Requirements**

### **4.1. User Management**
- Users can register, log in, and manage their profiles.
- Users can be verified via email, and roles (guest, host, admin) are assigned.
  
### **4.2. Property Management**
- Hosts can add, update, and remove properties.
- Each property has a description, price per night, availability status, and images.

### **4.3. Booking System**
- Guests can search for properties and book them.
- Bookings include start and end dates, total price, and status (pending, confirmed, cancelled).

### **4.4. Payment System**
- Payments are linked to bookings.
- Users can pay using different methods (credit card, PayPal, bank transfer).
- Each payment has a status and can be tracked by a transaction ID.

### **4.5. Review and Rating System**
- Users can leave reviews for properties after a stay.
- Reviews include overall ratings and specific ratings (cleanliness, communication).
  
### **4.6. Messaging System**
- Users can send messages to hosts or guests regarding bookings or inquiries.
  
### **4.7. Notifications**
- Users are notified about important events like booking confirmations, payment updates, and new messages.

### **4.8. Coupons and Discounts**
- Users can apply promotional coupons during bookings for discounts.
  
---

## **5. Conclusion**

This document provides a comprehensive overview of the requirements for the Airbnb-like system. The **User**, **Property**, **Booking**, **Payment**, **Review**, **Message**, **Notification**, and **Coupons** entities form the core of the system, with well-defined relationships and functionality to ensure smooth operations and a positive user experience.

---

