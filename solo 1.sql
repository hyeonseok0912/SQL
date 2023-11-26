/*23/11/21 ~ 23/11/24
DB, SQL ���� ���� Ȧ�� �����غ���*/

DESC EMP;

DESC DEPT;

DESC SALGRADE;

SELECT * FROM EMP;

SELECT EMPNO, ENAME, DEPTNO
    FROM EMP;
    
SELECT EMPNO, DEPTNO
    FROM EMP;
    
SELECT DISTINCT DEPTNO
    FROM EMP;
    
SELECT DISTINCT JOB, DEPTNO
    FROM EMP;
    
SELECT ENAME, SAL, SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL+SAL, COMM
    FROM EMP;
    
SELECT ENAME, SAL, SAL*12+COMM, COMM
    FROM EMP;
    
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
    FROM EMP;
    
SELECT *
    FROM EMP
    ORDER BY SAL;
    
SELECT *
    FROM EMP
    ORDER BY EMPNO;
    
SELECT *
    FROM EMP
    ORDER BY SAL DESC;
        
SELECT *
    FROM EMP
    ORDER BY EMPNO DESC;
    
SELECT *
    FROM EMP
    ORDER BY DEPTNO ASC, SAL DESC;
    
SELECT DISTINCT JOB
    FROM EMP;
    
SELECT *
    FROM EMP;
    
SELECT *
    FROM EMP
    WHERE DEPTNO = 30;
    
SELECT *
    FROM EMP
    WHERE EMPNO = 7782;
    
SELECT *
    FROM EMP
    WHERE DEPTNO = 30
    AND JOB = 'SALESMAN';
    
SELECT *
    FROM EMP
    WHERE DEPTNO = 30
    OR JOB = 'CLERK';
    
SELECT *
    FROM EMP
    WHERE EMPNO = 7499
    AND DEPTNO = 30;
    
SELECT *
    FROM EMP
    WHERE DEPTNO = 20
    OR JOB = 'SALESMAN';
    
SELECT *
    FROM EMP
    WHERE SAL >= 2500
    AND JOB = 'ANALYST';
    
SELECT *
    FROM EMP
    WHERE ENAME >= 'F';

SELECT *
    FROM EMP
    WHERE ENAME <= 'FORZ';
    
SELECT *
    FROM EMP
    WHERE SAL != 3000;
    
SELECT *
    FROM EMP
    WHERE SAL <> 3000;
    
SELECT *
    FROM EMP
    WHERE NOT SAL = 3000;
    
SELECT *
    FROM EMP
    WHERE JOB = 'MANAGER'
    OR JOB = 'SALESMAN'
    OR JOB = 'CLERK';
    
SELECT *
    FROM EMP
    WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');
    
SELECT *
    FROM EMP
    WHERE DEPTNO IN ('10', '20');
    
SELECT *
    FROM EMP
    WHERE SAL >= 2000
    AND SAL <= 3000;
    
SELECT *
    FROM EMP
    WHERE SAL BETWEEN 2000 AND 3000;
    
SELECT *
    FROM EMP
    WHERE SAL NOT BETWEEN 2000 AND 3000;
    
SELECT *
    FROM EMP
    WHERE ENAME LIKE 'S%';
    
SELECT *
    FROM EMP
    WHERE ENAME LIKE '_L%';
    
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%AM%';
    
SELECT *
    FROM EMP
    WHERE ENAME NOT LIKE '%AM%';
    
SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
    FROM EMP;
    
SELECT *
    FROM EMP
    WHERE COMM = NULL;
    
SELECT *
    FROM EMP
    WHERE COMM IS NULL;
    
SELECT *
    FROM EMP
    WHERE MGR IS NOT NULL;
    
SELECT *
    FROM EMP
    WHERE SAL > NULL
    AND COMM IS NULL;
    
SELECT *
    FROM EMP
    WHERE SAL > NULL
    OR COMM IS NULL;
    
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 20;
    
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO
    FROM EMP
    WHERE ENAME LIKE '%S'
    ORDER BY DEPTNO ASC;

SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO = 30
    AND JOB = 'SALESMAN';
    
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP
    WHERE DEPTNO IN ('20', '30')
    AND SAL > 2000;
    
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
    FROM EMP;
    
SELECT UPPER(ENAME)
    FROM EMP;
    
SELECT ENAME, LENGTH(ENAME)
    FROM EMP;
    
SELECT ENAME, LENGTH(ENAME)
    FROM EMP;
    
SELECT ENAME, LENGTH(ENAME)
    FROM EMP
    WHERE LENGTH(ENAME) >= 5;
    
SELECT JOB, LENGTH(JOB)
    FROM EMP
    WHERE LENGTH(JOB) >= 6;
    
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5)
    FROM EMP;
    
SELECT SUBSTR(ENAME, 3)
    FROM EMP;
    
SELECT *
    FROM EMP
    WHERE INSTR(ENAME, 'S') > 0;
    
SELECT *
    FROM EMP
    WHERE ENAME LIKE '%S%';
    
SELECT '010-1234-5678' AS REPLACE_BEFORE,
    REPLACE('010-1234-5678', '-', '') AS REPLACE_1,
    REPLACE('010-1234-5678', '-') AS REPLACE_2
    FROM DUAL;
    
SELECT 'Oracle',
    LPAD('Oracle', 10, '#') AS LPAD_1,
    RPAD('Oracle', 10, '*') AS RPAD_1,
    LPAD('Oracle', 10) AS LPAD_2,
    RPAD('Oracle', 10) AS RPAD_2
    FROM DUAL;
    
SELECT
    RPAD('971125-', 14, '*') AS RPAD_JMNO,
    RPAD('010-1234-', 13, '*') AS RPAD_PHONE
    FROM DUAL;
    
SELECT CONCAT(EMPNO, ENAME),
    CONCAT(EMPNO, CONCAT(' : ', ENAME))
    FROM EMP
    WHERE ENAME = 'SMITH';
    
SELECT ROUND(1234.5678) AS ROUND,
    ROUND(1234.5678, 0) AS ROUND_0,
    ROUND(1234.5678, 1) AS ROUND_1,
    ROUND(1234.5678, 2) AS ROUND_2,
    ROUND(1234.5678, -1) AS ROUND_MINUS1,
    ROUND(1234.5678, -2) AS ROUND_MINUS2
    FROM DUAL;
    
SELECT TRUNC(1234.5678) AS TRUNC,
    TRUNC(1234.5678, 0) AS TRUNC_0,
    TRUNC(1234.5678, 1) AS TRUNC_1,
    TRUNC(1234.5678, 2) AS TRUNC_2,
    TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
    TRUNC(1234.5678, -2) AS TRUNC_MINUS2
    FROM DUAL;
    
SELECT CEIL(3.14),
    FLOOR(3.14),
    CEIL(-3.14),
    FLOOR(-3.14)
    FROM DUAL;
    
SELECT MOD(15, 6),
    MOD(10, 2),
    MOD(11, 2)
    FROM DUAL;
    
SELECT SYSDATE AS NOW,
    SYSDATE-1 AS YESTERDAY,
    SYSDATE+1 AS TOMORROW
    FROM DUAL;
    
SELECT SYSDATE,
    ADD_MONTHS(SYSDATE, 3)
    FROM DUAL;
    
SELECT EMPNO, ENAME, HIREDATE,
    ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
    FROM EMP;
    
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
    MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1,
    MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2,
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3
    FROM EMP;
    
SELECT SYSDATE,
    ROUND(SYSDATE, 'CC') AS FORMAT_CC,
    ROUND(SYSDATE, 'YYYY') AS FORMAT_YYYY,
    ROUND(SYSDATE, 'Q') AS FORMAT_Q,
    ROUND(SYSDATE, 'DDD') AS FORMAT_DDD,
    ROUND(SYSDATE, 'HH') AS FORMAT_HH
    FROM DUAL;
    
