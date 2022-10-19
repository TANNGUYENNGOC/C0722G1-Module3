USE quan_li_sinh_vien;

-- 1. Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT*
FROM `subject`
WHERE credit = (
SELECT MAX(credit)
FROM `subject`);

-- 2.Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT*
FROM `subject` Sub JOIN mark M ON  Sub.sub_id = M.sub_id
WHERE M.mark = (
SELECT MAX(mark)
FROM mark
);

-- 3.Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT S.student_name, AVG(M.mark)
FROM student S JOIN mark M ON S.student_id = M.student_id
GROUP BY S.student_name
ORDER BY M.mark DESC, S.student_name ASC;

