USE quan_li_khu_nghi_duong_furama;

-- 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có
-- tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT *
FROM nhan_vien NV
WHERE NV.ho_ten LIKE 'H%' OR NV.ho_ten LIKE 'K%' OR NV.ho_ten LIKE 'T%';
-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT*
FROM nhan_vien AS NV
WHERE NV.