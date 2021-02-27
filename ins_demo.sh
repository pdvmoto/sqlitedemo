!#/bin/ksh

set -v

# now try orademo
sqlite3 myfirst.dat <<EOF

--
-- Copyright (c) Oracle Corporation 1988, 2000.  All Rights Reserved.
--
-- NAME
--   demobld.sql
--
-- DESCRIPTION
--   This script creates the SQL*Plus demonstration tables in the
--   current schema.  It should be STARTed by each user wishing to
--   access the tables.  To remove the tables use the demodrop.sql
--   script.
--
--  USAGE
--    modified for use with sqlite3

DROP TABLE EMP;
DROP TABLE DEPT;

-- Caveat!
PRAGMA foreign_keys=true ;          

CREATE TABLE DEPT
       (DEPTNO NUMBER(2) CONSTRAINT pk_dept PRIMARY KEY,
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13) );

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE EMP
       (EMPNO NUMBER(4) CONSTRAINT pk_emp PRIMARY KEY,
        ENAME VARCHAR2(10),
        JOB VARCHAR2(9),
        MGR NUMBER(4),
        HIREDATE DATE,
        SAL NUMBER(7, 2),
        COMM NUMBER(7, 2),
        DEPTNO NUMBER(2) ,
     foreign key ( deptno)  REFERENCES dept(deptno)
   );

-- Caveat!
pragma foreign_keys=true ;          

INSERT INTO EMP VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        DATE('1980-12-17'),  800, NULL, 20);
INSERT INTO EMP VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        DATE('1981-02-20'), 1600,  300, 30);
INSERT INTO EMP VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        DATE('1981-02-22'), 1250,  500, 30);
INSERT INTO EMP VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        DATE('1981-04-02'),  2975, NULL, 20);
INSERT INTO EMP VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        DATE('1981-09-28'), 1250, 1400, 30);
INSERT INTO EMP VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        DATE('1981-05-01'),  2850, NULL, 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        DATE('1981-06-09'),  2450, NULL, 10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        DATE('1982-12-09'), 3000, NULL, 20);
INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        DATE('1981-11-17'), 5000, NULL, 10);
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        DATE('1981-09-08'),  1500,    0, 30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        DATE('1983-01-12'), 1100, NULL, 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        DATE('1981-12-03'),   950, NULL, 30);
INSERT INTO EMP VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        DATE('1981-12-03'),  3000, NULL, 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        DATE('1982-01-23'), 1300, NULL, 40);

-- test FK.. this one should fail
INSERT INTO EMP VALUES(7935,'MILLER2','CLERK',7782,'1982-01-23',1300,NULL,100);

COMMIT;

select '  ---- Demonstration table build is complete. --- ' ; 

EOF

echo demo build done, check using   sqlite3 myfirst.dat

