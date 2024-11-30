

-- insert into user table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at, updated_at, deleted_at)
VALUES
    ('123e4567-e89b-12d3-a456-426614174000', 'John', 'Doe', 'john@example.com', 'hashedpassword123', '1234567890', 'guest', NOW(), NOW(), NULL),
    ('234e4567-e89b-18d3-a478-426614174000', 'Jane', 'Smith', 'jane@example.com', 'hashedpassword456', '9876543210', 'host', '2021-01-01 22:11:12', NOW(), NULL),
    ('345e4567-e89b-12d3-a456-426614174000', 'Bob', 'Johnson', 'bob@example.com', 'hashedpassword789', '5555555555', 'guest', '2022-02-01 20:01:12', '2022-02-15 23:59:59', NULL),
    ('456e4567-e89b-12d3-a456-426614174000', 'Alice', 'Williams', 'alice@example.com', 'hashedpassword012', '1111111111', 'admin', '2023-03-01 14:40:59', '2023-03-15 12:00:00', NULL),
    ('567e4567-e89b-12d3-a456-426614174000', 'David', 'Brown', 'david@example.com', 'hashedpassword345', '2222222222', 'host', '2024-04-01 10:00:00', '2024-04-15 08:23:50', NULL),
    ('678e4567-e89b-12d3-a456-426614174000', 'Emily', 'Davis', 'emily@example.com', 'hashedpassword678', '3333333333', 'guest', '2025-05-01 06:34:00', '2025-05-15 04:56:30', NULL),
    ('789e4567-e89b-12d3-a456-426614174000', 'Michael', 'Wilson', 'michael@example.com', 'hashedpassword901', '4444444444', 'admin', '2026-06-01 02:12:00', '2026-06-15 00:34:00', '2027-07-01 23:56:00'),
    ('890e4567-e89b-12d3-a456-426614174000', 'Olivia', 'Taylor', 'olivia@example.com', 'hashedpassword234', '5555555555', 'host', '2027-07-01 21:00:00', '2027-07-15 19:30:00', NULL),
    ('901e4567-e89b-12d3-a456-426614174000', 'William', 'Anderson', 'william@example.com', 'hashedpassword567', '6666666666', 'guest', '2028-08-01 17:00:00', '2028-08-15 15:30:00', NULL),
    ('012e4567-e89b-12d3-a456-426614174000', 'Sophia', 'Thomas', 'sophia@example.com', 'hashedpassword890', '7777777777', 'guest', '2029-09-01 13:00:00', '2029-09-15 11:30:00', '2030-10-01 10:00:00'),
    ('013e4567-e89b-12d3-a456-426614174000', 'James', 'Moore', 'james@example.com', 'hashedpassword923', '8888888888', 'admin', '2030-10-01 08:00:00', '2030-10-15 06:30:00', NULL),
    ('014e4567-e89b-12d3-a456-426614174000', 'Emma', 'Garcia', 'emma@example.com', 'hashedpassword496', '9999999999', 'guest', '2031-11-01 04:00:00', '2031-11-15 02:30:00', '2032-12-01 01:00:00'),
    ('015e4567-e89b-12d3-a456-426614174000', 'Daniel', 'Perez', 'daniel@example.com', 'hashedpassword780', '0000000000', 'guest', '2032-12-01 23:00:00', '2032-12-15 21:30:00', NULL),
    ('123e4567-e89b-12d3-a456-426614174017', 'Madison', 'Herrera', 'madison@example.com', 'hashedpassword789', '3333333333', 'host', '2025-01-01 16:00:00', '2025-01-15 14:30:00', '2026-02-01 13:00:00')
ON DUPLICATE KEY UPDATE
    updated_at = NOW(),
    first_name = VALUES(first_name),
    last_name = VALUES(last_name),
    email = VALUES(email),
    password_hash = VALUES(password_hash),
    phone_number = VALUES(phone_number),
    role = VALUES(role),
    created_at = VALUES(created_at),
    deleted_at = VALUES(deleted_at);


-- insert payment method
INSERT INTO PaymentMethod (
    pay_method_id, name, transaction_fee, currency_conversion, created_at, updated_at, deleted_at
)
VALUES
    ('method001-e89b-12d3-a456-42661417001', 'credit_card', 1.50, 1.00, NOW(), NOW(), NULL),
    ('method002-e89b-12d3-a456-42661417002', 'paypal', 2.00, 1.00, NOW(), NOW(), NULL),
    ('method003-e89b-12d3-a456-42661417003', 'bank_transfer', 0.50, 1.00, NOW(), NOW(), NULL),
    ('method004-e89b-12d3-a456-42661417004', 'apple_pay', 1.00, 1.00, NOW(), NOW(), NULL),
    ('method005-e89b-12d3-a456-42661417005', 'google_pay', 1.00, 1.00, NOW(), NOW(), NULL),
    ('method006-e89b-12d3-a456-42661417006', 'cryptocurrency', 3.00, 2.00, NOW(), NOW(), NULL),
    ('method007-e89b-12d3-a456-42661417007', 'cash', 0.00, 0.00, NOW(), NOW(), NULL),
    ('method008-e89b-12d3-a456-42661417008', 'cheque', 1.50, 1.50, NOW(), NOW(), NULL),
    ('method009-e89b-12d3-a456-42661417009', 'venmo', 1.75, 1.00, NOW(), NOW(), NULL),
    ('method010-e89b-12d3-a456-42661417010', 'stripe', 2.00, 1.00, NOW(), NOW(), NULL)
