--parametro de entrada
--Obtener el numero de ordenes por empleado

CREATE OR REPLACE FUNCTION orders_by_employee(num_id int) RETURNS INTEGER AS $$
DECLARE ordenes INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO ordenes
    FROM orders
	WHERE employee_id=num_id;
    RETURN ordenes;
END;
$$ LANGUAGE plpgsql;
SELECT orders_by_employee(1);

--Obtener la venta de un empleado con un determinado producto
CREATE OR REPLACE FUNCTION sales_by_employee(num_emp int, num_prod int) RETURNS INTEGER AS $$
DECLARE ventas INTEGER;
BEGIN
    SELECT SUM(quantity)
    INTO ventas
    FROM order_details
    WHERE order_id IN (
        SELECT order_id
        FROM orders
		WHERE employee_id=num_emp
	)AND product_id=num_prod;
    RETURN ventas;
END;
$$ LANGUAGE plpgsql;
SELECT sales_by_employee(2,1);