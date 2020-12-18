CREATE TABLE guestbooks
(
    id      INT NOT NULL AUTO_INCREMENT,
    email   VARCHAR(100),
    title   VARCHAR(200),
    content TEXT,
    PRIMARY KEY (id)
) ENGINE = InnoDB;

SELECT *
FROM customers;

INSERT INTO guestbooks(email, title, content)
VALUES ('guest@gmail.com', 'Hello', 'Hello'),
       ('guest2@gmail.com', 'Hello', 'Hello'),
       ('guest3@gmail.com', 'Hello', 'Hello'),
       ('eko@gmail.com', 'Hello', 'Hello'),
       ('eko@gmail.com', 'Hello', 'Hello'),
       ('eko@gmail.com', 'Hello', 'Hello');

SELECT *
FROM guestbooks;

SELECT email
FROM customers
UNION
SELECT email
FROM guestbooks;

SELECT email
FROM customers
UNION ALL
SELECT email
FROM guestbooks;

SELECT emails.email, COUNT(emails.email)
FROM (SELECT email
      FROM customers
      UNION ALL
      SELECT email
      FROM guestbooks) as emails
GROUP BY emails.email;

SELECT DISTINCT email
FROM customers
WHERE email IN (SELECT DISTINCT email FROM guestbooks);

SELECT DISTINCT customers.email
FROM customers
         INNER JOIN guestbooks ON (guestbooks.email = customers.email);

SELECT DISTINCT customers.email, guestbooks.email
FROM customers
         LEFT JOIN guestbooks ON (customers.email = guestbooks.email)
WHERE guestbooks.email IS NULL;