SELECT EMPNO, ENAME, EMPNO + '500'
    FROM EMP
    WHERE ENAME = 'SMITH';
    
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð�
    FROM DUAL;
    
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'MM') AS MM,
    TO_CHAR(SYSDATE, 'MON') AS MON,
    TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
    TO_CHAR(SYSDATE, 'DD') AS DD,
    TO_CHAR(SYSDATE, 'DY') AS DY,
    TO_CHAR(SYSDATE, 'DAY') AS DAY
    FROM DUAL;
    
SELECT SYSDATE,
    TO_CHAR(SYSDATE, 'HH24:MI:SS') AS HH24MISS,
    TO_CHAR(SYSDATE, 'HH12:MI:SS AM') AS HHMISS_AM,
    TO_CHAR(SYSDATE, 'HH:MI:SS P.M.') AS HHMISS_PM
    FROM DUAL;
    
SELECT 1300 - '1500',
    '1300' + 1500
    FROM DUAL;
    
SELECT TO_NUMBER('1,300', '999,999') - TO_NUMBER('1,500', '999,999')
    FROM DUAL;
    
SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1,
    TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2
    FROM DUAL;
    
SELECT *
    FROM EMP
    WHERE HIREDATE > TO_DATE('1981/06/01', 'YYYY/MM/DD');
    
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,
    NVL(COMM, 0),
    SAL + NVL(COMM, 0)
    FROM EMP;
    
SELECT EMPNO, ENAME, COMM,
    NVL2(COMM, 'O', 'X'),
    NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL
    FROM EMP;
    
SELECT EMPNO, ENAME, JOB, SAL,
    CASE JOB
    WHEN 'MANAGER' THEN SAL*1.1
    WHEN 'SALESMAN' THEN SAL*1.05
    WHEN 'ANALYST' THEN SAL
    ELSE SAL*1.03
    END AS UPSAL
    FROM EMP;
    
SELECT EMPNO, ENAME, COMM,
    CASE
    WHEN COMM IS NULL THEN '�ش���� ����'
    WHEN COMM = 0 THEN '�������'
    WHEN COMM > 0 THEN '���� : ' ||COMM
    END AS COMM_TEXT
    FROM EMP;
    
SELECT EMPNO,
    RPAD(SUBSTR(EMPNO, 1, 2),4,'*') AS MASKING_EMPNO, 
    ENAME,
    RPAD(SUBSTR(ENAME, 1, 1),5,'*') AS MASKING_ENAME
    FROM EMP
    WHERE LENGTH(ENAME) >=5
    AND LENGTH(ENAME) < 6;

SELECT EMPNO, ENAME, SAL,
    TRUNC(SAL/21.5, 2) AS DAY_PAY,
    ROUND(SAL/21.5/8, 1) AS TIME_PAY
    FROM EMP;
    
SELECT EMPNO, ENAME, MGR,
    CASE
        WHEN MGR IS NULL THEN 0000
        WHEN MGR LIKE '75%' THEN 5555
        WHEN MGR LIKE '76%' THEN 6666
        WHEN MGR LIKE '77%' THEN 7777
        WHEN MGR LIKE '78%' THEN 8888
        ELSE MGR
    END AS CHG_MGR
    FROM EMP;
    
SELECT SUM(SAL)
    FROM EMP;
    
SELECT SUM(COMM)
    FROM EMP;
    
SELECT SUM(DISTINCT SAL),
    SUM(ALL SAL),
    SUM(SAL)
    FROM EMP;
    
SELECT COUNT(*)
    FROM EMP;
    
SELECT COUNT(*)
    FROM EMP
    WHERE DEPTNO = 30;
    
SELECT COUNT(DISTINCT SAL),
    COUNT(ALL SAL),
    COUNT(SAL)
    FROM EMP;
    
SELECT COUNT(COMM)
    FROM EMP;
    
SELECT COUNT(COMM)
    FROM EMP
    WHERE COMM IS NOT NULL;
    
SELECT MAX(SAL)
    FROM EMP
    WHERE DEPTNO = 10;
    
SELECT MAX(HIREDATE)
    FROM EMP
    WHERE DEPTNO = 20;
    
