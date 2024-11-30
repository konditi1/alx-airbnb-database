# Airbnb Database Sample Data

This repository contains SQL queries to insert sample data into the Airbnb-like database. The data includes users, properties, bookings, reviews, payments, messages, notifications, and coupons.

## Tables

1. **User Table**
    - Contains information about users including guests and hosts.

    ```sql
    INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at, updated_at, deleted_at)
    VALUES
        ('123e4567-e89b-12d3-a456-426614174000', 'John', 'Doe', 'john@example.com', 'hashedpassword123', '1234567890', 'guest', NOW(), NOW(), NULL),
        ON DUPLICATE KEY UPDATE updated_at = VALUES(updated_at), first_name = VALUES(first_name), last_name = VALUES(last_name);
    ```

2. **UserToken Table**
    - Stores tokens for actions like email verification or password reset.

    ```sql
    INSERT INTO UserToken (token_id, user_id, token, token_expire_at, token_type, is_used, created_at, updated_at, deleted_at)
    VALUES
        ('001e4567-e89b-12d3-a456-426614174000', '028e4567-e89b-12d3-a456-426614174000', 'token1', '2023-02-01 01:20:11', 'email_verification', FALSE, '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
        ON DUPLICATE KEY UPDATE updated_at = NOW(), token = VALUES(token), token_expire_at = VALUES(token_expire_at), token_type = VALUES(token_type), is_used = VALUES(is_used);
    ```

3. **Review Table**
    - Holds reviews left by users for properties.

    ```sql
    INSERT IGNORE INTO Review (review_id, property_id, user_id, rating, comment, reviewed_by, created_at, updated_at, deleted_at)
    VALUES
        ('rev123e4567-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174003', '123e4567-e89b-12d3-a456-426614174000', 4, 'Great place!', 'guest', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL);
    ```

4. **Property Table**
    - Contains property listings with details like location, description, and pricing.

    ```sql
    INSERT INTO Property (property_id, host_id, location_id, name, description, price_per_night, availabity_status, created_at, updated_at, deleted_at)
    VALUES
        ('123e4567-e89b-12d3-a456-426614174003', '234e4567-e89b-18d3-a478-426614174000', 'loc123e4567-e89b-12d3-a456-426614174001', 'Beach House', 'A lovely beach house with ocean views.', 250.00, 'available', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
        ON DUPLICATE KEY UPDATE updated_at = NOW(), location_id = VALUES(location_id), availabity_status = VALUES(availabity_status), description = VALUES(description), price_per_night = VALUES(price_per_night), name = VALUES(name);
    ```

5. **Location Table**
    - Stores geographic locations associated with properties.

    ```sql
    INSERT IGNORE INTO Location (location_id, latitude, longitude, city, state, country, created_at, updated_at, deleted_at)
    VALUES
        ('loc123e4567-e89b-12d3-a456-426614174001', 37.7749, -122.4194, 'San Francisco', 'California', 'USA', NOW(), NOW(), NULL);
    ```

6. **Booking Table**
    - Holds booking information for properties by users.

    ```sql
    INSERT IGNORE INTO Booking (
        booking_id, property_id, user_id, start_date, end_date, total_price, booking_status, payment_status, created_at, updated_at, deleted_at
    )
    VALUES
        ('book001-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174003', '123e4567-e89b-12d3-a456-426614174000', '2024-01-01', '2024-01-05', 1250.00, 'confirmed', 'paid', NOW(), NOW(), NULL);
    ```

7. **BookingCancellation Table**
    - Stores booking cancellations.

    ```sql
    INSERT IGNORE INTO BookingCancellation (
        cancellation_id, booking_id, cancelled_by, cancel_reason, cancel_fee, cancel_at, deleted_at
    )
    VALUES
        ('cancel001-e89b-12d3-a456-426614174001', 'book003-e89b-12d3-a456-426614174003', 'guest', 'Changed plans, cannot travel.', 20.00, '2024-03-01 10:00:00', NULL),
        ('cancel002-e89b-12d3-a456-426614174002', 'book007-e89b-12d3-a456-426614174007', 'host', 'Double-booked by mistake.', 0.00, '2024-05-01 15:30:00', NULL);
    ```

8. **Payment Table**
    - Tracks payments made for bookings.

    ```sql
    INSERT IGNORE INTO Payment (
        payment_id, booking_id, amount, pay_method_id, transaction_id, status, payment_date, created_at, updated_at, deleted_at
    )
    VALUES
        ('pay001-e89b-12d3-a456-426614174001', 'book001-e89b-12d3-a456-426614174001', 1250.00, 'method001-e89b-12d3-a456-426614174001', 'txn001', 'completed', '2024-01-01 12:00:00', NOW(), NOW(), NULL);
    ```

9. **PaymentMethod Table**
    - Defines the payment methods available.

    ```sql
    INSERT IGNORE INTO PaymentMethod (
        pay_method_id, name, transaction_fee, currency_conversion, created_at, updated_at, deleted_at
    )
    VALUES
        ('method001-e89b-12d3-a456-426614174001', 'credit_card', 1.50, 1.00, NOW(), NOW(), NULL);
    ```

10. **Message Table**
    - Stores messages sent between users and hosts.

    ```sql
    INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at, read_at, deleted_at)
    VALUES
        ('msg001-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174000', '234e4567-e89b-18d3-a478-426614174000', 'Hello, I am interested in your property!', '2024-01-01 10:00:00', '2024-01-01 12:00:00', NULL);
    ```

11. **Notification Table**
    - Holds notifications sent to users regarding bookings, payments, and other alerts.

    ```sql
    INSERT INTO Notification (notification_id, user_id, message, is_read, event_type, created_at, expiration_time, deleted_at)
    VALUES
        ('notif001-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174000', 'Your booking for the Beach House has been confirmed! Total Price: $1250.00', FALSE, 'booking_confirmation', NOW(), NULL, NULL);
    ```

12. **Coupon Table**
    - Stores discount coupons for users.

    ```sql
    INSERT IGNORE INTO Coupon (
        coupon_id, user_id, property_id, code, description, discount_type, discount_amount, 
        max_no_uses, valid_from, valid_to, created_at, updated_at, deleted_at
    )
    VALUES
        ('coup123e4567-e89b-12d3-a456-426614174000', '123e4567-e89b-12d3-a456-426614174000', NULL, 'SAVE20', 'Save 20% on your next stay', 'percentage', 20.00, 100, '2024-01-01 00:00:00', '2024-12-31 23:59:59', NOW(), NOW(), NULL);
    ```

## Usage

To insert sample data into the tables, run the provided SQL commands in your MySQL database.

## License

This repository is licensed under the MIT License.
