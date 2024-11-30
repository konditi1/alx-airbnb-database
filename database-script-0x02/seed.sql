

-- Insert sample users into the User table
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
    ('016e4567-e89b-12d3-a456-426614174000', 'Mia', 'Hernandez', 'mia@example.com', 'hashedpassword123', '1111111111', 'guest', '2033-01-01 19:00:00', '2033-01-15 17:30:00', NULL),
    ('017e4567-e89b-12d3-a456-426614174000', 'Alexander', 'Lopez', 'alexander@example.com', 'hashedpassword456', '2222222222', 'guest', '2034-02-01 15:00:00', '2034-02-15 13:30:00', NULL),
    ('018e4567-e89b-12d3-a456-426614174000', 'Isabella', 'Gonzalez', 'isabella@example.com', 'hashedpassword789', '3333333333', 'guest', '2035-03-01 11:00:00', '2035-03-15 09:30:00', '2036-04-01 08:00:00'),
    ('019e4567-e89b-12d3-a456-426614174000', 'Ethan', 'Ramirez', 'ethan@example.com', 'hashedpassword012', '4444444444', 'guest', '2036-04-01 06:00:00', '2036-04-15 04:30:00', NULL),
    ('020e4567-e89b-12d3-a456-426614174000', 'Ava', 'Sanchez', 'ava@example.com', 'hashedpassword345', '5555555555', 'guest', '2037-05-01 02:00:00', '2037-05-15 00:30:00', NULL),
    ('021e4567-e89b-12d3-a456-426614174000', 'Noah', 'Torres', 'noah@example.com', 'hashedpassword678', '6666666666', 'guest', '2037-06-01 22:00:00', '2037-06-15 20:30:00', '2037-07-01 19:00:00'),
    ('022e4567-e89b-12d3-a456-426614174000', 'Sophia', 'Gutierrez', 'sophia@example.com', 'hashedpassword901', '7777777777', 'guest', '2037-07-01 17:00:00', '2037-07-15 15:30:00', NULL),
    ('023e4567-e89b-12d3-a456-426614174000', 'Liam', 'Hernandez', 'liam@example.com', 'hashedpassword234', '8888888888', 'guest', '2020-08-01 13:00:00', '2020-08-15 11:30:00', NULL),
    ('024e4567-e89b-12d3-a456-426614174000', 'Emma', 'Flores', 'emma@example.com', 'hashedpassword567', '9999999999', 'guest', '2021-09-01 09:00:00', '2021-09-15 07:30:00', NULL),
    ('025e4567-e89b-12d3-a456-426614174000', 'Oliver', 'Perez', 'oliver@example.com', 'hashedpassword890', '0000000000', 'guest', '2022-10-01 05:00:00', '2022-10-15 03:30:00', NULL),
    ('026e4567-e89b-12d3-a456-426614174000', 'Avery', 'Garcia', 'avery@example.com', 'hashedpassword923', '1111111111', 'host', '2023-11-01 01:00:00', '2023-11-15 23:30:00', '2024-12-01 22:00:00'),
    ('027e4567-e89b-12d3-a456-426614174000', 'Elijah', 'Lopez', 'elijah@example.com', 'hashedpassword456', '2222222222', 'guest', '2024-12-01 20:00:00', '2024-12-15 18:30:00', NULL),
    ('123e4567-e89b-12d3-a456-426614174017', 'Madison', 'Herrera', 'madison@example.com', 'hashedpassword789', '3333333333', 'host', '2025-01-01 16:00:00', '2025-01-15 14:30:00', '2026-02-01 13:00:00'),
    ('028e4567-e89b-12d3-a456-426614174000', 'Amelia', 'Martinez', 'amelia@example.com', 'hashedpassword789', '3333333333', 'guest', '2025-01-01 16:00:00', '2025-01-15 14:30:00', '2026-02-01 13:00:00');

    ON DUPLICATE KEY UPDATE updated_at = VALUES(updated_at), first_name = VALUES(first_name), last_name = VALUES(last_name);

