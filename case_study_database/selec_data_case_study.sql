USE quan_li_khu_nghi_duong_furama;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có
-- tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT *
FROM nhan_vien NV
WHERE NV.ho_ten LIKE 'H%' OR NV.ho_ten LIKE 'K%' OR NV.ho_ten LIKE 'T%';
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
SELECT KH.ma_khach_hang, KH.ho_ten, LK.ten_loai_khach, HD.ma_hop_dong, DV.ten_dich_vu, HD.ngay_lam_hop_dong,HD.ngay_ket_thuc,
DV.chi_phi_thue+(HDCT.so_luong*DVDK.gia) AS tong_tien
FROM khach_hang KH LEFT JOIN loai_khach LK ON KH.ma_loai_khach = LK.ma_loai_khach 
LEFT JOIN hop_dong HD ON KH.ma_khach_hang = HD.ma_khach_hang
LEFT JOIN dich_vu DV ON HD.ma_dich_vu = DV.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet HDCT ON HDCT.ma_hop_dong = HD.ma_hop_dong
LEFT JOIN dich_vu_di_kem DVDK ON DVDK.ma_dich_vu_di_kem = HDCT.ma_dich_vu_di_kem
 
 