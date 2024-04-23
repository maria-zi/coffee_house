CREATE OR REPLACE FUNCTION create_coffee_house_database()
RETURNS VOID AS $$
BEGIN
    EXECUTE 'CREATE DATABASE coffee_house';
END;
$$ LANGUAGE plpgsql;
