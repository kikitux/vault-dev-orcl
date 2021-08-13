CREATE USER {{username}} IDENTIFIED BY "{{password}}";
GRANT CONNECT TO {{name}};
GRANT CREATE SESSION to {{name}};
GRANT DBA TO {{name}};
GRANT RESOURCE TO {{name}};
