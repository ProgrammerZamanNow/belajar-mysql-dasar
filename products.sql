CREATE TABLE products
(
    id          VARCHAR(10)  NOT NULL,
    name        VARCHAR(100) NOT NULL,
    description TEXT,
    price       INT UNSIGNED NOT NULL,
    quantity    INT UNSIGNED NOT NULL DEFAULT 0,
    created_at  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE = InnoDB;

SHOW TABLES;

DESCRIBE products;

INSERT INTO products(id, name, price, quantity)
VALUES ('P0001', 'Mie Ayam Original', 15000, 100);

SELECT *
FROM products;

INSERT INTO products(id, name, description, price, quantity)
VALUES ('P0002', 'Mie Ayam Bakso', 'Mie Ayam Original + Bakso', 20000, 100);

INSERT INTO products(id, name, price, quantity)
VALUES ('P0003', 'Mie Ayam Ceker', 20000, 100),
       ('P0004', 'Mie Ayam Spesial', 25000, 100),
       ('P0005', 'Mie Ayam Yamin', 15000, 100);

SELECT *
FROM products;

SELECT id, name, price, quantity
FROM products;

SELECT name, quantity, id
FROM products;

ALTER TABLE products
    ADD PRIMARY KEY (id);

DESCRIBE products;

SHOW CREATE TABLE products;

INSERT INTO products(id, name, price, quantity)
VALUES ('P0001', 'Mie Ayam Original', 15000, 100);

SELECT *
FROM products
WHERE quantity = 100;

SELECT *
FROM products
WHERE price = 15000;

SELECT *
FROM products
WHERE id = 'P0001';

SELECT *
FROM products
WHERE name = 'mie ayam bakso';

DESCRIBE products;

ALTER TABLE products
    ADD COLUMN category ENUM ('Makanan', 'Minuman', 'Lain-Lain')
        AFTER name;

SELECT *
FROM products;

SELECT *
FROM products
WHERE id = 'P0001';

UPDATE products
SET category = 'Makanan'
WHERE id = 'P0001';

UPDATE products
SET category    = 'Makanan',
    description = 'Mie Ayam Original + Ceker'
WHERE id = 'P0003';

UPDATE products
SET price = price + 5000
WHERE id = 'P0005';

INSERT INTO products(id, name, price, quantity)
VALUES ('P0009', 'Mie Ayam Original', 15000, 100);

DELETE
FROM products
WHERE id = 'P0009';

SELECT id       AS Kode,
       name     AS Nama,
       category AS Kategori,
       price    AS Harga,
       quantity AS Jumlah
FROM products;

SELECT p.id       AS Kode,
       p.name     AS Nama,
       p.category AS Kategori,
       p.price    AS Harga,
       p.quantity AS Jumlah
FROM products AS p;

INSERT INTO products(id, category, name, price, quantity)
VALUES ('P0006', 'Makanan', 'Bakso Rusuk', 25000, 200),
       ('P0007', 'Minuman', 'Es Jeruk', 10000, 300),
       ('P0008', 'Minuman', 'Es Campur', 15000, 500),
       ('P0009', 'Minuman', 'Es Teh Manis', 5000, 400),
       ('P0010', 'Lain-Lain', 'Kerupuk', 2500, 1000),
       ('P0011', 'Lain-Lain', 'Keripik Udang', 10000, 300),
       ('P0012', 'Lain-Lain', 'Es Krim', 5000, 200),
       ('P0013', 'Makanan', 'Mie Ayam Jamur', 20000, 50),
       ('P0014', 'Makanan', 'Bakso Telor', 20000, 150),
       ('P0015', 'Makanan', 'Bakso Jando', 25000, 300);

SELECT *
FROM products
WHERE quantity > 100;

SELECT *
FROM products
WHERE quantity >= 100;

SELECT *
FROM products
WHERE category != 'Makanan';

SELECT *
FROM products
WHERE category <> 'Minuman';

SELECT *
FROM products
WHERE quantity > 100
  AND price > 20000;

SELECT *
FROM products
WHERE category = 'Makanan'
  AND price < 20000;

SELECT *
FROM products
WHERE quantity > 100
   OR price > 20000;

SELECT *
FROM products
WHERE (category = 'Makanan' OR quantity > 500)
  AND price > 20000;

SELECT *
FROM products
WHERE name LIKE '%mie%';

SELECT *
FROM products
WHERE name LIKE '%bakso%';

SELECT *
FROM products
WHERE name LIKE '%usu%';

SELECT *
FROM products
WHERE description IS NULL;

SELECT *
FROM products
WHERE description IS NOT NULL;

SELECT *
FROM products
WHERE price BETWEEN 10000 AND 20000;

SELECT *
FROM products
WHERE price NOT BETWEEN 10000 AND 20000;

SELECT *
FROM products
WHERE category IN ('Makanan', 'Minuman');

SELECT *
FROM products
WHERE category NOT IN ('Makanan', 'Minuman');

SELECT id, category, name
FROM products
ORDER BY category;

SELECT id, category, price, name
FROM products
ORDER BY category ASC, price DESC;

SELECT *
FROM products
ORDER BY id
LIMIT 5;

SELECT *
FROM products
ORDER BY id
LIMIT 3;

SELECT *
FROM products
ORDER BY id
LIMIT 0, 5;

SELECT *
FROM products
ORDER BY id
LIMIT 5, 5;

SELECT *
FROM products
ORDER BY id
LIMIT 10, 5;

SELECT *
FROM products
ORDER BY id
LIMIT 15, 5;

SELECT DISTINCT category
FROM products;

SELECT 10, 10, 10 * 10 as Hasil;

SELECT id, name, price, price DIV 1000 AS 'Price in K'
FROM products;

SELECT id, COS(price), SIN(price), TAN(price)
FROM products;

SELECT id, name, price
FROM products
WHERE price DIV 1000 > 15;

SELECT id,
       LOWER(name)  as 'Name Lower',
       UPPER(name)  as 'Name Lower',
       LENGTH(name) as 'Name Length'
FROM products;

SELECT id,
       created_at,
       EXTRACT(YEAR FROM created_at)  as Year,
       EXTRACT(MONTH FROM created_at) as Month
FROM products;

SELECT id, created_at, YEAR(created_at), MONTH(created_at)
FROM products;

SELECT id,
       category,
       CASE category
           WHEN 'Makanan' THEN 'Enak'
           WHEN 'Minuman' THEN 'Segar'
           ELSE 'Apa Itu?'
           END AS 'Category'
FROM products;

SELECT id,
       price,
       IF(price <= 15000, 'Murah', IF(price <= 20000, 'Mahal', 'Mahal Banget')) as 'Mahal?'
FROM products;

SELECT id, name, IFNULL(description, 'Kosong')
FROM products;

SELECT COUNT(id) as 'Total Product'
FROM products;

SELECT MAX(price) as 'Product Termahal'
FROM products;

SELECT MIN(price) as 'Product Termurah'
FROM products;

SELECT AVG(price) as 'Rata-Rata Harga'
FROM products;

SELECT SUM(quantity) AS 'Total Stock'
FROM products;

SELECT COUNT(id) as 'Total Product', category
FROM products
GROUP BY category;

SELECT MAX(price) as 'Product Termahal', category
FROM products
GROUP BY category;

SELECT MIN(price) as 'Product Termurah', category
FROM products
GROUP BY category;

SELECT AVG(price) as 'Rata-Rata Harga', category
FROM products
GROUP BY category;

SELECT SUM(quantity) AS 'Total Stock', category
FROM products
GROUP BY category;

SELECT COUNT(id) as total,
       category
FROM products
GROUP BY category
HAVING total > 5;

SELECT *
FROM products;

INSERT INTO products(id, name, category, price, quantity)
VALUES ('P0016', 'Permen', 'Lain-Lain', 500, 1000);

UPDATE products
SET price = 1000
WHERE id = 'P0016';

ALTER TABLE products
    ADD CONSTRAINT price_check CHECK ( price >= 1000 );

SHOW CREATE TABLE products;

INSERT INTO products(id, name, category, price, quantity)
VALUES ('P0017', 'Permen Lagi', 'Lain-Lain', 500, 1000);

UPDATE products
SET price = 500
WHERE id = 'P0016';

ALTER TABLE products
    ADD FULLTEXT product_fulltext (name, description);

SHOW CREATE TABLE products;

SELECT *
FROM products
WHERE name LIKE '%ayam%'
   OR description LIKE '%ayam%';

SELECT *
FROM products
WHERE MATCH(name, description)
            AGAINST('ayam' IN NATURAL LANGUAGE MODE);

SELECT *
FROM products
WHERE MATCH(name, description)
            AGAINST('+ayam -bakso' IN BOOLEAN MODE);

SELECT *
FROM products
WHERE MATCH(name, description)
            AGAINST('bakso' WITH QUERY EXPANSION);

DESC products;

SELECT *
FROM products;

INSERT INTO products(id, name, category, price, quantity)
VALUES ('Pxxxx', 'Contoh', 'Lain-Lain', 1000, 1000);


INSERT INTO products(id, name, price, quantity)
VALUES ('X0001', 'X Satu', 25000, 200),
       ('X0002', 'X Dua', 10000, 300),
       ('X0003', 'X Tiga', 15000, 500);

SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

SELECT MAX(price)
FROM products;

SELECT *
FROM products;

SELECT MAX(cp.price)
FROM (SELECT price
      FROM categories
               JOIN products ON (products.id_category = categories.id)) as cp;

UPDATE products
SET price=1000000
WHERE id = 'X0003';