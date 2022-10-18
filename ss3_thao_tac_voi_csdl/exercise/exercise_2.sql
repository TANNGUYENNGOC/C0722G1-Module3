USE quan_li_ban_hang;
INSERT INTO customer VALUE (1,'Minh Quan',10),
						(2,'Ngoc Oanh',20),
						(3,'Hong Ha', 50);
                        
INSERT INTO `order` VALUE(1,1,'2006-03-21',3),
						(2,2,'2006-03-23',3),
                        (3,1,'2006-03-16',3);
                        
INSERT INTO product VALUE (1,'May giat',3),
							(2,'Tu lanh',5),
                            (3,'Dieu hoa',7),
                            (4,'Quat',1),
                            (5,'Bep dien',2);
                            
INSERT INTO `order_detail` VALUE(1,1,3),
								(1,3,7),
                                (1,4,2),
                                (2,1,1),
                                (3,1,8),
                                (2,5,4),
                                (2,3,3);
                                
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT o_id, o_date, o_total_price
FROM `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT customer.c_name, product.p_name
FROM order_detail JOIN product ON order_detail.p_id = product.p_id JOIN `order` ON `order`.o_id = order_detail.o_id 
JOIN customer ON customer.c_id = `order`.c_id
WHERE od_qty >= 1;

SELECT*
FROM customer LEFT JOIN `order` ON customer.c_id = `order`.c_id
WHERE `order`.c_id IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt 
-- hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)

SELECT od.o_id, o.o_date, od.od_qty * p.p_price as gia_hoa_don
FROM customer  c JOIN `order` o ON c.c_id = o.c_id
JOIN order_detail od ON od.o_id = o.o_id
JOIN product p ON p.p_id = od.p_id;
