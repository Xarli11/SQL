CREATE FUNCTION convertir_dolares_a_mn(dolares NUMERIC, cambio NUMERIC)
RETURNS NUMERIC AS $$
DECLARE
    mn NUMERIC;
BEGIN
    mn := dolares * cambio;
    RETURN mn;
END;
$$ LANGUAGE plpgsql;
SELECT convertir_dolares_a_mn(10,1.2); --Ejemplo practico