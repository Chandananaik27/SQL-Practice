use happy;
create table department(d_id int,d_name varchar(20),d_location varchar(20));
insert into department values(1,'content','newyork');
insert into department values(2,'support','chicago');
insert into department values(3,'analytics','newyork');
insert into department values(4,'sales','boston');
insert into department values(5,'tech','dalla');
insert into department values(6,'finance','chicago');
select * from department;
select * from employe;

---Inner join---
select employe.e_id,employe.e_dept,department.d_name,department.d_location
from employe
inner join department on department.d_name=employe.e_dept;

select e.e_id,e.e_name,e.e_dept,e.e_salary,e.e_age,e.e_gender,d.d_location
from employe e
inner join department d on e.e_dept=d.d_name;

select e.e_name,e.e_dept,d.d_location
from employe e
inner join department d on e.e_dept=d.d_name
where d.d_location='newyork'

---Left join---
select e.e_name,e.e_dept,d.d_name,d.d_location
from employe e 
left join department d on
e.e_dept=d.d_name;

select e.e_id,e.e_name,e.e_dept,d.d_name
from employe e
left join department d
on e.e_dept=d.d_name
where d_name is null;

---Right Join---
select e.e_name,e.e_dept,d.d_name,d.d_location
from employe e
right join department d
on e.e_dept=d.d_name;

select d.d_name,count(e.e_id) as employe_count
from employe e
right join department d on
e.e_dept=d.d_name
group by d.d_name;

---Full Join---

select e.e_name,e.e_dept,d.d_name,d.d_location
from employe e
full join department d on
e.e_dept=d.d_name;

---all employees who don’t match any department OR all departments that don’t have any employee.---
select e.e_id,e.e_name,e.e_dept,d.d_name,d.d_location
from employe e
full join department d
on e.e_dept=d.d_name
where e.e_id is null or d.d_name is null;

---self join--

---all pairs of employees working in the same department---
select a.e_name as employe1,b.e_name as employ2,a.e_dept
from employe a
join employe b
on a.e_dept=b.e_dept and a.e_id<b.e_id;

select distinct a.e_name,a.e_dept
from employe a
join employe b
on a.e_dept=b.e_dept and a.e_id<>b.e_id;


