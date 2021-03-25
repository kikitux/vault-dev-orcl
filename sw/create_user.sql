declare
userexist integer;

begin
  select count(*) into userexist from dba_users where username='SCOTT';
  if (userexist = 0) then
    execute immediate 'create user scott';
    execute immediate 'grant connect to scott';
    execute immediate 'grant all privileges to scott';
  end if;
end;
/

declare
userexist integer;

begin
  select count(*) into userexist from dba_users where username='STATIC';
  if (userexist = 0) then
    execute immediate 'create user static';
    execute immediate 'grant connect to static';
    execute immediate 'grant all privileges to static';
  end if;
end;
/
