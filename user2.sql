START TRANSACTION ;

SELECT * FROM guestbooks;

UPDATE guestbooks
SET title = 'Diubah Oleh User 2'
WHERE id = 9;

COMMIT ;

START TRANSACTION ;

SELECT * FROm products;

SELECT * FROM products WHERE id = 'P0001' FOR UPDATE ;

UPDATE products
SET quantity = quantity - 10
WHERE id = 'P0001';

COMMIT ;

#  DEADLOCK

START TRANSACTION ;

SELECT * FROM products WHERE id = 'P0002' FOR UPDATE ;

SELECT * FROM products WHERE id = 'P0001' FOR UPDATE ;

# LOCK TABLE READ

SELECT * FROM products;

UPDATE products
SET quantity = 100
WHERE id = 'P0001';

# LOCK TABLE WRITE

SELECT * FROM products;

# LOCK INSTANCE

ALTER TABLE products
ADD column sample VARCHAR(100);
