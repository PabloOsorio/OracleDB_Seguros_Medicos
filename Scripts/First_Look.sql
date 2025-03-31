SELECT * FROM v$version;
Select username from dba_users;
SELECT tablespace_name, status from dba_tablespaces;
select sid, serial#, username, status from v$session WHERE username is not null;
SELECT name, open_mode FROM v$pdbs;
SHOW con_name;
SELECT name, cdb from v$database;
Alter session set container = FREEPDB1;
show con_name;
SELECT name, open_mode, restricted FROM v$pdbs;
SELECT username from dba_users;
SELECT table_name FROM user_tables;

