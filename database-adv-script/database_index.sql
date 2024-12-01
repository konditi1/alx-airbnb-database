--user table
-- index for email column used in login and search
CREATE UNIQUE INDEX idx_user_email ON User(email);

-- index for role column used in admin views
CREATE INDEX idx_user_role ON User(role);

-- booking table
-- Frequently joined with the User table and filtered by user-specific queries.
CREATE INDEX idx_booking_user_id ON Booking(user_id);


-- index for fetching bookings within a date range
CREATE INDEX idx_booking_date_range ON Booking(start_date, end_date);


-- index for fetching bookings for a specific property
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- property table

-- Frequently joined with a Location table and filtered by location.
CREATE INDEX idx_property_location_id ON Property(location_id);

-- Frequently filtered by price.
CREATE INDEX idx_property_price_per_night ON Property(price_per_night);
