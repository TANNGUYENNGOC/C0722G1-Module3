USE quan_li_khu_nghi_duong_furama;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có
-- tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT *
FROM nhan_vien NV
WHERE (NV.ho_ten LIKE 'H%' OR NV.ho_ten LIKE 'K%' OR NV.ho_ten LIKE 'T%') AND (CHAR_LENGTH(NV.ho_ten)<=15);
-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
-- c1
SELECT *
FROM khach_hang KH
WHERE KH.dia_chi LIKE '% Đà Nẵng' OR KH.dia_chi LIKE '% Quảng Trị' AND  (YEAR(CURDATE())- YEAR(KH.ngay_sinh) <= 50)
AND (YEAR(CURDATE())- YEAR(KH.ngay_sinh) > 18);

-- c2
SELECT *
FROM khach_hang KH
WHERE (KH.dia_chi LIKE '% Đà Nẵng' OR KH.dia_chi LIKE '% Quảng Trị')
AND ((YEAR(CURDATE())- YEAR(KH.ngay_sinh)) BETWEEN 18 AND 50);

-- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
 -- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
 SELECT KH.ma_khach_hang, KH.ho_ten, KH.gioi_tinh, KH.ma_loai_khach, COUNT(KH.ma_khach_hang) AS so_lan_dat
 FROM khach_hang KH JOIN hop_dong HD ON KH.ma_khach_hang = HD.ma_khach_hang
 WHERE KH.ma_loai_khach = 1
  GROUP BY KH.ma_khach_hang
  ORDER BY so_lan_dat;
  
-- 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong,
-- ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau:
-- Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT KH.ma_khach_hang, KH.ho_ten, LK.ten_loai_khach, HD.ma_hop_dong,
 DV.ten_dich_vu, HD.ngay_lam_hop_dong,HD.ngay_ket_thuc,
ifnull(DV.chi_phi_thue,0)+SUM(ifnull(HDCT.so_luong*DVDK.gia,0)) AS tong_tien
FROM khach_hang KH LEFT JOIN loai_khach LK ON KH.ma_loai_khach = LK.ma_loai_khach 
LEFT JOIN hop_dong HD ON KH.ma_khach_hang = HD.ma_khach_hang
LEFT JOIN dich_vu DV ON HD.ma_dich_vu = DV.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet HDCT ON HDCT.ma_hop_dong = HD.ma_hop_dong
LEFT JOIN dich_vu_di_kem DVDK ON DVDK.ma_dich_vu_di_kem = HDCT.ma_dich_vu_di_kem
GROUP BY  HD.ma_hop_dong, KH.ma_khach_hang;

-- 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa 
-- từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
SELECT DV.ma_dich_vu, DV.ten_dich_vu, DV.dien_tich, DV.chi_phi_thue, LDV.ten_loai_dich_vu, HD.ngay_lam_hop_dong
FROM dich_vu DV LEFT JOIN loai_dich_vu LDV ON DV.ma_loai_dich_vu = LDV.ma_loai_dich_vu
JOIN hop_dong HD ON DV.ma_dich_vu = HD.ma_dich_vu
WHERE DV.ma_dich_vu NOT IN (
SELECT ma_dich_vu
FROM hop_dong 
WHERE MONTH(ngay_lam_hop_dong) IN (1,2,3) AND (year(ngay_lam_hop_dong)=2021))
GROUP BY ma_dich_vu
ORDER BY ten_dich_vu DESC;

-- 7. Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, 
-- ten_loai_dich_vu của tất cả các loại dịch vụ 
-- đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT dich_vu.ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
FROM dich_vu JOIN loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
JOIN hop_dong ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
WHERE dich_vu.ma_dich_vu NOT IN (
SELECT DV.ma_dich_vu
FROM dich_vu DV
JOIN hop_dong ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
WHERE YEAR(ngay_lam_hop_dong) = '2021')
GROUP BY ten_dich_vu;

-- 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- c1
SELECT ho_ten FROM khach_hang GROUP BY ho_ten;
-- c2
SELECT DISTINCT ho_ten FROM khach_hang;
-- c3
SELECT ho_ten FROM khach_hang UNION SELECT ho_ten FROM khach_hang;

-- 9. Thực hiện thống kê doanh thu theo tháng, nghĩa là 
-- tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT month(ngay_lam_hop_dong) , COUNT(ho_ten)
FROM hop_dong HD JOIN khach_hang KH ON HD.ma_khach_hang = KH.ma_khach_hang
WHERE  YEAR(ngay_lam_hop_dong) = '2021'
GROUP BY month(ngay_lam_hop_dong)
ORDER BY month(ngay_lam_hop_dong);

