--부서번호가 30번인 사원정보
SELECT  * FROM EMP;

SELECT * FROM EMP
WHERE DEPTNO = 30;

/*
부서번호가 30번인 사원정보
부서번호가 10번인 사원정보
부서번호가 20번인 사원정보*/
SELECT * FROM EMP
WHERE DEPTNO = 30 OR DEPTNO = 10 OR DEPTNO = 20;

/*부서번호가 10번이 아닌 사원 정보*/
SELECT * FROM EMP
WHERE EMPNO != 10;

/*부서번호가 10, 20, 30번이 아닌 사원정보*/
SELECT * FROM EMP
WHERE DEPTNO NOT IN (10,20,30);

/*급여의 최댓값은?*/
SELECT MAX(SAL)
FROM EMP;

/*급여가 4000~5000인 사원정보*/
SELECT * FROM EMP
WHERE SAL BETWEEN 4000 AND 5000;

/*이름이 'A'로 시작하는 사원정보*/
SELECT * FROM EMP
WHERE ENAME LIKE 'A%';

/*이름 두번째 글자가 A인 사원정보*/
SELECT * FROM EMP
WHERE ENAME LIKE '_A%';

/*이름 끝에서 두번째 글자가 'A'인 사원*/
SELECT * FROM EMP
WHERE ENAME LIKE '%A_';

/*COMM의 값이 NULL인 사원 정보*/
SELECT * FROM EMP
WHERE COMM IS NULL;

/*COMM의 값이 NULL이 아닌 사원 정보*/
SELECT * FROM EMP
WHERE COMM IS NOT NULL;

/*COMM이 NULL이면 0으로 처리해서 ENAME과 COMM을 출력*/
SELECT ENAME, NVL(COMM, 0)
FROM EMP;

/*ENAME, COMM, COMM을 포함한 연봉을 출력*/
SELECT ENAME, NVL2(COMM, COMM, 0) AS YEAR_SAL
FROM EMP;

/*COMM의 값이 NULL이 아닌 사원의 수*/
SELECT COUNT(*)
FROM EMP
WHERE COMM IS NOT NULL;

/*중간에 소문자 mi가 있는 사원의 정보*/
SELECT * FROM EMP
WHERE ENAME LIKE '%MI%'
OR ENAME LIKE '%mi%';
--이거 아니면
SELECT ENAME, LOWER(ENAME) FROM EMP
WHERE ENAME LIKE '%MI%';

/*1+1의 길이*/
SELECT LENGTH('1+1')
FROM DUAL;

SELECT 1+1
FROM DUAL;

/*990723 - 2824014에서 뒤쪽부분만 출력*/
SELECT SUBSTR('990723-2824014','8')
FROM DUAL;

/*앞쪽 부분만 출력*/
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
--순서 : 2 -> 3 -> 4 -> 5 -> 1-> 6    

SELECT DEPTNO, JOB, AVG(SAL)
    FROM EMP
    WHERE JOB IN ('MANAGER', 'ANALYST')
    GROUP BY DEPTNO, JOB
    ORDER BY DEPTNO;
   
/*HAVING절을 사용하여 EMP 테이블의 부서별 직책의 평균 급여가 500 이상인 사원들의
부서 번호, 직책, 부서별 직책의 평균 급여가 출력되도록 SQL문을 작성하시오*/
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
--ROLLUP은 GROUP에 따른 중간값을 보여주는 느낌

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
   
/*EMP 테이블을 이용하여 부서번호, 평균급여, 최고급여, 최저 급여, 사원 수를 출력합니다.
단 평균 급여를 출력할 때 소수점을 제외하고, 각 부서 번호별로 출력하세요*/
SELECT DEPTNO, ROUND(AVG(SAL)), MAX(SAL), MIN(SAL), COUNT(*)
    FROM EMP
    GROUP BY DEPTNO;
   
/*같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력하세요*/
SELECT JOB, COUNT(*)
    FROM EMP
    GROUP BY JOB
    HAVING COUNT(*) >= 3;
   
/*사원들의 입사 연도를 기준으로 부서별로 몇 명이 입사했는지 출력하세요*/
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, DEPTNO, COUNT(*)
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO
    ORDER BY HIRE_YEAR DESC;

/*추가 수당을 받은 사원 수와 받지 않은 사원 수를 구하시오*/
SELECT NVL2(COMM, 'O', 'X'), COUNT(*)
    FROM EMP
    GROUP BY NVL2(COMM, 'O', 'X');
   
/*각 부서의 입사 연도별 사원 수, 최고 급여, 급여 합, 평균 급여를 출력하고 각 부서별
소계와 총계를 출력하세요*/
--문제 풀어보기(CUBE)활용;

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
   
/*SMITH의 JOB과 LOC는?*/
SELECT E.ENAME, E.JOB, D.LOC
    FROM EMP E, DEPT D
    WHERE E.ENAME = 'SMITH';
   
