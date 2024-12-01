
-- A  query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.role,
    COUNT(b.booking_id) AS total_bookings
FROM 
    User u
INNER JOIN
    Booking b
ON
    u.user_id = b.user_id
GROUP BY 
    u.user_id;

-- A window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.

SELECT 
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS row_number_rank,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank
FROM 
    Property p
LEFT JOIN 
    Booking b
ON 
    p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name;
