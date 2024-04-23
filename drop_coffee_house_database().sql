CREATE OR REPLACE FUNCTION drop_coffee_house_database()
RETURNS VOID AS $$
BEGIN
    -- Проверяем существование базы данных
    IF EXISTS(SELECT 1 FROM pg_database WHERE datname = 'coffee_house') THEN
        -- Удаляем базу данных
        EXECUTE 'DROP DATABASE coffee_house';
    END IF;
END;
$$ LANGUAGE plpgsql;
