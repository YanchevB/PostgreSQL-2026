-- Customers without Reviews
SELECT
    c.id AS customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,
    COUNT(o.id) AS total_orders,
    CASE WHEN c.loyalty_card THEN 'Loyal Customer' ELSE 'Regular Customer' END AS loyalty_status
FROM customers AS c
JOIN orders AS o ON o.customer_id = c.id
WHERE c.id NOT IN (SELECT customer_id FROM reviews)
GROUP BY c.id, c.first_name, c.last_name, c.loyalty_card
ORDER BY total_orders DESC, customer_id ASC;