/*EMP 테이블 별칭을 E로, DEPT 테이블 별칭은 D로 하여 다음과 같이 등가조인 했을때
급여가 2500이하이고 사원 번호가 9999 이하인 사원의 정보가 출력되도록 다음 SQL문을
작성하시오*/
SELECT *
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL <= 2500
    AND E.EMPNO <= 9999;
   
/*각 부서의 입사 연도별 사원 수, 최고 급여, 급여 합, 평균 급여를 출력하고 각 부서별
소계와 총계를 출력하세요*/
--문제 풀어보기(CUBE)활용
SELECT DEPTNO, TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, COUNT(*),
    MAX(SAL) AS MAX_SAL, SUM(SAL) AS SUM_SAL, AVG(SAL) AS AVG_SAL
    FROM EMP
    GROUP BY TO_CHAR(HIREDATE, 'YYYY'), CUBE(DEPTNO);

SELECT * FROM SALGRADE;

--SAL 에 따른 GRADE 판별 이따 복습  
SELECT E.ENAME, E.SAL, S.GRADE
    FROM EMP E, SALGRADE S
    WHERE E.SAL > S.LOSAL AND E.SAL <= S.HISAL;

SELECT E.ENAME, E.SAL, S.GRADE
    FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

SELECT *
    FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;
   
/*SMITH의 급여액과 급여 등급*/
SELECT E.ENAME, E.SAL, S.GRADE
    FROM EMP E, SALGRADE S
    WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL
    AND E.ENAME = 'SMITH';

CREATE TABLE EMP_NEW AS SELECT * FROM EMP;

SELECT *
    FROM EMP;
   
SELECT *
    FROM EMP_NEW;
   
/*SMITH의 직속 매니저 이름은?*/
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
   
/*급여가 20000 초과인 사원들의 부서 정보, 사원 정보를
오른쪽과 같이 출력*/
--SELECT * FROM DEPT;
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND SAL > 2000
    ORDER BY E.DEPTNO ASC;

--부서별 평균 급여, 최대 급여, 최소 급여, 사원수
SELECT E.DEPTNO, D.DNAME,
    AVG(SAL) AS AVG_SAL,
    MAX(SAL) AS MAX_SAL,
    MIN(SAL) AS MIN_SAL,
    COUNT(E.DEPTNO) AS CNT
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    GROUP BY E.DEPTNO, D.DNAME
    ORDER BY E.DEPTNO ASC;
   
--모든 부서 정보와 사원 정보를 오른쪽과 같이 부서 번호, 사원 이름 순으로 정렬
SELECT E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    ORDER BY E.DEPTNO ASC, E.ENAME ASC;
   
/*모든 부서 정보, 사원 정보, 급여 등급 정보, 각 사원의 직속 상관의 정보를
부서 번호, 사원 번호 순서로 정렬하여 출력해보세요*/
--쉬는시간에 해보기

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

/*서브쿼리를 사용하여 EMP 테이블의 사원 정보 중에서 사원 이름이 ALLEN인
사원의 추가 수당보다 많은 추가 수당을 받는 사원 정보를 구하시오*/
SELECT ENAME, COMM
    FROM EMP
    WHERE COMM > (
        SELECT COMM
        FROM EMP
        WHERE ENAME = 'ALLEN'
    );

/*DALLAS에 근무하는 사원의 이름*/
SELECT ENAME
    FROM EMP
    WHERE DEPTNO = (
        SELECT DEPTNO
        FROM DEPT
        WHERE LOC = 'DALLAS'
    );

/*서브쿼리를 사용하여 EMP 테이블에서 전체 사원의 평균 급여보다 작거나
같은 급여를 받고 있는 20번 부서의 사원 및 부서의 정보를 구하시오*/
SELECT D.DNAME, E.ENAME
    FROM EMP E, DEPT D
    WHERE E.SAL <=(
        SELECT AVG(SAL)
        FROM EMP
    )
    AND E.DEPTNO = 20;

/*서브쿼리를 사용하여 SCOTT의 입사 선배의 이름을 구하시오*/
SELECT ENAME
    FROM EMP
    WHERE HIREDATE < (
        SELECT HIREDATE
        FROM EMP
        WHERE ENAME = 'SCOTT'
    );
   
/*평균 월급보다 많이 받는 사원의 이름은?*/
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

/*서브쿼리를 이용하여 EMP 테이블의 사원 중에 10번 부서에 속한 모든 사원
들보다 일찍 입사한 사원 정보를 구하도록 코드를 채워 보세요*/
SELECT *
    FROM EMP
    WHERE TO_CHAR(HIREDATE, 'YYYY-MM-DD') < (
        SELECT MIN(HIREDATE)
        FROM EMP
        WHERE DEPTNO = 10
    );
   
/*전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사원 정보, 부서
정보, 급여 등급 정보를 출력하는 SQL문을 작성하세요*/
SELECT E.ENAME, D.DNAME, E.SAL
    FROM EMP E, DEPT D
    WHERE E.DEPTNO = D.DEPTNO
    AND E.SAL > (
        SELECT AVG(SAL)
        FROM EMP
    );