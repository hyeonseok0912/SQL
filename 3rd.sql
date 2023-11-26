--�μ���ȣ�� 30���� �������
SELECT  * FROM EMP;

SELECT * FROM EMP
WHERE DEPTNO = 30;

/*
�μ���ȣ�� 30���� �������
�μ���ȣ�� 10���� �������
�μ���ȣ�� 20���� �������*/
SELECT * FROM EMP
WHERE DEPTNO = 30 OR DEPTNO = 10 OR DEPTNO = 20;

/*�μ���ȣ�� 10���� �ƴ� ��� ����*/
SELECT * FROM EMP
WHERE EMPNO != 10;

/*�μ���ȣ�� 10, 20, 30���� �ƴ� �������*/
SELECT * FROM EMP
WHERE DEPTNO NOT IN (10,20,30);

/*�޿��� �ִ���?*/
SELECT MAX(SAL)
FROM EMP;

/*�޿��� 4000~5000�� �������*/
SELECT * FROM EMP
WHERE SAL BETWEEN 4000 AND 5000;

/*�̸��� 'A'�� �����ϴ� �������*/
SELECT * FROM EMP
WHERE ENAME LIKE 'A%';

/*�̸� �ι�° ���ڰ� A�� �������*/
SELECT * FROM EMP
WHERE ENAME LIKE '_A%';

/*�̸� ������ �ι�° ���ڰ� 'A'�� ���*/
SELECT * FROM EMP
WHERE ENAME LIKE '%A_';

/*COMM�� ���� NULL�� ��� ����*/
SELECT * FROM EMP
WHERE COMM IS NULL;

/*COMM�� ���� NULL�� �ƴ� ��� ����*/
SELECT * FROM EMP
WHERE COMM IS NOT NULL;

/*COMM�� NULL�̸� 0���� ó���ؼ� ENAME�� COMM�� ���*/
SELECT ENAME, NVL(COMM, 0)
FROM EMP;

/*ENAME, COMM, COMM�� ������ ������ ���*/
SELECT ENAME, NVL2(COMM, COMM, 0) AS YEAR_SAL
FROM EMP;

/*COMM�� ���� NULL�� �ƴ� ����� ��*/
SELECT COUNT(*)
FROM EMP
WHERE COMM IS NOT NULL;

/*�߰��� �ҹ��� mi�� �ִ� ����� ����*/
SELECT * FROM EMP
WHERE ENAME LIKE '%MI%'
OR ENAME LIKE '%mi%';
--�̰� �ƴϸ�
SELECT ENAME, LOWER(ENAME) FROM EMP
WHERE ENAME LIKE '%MI%';

/*1+1�� ����*/
SELECT LENGTH('1+1')
FROM DUAL;

SELECT 1+1
FROM DUAL;

/*990723 - 2824014���� ���ʺκи� ���*/
SELECT SUBSTR('990723-2824014','8')
FROM DUAL;

/*���� �κи� ���*/
SELECT SUBSTR('990723-2824014', '1','6')
FROM DUAL;

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO ASC;
   
SELECT DEPTNO, AVG(SAL)
    FROM EMP
    WHERE SAL > 1000
    GROUP BY DEPTNO
    HAVING AVG(SAL) > 2000
    ORDER BY DEPTNO;
--���� : 2 -> 3 -> 4 -> 5 -> 1-> 6    

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    WHERE JOB IN ('MANAGER', 'ANALYST')
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO;
   
/*HAVING���� ����Ͽ� EMP ���̺��� �μ��� ��å�� ��� �޿��� 500 �̻��� �������
�μ� ��ȣ, ��å, �μ��� ��å�� ��� �޿��� ��µǵ��� SQL���� �ۼ��Ͻÿ�*/
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >= 500;
   
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO, JOB;
   
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL)
    FROM EMP
    GROUP BY ROLLUP(DEPTNO, JOB)
    ORDER BY DEPTNO, JOB;    
--ROLLUP�� GROUP�� ���� �߰����� �����ִ� ����

SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL)
    FROM EMP
    GROUP BY CUBE(DEPTNO, JOB)
    ORDER BY DEPTNO, JOB;
   
SELECT DEPTNO, JOB, COUNT(*)
    FROM EMP
    GROUP BY DEPTNO, ROLLUP(JOB);
   
SELECT DEPTNO, JOB, COUNT(*)
    FROM EMP
    GROUP BY JOB, ROLLUP(DEPTNO);
   
