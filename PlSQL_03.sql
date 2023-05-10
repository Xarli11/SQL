CREATE FUNCTION convertir_dolares(dolares NUMERIC, cambio NUMERIC)
RETURNS NUMERIC AS $$
DECLARE
    moneda NUMERIC;
BEGIN
    moneda := dolares * cambio;
    RETURN moneda;
END;
$$ LANGUAGE plpgsql;
SELECT convertir_dolares(10,1.2); --Ejemplo practico