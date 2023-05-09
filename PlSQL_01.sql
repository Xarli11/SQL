DO $$
DECLARE
    nota integer := 4; 
BEGIN
    IF nota >= 9 THEN
        RAISE NOTICE 'La nota ingresada es A';
    ELSEIF nota >= 8 THEN
        RAISE NOTICE 'La nota ingresada es B';
    ELSEIF nota >= 7 THEN
        RAISE NOTICE 'La nota ingresada es C';
    ELSEIF nota >= 6 THEN
        RAISE NOTICE 'La nota ingresada es D';
    ELSEIF nota >= 5 THEN
        RAISE NOTICE 'La nota ingresada es E';
    ELSE
        RAISE NOTICE 'La nota ingresada es F';
    END IF;
END $$;