SELECT MIN(HIREDATE)
    FROM EMP
    WHERE DEPTNO = 20;
    
SELECT AVG(SAL)
    FROM EMP
    WHERE DEPTNO = 30;
    
SELECT AVG(DISTINCT SAL)
    FROM EMP
    WHERE DEPTNO = 30;
    
SELECT AVG(COMM)
    FROM EMP
    WHERE DEPTNO = 30;
    
SELECT AVG(SAL), DEPTNO
    FROM EMP
    GROUP BY DEPTNO;
    
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO, JOB;
    
SELECT DEPTNO, AVG(NVL2(COMM, COMM, 0))
    FROM EMP
    GROUP BY DEPTNO
    ORDER BY DEPTNO;
    
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
        HAVING AVG(SAL) >= 2000
    ORDER BY DEPTNO, JOB;
    
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
        HAVING AVG(SAL) >= 500
    ORDER BY DEPTNO, JOB;
    
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO, JOB;
    
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
    GROUP BY ROLLUP(DEPTNO, JOB);
    
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
    GROUP BY CUBE(DEPTNO, JOB)
    ORDER BY DEPTNO, JOB;
    
SELECT DEPTNO, JOB, COUNT(*)
    FROM EMP
    GROUP BY DEPTNO, ROLLUP(JOB);
    
SELECT DEPTNO, JOB, COUNT(*)
    FROM EMP
    GROUP BY JOB, ROLLUP(DEPTNO);
    
SELECT DEPTNO, ROUND(AVG(SAL), 0) AS AVG_SAL, MAX(SAL) AS MAX_SAL, MIN(SAL) AS MIN_SAL,
    COUNT(*)
    FROM EMP
    GROUP BY DEPTNO;
    
SELECT JOB, COUNT(*)
    FROM EMP
    GROUP BY JOB
    HAVING COUNT(*) >= 3;
    
SELECT SUBSTR(HIREDATE, 3,4) AS HIRE_YEAR, DEPTNO, COUNT(*) AS CNT
    FROM EMP
    GROUP BY SUBSTR(HIREDATE, 3,4), DEPTNO;
    
SELECT NVL2(COMM, 'O', 'X') AS EXIST_COMM, COUNT(*) AS CNT
    FROM EMP
    GROUP BY NVL2(COMM, 'O', 'X');
    
SELECT DEPTNO,
    TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR,
    COUNT(*) AS CNT,
    MAX(SAL) AS MAX_SAL,
    SUM(SAL) AS SUM_SAL,
    AVG(SAL) AS AVG_SAL
    FROM EMP
    GROUP BY ROLLUP(DEPTNO, TO_CHAR(HIREDATE, 'YYYY'));
    
SELECT *
    FROM EMP, DEPT
    ORDER BY EMPNO;
    
SELECT *
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO
    ORDER BY EMPNO;
    
SELECT *
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY EMPNO;
    
SELECT E.EMPNO, D.DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY EMPNO;
    
SELECT *
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL BETWEEN 2500 AND 9999;
    
SELECT *
    FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;
    
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL > 2000
    ORDER BY DEPTNO ASC;
    
SELECT E.DEPTNO, D.DNAME,
    ROUND(AVG(SAL), 0) AS AVG_SAL,
    MAX(SAL) AS MAX_SAL,
    MIN(SAL) AS MIN_SAL,
    COUNT(*) AS CNT
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    GROUP BY E.DEPTNO, D.DNAME
    ORDER BY DEPTNO;
    
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY DEPTNO;
    
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.MGR, E.SAL,
    DEPTNO AS DEPTNO_1,
    MIN(E.SAL) AS LOSAL,
    MAX(E.SAl) AS HISAL,
    E.SAL BETWEEN S.LOSAL AND S.HISAL AS GRADE,
    E.MGR AS MGR_EMPNO,
    E.ENAME AS MGR_ENAME
    FROM EMP E, DEPT D, SALGRADE S
    GROUP BY DEPTNO, DNAME
    ORDER BY DEPTNO;
    
SELECT *
    FROM SALGRADE;
    
