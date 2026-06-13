-- Insert (rows 64,70-73 matched example exactly)
INSERT INTO items (name, quantity, price, description, brand_id, classification_id)
SELECT
    CONCAT('Item', r.created_at),
    r.customer_id,
    r.rating * 5,
    NULL,
    r.item_id,
    (SELECT MIN(item_id) FROM reviews)
FROM reviews AS r
ORDER BY r.item_id
LIMIT 10;