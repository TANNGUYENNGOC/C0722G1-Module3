CREATE DATABASE quan_li_sinh_vien;
USE quan_li_sinh_vien;

CREATE TABLE class(
class_id int AUTO_INCREMENT PRIMARY KEY,
class_name varchar(45),
start_date DATE,
`status` BOOLEAN
);

CREATE TABLE student(
student_id INT AUTO_INCREMENT PRIMARY KEY,
student_name VARCHAR(45),
address varchar(45),
phone varchar(45),
`status` BOOLEAN,
class_id int,
FOREIGN KEY(class_id) REFERENCES class(class_id)
);

CREATE TABLE  `subject`(
sub_id int AUTO_INCREMENT PRIMARY KEY,
sub_name VARCHAR(45),
credit int,
`status` BOOLEAN
);

CREATE TABLE mark(
mark_id int AUTO_INCREMENT PRIMARY KEY,
sub_id int,
student_id INT,
mark INT,
exam_times INT,
FOREIGN KEY(sub_id) REFERENCES `subject`(sub_id),
FOREIGN KEY(student_id) REFERENCES student(student_id)
);

INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);

INSERT INTO student (student_name, address, phone, status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, address, status, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (student_name, address, phone, status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
INSERT INTO mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);       
       
-- Hiển thị danh sách tất cả các học viên
SELECT*FROM student;

-- Để hiển thị danh sách học viên đang theo học cần phải sử dụng câu lệnh select
-- ... from kèm theo where để xét điều kiện truy vấn như sau:
SELECT*FROM student
WHERE status = true;

-- Sử dụng điều kiện where Credit < 10 và from Subject để lấy 
-- ra danh sách các môn học có thời gian học nhỏ hơn 10
SELECT * FROM `subject`
WHERE credit < 10;

--  Sử dụng câu lệnh Join và where để hiển thị danh sách học viên lớp A1, Join 2 bảng Student và Class bằng câu lệnh sau
SELECT S.student_id, S.student_name, c.class_name
FROM student S JOIN class C on S.class_id = C.class_id
WHERE C.class_name = 'A1';

-- Sử dụng câu lệnh Where để hiển thị điểm môn CF của các học viên
SELECT S.student_id, S.student_name, M.mark
FROM student S JOIN mark M on S.student_id = M.student_id JOIN `subject` Sub on Sub.sub_id = M.sub_id
WHERE Sub.sub_name = 'CF';












