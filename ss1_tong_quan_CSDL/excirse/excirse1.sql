create table  if not exists Class (
iD int primary key,
`name` nvarchar(50)
);

create table if not exists Teacher(
iD int primary key,
`name` nvarchar(50),
age int,
country nvarchar(40)
);