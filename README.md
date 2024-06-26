# Тестовая база данных "coffee_house"

Этот репозиторий содержит тестовую базу данных "coffee_house", созданную для демонстрации функционала базы данных кофейни.

## Описание

База данных "coffee_house" моделирует работу кофейни, включая информацию о продукции, заказах, клиентах и т.д. Она предоставляет простую схему данных для тестирования и демонстрации различных запросов и операций баз данных.

## Структура базы данных

- `order_list`: информация о заказах, включая id заказа, id продукта, количество продуктов в заказе.
- `order_staff`: данные о персонале.
- `clients`: данные о клиентах, включая имя, контактную информацию и т.д.
- `delivery`: информация о доставке заказов.
- `ingredients`: информация об ингредиентах для приготовления продукции.
- `menu`: меню кофейни с информацией о продукции.
- `providers`: данные о поставщиках ингредиентов.
- `staff`: информация о сотрудниках кофейни.
- `supply`: информация о поставках ингредиентов.

## Примеры запросов

1. Запрос возвращает все продукты, имеющиеся в наличии:
```sql
SELECT * FROM menu;
```
2. Запрос возвращает суммарное количество поставок молока за каждую дату поставки из таблицы `supply`. 

```sql
SELECT sup_date, ing_name, SUM(sup_quantity) AS sum
FROM supply AS s
JOIN ingredients AS i ON s.sup_ingredient = i.ing_id
WHERE ing_name = 'milk'
GROUP BY sup_date, ing_name, sup_quantity;
```
3. Запрос возвращает список клиентов, их общую сумму потраченных средств и общее количество купленных продуктов за последний месяц, при условии, что общая сумма покупок каждого клиента превышает 5000.

```sql
SELECT c.cl_fname || ' ' || c.cl_lname AS client_name, 
       SUM(ol.prod_quantity * m.m_price) AS total_spent,
       SUM(ol.prod_quantity) AS total_items
FROM clients AS c
JOIN orders AS o ON c.cl_id = o.ord_cli_id
JOIN order_list AS ol ON o.order_id = ol.ord_id
JOIN menu AS m ON ol.prod_id = m.menu_id
WHERE o.ord_date_time >= DATE '2023-10-26' - INTERVAL '1 month'
GROUP BY c.cl_id, client_name
HAVING SUM(ol.prod_quantity * m.m_price) > 5000;
```

## Пример процедуры
```sql
CREATE PROCEDURE insert_order(a TIMESTAMP, b integer, c integer, d integer, e integer, f integer, g integer, h integer, i integer)
LANGUAGE SQL
AS $$
INSERT INTO orders (ord_date_time, ord_cli_id) VALUES (a, b); -- для даты и id клиента заказа
INSERT INTO order_list (ord_id, prod_id, prod_quantity) VALUES (c, d, e); --для номера заказа, продукта в заказе и количества продукта (для заказа с одним видом продуктом)
INSERT INTO order_staff (id_ord, id_staff) VALUES (f, g); -- для добавления бариста
INSERT INTO order_staff (id_ord, id_staff) VALUES (h, i); -- для добавления клинера
$$;
```
Эта SQL-процедура предназначена для добавления нового заказа в базу данных. Она принимает следующие параметры:

- `a`: дата и время заказа (`TIMESTAMP`);
- `b`: идентификатор клиента (`integer`);
- `c`: номер заказа (`integer`);
- `d`: идентификатор продукта в заказе (`integer`);
- `e`: количество продукта в заказе (`integer`);
- `f`: идентификатор баристы (`integer`);
- `g`: идентификатор клинера (`integer`);
- `h`: идентификатор баристы (если применимо) (`integer`);
- `i`: идентификатор клинера (если применимо) (`integer`).

Процедура выполняет следующие действия:
1. Добавляет информацию о заказе в таблицу `orders`, включая дату и время заказа и идентификатор клиента.
2. Добавляет информацию о продукте в заказе в таблицу `order_list`, включая номер заказа, идентификатор продукта и количество продукта.
3. Добавляет информацию о персонале, занятом на выполнении заказа, в таблицу `order_staff`. В данной версии процедуры предполагается, что заказ обслуживается двумя членами персонала: бариста и клинером. Параметры `g` и `i` используются для добавления идентификаторов бариста и клинера соответственно.

Для вызова этой процедуры используйте следующий синтаксис:

CALL insert_order('2023-10-27 00:00:00', 3, 265, 1, 2, 265, 2, 265, 10);

## Модель базы данных coffee_house, схемы public

![model DB](https://github.com/maria-zi/coffee_house/assets/102587427/fd86b4ad-b723-4a21-b7bb-238ae5617733)

 
