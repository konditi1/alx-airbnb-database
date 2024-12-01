
SELECT
    p.name,
    p.price_per_night,
    p.availability_status
FROM 
    Property p
WHERE
    p.property_id
IN
    (SELECT 
        r.property_id
    FROM
        Review r
    GROUP BY
        r.property_id
    HAVING
        AVG(r.rating) > 4.0
    );

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.role
FROM 
    User u
WHERE 
    (SELECT COUNT(*) 
     FROM Booking b 
     WHERE b.user_id = u.user_id) > 3;

