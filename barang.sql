SHOW ENGINES;

SHOW TABLES;

CREATE TABLE barang
(
    id     INT          NOT NULL,
    nama   VARCHAR(100) NOT NULL,
    harga  INT          NOT NULL DEFAULT 0,
    jumlah INT          NOT NULL DEFAULT 0
) ENGINE = InnoDB;

DESCRIBE barang;

SHOW CREATE TABLE barang;

ALTER TABLE barang
    ADD COLUMN deskripsi TEXT;

ALTER TABLE barang
    ADD COLUMN salah TEXT;

ALTER TABLE barang
    DROP COLUMN salah;

ALTER TABLE barang
    MODIFY nama VARCHAR(200) AFTER deskripsi;

ALTER TABLE barang
    MODIFY nama VARCHAR(200) FIRST;

ALTER TABLE barang
    MODIFY id INT NOT NULL;

ALTER TABLE barang
    MODIFY nama VARCHAR(200) NOT NULL;

SHOW CREATE TABLE barang;

ALTER TABLE barang
    MODIFY jumlah INT NOT NULL DEFAULT 0;

ALTER TABLE barang
    MODIFY harga INT NOT NULL DEFAULT 0;

ALTER TABLE barang
    ADD waktu_dibuat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;

INSERT INTO barang (id, nama)
VALUES (1, 'Apel');

SELECT *
FROM barang;

TRUNCATE barang;

SHOW tables;

DROP TABLE barang;