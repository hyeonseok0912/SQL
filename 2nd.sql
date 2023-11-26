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

-- 소문자로 변경, 앞글자만 대문자
SELECT ENAME, LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

-- 사원이름을 대문자로 출력하세요
SELECT ENAME, UPPER(ENAME)
FROM EMP;

-- 글자수 체크 (길이)
SELECT ENAME, LENGTH(ENAME) FROM EMP;

--------------------------------------------------------------------------------

-- 5글자 이상
SELECT ENAME, LENGTH(ENAME)
FROM EMP
WHERE LENGTH(ENAME)>=5;

-- LENGTH와 LENGTHB 함수 비교
SELECT LENGTH('한글'), LENGTHB('한글')
FROM DUAL;

SELECT LENGTH('AB'), LENGTHB('AB')
FROM DUAL;
-- 한글은 한글자당 2 바이트, 영어는 1바이트


-- DUAL 테이블은 테이블도 아닌데 SELECT 문에 있는 것을 맞추기 위한 가상의 테이블
SELECT 1+1 FROM DUAL;

-- SUBSTR 일부 문자열 출력
SELECT JOB, SUBSTR(JOB,2), SUBSTR(JOB,2,3) FROM EMP;


-- SUBSTR 함수를 사용해서 EMP 테이블의 모든 사원 이름을 세번째 글자부터 끝까지 출력
SELECT ENAME , SUBSTR(ENAME,3)
FROM EMP;

-- INSTR('HELLO,ORACLE!', 'L') => 처음부터 찾기
-- INSTR('HELLO,ORACLE!', 'L', 2) => 주소 2번째부터 찾기
-- INSTR('HELLO,ORACLE!', 'L', 1,3) => 주소 1번째부터 찾으면서 L이 3번쨰인것 찾기
SELECT INSTR('HELLO,ORACLE!', 'L'), INSTR('HELLO,ORACLE!', 'L',2),
    INSTR('HELLO,ORACLE!', 'L',1,3)
FROM DUAL;

-- REPLACE 문자열 대체하기
SELECT '010-1234-5678', REPLACE('010-1234-5678','-','')
FROM DUAL;

-- LPAD(왼쪽부터 채우기), RPAD(오른쪽부터 채우기)
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

/*문자와 숫자와의 형변환 가능, 문자와 날짜도 형변환 가능
그러나 숫자와 날짜 사이의 형변환은 불가능
숫자 - 문자 - 날짜 느낌
가능하게 하려면 문자 형태를 거쳐야함
TO_CHAR - 숫자 또는 날짜 데이터를 문자 데이터로 변환
TO-NUMBER - 문자 데이터를 숫자 데이터로 변환
TO-DATE - 문자 데이터를 날짜 데이터로 변환*/

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS 현재날짜시간
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YY/MM/DD HH24:MI:SS') AS 현재날짜시간
FROM DUAL;

SELECT 1300 - '1500',
    '1300' + 1500
    FROM DUAL;
   
SELECT TO_NUMBER('1300') + TO_NUMBER('1500')
FROM DUAL;

--이거 왜 안되지? 이따 집가서 공부해보기
SELECT TO_NUMBER('11,300', '99999,999') - TO_NUMBER('1,500', '999,999')
FROM DUAL;

SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1,
    TO_DATE('20180714', 'YYYY%MM%DD') AS TODATE2
    FROM DUAL;
   
