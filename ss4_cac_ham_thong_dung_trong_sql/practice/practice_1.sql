USE quan_li_sinh_vien;
-- 1.Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
SELECT  S.address, COUNT(S.address) AS so_luong_hoc_vien
FROM student S
GROUP BY S.address;

-- 2.Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
SELECT S.student_id, S.student_name, AVG(M.mark) AS diem_trung_binh
FROM student S JOIN mark M ON S.student_id = M.student_id
GROUP BY S.student_id;

-- 3. Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
SELECT S.student_id, S.student_name, AVG(M.mark) AS diem_trung_binh
FROM student S JOIN mark M ON S.student_id = M.student_id
GROUP BY S.student_id
HAVING AVG(M.mark) > 15;

--  4. Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
SELECT S.student_id, S.student_name, AVG(M.mark) as diem_trung_binh_max
FROM student S JOIN mark M ON S.student_id = M.student_id
GROUP BY S.student_id
HAVING AVG(M.mark) >= all (
SELECT AVG(M.mark)
FROM mark M
GROUP BY M.student_id
)