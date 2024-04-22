BEGIN;

-- Создание новой роли 
CREATE ROLE observer WITH LOGIN PASSWORD 'observerpass321';

-- Предоставление прав на использование схемы public и чтение данных
GRANT USAGE ON SCHEMA public TO observer;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO observer;

COMMIT;
