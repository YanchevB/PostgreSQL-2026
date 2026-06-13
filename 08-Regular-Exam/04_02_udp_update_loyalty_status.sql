-- Procedure: CALL udp_update_loyalty_status(4) flipped only customer 31
CREATE OR REPLACE PROCEDURE udp_update_loyalty_status(min_orders INT)
AS
$$
BEGIN
    UPDATE customers
    SET loyalty_card = TRUE
    WHERE id IN (
        SELECT customer_id
        FROM orders
        GROUP BY customer_id
        HAVING COUNT(id) >= min_orders
    );
END;
$$ LANGUAGE plpgsql;