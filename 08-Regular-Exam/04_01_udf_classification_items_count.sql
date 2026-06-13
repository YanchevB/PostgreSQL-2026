-- UDF: 'Nonexistent' -> No items found. | 'Laptops' -> Found 9 items.
CREATE OR REPLACE FUNCTION udf_classification_items_count(classification_name VARCHAR(30))
RETURNS VARCHAR
AS
$$
DECLARE
    items_count INT;
BEGIN
    SELECT COUNT(i.id)
    INTO items_count
    FROM items AS i
    JOIN classifications AS c ON i.classification_id = c.id
    WHERE c.name = classification_name;

    IF items_count = 0 THEN
        RETURN 'No items found.';
    END IF;
    RETURN CONCAT('Found ', items_count, ' items.');
END;
$$ LANGUAGE plpgsql;