ON DUPLICATE KEY UPDATE
    name = VALUES(name),
    transaction_fee = VALUES(transaction_fee),
    currency_conversion = VALUES(currency_conversion),
    updated_at = NOW(),
    deleted_at = VALUES(deleted_at);


-- insert location
INSERT INTO Location (
    location_id, latitude, longitude, city, state, country, created_at, updated_at, deleted_at
)
VALUES
    ('loc123e4567-e89b-12d3-a456-426617001', 37.7749, -122.4194, 'San Francisco', 'California', 'USA', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617002', 34.0522, -118.2437, 'Los Angeles', 'California', 'USA', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617003', 40.7128, -74.0060, 'New York City', 'New York', 'USA', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617004', 51.5074, -0.1278, 'London', 'England', 'United Kingdom', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617005', 48.8566, 2.3522, 'Paris', 'Île-de-France', 'France', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617006', 35.6895, 139.6917, 'Tokyo', NULL, 'Japan', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617007', -33.8688, 151.2093, 'Sydney', 'New South Wales', 'Australia', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617008', -23.5505, -46.6333, 'São Paulo', 'São Paulo', 'Brazil', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617009', 55.7558, 37.6173, 'Moscow', 'Moscow Oblast', 'Russia', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617010', 28.6139, 77.2090, 'New Delhi', 'Delhi', 'India', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617011', 19.4326, -99.1332, 'Mexico City', 'Distrito Federal', 'Mexico', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617012', 41.8781, -87.6298, 'Chicago', 'Illinois', 'USA', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617013', -34.6037, -58.3816, 'Buenos Aires', 'Buenos Aires', 'Argentina', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617014', 39.9042, 116.4074, 'Beijing', NULL, 'China', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617015', 52.5200, 13.4050, 'Berlin', 'Berlin', 'Germany', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617016', -1.2921, 36.8219, 'Nairobi', 'Nairobi County', 'Kenya', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617017', 30.0444, 31.2357, 'Cairo', 'Cairo Governorate', 'Egypt', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617018', 37.5665, 126.9780, 'Seoul', 'Seoul Capital Area', 'South Korea', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617019', 22.3964, 114.1095, 'Hong Kong', NULL, 'China', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426617020', 45.4215, -75.6972, 'Ottawa', 'Ontario', 'Canada', NOW(), NOW(), NULL)
ON DUPLICATE KEY UPDATE
    latitude = VALUES(latitude),
    longitude = VALUES(longitude),
    city = VALUES(city),
    state = VALUES(state),
    country = VALUES(country),
    updated_at = NOW(),
    deleted_at = VALUES(deleted_at);

-- Insert data into the Property table
INSERT INTO Property (
    property_id, host_id, location_id, name, description, price_per_night, availability_status, created_at, updated_at, deleted_at
)
VALUES
    ('prop001-4567-e89b-12d3-a456-42667001', '567e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426617001', 'Cozy Apartment in SF', 'A beautiful and cozy apartment in the heart of San Francisco.', 150.00, 'available', NOW(), NOW(), NULL),
    ('prop002-4567-e89b-12d3-a456-42667002', '567e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426617002', 'Luxury Villa in LA', 'A luxurious villa with a private pool in Los Angeles.', 500.00, 'available', NOW(), NOW(), NULL),
    ('prop003-4567-e89b-12d3-a456-42667003', '890e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426617003', 'Modern Loft in NYC', 'A stylish and modern loft in New York City.', 300.00, 'unavailable', NOW(), NOW(), NULL),
    ('prop004-4567-e89b-12d3-a456-42667004', '890e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426617004', 'Charming Flat in London', 'A charming flat near London city center.', 200.00, 'available', NOW(), NOW(), NULL),
    ('prop005-4567-e89b-12d3-a456-42667005', '890e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426617005', 'Elegant Apartment in Paris', 'An elegant apartment with a view of the Eiffel Tower.', 250.00, 'unavailable', NOW(), NOW(), NULL),
    ('prop006-4567-e89b-12d3-a456-42667006', '567e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426617006', 'Traditional House in Tokyo', 'A traditional Japanese house in Tokyo.', 180.00, 'available', NOW(), NOW(), NULL),
    ('prop007-4567-e89b-12d3-a456-42667007', '890e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426617007', 'Beachfront Villa in Sydney', 'A villa with stunning ocean views in Sydney.', 400.00, 'unavailable', NOW(), NOW(), NULL),
    ('prop008-4567-e89b-12d3-a456-42667008', '890e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426617008', 'Downtown Apartment in São Paulo', 'A modern apartment in the bustling city of São Paulo.', 120.00, 'available', NOW(), NOW(), NULL),
    ('prop009-4567-e89b-12d3-a456-42667009', '567e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426617009', 'Luxury Flat in Moscow', 'An upscale flat with a panoramic view of Moscow.', 300.00, 'available', NOW(), NOW(), NULL),
    ('prop010-4567-e89b-12d3-a456-42667010', '890e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426617010', 'Penthouse in New Delhi', 'A penthouse with modern amenities in New Delhi.', 350.00, 'unavailable', NOW(), NOW(), NULL)
ON DUPLICATE KEY UPDATE
    location_id = VALUES(location_id),
    host_id = VALUES(host_id),
    name = VALUES(name),
    description = VALUES(description),
    price_per_night = VALUES(price_per_night),
    availability_status = VALUES(availability_status),
    created_at = VALUES(created_at),
    updated_at = NOW(),
    deleted_at = VALUES(deleted_at);

   
-- Insert data into the Coupon table
INSERT INTO Coupon (
    coupon_id, user_id, property_id, code, description, discount_type, discount_amount, max_no_uses, valid_from, valid_to, created_at, updated_at, deleted_at
)
VALUES
    ('coup001-4567-e89b-12d3-a456-42667001', '567e4567-e89b-12d3-a456-426614174000', 'prop001-4567-e89b-12d3-a456-42667001', 'DISCOUNT10', '10% off on Cozy Apartment in SF', 'percentage', 10.00, 100, NOW(), NOW() + INTERVAL 30 DAY, NOW(), NOW(), NULL),
    ('coup002-4567-e89b-12d3-a456-42667002', '890e4567-e89b-12d3-a456-426614174000', 'prop002-4567-e89b-12d3-a456-42667002', 'DISCOUNT15', '15% off on Luxury Villa in LA', 'percentage', 15.00, 50, NOW(), NOW() + INTERVAL 30 DAY, NOW(), NOW(), NULL),
    ('coup003-4567-e89b-12d3-a456-42667003', '567e4567-e89b-12d3-a456-426614174000', 'prop003-4567-e89b-12d3-a456-42667003', 'FLAT50', '50 off on Modern Loft in NYC', 'fixed_amount', 50.00, 20, NOW(), NOW() + INTERVAL 30 DAY, NOW(), NOW(), NULL),
    ('coup004-4567-e89b-12d3-a456-42667004', '567e4567-e89b-12d3-a456-426614174000', 'prop004-4567-e89b-12d3-a456-42667004', 'DISCOUNT20', '20% off on Charming Flat in London', 'percentage', 20.00, 30, NOW(), NOW() + INTERVAL 30 DAY, NOW(), NOW(), NULL),
    ('coup005-4567-e89b-12d3-a456-42667005', '890e4567-e89b-12d3-a456-426614174000', 'prop005-4567-e89b-12d3-a456-42667005', 'DISCOUNT25', '25% off on Elegant Apartment in Paris', 'percentage', 25.00, 40, NOW(), NOW() + INTERVAL 30 DAY, NOW(), NOW(), NULL),
    ('coup006-4567-e89b-12d3-a456-42667006', '890e4567-e89b-12d3-a456-426614174000', 'prop006-4567-e89b-12d3-a456-42667006', 'FLAT100', '100 off on Traditional House in Tokyo', 'fixed_amount', 100.00, 10, NOW(), NOW() + INTERVAL 30 DAY, NOW(), NOW(), NULL),
    ('coup007-4567-e89b-12d3-a456-42667007', '567e4567-e89b-12d3-a456-426614174000', 'prop007-4567-e89b-12d3-a456-42667007', 'DISCOUNT30', '30% off on Beachfront Villa in Sydney', 'percentage', 30.00, 60, NOW(), NOW() + INTERVAL 30 DAY, NOW(), NOW(), NULL),
    ('coup008-4567-e89b-12d3-a456-42667008', '890e4567-e89b-12d3-a456-426614174000', 'prop008-4567-e89b-12d3-a456-42667008', 'FLAT200', '200 off on Downtown Apartment in São Paulo', 'fixed_amount', 200.00, 15, NOW(), NOW() + INTERVAL 30 DAY, NOW(), NOW(), NULL),
    ('coup009-4567-e89b-12d3-a456-42667009', '890e4567-e89b-12d3-a456-426614174000', 'prop009-4567-e89b-12d3-a456-42667009', 'DISCOUNT40', '40% off on Luxury Flat in Moscow', 'percentage', 40.00, 80, NOW(), NOW() + INTERVAL 30 DAY, NOW(), NOW(), NULL),
    ('coup010-4567-e89b-12d3-a456-42667010', '567e4567-e89b-12d3-a456-426614174000', 'prop010-4567-e89b-12d3-a456-42667010', 'FLAT300', '300 off on Penthouse in New Delhi', 'fixed_amount', 300.00, 5, NOW(), NOW() + INTERVAL 30 DAY, NOW(), NOW(), NULL)
ON DUPLICATE KEY UPDATE
    user_id = VALUES(user_id),
    property_id = VALUES(property_id),
    code = VALUES(code),
    description = VALUES(description),
    discount_type = VALUES(discount_type),
    discount_amount = VALUES(discount_amount),
    max_no_uses = VALUES(max_no_uses),
    valid_from = VALUES(valid_from),
    valid_to = VALUES(valid_to),
    updated_at = NOW(),
    deleted_at = VALUES(deleted_at);


-- Insert data into the Booking table
INSERT INTO Booking (
    booking_id, property_id, user_id, start_date, end_date, total_price, booking_status, payment_status, created_at, updated_at, deleted_at
)
VALUES
    ('book001-4567-e89b-12d3-a456-42667001', 'prop001-4567-e89b-12d3-a456-42667001', '567e4567-e89b-12d3-a456-426614174000', '2024-12-01', '2024-12-05', 150.00 * 4, 'confirmed', 'paid', NOW(), NOW(), NULL),
    ('book002-4567-e89b-12d3-a456-42667002', 'prop002-4567-e89b-12d3-a456-42667002', '890e4567-e89b-12d3-a456-426614174000', '2024-12-10', '2024-12-15', 500.00 * 5, 'confirmed', 'paid', NOW(), NOW(), NULL),
    ('book003-4567-e89b-12d3-a456-42667003', 'prop003-4567-e89b-12d3-a456-42667003', '567e4567-e89b-12d3-a456-426614174000', '2024-12-05', '2024-12-08', 300.00 * 3, 'pending', 'in_progress', NOW(), NOW(), NULL),
    ('book004-4567-e89b-12d3-a456-42667004', 'prop004-4567-e89b-12d3-a456-42667004', '890e4567-e89b-12d3-a456-426614174000', '2024-12-12', '2024-12-14', 200.00 * 2, 'cancelled', 'failed', NOW(), NOW(), NULL),
    ('book005-4567-e89b-12d3-a456-42667005', 'prop005-4567-e89b-12d3-a456-42667005', '567e4567-e89b-12d3-a456-426614174000', '2024-12-15', '2024-12-18', 250.00 * 3, 'confirmed', 'paid', NOW(), NOW(), NULL),
    ('book006-4567-e89b-12d3-a456-42667006', 'prop006-4567-e89b-12d3-a456-42667006', '890e4567-e89b-12d3-a456-426614174000', '2024-12-20', '2024-12-25', 180.00 * 5, 'pending', 'in_progress', NOW(), NOW(), NULL),
    ('book007-4567-e89b-12d3-a456-42667007', 'prop007-4567-e89b-12d3-a456-42667007', '567e4567-e89b-12d3-a456-426614174000', '2024-12-10', '2024-12-13', 400.00 * 3, 'confirmed', 'paid', NOW(), NOW(), NULL),
    ('book008-4567-e89b-12d3-a456-42667008', 'prop008-4567-e89b-12d3-a456-42667008', '890e4567-e89b-12d3-a456-426614174000', '2024-12-05', '2024-12-10', 120.00 * 5, 'cancelled', 'failed', NOW(), NOW(), NULL),
    ('book009-4567-e89b-12d3-a456-42667009', 'prop009-4567-e89b-12d3-a456-42667009', '567e4567-e89b-12d3-a456-426614174000', '2024-12-01', '2024-12-03', 300.00 * 2, 'confirmed', 'paid', NOW(), NOW(), NULL),
    ('book010-4567-e89b-12d3-a456-42667010', 'prop010-4567-e89b-12d3-a456-42667010', '890e4567-e89b-12d3-a456-426614174000', '2024-12-10', '2024-12-12', 350.00 * 2, 'pending', 'in_progress', NOW(), NOW(), NULL),
    ('book011-4567-e89b-12d3-a456-42667011', 'prop001-4567-e89b-12d3-a456-42667001', '890e4567-e89b-12d3-a456-426614174000', '2024-12-06', '2024-12-09', 150.00 * 3, 'pending', 'in_progress', NOW(), NOW(), NULL),
    ('book012-4567-e89b-12d3-a456-42667012', 'prop002-4567-e89b-12d3-a456-42667002', '567e4567-e89b-12d3-a456-426614174000', '2024-12-16', '2024-12-20', 500.00 * 4, 'confirmed', 'paid', NOW(), NOW(), NULL),
    ('book013-4567-e89b-12d3-a456-42667013', 'prop003-4567-e89b-12d3-a456-42667003', '890e4567-e89b-12d3-a456-426614174000', '2024-12-11', '2024-12-13', 300.00 * 2, 'confirmed', 'paid', NOW(), NOW(), NULL),
    ('book014-4567-e89b-12d3-a456-42667014', 'prop004-4567-e89b-12d3-a456-42667004', '567e4567-e89b-12d3-a456-426614174000', '2024-12-18', '2024-12-22', 200.00 * 4, 'pending', 'in_progress', NOW(), NOW(), NULL),
    ('book015-4567-e89b-12d3-a456-42667015', 'prop005-4567-e89b-12d3-a456-42667005', '890e4567-e89b-12d3-a456-426614174000', '2024-12-12', '2024-12-15', 250.00 * 3, 'confirmed', 'paid', NOW(), NOW(), NULL),
    ('book016-4567-e89b-12d3-a456-42667016', 'prop006-4567-e89b-12d3-a456-42667006', '567e4567-e89b-12d3-a456-426614174000', '2024-12-06', '2024-12-09', 180.00 * 3, 'cancelled', 'failed', NOW(), NOW(), NULL),
    ('book017-4567-e89b-12d3-a456-42667017', 'prop007-4567-e89b-12d3-a456-42667007', '890e4567-e89b-12d3-a456-426614174000', '2024-12-14', '2024-12-16', 400.00 * 2, 'pending', 'in_progress', NOW(), NOW(), NULL),
    ('book018-4567-e89b-12d3-a456-42667018', 'prop008-4567-e89b-12d3-a456-42667008', '567e4567-e89b-12d3-a456-426614174000', '2024-12-01', '2024-12-04', 120.00 * 3, 'confirmed', 'paid', NOW(), NOW(), NULL),
    ('book019-4567-e89b-12d3-a456-42667019', 'prop009-4567-e89b-12d3-a456-42667009', '890e4567-e89b-12d3-a456-426614174000', '2024-12-13', '2024-12-15', 300.00 * 2, 'confirmed', 'paid', NOW(), NOW(), NULL),
    ('book020-4567-e89b-12d3-a456-42667020', 'prop010-4567-e89b-12d3-a456-42667010', '567e4567-e89b-12d3-a456-426614174000', '2024-12-05', '2024-12-08', 350.00 * 3, 'pending', 'in_progress', NOW(), NOW(), NULL)
ON DUPLICATE KEY UPDATE
    property_id = VALUES(property_id),
    user_id = VALUES(user_id),
    start_date = VALUES(start_date),
    end_date = VALUES(end_date),
    total_price = VALUES(total_price),
    booking_status = VALUES(booking_status),
    payment_status = VALUES(payment_status),
    updated_at = NOW(),
    deleted_at = VALUES(deleted_at);

-- Seed data for Review table
INSERT INTO Review (
    review_id, property_id, user_id, rating, comment, reviewed_by, created_at, updated_at, deleted_at
)
VALUES
    ('rev001-4567-e89b-12d3-a456-42667001', 'prop001-4567-e89b-12d3-a456-42667001', '890e4567-e89b-12d3-a456-426614174000', 5, 'Amazing apartment, highly recommended!', 'guest', NOW(), NOW(), NULL),
    ('rev002-4567-e89b-12d3-a456-42667002', 'prop002-4567-e89b-12d3-a456-42667002', '567e4567-e89b-12d3-a456-426614174000', 4, 'Luxury villa but a bit overpriced.', 'guest', NOW(), NOW(), NULL),
    ('rev003-4567-e89b-12d3-a456-42667003', 'prop003-4567-e89b-12d3-a456-42667003', '890e4567-e89b-12d3-a456-426614174000', 3, 'Nice loft but could be cleaner.', 'guest', NOW(), NOW(), NULL),
    ('rev004-4567-e89b-12d3-a456-42667004', 'prop004-4567-e89b-12d3-a456-42667004', '567e4567-e89b-12d3-a456-426614174000', 5, 'Perfect stay, would definitely come back!', 'guest', NOW(), NOW(), NULL),
    ('rev005-4567-e89b-12d3-a456-42667005', 'prop005-4567-e89b-12d3-a456-42667005', '890e4567-e89b-12d3-a456-426614174000', 2, 'Apartment was okay, but there were some issues with the plumbing.', 'guest', NOW(), NOW(), NULL),
    ('rev006-4567-e89b-12d3-a456-42667006', 'prop006-4567-e89b-12d3-a456-42667006', '567e4567-e89b-12d3-a456-426614174000', 4, 'Traditional house, but internet was spotty.', 'guest', NOW(), NOW(), NULL),
    ('rev007-4567-e89b-12d3-a456-42667007', 'prop007-4567-e89b-12d3-a456-42667007', '890e4567-e89b-12d3-a456-426614174000', 5, 'Beachfront views were fantastic! Highly recommend!', 'guest', NOW(), NOW(), NULL),
    ('rev008-4567-e89b-12d3-a456-42667008', 'prop008-4567-e89b-12d3-a456-42667008', '567e4567-e89b-12d3-a456-426614174000', 4, 'Modern apartment, but a bit noisy at night.', 'guest', NOW(), NOW(), NULL),
    ('rev009-4567-e89b-12d3-a456-42667009', 'prop009-4567-e89b-12d3-a456-42667009', '890e4567-e89b-12d3-a456-426614174000', 5, 'Great flat, very comfortable and well-located.', 'guest', NOW(), NOW(), NULL),
    ('rev010-4567-e89b-12d3-a456-42667010', 'prop010-4567-e89b-12d3-a456-42667010', '567e4567-e89b-12d3-a456-426614174000', 3, 'Good penthouse, but some amenities were lacking.', 'guest', NOW(), NOW(), NULL)
ON DUPLICATE KEY UPDATE
    property_id = VALUES(property_id),
    user_id = VALUES(user_id),
    rating = VALUES(rating),
    comment = VALUES(comment),
    reviewed_by = VALUES(reviewed_by),
    updated_at = NOW(),
    deleted_at = VALUES(deleted_at);

-- Seed data for BookingCancellation table
INSERT INTO BookingCancellation (
    cancellation_id, booking_id, cancelled_by, cancel_reason, cancel_fee, cancel_at, deleted_at
)
VALUES
    ('cancel001-4567-e89b-12d3-a456-427001', 'book011-4567-e89b-12d3-a456-42667011', 'guest', 'Booking cancelled due to change in plans.', 50.00, NOW(), NULL),
    ('cancel002-4567-e89b-12d3-a456-427002', 'book012-4567-e89b-12d3-a456-42667012', 'host', 'Booking cancelled due to property issues.', 100.00, NOW(), NULL),
    ('cancel003-4567-e89b-12d3-a456-427003', 'book013-4567-e89b-12d3-a456-42667013', 'guest', 'Guest canceled after last-minute change.', 75.00, NOW(), NULL),
    ('cancel004-4567-e89b-12d3-a456-427004', 'book014-4567-e89b-12d3-a456-42667014', 'host', 'Property unavailable, host canceled the booking.', 0.00, NOW(), NULL),
    ('cancel005-4567-e89b-12d3-a456-427005', 'book015-4567-e89b-12d3-a456-42667015', 'guest', 'Guest decided to stay at another property.', 25.00, NOW(), NULL),
    ('cancel006-4567-e89b-12d3-a456-427006', 'book016-4567-e89b-12d3-a456-42667016', 'host', 'Booking canceled by host due to maintenance work.', 150.00, NOW(), NULL),
    ('cancel007-4567-e89b-12d3-a456-427007', 'book017-4567-e89b-12d3-a456-42667017', 'guest', 'Canceled due to personal reasons.', 0.00, NOW(), NULL),
    ('cancel008-4567-e89b-12d3-a456-427008', 'book018-4567-e89b-12d3-a456-42667018', 'host', 'Host canceled the booking due to overbooking.', 50.00, NOW(), NULL),
    ('cancel009-4567-e89b-12d3-a456-427009', 'book019-4567-e89b-12d3-a456-42667019', 'guest', 'Guest found alternative accommodation.', 0.00, NOW(), NULL),
    ('cancel010-4567-e89b-12d3-a456-427010', 'book020-4567-e89b-12d3-a456-42667020', 'host', 'Canceled due to unexpected property issues.', 100.00, NOW(), NULL)
ON DUPLICATE KEY UPDATE
    booking_id = VALUES(booking_id),
    cancelled_by = VALUES(cancelled_by),
    cancel_reason = VALUES(cancel_reason),
    cancel_fee = VALUES(cancel_fee),
    cancel_at = NOW(),
    deleted_at = VALUES(deleted_at);


-- insert for Payment table
INSERT INTO Payment (
    payment_id, booking_id, amount, pay_method_id, transaction_id, status, payment_date, created_at, updated_at, deleted_at
)
VALUES
    ('a8094567-e89b-12d3-a456-426614174001', 'book011-4567-e89b-12d3-a456-42667011', 200.00, 'method001-e89b-12d3-a456-42661417001', 'txn001', 'completed', NOW(), NOW(), NOW(), NULL),
    ('a8094567-e89b-12d3-a456-426614174002', 'book012-4567-e89b-12d3-a456-42667012', 150.00, 'method002-e89b-12d3-a456-42661417002', 'txn002', 'completed', NOW(), NOW(), NOW(), NULL),
    ('a8094567-e89b-12d3-a456-426614174003', 'book013-4567-e89b-12d3-a456-42667013', 180.00, 'method003-e89b-12d3-a456-42661417003', 'txn003', 'completed', NOW(), NOW(), NOW(), NULL),
    ('a8094567-e89b-12d3-a456-426614174004', 'book014-4567-e89b-12d3-a456-42667014', 120.00, 'method001-e89b-12d3-a456-42661417001', 'txn004', 'failed', NOW(), NOW(), NOW(), NULL),
    ('a8094567-e89b-12d3-a456-426614174005', 'book015-4567-e89b-12d3-a456-42667015', 250.00, 'method002-e89b-12d3-a456-42661417002', 'txn005', 'pending', NOW(), NOW(), NOW(), NULL),
    ('a8094567-e89b-12d3-a456-426614174006', 'book016-4567-e89b-12d3-a456-42667016', 220.00, 'method003-e89b-12d3-a456-42661417003', 'txn006', 'completed', NOW(), NOW(), NOW(), NULL),
    ('a8094567-e89b-12d3-a456-426614174007', 'book017-4567-e89b-12d3-a456-42667017', 160.00, 'method001-e89b-12d3-a456-42661417001', 'txn007', 'completed', NOW(), NOW(), NOW(), NULL),
    ('a8094567-e89b-12d3-a456-426614174008', 'book018-4567-e89b-12d3-a456-42667018', 190.00, 'method002-e89b-12d3-a456-42661417002', 'txn008', 'failed', NOW(), NOW(), NOW(), NULL),
    ('a8094567-e89b-12d3-a456-426614174009', 'book019-4567-e89b-12d3-a456-42667019', 210.00, 'method003-e89b-12d3-a456-42661417003', 'txn009', 'completed', NOW(), NOW(), NOW(), NULL),
    ('a8094567-e89b-12d3-a456-426614174010', 'book020-4567-e89b-12d3-a456-42667020', 230.00, 'method001-e89b-12d3-a456-42661417001', 'txn010', 'pending', NOW(), NOW(), NOW(), NULL)
ON DUPLICATE KEY UPDATE
    booking_id = VALUES(booking_id),
    amount = VALUES(amount),
    pay_method_id = VALUES(pay_method_id),
    transaction_id = VALUES(transaction_id),
    status = VALUES(status),
    payment_date = VALUES(payment_date),
    updated_at = NOW(),
    deleted_at = VALUES(deleted_at);


-- Insert data into CouponUsage table
INSERT INTO CouponUsage (
    coupon_usage_id, coupon_id, user_id, property_id, booking_id, used_at
)
VALUES
    ('cusage001-e89b-12d3-a456-42661417001', 'coup010-4567-e89b-12d3-a456-42667010', '123e4567-e89b-12d3-a456-426614174000', 'prop001-4567-e89b-12d3-a456-42667001', 'book011-4567-e89b-12d3-a456-42667011', NOW()),
    ('cusage002-e89b-12d3-a456-42661417002', 'coup009-4567-e89b-12d3-a456-42667009', '901e4567-e89b-12d3-a456-426614174000', 'prop002-4567-e89b-12d3-a456-42667002', 'book012-4567-e89b-12d3-a456-42667012', NOW()),
    ('cusage003-e89b-12d3-a456-42661417003', 'coup009-4567-e89b-12d3-a456-42667009', '012e4567-e89b-12d3-a456-426614174000', 'prop003-4567-e89b-12d3-a456-42667003', 'book013-4567-e89b-12d3-a456-42667013', NOW()),
    ('cusage004-e89b-12d3-a456-42661417004', 'coup009-4567-e89b-12d3-a456-42667009', '345e4567-e89b-12d3-a456-426614174000', 'prop004-4567-e89b-12d3-a456-42667004', 'book014-4567-e89b-12d3-a456-42667014', NOW()),
    ('cusage005-e89b-12d3-a456-42661417005', 'coup009-4567-e89b-12d3-a456-42667009', '014e4567-e89b-12d3-a456-426614174000', 'prop005-4567-e89b-12d3-a456-42667005', 'book015-4567-e89b-12d3-a456-42667015', NOW())
ON DUPLICATE KEY UPDATE
    coupon_id = VALUES(coupon_id),
    user_id = VALUES(user_id),
    property_id = VALUES(property_id),
    booking_id = VALUES(booking_id),
    used_at = NOW();

-- Insert data into Message table
INSERT INTO Message (
    message_id, sender_id, recipient_id, message_body, sent_at, read_at, deleted_at
)
VALUES
    ('msg001-e89b-12d3-a456-42661417001', '123e4567-e89b-12d3-a456-426614174000', '234e4567-e89b-18d3-a478-426614174000', 'Hello Jane, how are you?', NOW(), NULL, NULL),
    ('msg002-e89b-12d3-a456-42661417002', '234e4567-e89b-18d3-a478-426614174000', '123e4567-e89b-12d3-a456-426614174000', 'I am doing well, John! How about you?', NOW(), NULL, NULL),
    ('msg003-e89b-12d3-a456-42661417003', '345e4567-e89b-12d3-a456-426614174000', '456e4567-e89b-12d3-a456-426614174000', 'Hey Alice, I wanted to ask about the new features.', NOW(), NULL, NULL),
    ('msg004-e89b-12d3-a456-42661417004', '456e4567-e89b-12d3-a456-426614174000', '345e4567-e89b-12d3-a456-426614174000', 'Sure, Bob! I can explain them to you in detail.', NOW(), NULL, NULL),
    ('msg005-e89b-12d3-a456-42661417005', '567e4567-e89b-12d3-a456-426614174000', '678e4567-e89b-12d3-a456-426614174000', 'Emily, I would like to confirm our meeting for tomorrow.', NOW(), NULL, NULL),
    ('msg006-e89b-12d3-a456-42661417006', '678e4567-e89b-12d3-a456-426614174000', '567e4567-e89b-12d3-a456-426614174000', 'Yes, David, it’s confirmed! See you tomorrow.', NOW(), NULL, NULL),
    ('msg007-e89b-12d3-a456-42661417007', '789e4567-e89b-12d3-a456-426614174000', '890e4567-e89b-12d3-a456-426614174000', 'Olivia, can you send me the report by today?', NOW(), NULL, NULL),
    ('msg008-e89b-12d3-a456-42661417008', '890e4567-e89b-12d3-a456-426614174000', '789e4567-e89b-12d3-a456-426614174000', 'I will get it to you soon, Michael!', NOW(), NULL, NULL),
    ('msg009-e89b-12d3-a456-42661417009', '901e4567-e89b-12d3-a456-426614174000', '012e4567-e89b-12d3-a456-426614174000', 'Sophia, I need your feedback on this project.', NOW(), NULL, NULL),
    ('msg010-e89b-12d3-a456-42661417010', '012e4567-e89b-12d3-a456-426614174000', '901e4567-e89b-12d3-a456-426614174000', 'I will review it and send my comments soon.', NOW(), NULL, NULL),
    ('msg011-e89b-12d3-a456-42661417011', '013e4567-e89b-12d3-a456-426614174000', '014e4567-e89b-12d3-a456-426614174000', 'Emma, I have a question about your last update.', NOW(), NULL, NULL),
    ('msg012-e89b-12d3-a456-42661417012', '014e4567-e89b-12d3-a456-426614174000', '013e4567-e89b-12d3-a456-426614174000', 'I’ll clarify it right away, James!', NOW(), NULL, NULL),
    ('msg013-e89b-12d3-a456-42661417013', '015e4567-e89b-12d3-a456-426614174000', '123e4567-e89b-12d3-a456-426614174017', 'Madison, how’s the new project going?', NOW(), NULL, NULL),
    ('msg014-e89b-12d3-a456-42661417014', '123e4567-e89b-12d3-a456-426614174017', '015e4567-e89b-12d3-a456-426614174000', 'It’s going great! Thanks for asking, Daniel.', NOW(), NULL, NULL)

ON DUPLICATE KEY UPDATE
     message_body = VALUES(message_body),
     sent_at = VALUES(sent_at),
     read_at = VALUES(read_at),
     deleted_at = VALUES(deleted_at);

-- Insert data into Notification table
INSERT INTO Notification (
    notification_id, user_id, message, is_read, event_type, created_at, expiration_time, deleted_at
)
VALUES
    ('notif001-e89b-12d3-a456-42661417001', '123e4567-e89b-12d3-a456-426614174000', 'Your booking has been confirmed, John!', FALSE, 'booking_confirmation', NOW(), NULL, NULL),
    ('notif002-e89b-12d3-a456-42661417002', '234e4567-e89b-18d3-a478-426614174000', 'Your payment has been successfully processed, Jane.', FALSE, 'payment_update', NOW(), NULL, NULL),
    ('notif003-e89b-12d3-a456-42661417003', '345e4567-e89b-12d3-a456-426614174000', 'Hello Bob, we have an update for you regarding your account.', FALSE, 'general_alert', NOW(), NULL, NULL),
    ('notif004-e89b-12d3-a456-42661417004', '456e4567-e89b-12d3-a456-426614174000', 'Alice, there is a new feature available for your account.', FALSE, 'general_alert', NOW(), NULL, NULL),
    ('notif005-e89b-12d3-a456-42661417005', '567e4567-e89b-12d3-a456-426614174000', 'David, your payment update has been completed successfully.', FALSE, 'payment_update', NOW(), NULL, NULL),
    ('notif006-e89b-12d3-a456-42661417006', '678e4567-e89b-12d3-a456-426614174000', 'Reminder: Your booking confirmation for tomorrow is pending, Emily.', FALSE, 'booking_confirmation', NOW(), NULL, NULL),
    ('notif007-e89b-12d3-a456-42661417007', '789e4567-e89b-12d3-a456-426614174000', 'Michael, please review your recent payment details.', FALSE, 'payment_update', NOW(), NULL, NULL),
    ('notif008-e89b-12d3-a456-42661417008', '890e4567-e89b-12d3-a456-426614174000', 'Olivia, your recent booking has been confirmed!', FALSE, 'booking_confirmation', NOW(), NULL, NULL),
    ('notif009-e89b-12d3-a456-42661417009', '901e4567-e89b-12d3-a456-426614174000', 'William, you have a new general alert awaiting you.', FALSE, 'general_alert', NOW(), NULL, NULL),
    ('notif010-e89b-12d3-a456-42661417010', '012e4567-e89b-12d3-a456-426614174000', 'Sophia, your account has received an update.', FALSE, 'general_alert', NOW(), NULL, NULL),
    ('notif011-e89b-12d3-a456-42661417011', '013e4567-e89b-12d3-a456-426614174000', 'James, we have confirmed your booking!', FALSE, 'booking_confirmation', NOW(), NULL, NULL),
    ('notif012-e89b-12d3-a456-42661417012', '014e4567-e89b-12d3-a456-426614174000', 'Emma, your recent payment has been processed.', FALSE, 'payment_update', NOW(), NULL, NULL),
    ('notif013-e89b-12d3-a456-42661417013', '015e4567-e89b-12d3-a456-426614174000', 'Daniel, you have a new general alert. Please check your notifications.', FALSE, 'general_alert', NOW(), NULL, NULL),
    ('notif014-e89b-12d3-a456-42661417014', '123e4567-e89b-12d3-a456-426614174017', 'Madison, we have updated your booking details.', FALSE, 'booking_confirmation', NOW(), NULL, NULL)

ON DUPLICATE KEY UPDATE
     message = VALUES(message),
     is_read = VALUES(is_read),
     event_type = VALUES(event_type),
     created_at = VALUES(created_at),
     expiration_time = VALUES(expiration_time),
     deleted_at = VALUES(deleted_at);


-- Insert data into PropertyImages table
INSERT INTO PropertyImages (
    image_id, property_id, image_url, alt_text, image_type, created_at, updated_at, deleted_at
)
VALUES
    ('img001-e89b-12d3-a456-42661417001', 'prop001-4567-e89b-12d3-a456-42667001', 'https://example.com/images/prop001_main.jpg', 'Main view of property 001', 'main', NOW(), NOW(), NULL),
    ('img002-e89b-12d3-a456-42661417002', 'prop001-4567-e89b-12d3-a456-42667001', 'https://example.com/images/prop001_gallery1.jpg', 'Gallery image 1 for property 001', 'gallery', NOW(), NOW(), NULL),
    ('img003-e89b-12d3-a456-42661417003', 'prop001-4567-e89b-12d3-a456-42667001', 'https://example.com/images/prop001_thumbnail.jpg', 'Thumbnail image of property 001', 'thumbnail', NOW(), NOW(), NULL),
    ('img004-e89b-12d3-a456-42661417004', 'prop002-4567-e89b-12d3-a456-42667002', 'https://example.com/images/prop002_main.jpg', 'Main view of property 002', 'main', NOW(), NOW(), NULL),
    ('img005-e89b-12d3-a456-42661417005', 'prop002-4567-e89b-12d3-a456-42667002', 'https://example.com/images/prop002_gallery1.jpg', 'Gallery image 1 for property 002', 'gallery', NOW(), NOW(), NULL),
    ('img006-e89b-12d3-a456-42661417006', 'prop002-4567-e89b-12d3-a456-42667002', 'https://example.com/images/prop002_thumbnail.jpg', 'Thumbnail image of property 002', 'thumbnail', NOW(), NOW(), NULL),
    ('img007-e89b-12d3-a456-42661417007', 'prop003-4567-e89b-12d3-a456-42667003', 'https://example.com/images/prop003_main.jpg', 'Main view of property 003', 'main', NOW(), NOW(), NULL),
    ('img008-e89b-12d3-a456-42661417008', 'prop003-4567-e89b-12d3-a456-42667003', 'https://example.com/images/prop003_gallery1.jpg', 'Gallery image 1 for property 003', 'gallery', NOW(), NOW(), NULL),
    ('img009-e89b-12d3-a456-42661417009', 'prop003-4567-e89b-12d3-a456-42667003', 'https://example.com/images/prop003_thumbnail.jpg', 'Thumbnail image of property 003', 'thumbnail', NOW(), NOW(), NULL),
    ('img010-e89b-12d3-a456-42661417010', 'prop004-4567-e89b-12d3-a456-42667004', 'https://example.com/images/prop004_main.jpg', 'Main view of property 004', 'main', NOW(), NOW(), NULL),
    ('img011-e89b-12d3-a456-42661417011', 'prop004-4567-e89b-12d3-a456-42667004', 'https://example.com/images/prop004_gallery1.jpg', 'Gallery image 1 for property 004', 'gallery', NOW(), NOW(), NULL),
    ('img012-e89b-12d3-a456-42661417012', 'prop004-4567-e89b-12d3-a456-42667004', 'https://example.com/images/prop004_thumbnail.jpg', 'Thumbnail image of property 004', 'thumbnail', NOW(), NOW(), NULL)

ON DUPLICATE KEY UPDATE
     image_url = VALUES(image_url),
     alt_text = VALUES(alt_text),
     image_type = VALUES(image_type),
     created_at = VALUES(created_at),
     updated_at = VALUES(updated_at),
     deleted_at = VALUES(deleted_at);
