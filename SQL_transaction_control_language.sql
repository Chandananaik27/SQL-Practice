---TCL
use happy;
create table trng(tr_id int,tr_name varchar(20),tr_fee int);
insert into trng values(101,'sqlserver',1500);
select * from trng;
begin transaction
insert into trng values(102,'python',30000);
commit; ---it has saved permanantly

begin transaction 
rollback; ---we cant come rollback if the commit has happend

begin transaction
insert into trng values(103,'java',3000);
select * from trng;
begin transaction 
rollback
select * from trng;

---
begin transaction
insert into trng values(103,'java',1500)
select * from trng;
update trng set tr_fee=15000 where tr_id=103
save transaction updated; 
update trng set tr_fee=20000 where tr_id=101
rollback transaction updated;