-- Insert sample data for UserToken
INSERT INTO UserToken (token_id, user_id, token, token_expire_at, token_type, is_used, created_at, updated_at, deleted_at)
VALUES
    ('001e4567-e89b-12d3-a456-426614174000', '028e4567-e89b-12d3-a456-426614174000', 'token1', '2023-02-01 01:20:11', 'email_verification', FALSE, '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('002e4567-e89b-12d3-a456-426614174000', '027e4567-e89b-12d3-a456-426614174000', 'token2', '2023-05-01 12:00:00', 'password_reset', FALSE, '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('003e4567-e89b-12d3-a456-426614174000', '019e4567-e89b-12d3-a456-426614174000', 'token3', '2024-01-01 00:00:00', 'email_verification', FALSE, '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('004e4567-e89b-12d3-a456-426614174000', '901e4567-e89b-12d3-a456-426614174000', 'token4', '2023-11-01 15:10:00', 'password_reset', FALSE, '2023-01-01 00:00:00', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
    ('005e4567-e89b-12d3-a456-426614174000', '016e4567-e89b-12d3-a456-426614174000', 'token5', '2024-02-04 08:00:00', 'email_verification', FALSE, '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('006e4567-e89b-12d3-a456-426614174000', '789e4567-e89b-12d3-a456-426614174000', 'token6', '2024-01-01 23:00:00', 'password_reset', FALSE, '2023-01-01 00:00:00', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
    ('007e4567-e89b-12d3-a456-426614174000', '671e4567-e49b-12f3-a456-495945854000', 'token7', '2024-11-03 18:10:00', 'email_verification', FALSE, '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('008e4567-e89b-12d3-a456-426614174000', '021e4567-e89b-12d3-a456-426614174000', 'token8', '2024-06-04 13:08:00', 'password_reset', FALSE, '2023-01-01 00:00:00', '2023-01-01 00:00:00', '2023-01-01 00:00:00'),
    ('009e4567-e89b-12d3-a456-426614174000', '671e4567-e49b-12f3-a456-414214174000', 'token9', '2024-01-01 00:00:00', 'email_verification', FALSE, '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('a1b2c3d4-e5f6-7g8h-9i0j-k1l2m3n4o5p6', '017e4567-e89b-12d3-a456-426614174000', 'token_123', '2024-12-01 12:00:00', 'email_verification', FALSE, '2024-11-29 10:00:00', '2024-11-29 10:00:00', NULL),
    ('b2c3d4e5-f6g7-8h9i-0j1k-l2m3n4o5p6q7', '345e4567-e89b-12d3-a456-426614174000', 'token_456', '2024-12-02 15:00:00', 'password_reset', TRUE, '2024-11-28 09:30:00', '2024-11-28 11:00:00', '2024-11-28 11:00:00'),
    ('c3d4e5f6-g7h8-9i0j-1k2l-m3n4o5p6q7r8', '123e4567-e89b-12d3-a456-426614174000', 'token_789', '2024-11-30 18:00:00', 'password_reset', FALSE, '2024-11-27 14:00:00', '2024-11-27 14:00:00', NULL),
    ('d4e5f6g7-h8i9-0j1k-2l3m-n4o5p6q7r8s9', '015e4567-e89b-12d3-a456-426614174000', 'token_101', '2024-12-10 20:00:00', 'email_verification', FALSE, '2024-11-29 11:00:00', '2024-11-29 11:00:00', '2024-11-29 11:00:00');

    ON DUPLICATE KEY UPDATE updated_at = NOW(), token = VALUES(token), token_expire_at = VALUES(token_expire_at), token_type = VALUES(token_type), is_used = VALUES(is_used);


--insert into reviw tables

INSERT IGNORE  INTO Review (review_id, property_id, user_id, rating, comment, reviewed_by, created_at, updated_at, deleted_at)
VALUES
    ('rev123e4567-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174003', '123e4567-e89b-12d3-a456-426614174000', 4, 'Great place!', 'guest', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('rev124e5467-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174004', '234e4567-e89b-18d3-a478-426614174000', 5, 'Excellent!', 'host', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('rev125e4567-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174000', '345e4567-e89b-12d3-a456-426614174000', 3, 'Decent', 'guest', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('rev126e4567-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174001', '456e4567-e89b-12d3-a456-426614174000', 4, 'Good', 'host', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('rev127e4567-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174000', 5, 'Excellent', 'guest', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('rev128e4567-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174001',  '015e4567-e89b-12d3-a456-426614174000', 4, 'Good', 'host', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('rev129e4567-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174000', 5, 'Excellent', 'guest', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('rev130e4567-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174001', '015e4567-e89b-12d3-a456-426614174000', 4, 'Good', 'host', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL);

--insert into property tables
INSERT INTO Property (property_id, host_id, location_id, name, description, price_per_night, availabity_status, created_at, updated_at, deleted_at)
VALUES
    ('123e4567-e89b-12d3-a456-426614174003', '234e4567-e89b-18d3-a478-426614174000', 'loc123e4567-e89b-12d3-a456-426614174001', 'Beach House', 'A lovely beach house with ocean views.', 250.00, 'available', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('123e4567-e89b-12d3-a456-426614174004', '234e4567-e89b-18d3-a478-426614174000', 'loc123e4567-e89b-12d3-a456-426614174002', 'Mountain Cabin', 'A cozy cabin in the mountains.', 150.00, 'available', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('123e4567-e89b-12d3-a456-426614174000', '345e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426614174003', 'City Apartment', 'A modern apartment in the city center.', 200.00, 'unavailable', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('123e4567-e89b-12d3-a456-426614174001', '456e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426614174004', 'Lakeside Cottage', 'A charming lakeside cottage with a dock.', 300.00, 'available', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('123e4567-e89b-12d3-a456-426614174005', '567e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426614174005', 'Forest Retreat', 'A secluded retreat in the heart of the forest.', 180.00, 'available', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('123e4567-e89b-12d3-a456-426614174006', '678e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426614174006', 'Desert Oasis', 'A unique property surrounded by desert beauty.', 220.00, 'available', '2023-01-01 00:00:00', '2023-01-01 00:00:00','2024-01-01 00:00:00'),
    ('123e4567-e89b-12d3-a456-426614174007', '789e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426614174007', 'Urban Loft', 'A stylish loft in the downtown district.', 175.00, 'available', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('123e4567-e89b-12d3-a456-426614174008', '890e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426614174008', 'Island Bungalow', 'A cozy bungalow on a private island.', 350.00, 'available', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('123e4567-e89b-12d3-a456-426614174009', '901e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426614174009', 'Mountain Villa', 'A luxurious villa overlooking the mountains.', 400.00, 'available', '2023-01-01 00:00:00', '2023-01-01 00:00:00', '2024-01-01 00:00:00'),
    ('123e4567-e89b-12d3-a456-426614174010', '012e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426614174010', 'Country Farmhouse', 'A traditional farmhouse with modern amenities.', 120.00, 'available', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('123e4567-e89b-12d3-a456-426614174011', '013e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426614174011', 'Historic Cottage', 'A charming historic cottage in a quiet village.', 140.00, 'available', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('123e4567-e89b-12d3-a456-426614174012', '014e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426614174012', 'Lakeview Apartment', 'A modern apartment with stunning lake views.', 190.00, 'unavailable', '2023-01-01 00:00:00', '2023-01-01 00:00:00', '2024-01-01 00:00:00'),
    ('123e4567-e89b-12d3-a456-426614174013', '015e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426614174013', 'Seaside Villa', 'A grand villa on the coast with private beach access.', 450.00, 'available', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL),
    ('123e4567-e89b-12d3-a456-426614174014', '016e4567-e89b-12d3-a456-426614174000', 'loc123e4567-e89b-12d3-a456-426614174014', 'Penthouse Suite', 'An exclusive penthouse suite with panoramic city views.', 500.00, 'available', '2023-01-01 00:00:00', '2023-01-01 00:00:00', NULL);
ON DUBLICATE KEY UPDATE updated_at = NOW(), location_id = VALUES(location_id), availabity_status = VALUES(availabity_status), description = VALUES(description), price_per_night = VALUES(price_per_night), name = VALUES(name);

--insert locations
INSERT IGNORE INTO Location (location_id, latitude, longitude, city, state, country, created_at, updated_at, deleted_at)
VALUES
    ('loc123e4567-e89b-12d3-a456-426614174001', 37.7749, -122.4194, 'San Francisco', 'California', 'USA', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426614174002', 34.0522, -118.2437, 'Los Angeles', 'California', 'USA', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426614174003', 40.7128, -74.0060, 'New York City', 'New York', 'USA', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426614174004', 51.5074, -0.1278, 'London', 'England', 'United Kingdom', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426614174005', 48.8566, 2.3522, 'Paris', 'Île-de-France', 'France', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426614174006', 35.6895, 139.6917, 'Tokyo', NULL, 'Japan', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426614174007', -33.8688, 151.2093, 'Sydney', 'New South Wales', 'Australia', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426614174008', -23.5505, -46.6333, 'São Paulo', 'São Paulo', 'Brazil', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426614174009', 55.7558, 37.6173, 'Moscow', 'Moscow Oblast', 'Russia', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426614174010', 28.6139, 77.2090, 'New Delhi', 'Delhi', 'India', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426614174011', 19.4326, -99.1332, 'Mexico City', 'Distrito Federal', 'Mexico', NOW(), NOW(), NULL),
    ('loc123e4567-e89b-12d3-a456-426614174012', 41.8781, -87.6298, 'Chicago', 'Illinois', 'USA', NOW(), NOW(), NULL);

--insert bookings
INSERT IGNORE INTO Booking (
    booking_id, property_id, user_id, start_date, end_date, total_price, booking_status, payment_status, created_at, updated_at, deleted_at
)
VALUES
    ('book001-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174003', '123e4567-e89b-12d3-a456-426614174000', '2024-01-01', '2024-01-05', 1250.00, 'confirmed', 'paid', NOW(), NOW(), NULL),
    ('book002-e89b-12d3-a456-426614174002', '123e4567-e89b-12d3-a456-426614174004', '234e4567-e89b-18d3-a478-426614174000', '2024-02-01', '2024-02-07', 1050.00, 'pending', 'in_progress', NOW(), NOW(), NULL),
    ('book003-e89b-12d3-a456-426614174003', '123e4567-e89b-12d3-a456-426614174000', '345e4567-e89b-12d3-a456-426614174000', '2024-03-01', '2024-03-05', 600.00, 'cancelled', 'failed', NOW(), NOW(), NULL),
    ('book004-e89b-12d3-a456-426614174004', '123e4567-e89b-12d3-a456-426614174001', '456e4567-e89b-12d3-a456-426614174000', '2024-03-10', '2024-03-15', 1500.00, 'confirmed', 'paid', NOW(), NOW(), NULL),
    ('book005-e89b-12d3-a456-426614174005', '123e4567-e89b-12d3-a456-426614174005', '567e4567-e89b-12d3-a456-426614174000', '2024-04-01', '2024-04-05', 720.00, 'confirmed', 'paid', NOW(), NOW(), NULL),
    ('book006-e89b-12d3-a456-426614174006', '123e4567-e89b-12d3-a456-426614174006', '678e4567-e89b-12d3-a456-426614174000', '2024-04-10', '2024-04-12', 440.00, 'pending', 'in_progress', NOW(), NOW(), NULL),
    ('book007-e89b-12d3-a456-426614174007', '123e4567-e89b-12d3-a456-426614174017', '789e4567-e89b-12d3-a456-426614174000', '2024-05-01', '2024-05-05', 700.00, 'cancelled', 'failed', NOW(), NOW(), NULL),
    ('book008-e89b-12d3-a456-426614174008', '123e4567-e89b-12d3-a456-426614174008', '890e4567-e89b-12d3-a456-426614174000', '2024-06-01', '2024-06-07', 2100.00, 'confirmed', 'paid', NOW(), NOW(), NULL),
    ('book009-e89b-12d3-a456-426614174009', '123e4567-e89b-12d3-a456-426614174009', '901e4567-e89b-12d3-a456-426614174000', '2024-06-15', '2024-06-20', 2000.00, 'confirmed', 'paid', NOW(), NOW(), NULL),
    ('book010-e89b-12d3-a456-426614174010', '123e4567-e89b-12d3-a456-426614174010', '012e4567-e89b-12d3-a456-426614174000', '2024-07-01', '2024-07-05', 600.00, 'pending', 'in_progress', NOW(), NOW(), NULL);

--insert data into boockingCancellation table
INSERT IGNORE INTO BookingCancellation (
    cancellation_id, booking_id, cancelled_by, cancel_reason, cancel_fee, cancel_at, deleted_at
)
VALUES
    ('cancel001-e89b-12d3-a456-426614174001', 'book003-e89b-12d3-a456-426614174003', 'guest', 'Changed plans, cannot travel.', 20.00, '2024-03-01 10:00:00', NULL),
    ('cancel002-e89b-12d3-a456-426614174002', 'book007-e89b-12d3-a456-426614174007', 'host', 'Double-booked by mistake.', 0.00, '2024-05-01 15:30:00', NULL);

--insert data into payment table
INSERT IGNORE INTO Payment (
    payment_id, booking_id, amount, pay_method_id, transaction_id, status, payment_date, created_at, updated_at, deleted_at
)
VALUES
    ('pay001-e89b-12d3-a456-426614174001', 'book001-e89b-12d3-a456-426614174001', 1250.00, 'method001-e89b-12d3-a456-426614174001', 'txn001', 'completed', '2024-01-01 12:00:00', NOW(), NOW(), NULL),
    ('pay002-e89b-12d3-a456-426614174002', 'book002-e89b-12d3-a456-426614174002', 1050.00, 'method002-e89b-12d3-a456-426614174002', 'txn002', 'pending', '2024-02-01 14:00:00', NOW(), NOW(), NULL),
    ('pay003-e89b-12d3-a456-426614174003', 'book003-e89b-12d3-a456-426614174003', 600.00, 'method003-e89b-12d3-a456-426614174003', 'txn003', 'failed', '2024-03-01 16:00:00', NOW(), NOW(), NULL),
    ('pay004-e89b-12d3-a456-426614174004', 'book004-e89b-12d3-a456-426614174004', 1500.00, 'method001-e89b-12d3-a456-426614174001', 'txn004', 'completed', '2024-03-10 10:00:00', NOW(), NOW(), NULL),
    ('pay005-e89b-12d3-a456-426614174005', 'book005-e89b-12d3-a456-426614174005', 720.00, 'method002-e89b-12d3-a456-426614174002', 'txn005', 'completed', '2024-04-01 08:00:00', NOW(), NOW(), NULL),
    ('pay006-e89b-12d3-a456-426614174006', 'book006-e89b-12d3-a456-426614174006', 440.00, 'method003-e89b-12d3-a456-426614174003', 'txn006', 'pending', '2024-04-10 12:00:00', NOW(), NOW(), NULL),
    ('pay008-e89b-12d3-a456-426614174008', 'book008-e89b-12d3-a456-426614174008', 2100.00, 'method001-e89b-12d3-a456-426614174001', 'txn007', 'completed', '2024-06-01 14:00:00', NOW(), NOW(), NULL),
    ('pay009-e89b-12d3-a456-426614174009', 'book009-e89b-12d3-a456-426614174009', 2000.00, 'method002-e89b-12d3-a456-426614174002', 'txn008', 'completed', '2024-06-15 16:00:00', NOW(), NOW(), NULL);


--insert data into payment_method table
INSERT IGNORE INTO PaymentMethod (
    pay_method_id, name, transaction_fee, currency_conversion, created_at, updated_at, deleted_at
)
VALUES
    ('method001-e89b-12d3-a456-426614174001', 'credit_card', 1.50, 1.00, NOW(), NOW(), NULL), -- Credit Card with minimal fees
    ('method002-e89b-12d3-a456-426614174002', 'paypal', 2.00, 1.00, NOW(), NOW(), NULL), -- PayPal with moderate fees
    ('method003-e89b-12d3-a456-426614174003', 'bank_transfer', 0.50, 1.00, NOW(), NOW(), NULL); -- Bank Transfer with low fees

insert data into message TABLE
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at, read_at, deleted_at)
VALUEs
    ('msg001-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174000', '234e4567-e89b-18d3-a478-426614174000', 'Hello, I am interested in your property!', '2024-01-01 10:00:00', '2024-01-01 12:00:00', NULL),
    ('msg002-e89b-12d3-a456-426614174002', '234e4567-e89b-18d3-a478-426614174000', '123e4567-e89b-12d3-a456-426614174000', 'Sure, let me know if you need more details.', '2024-01-01 13:00:00', NULL, NULL),
    ('msg003-e89b-12d3-a456-426614174003', '345e4567-e89b-12d3-a456-426614174000', '456e4567-e89b-12d3-a456-426614174000', 'Hi, can we schedule a visit?', '2024-01-02 09:00:00', NULL, NULL),
    ('msg004-e89b-12d3-a456-426614174004', '456e4567-e89b-12d3-a456-426614174000', '345e4567-e89b-12d3-a456-426614174000', 'Yes, I am available this weekend.', '2024-01-02 10:30:00', NULL, NULL),
    ('msg005-e89b-12d3-a456-426614174005', '567e4567-e89b-12d3-a456-426614174000', '678e4567-e89b-12d3-a456-426614174000', 'Is the property still available?', '2024-01-03 08:00:00', '2024-01-03 08:15:00', NULL),
    ('msg006-e89b-12d3-a456-426614174006', '678e4567-e89b-12d3-a456-426614174000', '567e4567-e89b-12d3-a456-426614174000', 'Yes, it is. Let me know your preferred dates.', '2024-01-03 08:30:00', NULL, NULL),
    ('msg007-e89b-12d3-a456-426614174007', '789e4567-e89b-12d3-a456-426614174000', '890e4567-e89b-12d3-a456-426614174000', 'Do you provide discounts for longer stays?', '2024-01-04 11:00:00', '2024-01-04 11:45:00', NULL),
    ('msg008-e89b-12d3-a456-426614174008', '890e4567-e89b-12d3-a456-426614174000', '789e4567-e89b-12d3-a456-426614174000', 'Yes, we offer discounts for stays longer than a week.', '2024-01-04 12:00:00', NULL, NULL),
    ('msg009-e89b-12d3-a456-426614174009', '901e4567-e89b-12d3-a456-426614174000', '012e4567-e89b-12d3-a456-426614174000', 'Can you confirm the booking details?', '2024-01-05 14:00:00', NULL, NULL),
    ('msg010-e89b-12d3-a456-426614174010', '012e4567-e89b-12d3-a456-426614174000', '901e4567-e89b-12d3-a456-426614174000', 'Yes, everything is confirmed. See you soon!', '2024-01-05 14:30:00', NULL, NULL);


-- Insert Notifications for Users
INSERT INTO Notification (notification_id, user_id, message, is_read, event_type, created_at, expiration_time, deleted_at)
VALUES
    -- Booking Notifications
    ('notif001-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174000', 'Your booking for the Beach House has been confirmed! Total Price: $1250.00', FALSE, 'booking_confirmation', NOW(), NULL, NULL),
    
    ('notif002-e89b-12d3-a456-426614174002', '234e4567-e89b-18d3-a478-426614174000', 'Your booking for the Mountain Cabin is pending. Please complete your payment to confirm.', FALSE, 'booking_confirmation', NOW(), NULL, NULL),
    
    ('notif003-e89b-12d3-a456-426614174003', '345e4567-e89b-12d3-a456-426614174000', 'Your booking for the City Apartment has been cancelled. We hope to welcome you again in the future.', TRUE, 'booking_confirmation', '2024-03-01', NULL, NULL),
    
    ('notif004-e89b-12d3-a456-426614174004', '456e4567-e89b-12d3-a456-426614174000', 'Booking cancellation for Lakeside Cottage has been processed. Cancellation fee: $50', TRUE, 'booking_confirmation', '2024-03-10', NULL, NULL),

    -- Payment Notifications
    ('notif005-e89b-12d3-a456-426614174005', '567e4567-e89b-12d3-a456-426614174000', 'Payment of $1250.00 successfully received for your Beach House booking. Thank you for using our service.', TRUE, 'payment_update', NOW(), NULL, NULL),
    
    ('notif006-e89b-12d3-a456-426614174006', '678e4567-e89b-12d3-a456-426614174000', 'Your payment for the Desert Oasis booking is still pending. Please complete it to avoid booking cancellation.', FALSE, 'payment_update', NOW(), '2024-04-01 23:59:59', NULL),
    
    ('notif007-e89b-12d3-a456-426614174007', '789e4567-e89b-12d3-a456-426614174000', 'We have received your payment of $700.00 for the Urban Loft booking. Enjoy your stay!', TRUE, 'payment_update', '2024-04-15', NULL, NULL),
    
    -- General Alerts (Examples: Promotional or System Alerts)
    ('notif008-e89b-12d3-a456-426614174008', '890e4567-e89b-12d3-a456-426614174000', 'Reminder: Your booking for the Island Bungalow is approaching! Enjoy your vacation.', FALSE, 'general_alert', NOW(), '2024-06-01', NULL),
    
    ('notif009-e89b-12d3-a456-426614174009', '901e4567-e89b-12d3-a456-426614174000', 'Special offer: Get 10% off your next booking with the code SAVE10. Offer expires soon!', FALSE, 'general_alert', NOW(), '2024-06-30', NULL),
    
    ('notif010-e89b-12d3-a456-426614174010', '012e4567-e89b-12d3-a456-426614174000', 'Your payment of $2000.00 for the Mountain Villa has been successfully processed.', TRUE, 'payment_update', NOW(), NULL, NULL);

-- Insert sample coupons into the Coupon table
INSERT IGNORE INTO Coupon (
    coupon_id, user_id, property_id, code, description, discount_type, discount_amount, 
    max_no_uses, valid_from, valid_to, created_at, updated_at, deleted_at
)
VALUES
    ('coup123e4567-e89b-12d3-a456-426614174000', '123e4567-e89b-12d3-a456-426614174000', NULL, 'SAVE20', 'Save 20% on your next stay', 'percentage', 20.00, 100, '2024-01-01 00:00:00', '2024-12-31 23:59:59', NOW(), NOW(), NULL),
    ('coup234e4567-e89b-12d3-a456-426614174001', '234e4567-e89b-18d3-a478-426614174000', '123e4567-e89b-12d3-a456-426614174003', 'FIFTYOFF', 'Get $50 off your booking', 'fixed_amount', 50.00, 50, '2024-01-01 00:00:00', '2024-06-30 23:59:59', NOW(), NOW(), NULL),
    ('coup345e4567-e89b-12d3-a456-426614174002', '345e4567-e89b-12d3-a456-426614174000', NULL, 'SUMMER25', 'Get 25% off your summer vacation', 'percentage', 25.00, 200, '2024-06-01 00:00:00', '2024-08-31 23:59:59', NOW(), NOW(), NULL),
    ('coup456e4567-e89b-12d3-a456-426614174003', '456e4567-e89b-12d3-a456-426614174000', '123e4567-e89b-12d3-a456-426614174004', 'EARLYBIRD', 'Get $30 off early bird booking', 'fixed_amount', 30.00, 150, '2024-02-01 00:00:00', '2024-03-31 23:59:59', NOW(), NOW(), NULL),
    ('coup567e4567-e89b-12d3-a456-426614174004', '567e4567-e89b-12d3-a456-426614174000', '123e4567-e89b-12d3-a456-426614174005', 'WINTER15', 'Get 15% off on winter bookings', 'percentage', 15.00, 120, '2024-11-01 00:00:00', '2024-12-31 23:59:59', NOW(), NOW(), NULL),
    ('coup678e4567-e89b-12d3-a456-426614174005', '678e4567-e89b-12d3-a456-426614174000', NULL, 'WELCOME10', 'Welcome 10% off for first-time users', 'percentage', 10.00, 500, '2024-01-01 00:00:00', '2024-12-31 23:59:59', NOW(), NOW(), NULL),
    ('coup789e4567-e89b-12d3-a456-426614174006', '789e4567-e89b-12d3-a456-426614174000', '123e4567-e89b-12d3-a456-426614174006', 'STAYLONGER', 'Get $100 off when booking 7+ days', 'fixed_amount', 100.00, 75, '2024-02-01 00:00:00', '2024-05-31 23:59:59', NOW(), NOW(), NULL),
    ('coup890e4567-e89b-12d3-a456-426614174007', '890e4567-e89b-12d3-a456-426614174000', '123e4567-e89b-12d3-a456-426614174007', 'FREEROOM', 'Get a free night when booking 5+ nights', 'fixed_amount', 0.00, 50, '2024-03-01 00:00:00', '2024-06-30 23:59:59', NOW(), NOW(), NULL),
    ('coup901e4567-e89b-12d3-a456-426614174008', '901e4567-e89b-12d3-a456-426614174000', '123e4567-e89b-12d3-a456-426614174008', 'EXTRA25', 'Get an extra 25% off your booking', 'percentage', 25.00, 300, '2024-04-01 00:00:00', '2024-06-30 23:59:59', NOW(), NOW(), NULL);

-- Insert data into the CouponUsage table
INSERT INTO CouponUsage (coupon_usage_id, coupon_id, user_id, property_id, booking_id, used_at)
VALUES
    ('coupon_usage_1', 'coupon_123e4567-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174000', '123e4567-e89b-12d3-a456-426614174003', 'book001-e89b-12d3-a456-426614174001', NOW()),
    ('coupon_usage_2', 'coupon_123e4567-e89b-12d3-a456-426614174002', '234e4567-e89b-18d3-a478-426614174000', '123e4567-e89b-12d3-a456-426614174004', 'book002-e89b-12d3-a456-426614174002', NOW()),
    ('coupon_usage_3', 'coupon_123e4567-e89b-12d3-a456-426614174003', '345e4567-e89b-12d3-a456-426614174000', '123e4567-e89b-12d3-a456-426614174005', 'book003-e89b-12d3-a456-426614174003', NOW()),
    ('coupon_usage_4', 'coupon_123e4567-e89b-12d3-a456-426614174004', '456e4567-e89b-12d3-a456-426614174000', '123e4567-e89b-12d3-a456-426614174006', 'book004-e89b-12d3-a456-426614174004', NOW()),
    ('coupon_usage_5', 'coupon_123e4567-e89b-12d3-a456-426614174005', '567e4567-e89b-12d3-a456-426614174000', '123e4567-e89b-12d3-a456-426614174007', 'book005-e89b-12d3-a456-426614174005', NOW());

-- Insert sample PropertyImages data into the PropertyImages table
INSERT INTO PropertyImages (image_id, property_id, image_url, alt_text, image_type, created_at, updated_at, deleted_at)
VALUES
    ('image_1e4567-e89b-12d3-a456-426614174001', '123e4567-e89b-12d3-a456-426614174003', 'https://example.com/image1.jpg', 'Main image of the beach house', 'main', NOW(), NOW(), NULL),
    ('image_2e4567-e89b-12d3-a456-426614174002', '123e4567-e89b-12d3-a456-426614174003', 'https://example.com/image2.jpg', 'Gallery image of the beach house', 'gallery', NOW(), NOW(), NULL),
    ('image_3e4567-e89b-12d3-a456-426614174003', '123e4567-e89b-12d3-a456-426614174004', 'https://example.com/image3.jpg', 'Thumbnail image of the mountain cabin', 'thumbnail', NOW(), NOW(), NULL),
    ('image_4e4567-e89b-12d3-a456-426614174004', '123e4567-e89b-12d3-a456-426614174004', 'https://example.com/image4.jpg', 'Gallery image of the mountain cabin', 'gallery', NOW(), NOW(), NULL),
    ('image_5e4567-e89b-12d3-a456-426614174005', '123e4567-e89b-12d3-a456-426614174005', 'https://example.com/image5.jpg', 'Main image of the forest retreat', 'main', NOW(), NOW(), NULL);
