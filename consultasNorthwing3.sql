--Subconsultas

-- Obtener los productos cuyo precio unitario sea mayor al precio promedio de la tabla de productos
SELECT product_id, product_name, unit_price FROM products WHERE unit_price > (SELECT AVG(unit_price) AS MediaPrecio FROM products);

-- Obtener los productos cuya cantidad en stock sea menor al promedio de cantidad en stock de toda la tabla de productos.
SELECT product_id, product_name, units_in_stock FROM products WHERE units_in_stock <(SELECT AVG(units_in_stock) AS MediaPrecio FROM products);

-- Obtener los productos cuya cantidad en Inventario (UnitsInStock) sea menor a la cantidad mínima del detalle de ordenes (Order Details)
SELECT * FROM products WHERE units_in_stock < (SELECT MIN(quantity) FROM order_details);

--OBTENER LOS PRODUCTOS CUYA CATEGORIA SEA IGUAL A LAS CATEGORIAS DE LOS PRODUCTOS CON PROVEEDOR 1.
SELECT * FROM products WHERE category_id IN ( SELECT DISTINCT category_id FROM products WHERE supplier_id = 1);

-- Subconsultas correlacionadas 

--Obtener el número de empleado y el apellido para aquellos empleados que tengan menos de 100 ordenes.
SELECT employee_id, last_name FROM employees WHERE employee_id IN (SELECT employee_id FROM orders GROUP BY employee_id HAVING COUNT(employee_id) < 100);

--Obtener la clave de cliente y el nombre de la empresa para aquellos clientes que tengan más de 20 ordenes
SELECT customers.customer_id, company_name FROM customers JOIN orders ON customers.customer_id = orders.customer_id GROUP BY customers.customer_id, company_name HAVING COUNT(order_id) > 20;

--Obtener el productoid, el nombre del producto, el proveedor de la tabla de productos para aquellos productos que se hayan vendido menos de 100 unidades (Consultarlo en la tabla de Orders details).
SELECT product_id, product_name, supplier_id FROM products WHERE product_id IN (
	SELECT product_id
    FROM order_details
    GROUP BY product_id
    HAVING SUM(quantity) < 100
);

--Obtener los datos del empleado IDEmpleado y nombre completo De aquellos que tengan mas de 100 ordenes

SELECT employees.employee_id, CONCAT(first_name, ' ', last_name) AS NombreCompleto FROM employees JOIN orders ON employees.employee_id = orders.employee_id GROUP BY employees.employee_id HAVING COUNT(order_id) > 100;
--Obtener los datos de Producto ProductId, ProductName, UnitsinStock, UnitPrice (Tabla Products) de los productos que la sumatoria de la cantidad (Quantity) de orders details sea mayor a 450
SELECT products.product_id, product_name, units_in_stock, products.unit_price FROM products INNER JOIN order_details ON products.product_id = order_details.product_id
GROUP BY products.product_id, product_name, units_in_stock, products.unit_price HAVING SUM(quantity) > 450;

--Obtener la clave de cliente y el nombre de la empresa para aquellos clientes que tengan más de 20 ordenes.
SELECT customers.customer_id, customers.company_name FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, company_name
HAVING COUNT(*) > 20;



--insert

--Insertar un registro en la tabla de Categorias, únicamente se quiere insertar la información del CategoryName y la descripción los Papelería y papelería escolar
INSERT INTO categories (category_name, description)
VALUES ('Papelería', 'Papeleria');

--Dar de alta un producto con Productname, SupplierId, CategoryId, UnitPrice, UnitsInStock Como esta tabla tiene dos clave foraneas hay que ver los datos a dar de alta
--Dar de alta un empleado con LastName, FistName, Title, BrithDate
--Dar de alta una orden, CustomerId, Employeeid, Orderdate, ShipVia Como esta tabla tiene dos clave foraneas hay que ver los datos a dar de alta
--Dar de alta un Order details, con todos los datos

--update

-- Cambiar el CategoryName a Verduras de la categoria 10
UPDATE categories
SET category_name = 'Verduras'
WHERE category_id = 10;

-- Actualizar los precios de la tabla de Productos para incrementarlos un 10%
UPDATE products
SET unit_price = unit_price * 1.1;

--ACTUALIZAR EL PRODUCTNAME DEL PRODUCTO 80 A ZANAHORIA ECOLOGICA
UPDATE products
SET product_name='Zanahoria Ecologica'
WHERE product_id=80;
--ACTUALIZAR EL FIRSTNAME DEL EMPLOYEE 10 A ROSARIO 
UPDATE employees
SET first_name='Rosario'
WHERE employee_id=10;
--ACTUALIZAR EL ORDERS DETAILS DE LA 11079 PARA QUE SU CANTIDAD SEA 10
UPDATE order_details
SET quantity=10
WHERE order_id=11079;
--Delete

--diferencia entre delete y truncate
--BORRAR EL EMPLEADO 10
DELETE FROM employees WHERE employee_id = 10;