-- 10. Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc,
-- tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
SELECT HD.ma_hop_dong, HD.ngay_lam_hop_dong, HD.ngay_ket_thuc, HD.tien_dat_coc, SUM(HDCT.so_luong) AS so_luong_dich_vu_di_kem
FROM hop_dong HD LEFT JOIN hop_dong_chi_tiet HDCT ON HD.ma_hop_dong = HDCT.ma_hop_dong
LEFT JOIN dich_vu_di_kem DVDK ON DVDK.ma_dich_vu_di_kem = HDCT.ma_dich_vu_di_kem
GROUP BY ma_hop_dong
ORDER BY ma_hop_dong;

-- 11. Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng 
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
SELECT 
    DVDK.ma_dich_vu_di_kem, DVDK.ten_dich_vu_di_kem
FROM
    khach_hang KH
        JOIN
    loai_khach LK ON KH.ma_loai_khach = LK.ma_loai_khach
        JOIN
    hop_dong HD ON HD.ma_khach_hang = KH.ma_khach_hang
        JOIN
    hop_dong_chi_tiet HDCT ON HD.ma_hop_dong = HDCT.ma_hop_dong
        JOIN
    dich_vu_di_kem DVDK ON DVDK.ma_dich_vu_di_kem = HDCT.ma_dich_vu_di_kem
WHERE
    (LK.ten_loai_khach = 'Diamond'
        AND ((KH.dia_chi LIKE '% Vinh')
        OR (KH.dia_chi LIKE '% Quảng Ngãi')));

-- 12. 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng),
 -- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch
 -- vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
 SELECT 
    HD.ma_hop_dong,
    NV.ho_ten,
    KH.ho_ten,
    KH.so_dien_thoai,
    DV.ten_dich_vu,
    SUM(HDCT.so_luong) AS so_luong_dich_vu_di_kem,
    ngay_lam_hop_dong
FROM
    hop_dong HD
        LEFT JOIN
    nhan_vien NV ON HD.ma_nhan_vien = NV.ma_nhan_vien
        LEFT JOIN
    khach_hang KH ON KH.ma_khach_hang = HD.ma_khach_hang
        JOIN
    dich_vu DV ON DV.ma_dich_vu = HD.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet HDCT ON HDCT.ma_hop_dong = HD.ma_hop_dong
WHERE
    MONTH(ngay_lam_hop_dong) IN (10 , 11, 12)
        AND YEAR(ngay_lam_hop_dong) = '2020'
        AND HD.ma_dich_vu NOT IN (SELECT 
            hop_dong.ma_dich_vu
        FROM
            hop_dong
        WHERE
            MONTH(ngay_lam_hop_dong) IN (1 , 2, 3, 4, 5, 6)
                AND YEAR(ngay_lam_hop_dong) = '2021')
GROUP BY HD.ma_hop_dong;

-- 13.Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
SELECT 
    dich_vu_di_kem.ma_dich_vu_di_kem,
    dich_vu_di_kem.ten_dich_vu_di_kem,
    SUM(hop_dong_chi_tiet.so_luong) AS so_luong_dich_vu_di_kem
FROM
    dich_vu_di_kem
        JOIN
    hop_dong_chi_tiet ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
        JOIN
    hop_dong ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
GROUP BY dich_vu_di_kem.ma_dich_vu_di_kem
HAVING  SUM(hop_dong_chi_tiet.so_luong) >= ALL (SELECT MAX(hop_dong_chi_tiet.so_luong)
FROM
    dich_vu_di_kem
        JOIN
    hop_dong_chi_tiet ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
        JOIN
    hop_dong ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
GROUP BY dich_vu_di_kem.ma_dich_vu_di_kem);

-- 14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
 -- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
 -- (được tính dựa trên việc count các ma_dich_vu_di_kem).
 SELECT hop_dong_chi_tiet.ma_hop_dong, loai_dich_vu.ten_loai_dich_vu, dich_vu_di_kem.ten_dich_vu_di_kem, COUNT(dich_vu_di_kem.ma_dich_vu_di_kem)
 FROM dich_vu_di_kem JOIN hop_dong_chi_tiet ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
 JOIN hop_dong ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
 JOIN dich_vu ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
 JOIN loai_dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
 GROUP BY dich_vu_di_kem.ma_dich_vu_di_kem
  HAVING   COUNT(dich_vu_di_kem.ma_dich_vu_di_kem) = 1
 ORDER BY hop_dong.ma_hop_dong;
 
 -- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan,
 -- so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
SELECT 
    nhan_vien.ma_nhan_vien,
    nhan_vien.ho_ten,
    trinh_do.ten_trinh_do,
    bo_phan.ten_bo_phan,
    nhan_vien.so_dien_thoai,
    nhan_vien.dia_chi,
    hop_dong.ngay_lam_hop_dong
FROM
    nhan_vien
        JOIN
    hop_dong ON nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
        JOIN
    trinh_do ON nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
        JOIN
    bo_phan ON bo_phan.ma_bo_phan = nhan_vien.ma_bo_phan
