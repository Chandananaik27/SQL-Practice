create database happy;
use happy;
create table employe(
e_id int not null,
e_name varchar(20),
e_salary int,
e_age int,
e_gender varchar(20),
e_dept varchar(20)
primary key(e_id));
insert into employe values(1,'sam',95000,45,'male','operation');
insert into employe values(2,'bob',80000,21,'male','Support');
insert into employe values(3,'anne',125000,25,'female','analytics');
insert into employe values(4,'julia',73000,30,'female','analytics');
insert into employe values(5,'matt',159000,33,'male','sales');
insert into employe values(6,'jeff',112000,27,'male','operation');

---SQL operators

select * from employe where e_gender='male' and e_age<30;
select * from employe where e_dept='operation' and e_salary>100000;

select * from employe where e_dept='operation'or e_dept='analytics'
select * from employe where e_salary=100000 or e_age<30;

select * from employe where not e_gender='female';
select * from employe where not e_age<30;

select * from employe where e_name like 'j%';
select * from employe where e_age like '3_';

select * from employe where e_age between 25 and 35;
select * from employe where e_salary between 90000 and 1000000;

---SQL caluses

select * from employe order by e_salary;
select * from employe order by e_salary desc;

select top 3* from employe order by e_age desc;
select * from employe order by e_age desc limit 3;

select avg(e_salary),e_gender from employe group by e_gender;
select avg(e_age),e_dept from employe group by e_dept order by avg(e_age) desc;

select e_dept, avg(e_salary) as avg_salary
from employe
group by e_dept
having avg(e_salary)>100000;

select e_age from employe 
where e_age <30;
