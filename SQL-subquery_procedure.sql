--Subquery--
use happy;
select * from employe

select * from employe --outrequery/mainquery
where e_salary>(select avg(e_salary) from employe) --subquery/innerquery

select * from employe e 
where e.e_salary = (select Max(e_salary) 
from employe
where e_dept=e.e_dept)

select * from department
where d_name not in (
select distinct e_dept from employe)

select * from department d
where not exists(select 1 from employe e where e.e_dept=d.d_name)

--using a subquery in select clause
select * 
,(case when e_salary > (select avg(e_salary) from employe)
			then 'higher than average'
	  else null
end ) as remarks
from employe

create procedure abc
as
begin 
	select e_age,e_name,e_dept from employe
end

exec abc;

create procedure employe_table
as
begin 
	select * from employe
end

exec employe_table