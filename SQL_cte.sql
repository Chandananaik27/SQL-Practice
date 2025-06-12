use happy
select * from employe
with my_cte as (
select e_name,e_salary
from employe
where e_dept='analytics'and e_salary>50000
)
select * from my_cte
