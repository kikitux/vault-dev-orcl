declare
userexist integer;

begin
  select count(*) into userexist from dba_users where username='DYNAMIC';
  if (userexist = 0) then
    execute immediate 'create user dynamic';
    execute immediate 'grant connect to dynamic';
    execute immediate 'grant create session to dynamic';
    execute immediate 'grant all privileges to dynamic';
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
    execute immediate 'grant create session to static';
    execute immediate 'grant all privileges to static';
  end if;
end;
/

declare
userexist integer;

begin
  select count(*) into userexist from dba_users where username='MYUSER';
  if (userexist = 0) then
    execute immediate 'create user myuser';
    execute immediate 'grant connect to myuser';
    execute immediate 'grant create session to myuser';
    execute immediate 'grant all privileges to myuser';
  end if;
end;
/

