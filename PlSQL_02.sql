DO $$
DECLARE
    numero INTEGER := 7; --Tabla de multiplicar del 7	
BEGIN
    FOR i IN 1..10 LOOP --Bucle for desde 1 hasta 10
        RAISE NOTICE '% x % = %', numero, i, numero*i; --Muestra cada una de las operaciones
    END LOOP;
END $$;