--2023년 12월 25일
크리스마스까지 며칠 남았습니까?
--SELECT ROUND (MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS TEMP
--FROM EMP;

SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2023-12-25'))
FROM DUAL;

SELECT ROUND(TO_DATE('2023-12-25','YYYY-MM-DD')-SYSDATE)
FROM DUAL;

SELECT * FROM EMP;

--1981년 6월 1일 이후에 입사한 사원 정보 출력
SELECT * FROM EMP
WHERE HIREDATE > TO_DATE('1981-06-01', 'YYYY-MM-DD')
ORDER BY HIREDATE ASC;


--NVL = NULL VALUE, NULL값 처리
SELECT COMM, NVL(COMM, 0)
FROM EMP;

SELECT COMM, NVL(COMM, 0), SAL*12 + NVL(COMM, 0)
FROM EMP;

--NVL2 = 데이터, 값이 있을때, 값이 없을때
SELECT COMM, NVL2(COMM, COMM, 0), SAL*12 + NVL(COMM, 0)
FROM EMP;

SELECT COMM, NVL2(COMM, 'O', 'X'), NVL2(COMM, COMM, 0)
FROM EMP;

SELECT ENAME, SAL*12 + NVL2(COMM, COMM, 0)AS 연봉
FROM EMP;

--NVL2(조건,참일때,거짓일때) : 3항연산자

--예제 EMP테이블 월 평균 근무일수 21.5, 하루 근무 시간8시간
SELECT EMPNO,ENAME, SAL, TRUNC(SAL/21.5,2),ROUND(SAL/21.5/8,1)
FROM EMP;

/*사원 이름 5글자 이상, 여섯 글자 미만, MASKING_EMPNO 열에는
사원 번호(EMPNO)앞 두 자리 외 뒷자리를 *기호로 출력, MASKING_ENAME
열에는 사원 이름의 첫 글자만 보여주고 나머지 글자 수만큼 *기호로 출력)*/

SELECT EMPNO, RPAD(SUBSTR(EMPNO,1,2),4,'*') AS MASKING_EMPNO,
    RPAD(SUBSTR(ENAME,1,1),5,'*') AS MASKING_ENAME
    FROM EMP
    WHERE LENGTH(ENAME) >=5 AND LENGTH(ENAME) < 6;

SELECT SUM(SAL)
FROM EMP;

--단일 그룹의 그룹 함수가 아니여서 안됨
SELECT ENAME, SUM(SAL)
FROM EMP;


SELECT SUM(SAL), COUNT(ENAME), ROUND(AVG(SAL)), ROUND(STDDEV(SAL))
FROM EMP;

SELECT SUM(DISTINCT SAL),
    SUM(ALL SAL),
    SUM(SAL)
    FROM EMP;
   
--부서 번호가 30번인 직원 수 구하기    
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

SELECT COUNT(*) AS 직원수
    FROM EMP
    WHERE SAL > 2000;

--10번부서에서 급여가 가장 높은 사원의 이름과 급여    
SELECT ENAME, SAL
FROM EMP
WHERE SAL = (
    SELECT MAX(SAL)
    FROM EMP
    WHERE DEPTNO = 10
);

--부서 번호가 30인 사원들의 평균 추가 수당
SELECT AVG(NVL2(COMM, COMM, 0)) FROM EMP
WHERE DEPTNO = 30;

SELECT COMM, DEPTNO
FROM EMP;

--부서 번호가 20인 사원의 입사일 중 제일 오래된 입사일 출력
SELECT ENAME, HIREDATE
FROM EMP
WHERE HIREDATE = (
    SELECT MIN(HIREDATE)
    FROM EMP
    WHERE DEPTNO = 20
);

--부서별 급여의 최대값은?
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
GROUP BY 절에 조건을 줄 때 사용하는 HAVING절
SELECT
FROM
WHERE
GROUP BY
HAVING(GROUP BY에만 적용되는 조건절)
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
--1,2일차 1분 복습

--급여가 2500 이상이고 직업이 ANALYST인 사원 정보만 출력
SELECT * FROM EMP
WHERE SAL >= 2500
AND JOB = 'ANALYST';

/*IN 연산자를 사용하여 다음 SQL문의 결과로 부서 번호가 10, 20번인
사원 정보만 나오도록 코드를 작성*/
SELECT * FROM EMP
WHERE DEPTNO IN ('10','20');

/*EMP 테이블을 사용하여 다음과 같이 사원 이름이 S로 끝나는 사원 데이터를 모두
출력하는 SQL문을 작성해 보세요*/
SELECT * FROM EMP
WHERE ENAME LIKE '%S';

/*EMP테이블을 사용하여 30번 부서에 근무하고 있는 사원 중 직책이 SALESMAN
인 사원의 사원번호, 이름, 직책, 급여, 부서번호를 출력하세요*/
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 30;

/*EMP테이블을 사용하여 20번, 30번 부서에 근무하고 있는 사원 중 급여가 2000초과
인 사원을 출력하세요*/
SELECT * FROM EMP
WHERE DEPTNO IN ('20','30')
AND SAL > 2000;

/*사원 이름이 대문자로 출력되도록 코드를 채워보세요*/
SELECT UPPER(ENAME)
FROM EMP;

/*직책 이름이 6글자 이상인 데이터만 출력되도록 코드를 채워보세요*/
SELECT * FROM EMP
WHERE LENGTH(JOB) > 6;

/*SUBSTR 함수를 사용하여 EMP 테이블의 모든 사원 이름을 세 번째 글자부터
끝까지 출력되도록 코드를 채워보세요*/
SELECT SUBSTR(ENAME, 3)
FROM EMP;

--실습6.24
SELECT SYSDATE,
    ADD_MONTHS(SYSDATE, 3)
    FROM DUAL;
--실습6.25    
SELECT EMPNO, ENAME, HIREDATE,
    ADD_MONTHS(SYSDATE, 120) AS WORK10YEAR
    FROM EMP;
--실습6.27
SELECT EMPNO, ENAME, HIREDATE, SYSDATE,
    MONTHS_BETWEEN(HIREDATE,SYSDATE)AS MONTH1,
    MONTHS_BETWEEN(SYSDATE,HIREDATE)AS MONTH2,
    TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE))AS MONTH3
    FROM EMP;
   
