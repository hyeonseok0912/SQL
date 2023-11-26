SELECT * FROM EMP;

CONN
SHOW USER
DESC;
ASC;

SELECT * FROM TAB;

SELECT * FROM EMP;

SELECT DISTINCT DEPTNO FROM EMP;

SELECT ENAME, COMM, SAL, SAL * 12+COMM AS ANNSAL FROM EMP;

SELECT ENAME, JOB FROM EMP
ORDER BY ENAME ASC;

SELECT ENAME, JOB, HIREDATE FROM EMP
ORDER BY HIREDATE DESC;

SELECT ENAME, JOB, HIREDATE, DEPTNO FROM EMP
ORDER BY DEPTNO DESC, ENAME ASC;

-- �ҹ��ڷ� ����, �ձ��ڸ� �빮��
SELECT ENAME, LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

-- ����̸��� �빮�ڷ� ����ϼ���
SELECT ENAME, UPPER(ENAME)
FROM EMP;

-- ���ڼ� üũ (����)
SELECT ENAME, LENGTH(ENAME) FROM EMP;

--------------------------------------------------------------------------------

-- 5���� �̻�
SELECT ENAME, LENGTH(ENAME)
FROM EMP
WHERE LENGTH(ENAME)>=5;

-- LENGTH�� LENGTHB �Լ� ��
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�')
FROM DUAL;

SELECT LENGTH('AB'), LENGTHB('AB')
FROM DUAL;
-- �ѱ��� �ѱ��ڴ� 2 ����Ʈ, ����� 1����Ʈ


-- DUAL ���̺��� ���̺� �ƴѵ� SELECT ���� �ִ� ���� ���߱� ���� ������ ���̺�
SELECT 1+1 FROM DUAL;

-- SUBSTR �Ϻ� ���ڿ� ���
SELECT JOB, SUBSTR(JOB,2), SUBSTR(JOB,2,3) FROM EMP;


-- SUBSTR �Լ��� ����ؼ� EMP ���̺��� ��� ��� �̸��� ����° ���ں��� ������ ���
SELECT ENAME , SUBSTR(ENAME,3)
FROM EMP;

-- INSTR('HELLO,ORACLE!', 'L') => ó������ ã��
-- INSTR('HELLO,ORACLE!', 'L', 2) => �ּ� 2��°���� ã��
-- INSTR('HELLO,ORACLE!', 'L', 1,3) => �ּ� 1��°���� ã���鼭 L�� 3�����ΰ� ã��
SELECT INSTR('HELLO,ORACLE!', 'L'), INSTR('HELLO,ORACLE!', 'L',2),
    INSTR('HELLO,ORACLE!', 'L',1,3)
FROM DUAL;

-- REPLACE ���ڿ� ��ü�ϱ�
SELECT '010-1234-5678', REPLACE('010-1234-5678','-','')
FROM DUAL;

-- LPAD(���ʺ��� ä���), RPAD(�����ʺ��� ä���)
SELECT 'ORACLE',
    LPAD('ORACLE',20),
    RPAD('ORACLE',20),
    LPAD('ORACLE',20,'#'),
    RPAD('ORACLE',20,'*')
FROM DUAL;

SELECT CONCAT(CONCAT (EMPNO, ENAME), JOB)
FROM EMP;

SELECT CONCAT(CONCAT (EMPNO,':'), ENAME)AS CON
FROM EMP;

SELECT EMPNO|| ' : ' ||ENAME
FROM EMP;

SELECT 1234.5678, ROUND(1234.5678), ROUND(1234.5678, 2),
CEIL(1234.5678), FLOOR(1234.5678), MOD(11,2),
TRUNC(1234.5678,2)
FROM DUAL;

SELECT CEIL(3.14),
FLOOR(3.14),
CEIL(-3.14),
FLOOR(-3.14)
FROM DUAL;

SELECT SYSDATE AS NOW,
SYSDATE-1 AS YESTERDAY,
SYSDATE+1 AS TOMORROW
FROM DUAL;

SELECT SYSDATE, SYSDATE+1, SYSDATE+10
FROM DUAL;

SELECT SYSDATE,
ADD_MONTHS(SYSDATE, 3)
FROM DUAL;

