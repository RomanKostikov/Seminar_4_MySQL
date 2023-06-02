  -- Создание таблицы с товарами
   CREATE TABLE products (
     product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     category INT NULL,
     product_name VARCHAR(100) NOT NULL
   );

   -- Создание таблицы с категориями
   CREATE TABLE categories (
     category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     category_name VARCHAR(100) NOT NULL
   );

   -- Добавление данных в таблицу с товарами
   INSERT INTO products(category, product_name)
     VALUES (1, 'Системный блок'),
            (1, 'Монитор'),
            (2, 'Холодильник'),
            (2, 'Телевизор'),
            (NULL, 'Операционная система');

   -- Добавление данных в таблицу с категориями
   INSERT INTO categories (category_name)
     VALUES ('Комплектующие компьютера'),
            ('Бытовая техника'),
            ('Мобильные устройства');

   SELECT * FROM products;
   SELECT * FROM categories;
   
   -- INNER JOIN
select * from products p join categories c on p.category = c.category_id;

-- LEFT JOIN
select * from products p left join categories c on p.category = c.category_id;

-- RIGHT JOIN
select * from products p right join categories c on p.category = c.category_id;

-- IF
select product_id, product_name, if (category_name is null, 'Категория не найдена', category_name)
from products p 
left join categories c 
on p.category = c.category_id;

-- COALESCE
select product_id, product_name, coalesce(category_name, 'Категория не найдена')
from products p 
left join categories c 
on p.category = c.category_id;

-- FULL JOIN
select * from products p 
left join categories c 
on p.category = c.category_id
union 
select * from products p 
right join categories c 
on p.category = c.category_id;