WHERE
    (YEAR(hop_dong.ngay_lam_hop_dong) IN (2020 , 2021))
     GROUP BY nhan_vien.ma_nhan_vien
    HAVING (COUNT(hop_dong.ma_hop_dong) <= 3)
    ORDER BY nhan_vien.ma_nhan_vien;

 -- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET SQL_SAFE_UPDATES = 0;
DELETE
FROM
    nhan_vien
WHERE
    nhan_vien.ma_nhan_vien NOT IN (
    SELECT*FROM(SELECT 
            hop_dong.ma_nhan_vien
        FROM
            hop_dong
        WHERE
            hop_dong.ngay_lam_hop_dong BETWEEN '2019-01-01' AND '2021-12-31') AS x );

-- 17. Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những
-- khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
-- SELECT khach_hang.ma_khach_hang, khach_hang.ho_ten, loai_khach.ma_loai_khach, loai_khach.ten_loai_khach, 
-- ifnull(dich_vu.chi_phi_thue,0)+SUM(ifnull(hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia,0)) AS tong_tien
-- , hop_dong.ngay_lam_hop_dong
UPDATE khach_hang 
SET 
    khach_hang.ma_loai_khach = 1
WHERE
    khach_hang.ma_loai_khach = (SELECT 
            ma_loai_khach
        FROM
            (SELECT 
                khach_hang.ma_loai_khach,
                    IFNULL(dich_vu.chi_phi_thue, 0) + SUM(IFNULL(hop_dong_chi_tiet.so_luong * dich_vu_di_kem.gia, 0)) AS tong_tien
            FROM
                khach_hang
            JOIN loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
            JOIN hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
            JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.ma_hop_dong = hop_dong.ma_hop_dong
            JOIN dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
            JOIN dich_vu ON dich_vu.ma_dich_vu = hop_dong.ma_dich_vu
           # WHERE                (YEAR(hop_dong.ngay_lam_hop_dong) = '2021')                    AND (khach_hang.ma_loai_khach = 2)
            GROUP BY hop_dong.ma_hop_dong , khach_hang.ma_khach_hang
            HAVING tong_tien >= 1000000) abc);
            
-- 18.Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
-- SELECT khach_hang.ma_khach_hang, khach_hang.ho_ten, hop_dong.ngay_lam_hop_dong
SET sql_safe_updates = 0;
SET FOREIGN_KEY_CHECKS=0;
DELETE FROM khach_hang 
WHERE
    ma_khach_hang IN (SELECT 
        hop_dong.ma_khach_hang
    FROM
        hop_dong
    WHERE
        YEAR(hop_dong.ngay_lam_hop_dong) < 2021);
SET sql_safe_updates = 1;
SET FOREIGN_KEY_CHECKS=1;
-- 19.  Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi. 
SET SQL_SAFE_UPDATES = 0;
UPDATE dich_vu_di_kem
SET dich_vu_di_kem.gia = dich_vu_di_kem.gia*2
WHERE dich_vu_di_kem.ten_dich_vu_di_kem IN (SELECT zxc.ten_dich_vu_di_kem FROM(
 SELECT 
    dich_vu_di_kem.ten_dich_vu_di_kem,
    SUM(hop_dong_chi_tiet.so_luong) as so_luong_dich_vu_di_kem,
    hop_dong.ngay_lam_hop_dong
FROM
    dich_vu_di_kem
        JOIN
    hop_dong_chi_tiet ON dich_vu_di_kem.ma_dich_vu_di_kem = hop_dong_chi_tiet.ma_dich_vu_di_kem
        JOIN
    hop_dong ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
WHERE
    YEAR(hop_dong.ngay_lam_hop_dong) = 2020
GROUP BY hop_dong_chi_tiet.ma_dich_vu_di_kem
HAVING so_luong_dich_vu_di_kem>10) AS zxc);
SET SQL_SAFE_UPDATES = 1;

