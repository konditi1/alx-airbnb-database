-- database_index.sql

-- User Table
-- Index for email column used in login and search
CREATE UNIQUE INDEX idx_user_email ON User(email);

-- Index for role column used in admin views
CREATE INDEX idx_user_role ON User(role);

-- Booking Table
-- Index for frequently joined queries with the User table
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index for fetching bookings within a date range
CREATE INDEX idx_booking_date_range ON Booking(start_date, end_date);

-- Index for fetching bookings for a specific property
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Property Table
-- Index for frequently joined queries with a Location table and filtered by location
CREATE INDEX idx_property_location_id ON Property(location_id);

-- Index for filtering by price
CREATE INDEX idx_property_price_per_night ON Property(price_per_night);

-- Measuring Query Performance: Add EXPLAIN and EXPLAIN ANALYZE checks
-- Example 1: Before adding an index on Booking(user_id)
EXPLAIN 
SELECT * 
FROM Booking 
WHERE user_id = 'U1';

-- Example 2: After adding an index on Booking(user_id)
EXPLAIN ANALYZE
SELECT * 
FROM Booking 
WHERE user_id = 'U1';

-- Example 3: Before adding an index on Booking(start_date, end_date)
EXPLAIN 
SELECT * 
FROM Booking 
WHERE start_date >= '2024-01-01' AND end_date <= '2024-01-31';

-- Example 4: After adding an index on Booking(start_date, end_date)
EXPLAIN ANALYZE
SELECT * 
FROM Booking 
WHERE start_date >= '2024-01-01' AND end_date <= '2024-01-31';

-- Example 5: Before adding an index on Property(location_id)
EXPLAIN 
SELECT * 
FROM Property 
WHERE location_id = 'L123';

-- Example 6: After adding an index on Property(location_id)
EXPLAIN ANALYZE
SELECT * 
FROM Property 
WHERE location_id = 'L123';

-- Example 7: Before adding an index on Property(price_per_night)
EXPLAIN 
SELECT * 
FROM Property 
WHERE price_per_night > 100;