SELECT *
    FROM EMP
    WHERE SAL > (
        SELECT SAL
            FROM EMP
            WHERE ENAME = 'JONES'
    );
    
SELECT *
    FROM EMP
    WHERE COMM > (
        SELECT COMM
            FROM EMP
            WHERE ENAME = 'ALLEN'
    );
    
SELECT *
    FROM EMP
    WHERE HIREDATE < (SELECT HIREDATE
        FROM EMP
        WHERE ENAME = 'SMITH');
        
SELECT *
    FROM EMP
    WHERE SAL <= (
        SELECT AVG(SAL)
        FROM EMP
        WHERE DEPTNO = 20
    );
    
SELECT *
    FROM EMP
    WHERE SAL IN (
        SELECT MAX(SAL)
        FROM EMP
        GROUP BY DEPTNO
    )
    ORDER BY DEPTNO;
    
SELECT *
    FROM EMP
    WHERE HIREDATE < ALL (
        SELECT HIREDATE
        FROM EMP
        WHERE DEPTNO = 10
    );
    
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND E.JOB = (
        SELECT JOB
        FROM EMP
        WHERE ENAME = 'ALLEN'
    );

--�°� Ǯ������ ��, Ʋ���Ű���
SELECT E.EMPNO, E.SAL, S.GRADE
    FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    GROUP BY E.EMPNO, E.SAL, S.GRADE
    HAVING E.SAL > AVG(SAL);
    
CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;
    
INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
    VALUES(50, 'DATABASE', 'SEOUL');
    
SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP
    VALUES(60, 'NETWORK', 'BUSAN');
    
SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
    VALUES(70, 'WEB', NULL);
    
SELECT * FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
    VALUES(80, 'MOBILE', '');
    
SELECT * FROM DEPT_TEMP;

CREATE TABLE DEPT_TEMP2
    AS SELECT * FROM DEPT;
    
SELECT * FROM DEPT_TEMP2;

UPDATE DEPT_TEMP2
    SET DNAME = 'DATABASE',
        LOC = 'SEOUL'
    WHERE DEPTNO = 40;
    
SELECT * FROM DEPT_TEMP2;

CREATE TABLE EMP_TEMP
    AS SELECT * FROM EMP;
    
UPDATE EMP_TEMP
    SET COMM = 50
    WHERE SAL <= 2500;
    
SELECT *
    FROM EMP_TEMP;
    
DELETE FROM EMP_TEMP
    WHERE SAL >= 3000;
    
SELECT * FROM EMP_TEMP;

ROLLBACK;

CREATE TABLE CHAP10HW_DEPT
    AS SELECT * FROM DEPT;
    
SELECT *
    FROM CHAP10HW_DEPT;
    
INSERT INTO CHAP10HW_DEPT
    VALUES (50, 'ORACLE', 'BUSAN');

INSERT INTO CHAP10HW_DEPT
    VALUES (60, 'SQL', 'ILSAN');

INSERT INTO CHAP10HW_DEPT
    VALUES (70, 'SELECT', 'INCHEON');

INSERT INTO CHAP10HW_DEPT
    VALUES (80, 'DML', 'BUNDANG');

SELECT *
    FROM CHAP10HW_DEPT;
    
CREATE TABLE EMP_DDL(
    EMPNO   NUMBER(4),
    ENAME   VARCHAR2(10),
    JOB     VARCHAR2(9),
    MGR     NUMBER(4),
    HIREDATE    DATE,
    SAL     NUMBER(7,2),
    COMM    NUMBER(7,2),
    DEPTNO  NUMBER(2)
);

DESC EMP_DDL;

CREATE INDEX IDX_EMP_SAL
    ON EMP(SAL);
    
DROP INDEX IDX_EMP_SAL;

CREATE VIEW VW_EMP20
    AS (SELECT EMPNO, ENAME, JOB, DEPTNO
        FROM EMP
        WHERE DEPTNO = 20);
        
CREATE VIEW VM_EMP30ALL
    AS (SELECT *
        FROM EMP
        WHERE DEPTNO = 30);