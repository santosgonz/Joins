-- write your queries here
SELECT o.id AS owner_id,
O.first_name, o.last_name,
v.id AS vehicle_id,
v.make, v.model, v.year, v.price
FROM owners o
FULL OUTER JOIN vehicles v ON o.id = v.owner_id
ORDER BY o.id, v.id

SELECT 
    o.first_name,
    o.last_name,
    COUNT(v.id) AS count
FROM 
    owners o
LEFT JOIN 
    vehicles v ON o.id = v.owner_id
GROUP BY 
    o.id, o.first_name, o.last_name
ORDER BY 
    o.first_name ASC;

SELECT 
    o.first_name, 
    o.last_name, 
    AVG(v.price) AS average_price, 
    COUNT(v.id) AS count
FROM 
    owners o 
JOIN
    vehicles v ON o.id = v.owner_id
GROUP BY 
    o.id, o.first_name, o.last_name
HAVING 
    AVG(v.price) > 10000 AND COUNT(v.id) > 1
ORDER BY 
    o.first_name DESC;