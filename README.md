1.Create a New Pluggable Database (PDB) Each student is required to create a PDB named plsql_class2024db. 
![n1](https://github.com/user-attachments/assets/2ccb4220-9276-478b-922b-011811113fd8)
sqlplus / as sysdba

SQL> create pluggable database ca_class2024db
  2   admin user pdbadmin identified by  carine
  3  file_name_convert=('C:\Users\hp\Documents\oracle\oradata\CARINE\pdbseed','C:\Users\hp\Documents\oracle\oradata\CARINE\ca_class2024db');
  
SQL> alter session set container=ca_class2024db;

Session altered.
2. You are required to create another Pluggable Database (PDB) based on the first two letters of your first name followed by _to_delete_pdb.
![n2](https://github.com/user-attachments/assets/f75898f2-4a72-467e-9fdc-55367d901a4b)
 create pluggable database ca_todelte_pdb
  2   admin user pdbadmin identified by  carine
  3   file_name_convert=('C:\Users\hp\Documents\oracle\oradata\CARINE\pdbseed','C:\Users\hp\Documents\oracle\oradata\CARINE\ca_todelte_pdb\');
  
SQL> DROP PLUGGABLE DATABASE ca_todelte_pdb INCLUDING DATAFILES;
3.Configure your Oracle Enterprise Manager and provide a screenshot of the dashboard after completing the above tasks.

![n3](https://github.com/user-attachments/assets/a72cc5fe-f250-42fb-9210-7389a2e36722)
SQL> sqlplus sys/password@CDB as sysdba
SP2-0734: unknown command beginning "sqlplus sy..." - rest of line ignored.
SQL> SELECT DBMS_XDB.GETHTTPPORT() FROM dual;

DBMS_XDB.GETHTTPPORT()
----------------------
                     0

SQL> sqlplus sys/password@CDB as sysdba
SP2-0734: unknown command beginning "sqlplus sy..." - rest of line ignored.
SQL> EXEC DBMS_XDB.SETHTTPPORT(5500); -- Optional: Set HTTP Port
BEGIN DBMS_XDB.SETHTTPPORT(5500); -- Optional: Set HTTP Port; END;

*
ERROR at line 1:
ORA-06550: line 2, column 0:
PLS-00103: Encountered the symbol "end-of-file" when expecting one of the
following:
( begin case declare end exception exit for goto if loop mod
null pragma raise return select update while with
<an identifier> <a double-quoted delimited-identifier>
<a bind variable> << continue close current delete fetch lock
insert open rollback savepoint set sql execute commit forall
merge standard pipe purge json_object


SQL> EXEC DBMS_XDB.SETHTTPPORT(8080);

PL/SQL procedure successfully completed.

SQL> SELECT DBMS_XDB.GETHTTPPORT() FROM dual;

DBMS_XDB.GETHTTPPORT()
----------------------
                  8080

SQL> lsnrctl stop
SP2-0734: unknown command beginning "lsnrctl st..." - rest of line ignored.
SQL> shutdown immediate;
Database closed.
Database dismounted.
ORACLE instance shut down.
SQL> startup;
ORACLE instance started.

Total System Global Area 2516581056 bytes
Fixed Size                  9857728 bytes
Variable Size             687865856 bytes
Database Buffers         1811939328 bytes
Redo Buffers                6918144 bytes
Database mounted.
Database opened.
