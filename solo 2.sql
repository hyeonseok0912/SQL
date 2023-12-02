SELECT *
    FROM EMP
    WHERE SAL > (
        SELECT AVG(SAL)
            FROM EMP
    );
   
SELECT ENAME, SAL
    FROM EMP
    WHERE SAL IN (
        SELECT MAX(SAL)
            FROM EMP
            GROUP BY DEPTNO
    );
   
SELECT *
    FROM EMP
    WHERE EXISTS (
        SELECT DNAME
            FROM DEPT
            WHERE DEPTNO = 10
    );

CREATE TABLE DEPT_TEMP
    AS SELECT * FROM DEPT;

INSERT INTO DEPT_TEMP
    VALUES (50, 'SALES', 'SEOUL');
   
INSERT INTO DEPT_TEMP (DEPTNO, LOC)
    VALUES (40, 'BUSAN');
   
SELECT *
    FROM DEPT_TEMP;

INSERT INTO DEPT_TEMP (DEPTNO, DNAME, LOC)
SELECT * FROM DEPT;

UPDATE DEPT_TEMP SET
    LOC = 'BUSAN'
    WHERE DEPTNO = 20;
   
SELECT * FROM DEPT_TEMP;

UPDATE DEPT_TEMP SET
    LOC = 'DAEGU',
    DNAME = 'HR'
    WHERE DEPTNO = 50;

CREATE USER ORCLSTUDY
IDENTIFIED BY ORACLE;

SELECT *
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO;

SELECT EMPNO ENAME, E.DEPTNO, DNAME
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND E.SAL >= 3000;
   
SELECT E.EMPNO, E.ENAME, DEPTNO, D.DNAME
    FROM EMP E NATURAL JOIN DEPT D
    WHERE E.SAL >= 3000;
   
SELECT E.EMPNO, E.ENAME, D.DNAME
    FROM EMP E JOIN DEPT D USING(DEPTNO)
    WHERE E.SAL >= 3000;
   
SELECT E.EMPNO, E.ENAME, D.DNAME
    FROM EMP E JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
    WHERE E.SAL >= 3000;
   
SELECT *
    FROM EMP E1 LEFT OUTER JOIN EMP E2 ON (E1.MGR = E2.EMPNO);
   
SELECT *
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO(+);
   
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM
    FROM EMP E JOIN DEPT D USING(DEPTNO)
    WHERE E.SAL >= 3000
    AND E.MGR IS NOT NULL;
   
SELECT *
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO(+)
    AND E.SAL >= 3000
    AND E.MGR IS NOT NULL;
   
SELECT *
    FROM EMP E NATURAL JOIN DEPT D
    WHERE E.SAL >=3000
    AND E.MGR IS NOT NULL;
   
SELECT *
    FROM EMP E LEFT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
    WHERE E.SAL >= 3000
    AND E.MGR IS NOT NULL;
   
SELECT *
    FROM EMP E RIGHT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
    WHERE E.SAL >= 3000
    AND E.MGR IS NOT NULL;
   
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
    FROM EMP E LEFT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
    WHERE E.SAL > 2000
    ORDER BY E.DEPTNO;
    
SELECT * FROM TAB;

DESC BOOK;

SELECT * FROM BOOK;

SELECT DISTINCT(PUBLISHER) FROM BOOK;

--���ǻ纰�� �Ⱓ�� å�� �Ǽ���?
SELECT PUBLISHER, COUNT(*)
    FROM BOOK
    GROUP BY PUBLISHER;
   
--�౸�� ���� å�� ����� ���ǻ��?
SELECT BOOKNAME, PUBLISHER
    FROM BOOK
    WHERE BOOKNAME LIKE '%�౸%';
   
SELECT * FROM CUSTOMER;

SELECT * FROM ORDERS;

--�������� �� å�� �Ǽ���?
SELECT COUNT(*)
    FROM ORDERS
    WHERE CUSTID = (
        SELECT CUSTID
            FROM CUSTOMER
            WHERE NAME = '������'
    );
   
SELECT NAME, COUNT(*)
    FROM CUSTOMER C JOIN ORDERS O USING (CUSTID)
    WHERE C.NAME = '������'
    GROUP BY C.NAME;
   
--�������� �� å�� ���԰����� �Ѿ���?
SELECT NAME, SUM(SALEPRICE)
    FROM CUSTOMER C JOIN ORDERS O USING (CUSTID)
    WHERE C.NAME = '������'
    GROUP BY C.NAME;
   
--�������� �� å�� ����� ���ǻ��?
SELECT NAME, B.BOOKNAME, B.PUBLISHER
    FROM CUSTOMER C JOIN ORDERS O USING (CUSTID)
    JOIN BOOK B USING (BOOKID)
    WHERE C.NAME = '������';

SELECT * FROM ORDERS;

--2014�� 7�� 4�� ~ 7�� 7�� ���ȿ� �ֹ����� ������ BOOKID
SELECT BOOKID, ORDERDATE
    FROM ORDERS
    WHERE ORDERDATE BETWEEN '2014/07/04' AND '2014/07/07';
   
--2014�� 7�� 4�� ~ 7�� 7�� ���ȿ� �ֹ����� ������ BOOKNAME
SELECT BOOKNAME, ORDERDATE
    FROM ORDERS O JOIN BOOK USING (BOOKID)
    WHERE ORDERDATE BETWEEN '2014/07/04' AND '2014/07/07';
   
SELECT * FROM ORDERS;

SELECT * FROM BOOK;