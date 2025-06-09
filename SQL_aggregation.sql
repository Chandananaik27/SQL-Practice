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

select count(*) as total_employe from employe;
select e_dept,count(*) as employe_count
from employe
group by e_dept;

select sum(e_salary) as total_salry
from employe;
select sum(e_salary) total_analytics_salary
from employe
where e_dept='analytics'
select sum(e_salary) as feamle_salary
from employe
where e_gender='female';

select avg(e_salary) as avg_salry
from employe
select avg(e_age) as avg_age
from employe 
where e_dept='operation'

select min(e_salary) as min_salary
from employe
select min(e_age) as min_age
from employe
where e_dept='sales'
select e_gender,e_dept ,min(e_salary) as min_salary
from employe
where e_dept not in ('support','sales')
group by e_gender,e_dept

select max(e_salary) as max_salary
from employe
select max(e_age) as max_age
from employe
where e_dept='analytics'
select e_age, e_dept,max(e_salary) as max_salary
from employe
where e_age>30
group by e_age,e_dept;