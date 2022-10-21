
-- B1:
CREATE DATABASE demo;
USE demo;

-- B2:
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_code VARCHAR(20),
    product_name VARCHAR(20),
    product_price DOUBLE,
    product_amount INT,
    product_description VARCHAR(30),
    product_status BIT
);
INSERT INTO products VALUES (1,'SP1','EXCITER 150',45000,1,'XE VIP',1),
							(2,'SP2','IPHONE 13',10000,9,'IPHONE SỊN',1),
                            (3,'SP3','DELL đỉnh cao',20000,7,'của hãng dell',1),
                            (4,'SP4','SH 150i',75000,14,'honda',1);
-- B3:
CREATE INDEX i_products_code ON products (
product_code);


ALTER TABLE products ADD INDEX i_product_name_price(
product_name,
product_price
);

EXPLAIN SELECT*FROM products WHERE product_code = 'SP2';
EXPLAIN SELECT*FROM products WHERE product_name = 'IPHONE 13' OR product_price=45000;

-- B4:
CREATE VIEW w_products AS SELECT product_code, product_name, product_price, product_status FROM products;
UPDATE w_products SET product_name = 'SUZUKI' WHERE   product_code = 'SP1';
UPDATE products SET product_name = 'xì po' WHERE product_code = 'SP1';
DROP VIEW w_products;

-- B5
DELIMITER //
CREATE PROCEDURE sp_product()
BEGIN
SELECT*FROM products;
END //
DELIMITER ;
CALL sp_product();
INSERT INTO products VALUES (9,'SP6','Satria', 50000,25,'suzuki',1);

DELIMITER //
CREATE PROCEDURE sp_product2()
BEGIN
INSERT INTO products VALUES (99,'SP6','Satria', 50000,25,'suzuki',1);
END //
DELIMITER ;
CALL sp_product2();

DELIMITER //
CREATE PROCEDURE sp_product1()
BEGIN
INSERT INTO products VALUES (8,'SP6','Satria', 50000,25,'suzuki',1);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_product3(IN p_id INT)
BEGIN
UPDATE products
SET product_code = 'SP5' WHERE id = p_id;
END //
DELIMITER ;
CALL sp_product3(8);

DELIMITER //
CREATE PROCEDURE sp_product4(IN p_id INT)
BEGIN
DELETE FROM products WHERE id = p_id; 
END //
DELIMITER ;
CALL sp_product4(99);