-- 20. Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id 
-- (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
SELECT nhan_vien.ma_nhan_vien,nhan_vien.ho_ten,nhan_vien.email,nhan_vien.so_dien_thoai,nhan_vien.ngay_sinh,nhan_vien.dia_chi FROM nhan_vien 
UNION
SELECT khach_hang.ma_khach_hang,khach_hang.ho_ten,khach_hang.email,khach_hang.so_dien_thoai,khach_hang.ngay_sinh,khach_hang.dia_chi FROM khach_hang;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Đà Nẵng”
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là  tháng 4 năm 2021.
CREATE VIEW v_nhan_vien AS
    SELECT 
        hop_dong.ma_nhan_vien,
        nhan_vien.ho_ten,
        SUM(hop_dong.ma_nhan_vien) AS so_hop_dong_da_lam,
        nhan_vien.dia_chi
    FROM
        nhan_vien
            JOIN
        hop_dong ON nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
    WHERE
        (nhan_vien.dia_chi LIKE '%Liên Chiểu%'
            AND MONTH(hop_dong.ngay_lam_hop_dong) = 4
            AND YEAR(ngay_lam_hop_dong) = 2021)
    GROUP BY hop_dong.ma_nhan_vien
    HAVING so_hop_dong_da_lam >= 1;
    DROP VIEW v_nhan_vien;
    SELECT*FROM v_nhan_vien;
    
-- 22. Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Đà Nẵng” đối với tất cả các nhân viên
-- được nhìn thấy bởi khung nhìn này.
set sql_safe_updates = 0;
UPDATE nhan_vien 
SET 
    nhan_vien.dia_chi = 'Liên Chiểu'
WHERE
    nhan_vien.dia_chi IN (SELECT 
            v_nhan_vien.dia_chi
        FROM
            v_nhan_vien);
           set sql_safe_updates = 1;
-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó 
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
DELIMITER //
CREATE PROCEDURE sp_xoa_khach_hang(IN ma_KH INT)
BEGIN
DELETE FROM khach_hang WHERE khach_hang.ma_khach_hang = ma_KH; 
END //
DELIMITER ;
CALL sp_xoa_khach_hang(8);
SELECT*FROM khach_hang;

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu
--  sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng 
-- khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
DELIMITER //
CREATE PROCEDURE sp_them_moi_hop_dong(IN ma_HD INT, IN ngay_lam_HD DATETIME, ngay_ket_thuc DATETIME, tien_dat_coc DOUBLE, ma_nv INT, ma_kh INT, ma_dv INT)
BEGIN
INSERT INTO hop_dong VALUES (ma_HD,ngay_lam_HD,ngay_ket_thuc,tien_dat_coc,ma_nv,ma_kh,ma_dv);
END //
DELIMITER ;
SELECT*FROM hop_dong;
CALL sp_them_moi_hop_dong(14,'2022-10-10','2022-12-12',25000,7,10,2);

-- 25. Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số 
-- lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
DELIMITER //
CREATE TRIGGER tr_xoa_hop_dong AFTER DELETE ON hop_dong FOR EACH ROW
BEGIN 
INSERT INTO `history` (tong_hop_dong)
SELECT count(hop_dong.ma_hop_dong) FROM  `hop_dong`;
END//
DELIMITER ;
DROP TRIGGER tr_xoa_hop_dong;
DELETE FROM hop_dong WHERE hop_dong.ma_hop_dong = 18;

		-- Bảng ghi log
CREATE TABLE `history`(
id INT auto_increment PRIMARY KEY,
tong_hop_dong int
);
-- 26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem
-- thời gian cập nhật có phù hợp hay không, với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
DELIMITER //
CREATE TRIGGER tr_cap_nhat_hop_dong  BEFORE UPDATE ON hop_dong FOR EACH ROW
BEGIN
IF datediff(new.ngay_ket_thuc, OLD.ngay_lam_hop_dong) <=2 THEN SIGNAL SQLSTATE '45000' 
SET MESSAGE_TEXT = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày';
END IF;
END//
DELIMITER ;
UPDATE hop_dong
SET hop_dong.ngay_ket_thuc = '2022-10-11'
WHERE hop_dong.ma_hop_dong = 15;

-- 27.	Tạo Function thực hiện yêu cầu sau:
-- a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
-- b.	Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến
	-- lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần
	-- làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). Mã của khách hàng được truyền vào như là
	-- tham số của function này.
CREATE VIEW v_dich_vu AS
SELECT hop_dong.ma_dich_vu, dich_vu.chi_phi_thue, SUM(dich_vu.chi_phi_thue) AS tong_chi_phi_thue, COUNT(dich_vu.ma_dich_vu) AS so_luong
FROM hop_dong JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
GROUP BY dich_vu.ma_dich_vu
HAVING tong_chi_phi_thue > 2000000;
SELECT*FROM v_dich_vu;

DELIMITER //
CREATE FUNCTION func_dem_dich_vu()
RETURNS INT deterministic
BEGIN
DECLARE dem INT;
-- SET dem = (SELECT v_dich_vu.so_luong FROM v_dich_vu);
SELECT hop_dong.ma_dich_vu, dich_vu.chi_phi_thue, SUM(dich_vu.chi_phi_thue) AS tong_chi_phi_thue, COUNT(dich_vu.ma_dich_vu) AS so_luong
FROM hop_dong JOIN dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
GROUP BY dich_vu.ma_dich_vu
HAVING tong_chi_phi_thue > 2000000;
RETURN 0;
END//
DELIMITER ;
DROP FUNCTION func_dem_dich_vu;

 
 