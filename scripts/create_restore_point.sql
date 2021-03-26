declare
restoreexist integer;

begin
  select count(*) into restoreexist from V$RESTORE_POINT where NAME='GOOD';
  if (restoreexist = 0) then
    execute immediate 'create restore point good';
  end if;
end;
/