/*EMP ���̺��� �̿��Ͽ� �μ���ȣ, ��ձ޿�, �ְ�޿�, ���� �޿�, ��� ���� ����մϴ�.
�� ��� �޿��� ����� �� �Ҽ����� �����ϰ�, �� �μ� ��ȣ���� ����ϼ���*/
SELECT DEPTNO, ROUND(AVG(SAL)), MAX(SAL), MIN(SAL), COUNT(*)
    FROM EMP
    GROUP BY DEPTNO;
   
/*���� ��å�� �����ϴ� ����� 3�� �̻��� ��å�� �ο����� ����ϼ���*/
SELECT JOB, COUNT(*)
    FROM EMP
    GROUP BY JOB
    HAVING COUNT(*) >= 3;
   
/*������� �Ի� ������ �������� �μ����� �� ���� �Ի��ߴ��� ����ϼ���*/
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*)
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO
    ORDER BY HIRE_YEAR DESC;

/*�߰� ������ ���� ��� ���� ���� ���� ��� ���� ���Ͻÿ�*/
SELECT NVL2(COMM, 'O', 'X'), COUNT(*)
    FROM EMP
    GROUP BY NVL2(COMM, 'O', 'X');
   
/*�� �μ��� �Ի� ������ ��� ��, �ְ� �޿�, �޿� ��, ��� �޿��� ����ϰ� �� �μ���
�Ұ�� �Ѱ踦 ����ϼ���*/
--���� Ǯ���(CUBE)Ȱ��;

SELECT *
    FROM EMP, DEPT
    ORDER BY EMPNO;
   
SELECT * FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO
    ORDER BY EMPNO;
   
SELECT E.ENAME, E.JOB, E.DEPTNO, D.DEPTNO, D.DNAME, D.LOC
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY EMPNO;
   
SELECT E.EMPNO, D.DNAME
    FROM EMP E, DEPT D;
   
/*SMITH�� JOB�� LOC��?*/
SELECT E.ENAME, E.JOB, D.LOC
    FROM EMP E, DEPT D
    WHERE E.ENAME = 'SMITH';
   
/*EMP ���̺� ��Ī�� E��, DEPT ���̺� ��Ī�� D�� �Ͽ� ������ ���� ����� ������
�޿��� 2500�����̰� ��� ��ȣ�� 9999 ������ ����� ������ ��µǵ��� ���� SQL����
�ۼ��Ͻÿ�*/
SELECT *
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL <= 2500
    AND E.EMPNO <= 9999;
   
/*�� �μ��� �Ի� ������ ��� ��, �ְ� �޿�, �޿� ��, ��� �޿��� ����ϰ� �� �μ���
�Ұ�� �Ѱ踦 ����ϼ���*/
--���� Ǯ���(CUBE)Ȱ��
SELECT DEPTNO, TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, COUNT(*),
    MAX(SAL) AS MAX_SAL, SUM(SAL) AS SUM_SAL, AVG(SAL) AS AVG_SAL
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY'), CUBE(DEPTNO);

SELECT * FROM SALGRADE;

--SAL �� ���� GRADE �Ǻ� �̵� ����  
SELECT E.ENAME, E.SAL, S.GRADE
    FROM EMP E, SALGRADE S
    WHERE E.SAL > S.LOSAL AND E.SAL <= S.HISAL;

SELECT E.ENAME, E.SAL, S.GRADE
    FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT *
    FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;
   
/*SMITH�� �޿��װ� �޿� ���*/
SELECT E.ENAME, E.SAL, S.GRADE
    FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND E.ENAME = 'SMITH';

CREATE TABLE EMP_NEW AS SELECT * FROM EMP;

SELECT *
    FROM EMP;
   
SELECT *
    FROM EMP_NEW;
   
/*SMITH�� ���� �Ŵ��� �̸���?*/
SELECT EMP_NEW.ENAME
    FROM EMP, EMP_NEW
    WHERE EMP.MGR = EMP_NEW.EMPNO
    AND EMP.ENAME = 'SMITH';
   
SELECT E.EMPNO, E.ENAME, E.MGR,
    N.EMPNO AS MGR_EMPNO,
    N.ENAME AS MGR_ENAME
    FROM EMP E, EMP N
    WHERE E.MGR = N.EMPNO(+);
   
