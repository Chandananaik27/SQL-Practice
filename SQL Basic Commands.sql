create database student;
use student;

--DDL
create table student_info1(id int,name varchar(50),age int,grade int,marks int);
insert into student_info1 values(1,'chan',23,12,34);
insert into student_info1 values(2,'chai',21,13,36);
insert into student_info1 values(3,'arun',20,14,44);
insert into student_info1 values(4,'manuu',24,15,54);
select * from student_info1;
update student_info1 set age=22 where name='arun';
delete from student_info1 where id=2;
drop table student_info1;
drop table student2;
drop table student;

create table student1(id int,
first_name varchar(40),
last_name varchar(40),
age int);
alter table student1 
add mid_name varchar(30);
exec sp_rename 'first_name' , 'frst_name','column';

--DML
insert into student1 values(1,'chandu','naik',20,'chandra');
insert into student1 values(2,'chandana','naik',21,'manju');
insert into student1 values(3,'chandru','k',22,'s');
insert into student1 values(4,'manu','n',23,'c');
select * from student1;
select first_name,last_name,id from student1;
update student1
set age=25
where id=1;
select *from student1;
delete from student1
where id=2;
select *from student1;

--DQL
CREATE TABLE student2 (
    student_id INT,
    name VARCHAR(50),
    age INT,
    grade CHAR(1)
);
INSERT INTO student2 (student_id, name, age, grade) VALUES
(1, 'John Doe', 20, 'A'),
(2, 'Jane Smith', 21, 'B'),
(3, 'Mark Brown', 19, 'A'),
(4, 'Emily Davis', 22, 'C');
SELECT * FROM student2;
SELECT name, grade FROM student2;

--DCL


