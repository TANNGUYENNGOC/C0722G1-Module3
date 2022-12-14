DROP DATABASE IF EXISTS quan_li_ban_hang;
CREATE DATABASE IF NOT EXISTS quan_li_ban_hang;
USE quan_li_ban_hang;

CREATE TABLE customer (
    c_id INT PRIMARY KEY,
    c_name NVARCHAR(50),
    c_age INT
);

CREATE TABLE `order` (
    o_id INT PRIMARY KEY,
    c_id INT,
    o_date DATETIME,
    o_total_price INT,
    FOREIGN KEY (c_id)
        REFERENCES customer (c_id)
);
ALTER TABLE `order` DROP o_date;
ALTER TABLE `order` ADD COLUMN o_date DATE AFTER c_id;

CREATE TABLE product (
    p_id INT PRIMARY KEY,
    p_name NVARCHAR(50),
    p_price INT
);

CREATE TABLE order_detail (
    o_id INT,
    p_id INT,
    od_qty INT,
    PRIMARY KEY (o_id , p_id),
    FOREIGN KEY (o_id)
        REFERENCES `order` (o_id),
    FOREIGN KEY (p_id)
        REFERENCES product (p_id)
);
DROP TABLE order_detail;