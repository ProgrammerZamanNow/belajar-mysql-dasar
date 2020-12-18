START TRANSACTION;

INSERT INTO guestbooks (email, title, content)
VALUES ('contoh@gmail.com', 'Contoh', 'Contoh'),
       ('contoh2@gmail.com', 'Contoh', 'Contoh'),
       ('contoh3@gmail.com', 'Contoh', 'Contoh');

SELECT *
FROM guestbooks;

COMMIT;

START TRANSACTION;

DELETE
FROM guestbooks;

SELECT *
FROM guestbooks;

ROLLBACK;