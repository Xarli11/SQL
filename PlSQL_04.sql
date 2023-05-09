CREATE FUNCTION calcular_cuota_frances(
    prestamo NUMERIC,
    duracion_meses INTEGER,
    tasa_interes INTEGER
) RETURNS NUMERIC AS $$
DECLARE
    cuota NUMERIC;
    i NUMERIC;
    base NUMERIC;
BEGIN
    i := tasa_interes / 12;
    base := (1 - (1 / (1 + i) ^ duracion_meses)) / i;
    cuota := prestamo / base;
    RETURN cuota;
END;
$$ LANGUAGE plpgsql;
SELECT calcular_cuota_frances(1000,1,0.01); --Ejemplo práctico
