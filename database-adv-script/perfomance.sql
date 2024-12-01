
-- A query that retrieves all bookings along with the user details, property details, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.price_per_night,
    p.availability_status,
    pm.payment_id,
    pm.status,
    pm.amount AS payment_amount
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id
INNER JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pm ON b.booking_id = pm.booking_id;

EXPLAIN 
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.price_per_night,
    p.availability_status,
    pm.payment_id,
    pm.status,
    pm.amount AS payment_amount
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id
INNER JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pm ON b.booking_id = pm.booking_id;


SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.price_per_night,
    p.availability_status,
    pm.payment_id,
    pm.status AS payment_status,
    pm.amount AS payment_amount
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id
INNER JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    (
        SELECT booking_id, payment_id, status, amount
        FROM Payment
        WHERE status IS NOT NULL  
    ) pm ON b.booking_id = pm.booking_id
WHERE 
    b.booking_status != 'canceled';

EXPLAIN 
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.booking_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.price_per_night,
    p.availability_status,
    pm.payment_id,
    pm.status AS payment_status,
    pm.amount AS payment_amount
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id
INNER JOIN  
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    (
        SELECT booking_id, payment_id, status, amount
        FROM Payment
        WHERE status IS NOT NULL  
    ) pm ON b.booking_id = pm.booking_id    
WHERE 
    b.booking_status != 'canceled';