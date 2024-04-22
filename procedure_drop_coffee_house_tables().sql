CREATE OR REPLACE FUNCTION "public"."drop_coffee_house_tables"()
  RETURNS "pg_catalog"."void" AS $BODY$
BEGIN
-- Удаляем таблицу orders, если она существует
EXECUTE $$
DROP TABLE IF EXISTS supply;
$$;

-- Удаляем таблицу clients, если она существует
EXECUTE $$
DROP TABLE IF EXISTS ingredients;
$$;

-- Удаляем таблицу menu, если она существует
EXECUTE $$
DROP TABLE IF EXISTS order_staff;
$$;

-- Удаляем таблицу menu, если она существует
EXECUTE $$
DROP TABLE IF EXISTS delivery;
$$;

-- Удаляем таблицу menu, если она существует
EXECUTE $$
DROP TABLE IF EXISTS order_list;
$$;

-- Удаляем таблицу menu, если она существует
EXECUTE $$
DROP TABLE IF EXISTS staff;
$$;

-- Удаляем таблицу menu, если она существует
EXECUTE $$
DROP TABLE IF EXISTS providers;
$$;

-- Удаляем таблицу menu, если она существует
EXECUTE $$
DROP TABLE IF EXISTS orders;
$$;

-- Удаляем таблицу menu, если она существует
EXECUTE $$
DROP TABLE IF EXISTS clients;
$$;

-- Удаляем таблицу menu, если она существует
EXECUTE $$
DROP TABLE IF EXISTS menu;
$$;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100