SELECT E.EMPNO, E.ENAME, E.MGR,
    N.EMPNO AS MGR_EMPNO,
    N.ENAME AS MGR_ENAME
    FROM EMP E, EMP N
    WHERE E.MGR(+) = N.EMPNO
    ORDER BY E.EMPNO;
   
/*�޿��� 20000 �ʰ��� ������� �μ� ����, ��� ������
�����ʰ� ���� ���*/
--SELECT * FROM DEPT;
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL > 2000
    ORDER BY E.DEPTNO ASC;

--�μ��� ��� �޿�, �ִ� �޿�, �ּ� �޿�, �����
SELECT E.DEPTNO, D.DNAME,
    AVG(SAL) AS AVG_SAL,
    MAX(SAL) AS MAX_SAL,
    MIN(SAL) AS MIN_SAL,
    COUNT(E.DEPTNO) AS CNT
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    GROUP BY E.DEPTNO, D.DNAME
    ORDER BY E.DEPTNO ASC;
   
--��� �μ� ������ ��� ������ �����ʰ� ���� �μ� ��ȣ, ��� �̸� ������ ����
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY E.DEPTNO ASC, E.ENAME ASC;
   
/*��� �μ� ����, ��� ����, �޿� ��� ����, �� ����� ���� ����� ������
�μ� ��ȣ, ��� ��ȣ ������ �����Ͽ� ����غ�����*/
--���½ð��� �غ���

SELECT SAL
    FROM EMP
    WHERE ENAME = 'JONES';
   
SELECT ENAME, SAL
    FROM EMP
    WHERE SAL > 2975;

SELECT ENAME, SAL
    FROM EMP
    WHERE SAL > (
        SELECT SAL
        FROM EMP
        WHERE ENAME = 'JONES'
    );

/*���������� ����Ͽ� EMP ���̺��� ��� ���� �߿��� ��� �̸��� ALLEN��
����� �߰� ���纸�� ���� �߰� ������ �޴� ��� ������ ���Ͻÿ�*/
SELECT ENAME, COMM
    FROM EMP
    WHERE COMM > (
        SELECT COMM
        FROM EMP
        WHERE ENAME = 'ALLEN'
    );

/*DALLAS�� �ٹ��ϴ� ����� �̸�*/
SELECT ENAME
    FROM EMP
    WHERE DEPTNO = (
        SELECT DEPTNO
        FROM DEPT
        WHERE LOC = 'DALLAS'
    );

/*���������� ����Ͽ� EMP ���̺��� ��ü ����� ��� �޿����� �۰ų�
���� �޿��� �ް� �ִ� 20�� �μ��� ��� �� �μ��� ������ ���Ͻÿ�*/
SELECT D.DNAME, E.ENAME
    FROM EMP E, DEPT D
    WHERE E.SAL <=(
        SELECT AVG(SAL)
        FROM EMP
    )
    AND E.DEPTNO = 20;

/*���������� ����Ͽ� SCOTT�� �Ի� ������ �̸��� ���Ͻÿ�*/
SELECT ENAME
    FROM EMP
    WHERE HIREDATE < (
        SELECT HIREDATE
        FROM EMP
        WHERE ENAME = 'SCOTT'
    );
   
/*��� ���޺��� ���� �޴� ����� �̸���?*/
SELECT ENAME
    FROM EMP
    WHERE SAL > (
        SELECT AVG(SAL)
        FROM EMP
    );

SELECT ENAME, DEPTNO, SAL
    FROM EMP
    WHERE SAL IN (
        SELECT MAX(SAL)
        FROM EMP
        GROUP BY DEPTNO
    );

SELECT ENAME FROM EMP
    WHERE DEPTNO IN (10,20);

SELECT ENAME, SAL, DEPTNO
    FROM EMP
    WHERE ENAME IN ('SCOTT', 'ADAMS');

/*���������� �̿��Ͽ� EMP ���̺��� ��� �߿� 10�� �μ��� ���� ��� ���
�麸�� ���� �Ի��� ��� ������ ���ϵ��� �ڵ带 ä�� ������*/
SELECT *
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'YYYY-MM-DD') < (
        SELECT MIN(HIREDATE)
        FROM EMP
        WHERE DEPTNO = 10
    );
   
/*��ü ����� ��� �޿����� ���� �޿��� �޴� ������� ��� ����, �μ�
����, �޿� ��� ������ ����ϴ� SQL���� �ۼ��ϼ���*/
SELECT E.ENAME, D.DNAME, E.SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND E.SAL > (
        SELECT AVG(SAL)
        FROM EMP
    );