--función sin parametro de entrada para devolver el precio máximo
CREATE OR REPLACE FUNCTION max_price() RETURNS NUMERIC AS $$
DECLARE max_price NUMERIC;
BEGIN
	SELECT MAX(unit_price)
	INTO max_price
	FROM products;
	RETURN max_price;
END;
$$ LANGUAGE plpgsql;
SELECT max_price();


