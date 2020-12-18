CREATE USER 'eko'@'localhost';
CREATE USER 'khannedy'@'%';

DROP USER 'eko'@'localhost';
DROP USER 'khannedy'@'%';

GRANT SELECT ON belajar_mysql.* TO 'eko'@'localhost';

GRANT SELECT ON belajar_mysql.* TO 'khannedy'@'%';
GRANT INSERT, UPDATE, DELETE ON belajar_mysql.* TO 'khannedy'@'%';

SHOW GRANTS FOR 'eko'@'localhost';
SHOW GRANTS FOR 'khannedy'@'%';

SET PASSWORD FOR 'eko'@'localhost' = 'rahasia';
SET PASSWORD FOR 'khannedy'@'%' = 'rahasia';

INSERT INTO guestbooks(email, title, content)
VALUES ('contoh@gmail.com', 'Hello', 'Hello');

CREATE TABLE contoh
(
    id INT NOT NULL,
    PRIMARY KEY (id)
) ENGINE = InnoDB;