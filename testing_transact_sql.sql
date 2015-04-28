
begin tran dan
exec AddClassToSchedule 'a', 'a', 'a', 'a', 'a', 1, 'beginner', 'a', 1

commit tran dan

rollback tran dan



select * from Class