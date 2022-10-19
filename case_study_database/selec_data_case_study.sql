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
SELECT HD.ma_hop_dong, HD.ngay_lam_hop_dong, HD.ngay_ket_thuc, HD.tien_dat_coc, SUM(HDCT.so_luong)
FROM hop_dong HD LEFT JOIN hop_dong_chi_tiet HDCT ON HD.ma_hop_dong = HDCT.ma_hop_dong
LEFT JOIN dich_vu_di_kem DVDK ON DVDK.ma_dich_vu_di_kem = HDCT.ma_dich_vu_di_kem
GROUP BY ma_hop_dong
ORDER BY ma_hop_dong;














 
 