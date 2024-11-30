
-- User table

CREATE TABLE IF NOT EXISTS User (
    user_id CHAR(36) PRIMARY KEY,
    first_name VARCHAR(36) NOT NULL,
    last_name VARCHAR(36) NOT NULL,
    email VARCHAR(36) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(36) NOT NULL,
    role ENUM('guest', 'host', 'admin') NOT NULL DEFAULT 'guest',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);

-- index for email
CREATE UNIQUE INDEX idx_user_email ON User (email);

-- create payment method table
CREATE TABLE IF NOT EXISTS PaymentMethod (
    pay_method_id CHAR(36) PRIMARY KEY,
    name VARCHAR(36) NOT NULL,
    transaction_fee DECIMAL(5, 2) NULL DEFAULT 0.00,
    currency_conversion DECIMAL(5, 2) NOT NULL DEFAULT 1.00, 
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);

-- index for fetching payment method by name
CREATE INDEX idx_payment_method_name ON PaymentMethod (name);

-- create location table
CREATE TABLE IF NOT EXISTS Location (
    location_id CHAR(36) PRIMARY KEY,
    latitude DECIMAL(10, 7) NOT NULL,
    longitude DECIMAL(10, 7) NOT NULL,
    city VARCHAR(36) NOT NULL,
    state VARCHAR(36), 
    country VARCHAR(36) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL
);

-- index for fetching location by city and country
CREATE INDEX idx_location_city_country ON Location (city, country);

-- table for Property
CREATE TABLE IF NOT EXISTS Property (
    property_id CHAR(36) PRIMARY KEY,
    host_id CHAR(36) NOT NULL,
    location_id CHAR(36) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price_per_night DECIMAL(10, 2) NOT NULL,
    availability_status ENUM('available', 'unavailable') NOT NULL DEFAULT 'available',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (host_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (location_id) REFERENCES Location(location_id) ON DELETE CASCADE
);

-- index for fetching property by price
CREATE INDEX idx_property_price ON Property (price_per_night);

-- index for fetching property by location
CREATE INDEX idx_property_location ON Property (location_id);




CREATE TABLE IF NOT EXISTS UserToken (
    token_id CHAR(36) PRIMARY KEY,
    user_id CHAR(36) NOT NULL,
    token VARCHAR(255) NOT NULL,
    token_expire_at TIMESTAMP NOT NULL,
    token_type ENUM('email_verification', 'password_reset') NOT NULL,
    is_used BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- index for token validation
CREATE INDEX idx_token_validation ON UserToken (token, token_expire_at, is_used);

-- index for fetching tokens by user
CREATE INDEX idx_user_tokens ON UserToken (user_id);


-- create table for Review
CREATE TABLE IF NOT EXISTS Review (
    review_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    reviewed_by ENUM('guest', 'host') NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- index for fetching reviews by property
CREATE INDEX idx_property_reviews ON Review (property_id);

-- create table for booking
CREATE TABLE IF NOT EXISTS Booking (
    booking_id CHAR(36) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL, 
    total_price DECIMAL(10, 2) NOT NULL, 
    booking_status ENUM('pending', 'confirmed', 'cancelled') NOT NULL DEFAULT 'pending',
    payment_status ENUM('in_progress', 'paid', 'failed') NOT NULL DEFAULT 'in_progress',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE
);

-- index for fetching booking by property
CREATE INDEX idx_property_bookings ON Booking (property_id);

-- index for fetching booking by user
CREATE INDEX idx_user_bookings ON Booking (user_id);

-- create bookingCancelation table
CREATE TABLE IF NOT EXISTS BookingCancellation (
    cancellation_id CHAR(36) PRIMARY KEY, 
    booking_id CHAR(36) NOT NULL,
    cancelled_by ENUM('guest', 'host') NOT NULL, 
    cancel_reason TEXT,
    cancel_fee DECIMAL(10, 2) DEFAULT 0.00,
    cancel_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE
);

-- index for fetching cancellation by booking
CREATE INDEX idx_booking_cancellations ON BookingCancellation (booking_id);

-- create payment table
CREATE TABLE IF NOT EXISTS Payment (
    payment_id CHAR(36) PRIMARY KEY,
    booking_id CHAR(36) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount > 0),
    pay_method_id CHAR(36) NOT NULL,
    transaction_id VARCHAR(36) UNIQUE NOT NULL,
    status ENUM('pending', 'completed', 'failed') DEFAULT 'pending', 
    payment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (pay_method_id) REFERENCES PaymentMethod(pay_method_id)
);

-- index for fetching payment by booking
CREATE INDEX idx_booking_payments ON Payment (booking_id);

-- create message table
CREATE TABLE IF NOT EXISTS Message (
    message_id CHAR(36) PRIMARY KEY,
    sender_id CHAR(36) NOT NULL,
    recipient_id CHAR(36) NOT NULL,
    message_body TEXT NOT NULL, 
    sent_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    read_at TIMESTAMP DEFAULT NULL,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (recipient_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (sender_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- index for fetching message by sender
CREATE INDEX idx_sender_messages ON Message (sender_id);

-- index for fetching message by recipient
CREATE INDEX idx_recipient_messages ON Message (recipient_id);

-- create notification table
CREATE TABLE IF NOT EXISTS Notification (
    notification_id CHAR(36) PRIMARY KEY,
    user_id CHAR(36) NOT NULL,
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT FALSE,
    event_type ENUM('booking_confirmation', 'payment_update', 'general_alert') NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expiration_time TIMESTAMP DEFAULT NULL,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
);

-- index for fetching notification by user
CREATE INDEX idx_user_notifications ON Notification (user_id);

-- create coupon table
CREATE TABLE IF NOT EXISTS Coupon (
    coupon_id CHAR(36) PRIMARY KEY,
    user_id CHAR(36),
    property_id CHAR(36),
    code VARCHAR(36) NOT NULL UNIQUE,
    description TEXT,
    discount_type ENUM('percentage', 'fixed_amount') NOT NULL,
    discount_amount DECIMAL(10, 2) NOT NULL,
    max_no_uses INT NOT NULL,
    valid_from TIMESTAMP NOT NULL,
    valid_to TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE
);

-- index for fetching coupon by user
CREATE INDEX idx_user_coupons ON Coupon (user_id);

-- index for fetching coupon by property
CREATE INDEX idx_property_coupons ON Coupon (property_id);

-- index for fetching coupon by validity
-- CREATE INDEX idx_validity_coupons ON Coupon (valid_from, valid_to);


-- create coupon table
CREATE TABLE IF NOT EXISTS CouponUsage (
    coupon_usage_id CHAR(36) PRIMARY KEY,
    coupon_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    property_id CHAR(36),
    booking_id CHAR(36),
    used_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (coupon_id, user_id),  -- Ensures a user can only use a coupon once
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE SET NULL,
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE,
    FOREIGN KEY (coupon_id) REFERENCES Coupon(coupon_id) ON DELETE CASCADE
);

-- index for fetching coupon usage by user and couponId
CREATE INDEX idx_user_coupon_usage ON CouponUsage (user_id, coupon_id);


-- image table
CREATE TABLE IF NOT EXISTS PropertyImages (
    image_id CHAR(255) PRIMARY KEY,
    property_id CHAR(36) NOT NULL,
    image_url TEXT NOT NULL,
    alt_text TEXT,
    image_type ENUM('main', 'gallery', 'thumbnail') NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP DEFAULT NULL,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE
);

-- index for fetching image by property
CREATE INDEX idx_property_id ON PropertyImages (property_id);