--숫자와 문자열(숫자)을 더하여 출력하기
SELECT EMPNO, ENAME, EMPNO + '500'
FROM EMP
WHERE ENAME = 'SCOTT';

/*EMPNO 열에는 EMP테이블에서 사원 이름이 다섯 글자 이상이며 여섯 글자 미만인
사원 정보를 출력합니다. MASKING_EMPNO 열에는 사원 번호 앞 두자리 외 뒷자리를 *
기호로 출력합니다. 그리고 MAKSING_ENAME 열에는 사원 이름의 첫 글자만 보여주고
나머지 글자수만큼 *기호로 출력하세요*/

SELECT RPAD(SUBSTR(EMPNO,1,2),4,'*') AS MASKING_EMPNO,
    RPAD(SUBSTR(ENAME,1,1),5,'*') AS MASKING_ENAME
    FROM EMP
    WHERE LENGTH(ENAME) >= 5 AND LENGTH(ENAME) < 6;
   
/*EMP 테이블에서 사원들의 월 평균 근무일 수는 21.5일입니다 하루 근무일을
8시간으로 보았을때, 사언들의 하루 급여(DAY_PAY)와 시급(TIME_PAY)을 계산하여
결과를 출력합니다. 단 하루 급여는 소수점 세 번째 자리에서 버리고, 시급은
두 번째 소수점에서 반올림하세요*/

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
   
/*부서 번호가 30인 사원들의 평균 추가 수당을 출력하세요*/
SELECT AVG(COMM)
    FROM EMP
    WHERE DEPTNO = 30;
/*GROUP BY절을 사용하여 부서 번호별 평균 추가 수당을 출력하도록 하세요*/
SELECT AVG(COMM)
    FROM EMP
    GROUP BY DEPTNO;
   
/*HAVING 절을 사용하여 EMP 테이블의 부서별 직책의 평균 급여가 500 이상인
사원들의 부서 번호, 직책, 부서별 직책의 평균 급여가 출력되도록 작성하세요*/
SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    GROUP BY DEPTNO, JOB
    HAVING AVG(SAL) >=500;