SELECT ENAME, HIREDATE,
ADD_MONTHS(HIREDATE, 10) AS WORK10YEAR
FROM EMP;

SELECT ROUND (MONTHS_BETWEEN(SYSDATE, HIREDATE))
FROM EMP;

SELECT ROUND (MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS TEMP
FROM EMP;

TEMP.MONTHS_BETWEEN().ROUND().CEIL()

SELECT
    ROUND(SYSDATE, 'CC'),
    ROUND(SYSDATE, 'YYYY'),
    ROUND(SYSDATE, 'HH')
    FROM DUAL;
   
SELECT EMPNO, ENAME, EMPNO + '500'
FROM EMP
WHERE ENAME = 'SCOTT';


SELECT EMPNO + 'ABCD' FROM EMP;

/*���ڿ� ���ڿ��� ����ȯ ����, ���ڿ� ��¥�� ����ȯ ����
�׷��� ���ڿ� ��¥ ������ ����ȯ�� �Ұ���
���� - ���� - ��¥ ����
�����ϰ� �Ϸ��� ���� ���¸� ���ľ���
TO_CHAR - ���� �Ǵ� ��¥ �����͸� ���� �����ͷ� ��ȯ
TO-NUMBER - ���� �����͸� ���� �����ͷ� ��ȯ
TO-DATE - ���� �����͸� ��¥ �����ͷ� ��ȯ*/

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð�
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS') AS ���糯¥�ð�
FROM DUAL;

SELECT 1300 - '1500',
    '1300' + 1500
    FROM DUAL;
   
SELECT TO_NUMBER('1300') + TO_NUMBER('1500')
FROM DUAL;

--�̰� �� �ȵ���? �̵� ������ �����غ���
SELECT TO_NUMBER('11,300', '99999,999') - TO_NUMBER('1,500', '999,999')
FROM DUAL;

SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1,
    TO_DATE('20180714', 'YYYY%MM%DD') AS TODATE2
    FROM DUAL;
   
--2023�� 12�� 25��
ũ������������ ��ĥ ���ҽ��ϱ�?
--SELECT ROUND (MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS TEMP
--FROM EMP;

SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2023-12-25'))
FROM DUAL;

SELECT ROUND(TO_DATE('2023-12-25','YYYY-MM-DD')-SYSDATE)
FROM DUAL;

SELECT * FROM EMP;

--1981�� 6�� 1�� ���Ŀ� �Ի��� ��� ���� ���
SELECT * FROM EMP
WHERE HIREDATE > TO_DATE('1981-06-01', 'YYYY-MM-DD')
ORDER BY HIREDATE ASC;


--NVL = NULL VALUE, NULL�� ó��
SELECT COMM, NVL(COMM, 0)
FROM EMP;

SELECT COMM, NVL(COMM, 0), SAL*12 + NVL(COMM, 0)
FROM EMP;

--NVL2 = ������, ���� ������, ���� ������
SELECT COMM, NVL2(COMM, COMM, 0), SAL*12 + NVL(COMM, 0)
FROM EMP;

SELECT COMM, NVL2(COMM, 'O', 'X'), NVL2(COMM, COMM, 0)
FROM EMP;

SELECT ENAME, SAL*12 + NVL2(COMM, COMM, 0)AS ����
FROM EMP;

--NVL2(����,���϶�,�����϶�) : 3�׿�����

--���� EMP���̺� �� ��� �ٹ��ϼ� 21.5, �Ϸ� �ٹ� �ð�8�ð�
SELECT EMPNO,ENAME, SAL, TRUNC(SAL/21.5,2),ROUND(SAL/21.5/8,1)
FROM EMP;

/*��� �̸� 5���� �̻�, ���� ���� �̸�, MASKING_EMPNO ������
��� ��ȣ(EMPNO)�� �� �ڸ� �� ���ڸ��� *��ȣ�� ���, MASKING_ENAME
������ ��� �̸��� ù ���ڸ� �����ְ� ������ ���� ����ŭ *��ȣ�� ���)*/

SELECT EMPNO, RPAD(SUBSTR(EMPNO,1,2),4,'*') AS MASKING_EMPNO,
    RPAD(SUBSTR(ENAME,1,1),5,'*') AS MASKING_ENAME
    FROM EMP
    WHERE LENGTH(ENAME) >=5 AND LENGTH(ENAME) < 6;

SELECT SUM(SAL)
FROM EMP;

--���� �׷��� �׷� �Լ��� �ƴϿ��� �ȵ�
SELECT ENAME, SUM(SAL)
FROM EMP;


SELECT SUM(SAL), COUNT(ENAME), ROUND(AVG(SAL)), ROUND(STDDEV(SAL))
FROM EMP;

SELECT SUM(DISTINCT SAL),
    SUM(ALL SAL),
    SUM(SAL)
    FROM EMP;
   
--�μ� ��ȣ�� 30���� ���� �� ���ϱ�    
SELECT COUNT(*)
    FROM EMP
    WHERE DEPTNO = 30;
   
SELECT COUNT(*)
FROM EMP;

SELECT COUNT(DISTINCT SAL),
    COUNT(ALL SAL),
    COUNT(SAL)
    FROM EMP;
   
SELECT COUNT(COMM)
FROM EMP;

SELECT COUNT(*) AS ������
    FROM EMP
    WHERE SAL > 2000;

--10���μ����� �޿��� ���� ���� ����� �̸��� �޿�    
SELECT ENAME, SAL
FROM EMP
WHERE SAL = (
    SELECT MAX(SAL)
    FROM EMP
    WHERE DEPTNO = 10
);

--�μ� ��ȣ�� 30�� ������� ��� �߰� ����
SELECT AVG(NVL2(COMM, COMM, 0)) FROM EMP
WHERE DEPTNO = 30;

SELECT COMM, DEPTNO
FROM EMP;

--�μ� ��ȣ�� 20�� ����� �Ի��� �� ���� ������ �Ի��� ���
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE = (
    SELECT MIN(HIREDATE)
    FROM EMP
    WHERE DEPTNO = 20
);

--�μ��� �޿��� �ִ밪��?
SELECT MAX(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT AVG(NVL2(COMM, COMM, 0))
FROM EMP
GROUP BY DEPTNO;

SELECT DEPTNO,JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB;

SELECT DEPTNO,COMM, AVG(NVL2(COMM, COMM, 0))
FROM EMP
GROUP BY DEPTNO, COMM;

SELECT ENAME, DEPTNO, MAX(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB;

/*
GROUP BY ���� ������ �� �� ����ϴ� HAVING��
SELECT
FROM
WHERE
GROUP BY
HAVING(GROUP BY���� ����Ǵ� ������)
ORDER BY*/

SELECT DEPTNO, AVG(SAL)
FROM EMP
GROUP BY DEPTNO
HAVING AVG(SAL) > 2000;

SELECT DEPTNO, MAX(SAL)
FROM EMP
WHERE SAL > 4000
GROUP BY DEPTNO;

------------------------------------------------------------------
--1,2���� 1�� ����

--�޿��� 2500 �̻��̰� ������ ANALYST�� ��� ������ ���
SELECT * FROM EMP
WHERE SAL >= 2500
AND JOB = 'ANALYST';

/*IN �����ڸ� ����Ͽ� ���� SQL���� ����� �μ� ��ȣ�� 10, 20����
��� ������ �������� �ڵ带 �ۼ�*/
SELECT * FROM EMP
WHERE DEPTNO IN ('10','20');

/*EMP ���̺��� ����Ͽ� ������ ���� ��� �̸��� S�� ������ ��� �����͸� ���
����ϴ� SQL���� �ۼ��� ������*/
SELECT * FROM EMP
WHERE ENAME LIKE '%S';

/*EMP���̺��� ����Ͽ� 30�� �μ��� �ٹ��ϰ� �ִ� ��� �� ��å�� SALESMAN
�� ����� �����ȣ, �̸�, ��å, �޿�, �μ���ȣ�� ����ϼ���*/
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30;

/*EMP���̺��� ����Ͽ� 20��, 30�� �μ��� �ٹ��ϰ� �ִ� ��� �� �޿��� 2000�ʰ�
�� ����� ����ϼ���*/
SELECT * FROM EMP
WHERE DEPTNO IN ('20','30')
AND SAL > 2000;

/*��� �̸��� �빮�ڷ� ��µǵ��� �ڵ带 ä��������*/
SELECT UPPER(ENAME)
FROM EMP;

/*��å �̸��� 6���� �̻��� �����͸� ��µǵ��� �ڵ带 ä��������*/
SELECT * FROM EMP
WHERE LENGTH(JOB) > 6;

/*SUBSTR �Լ��� ����Ͽ� EMP ���̺��� ��� ��� �̸��� �� ��° ���ں���
������ ��µǵ��� �ڵ带 ä��������*/
SELECT SUBSTR(ENAME, 3)
FROM EMP;

--�ǽ�6.24
SELECT SYSDATE,
    ADD_MONTHS(SYSDATE, 3)
    FROM DUAL;
--�ǽ�6.25    
SELECT EMPNO, ENAME, HIREDATE,
    ADD_MONTHS(SYSDATE, 120) AS WORK10YEAR
    FROM EMP;
--�ǽ�6.27
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
    MONTHS_BETWEEN(HIREDATE,SYSDATE)AS MONTH1,
    MONTHS_BETWEEN(SYSDATE,HIREDATE)AS MONTH2,
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))AS MONTH3
    FROM EMP;
   
--���ڿ� ���ڿ�(����)�� ���Ͽ� ����ϱ�
SELECT EMPNO, ENAME, EMPNO + '500'
FROM EMP
WHERE ENAME = 'SCOTT';

/*EMPNO ������ EMP���̺��� ��� �̸��� �ټ� ���� �̻��̸� ���� ���� �̸���
��� ������ ����մϴ�. MASKING_EMPNO ������ ��� ��ȣ �� ���ڸ� �� ���ڸ��� *
��ȣ�� ����մϴ�. �׸��� MAKSING_ENAME ������ ��� �̸��� ù ���ڸ� �����ְ�
������ ���ڼ���ŭ *��ȣ�� ����ϼ���*/

SELECT RPAD(SUBSTR(EMPNO,1,2),4,'*') AS MASKING_EMPNO,
    RPAD(SUBSTR(ENAME,1,1),5,'*') AS MASKING_ENAME
    FROM EMP
    WHERE LENGTH(ENAME) >= 5 AND LENGTH(ENAME) < 6;
   
/*EMP ���̺��� ������� �� ��� �ٹ��� ���� 21.5���Դϴ� �Ϸ� �ٹ�����
8�ð����� ��������, ������ �Ϸ� �޿�(DAY_PAY)�� �ñ�(TIME_PAY)�� ����Ͽ�
����� ����մϴ�. �� �Ϸ� �޿��� �Ҽ��� �� ��° �ڸ����� ������, �ñ���
�� ��° �Ҽ������� �ݿø��ϼ���*/

SELECT EMPNO, ENAME, SAL,
    TRUNC(SAL/21.5,2) AS DAY_PAY,
    ROUND(SAL/21.5/8,1) AS TIME_PAY
    FROM EMP;
   
SELECT MAX(SAL)
    FROM EMP
    WHERE DEPTNO = 10;
       
SELECT AVG(SAL)
    FROM EMP
    WHERE DEPTNO = 30;
   
SELECT AVG(DISTINCT SAL)
    FROM EMP
    WHERE DEPTNO = 30;
   
/*�μ� ��ȣ�� 30�� ������� ��� �߰� ������ ����ϼ���*/
SELECT AVG(COMM)
    FROM EMP
    WHERE DEPTNO = 30;
/*GROUP BY���� ����Ͽ� �μ� ��ȣ�� ��� �߰� ������ ����ϵ��� �ϼ���*/
SELECT AVG(COMM)
    FROM EMP
    GROUP BY DEPTNO;
   
/*HAVING ���� ����Ͽ� EMP ���̺��� �μ��� ��å�� ��� �޿��� 500 �̻���
������� �μ� ��ȣ, ��å, �μ��� ��å�� ��� �޿��� ��µǵ��� �ۼ��ϼ���*/
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >=500;