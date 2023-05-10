DO $$
DECLARE
    nota integer := 4,5; 
BEGIN
    IF nota >= 9 THEN
        RAISE NOTICE 'La nota es A';
    ELSEIF nota >= 8 THEN
        RAISE NOTICE 'La nota es B';
    ELSEIF nota >= 7 THEN
        RAISE NOTICE 'La nota es C';
    ELSEIF nota >= 6 THEN
        RAISE NOTICE 'La nota es D';
    ELSEIF nota >= 5 THEN
        RAISE NOTICE 'La nota es E';
    ELSE
        RAISE NOTICE 'La nota es F';
    END IF;
END $$;
