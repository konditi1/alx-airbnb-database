

-- A query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.booking_status,
    b.payment_status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.role
FROM 
    Booking b
INNER JOIN
    User u 
    USING (user_id);
/*
ON
    b.user_id = u.user_id;
*/

-- A query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
SELECT
    p.property_id,
    p.name AS property_name,
    p.description AS property_description,
    p.price_per_night,
    p.availability_status,
    r.review_id,
    r.rating,
    r.comment,
    r.reviewed_by,
    r.created_at AS review_created_on,
    r.updated_at AS review_updated_on
FROM 
    Property p
LEFT JOIN
    Review r 
    USING (property_id)
ORDER BY
    r.rating DESC;

-- A query using a FULL OUTER JOIN to retrieve all users and all bookings,
-- even if the user has no booking or a booking is not linked to a user.
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.role,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.booking_status,
    b.payment_status
FROM 
    User u
LEFT JOIN
    Booking b 
USING (user_id)
UNION
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.role,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.booking_status,
    b.payment_status
FROM 
    User u
RIGHT JOIN
    Booking b 
USING (user_id);
