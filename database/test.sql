SELECT * FROM MEMBER;

SELECT *
FROM dept
WHERE dname LIKE '%'||'E'||'%'
AND loc LIKE '%'||'A'||'%';

SELECT job, count(*) cnt,
		round(avg(sal)) avgsal
FROM EMP
GROUP BY job
having round(avg(sal)) >= 2000
ORDER BY job;

/*
private String job;
private int cnt;
private int avgsal;

*/
CREATE TABLE EMP2
AS SELECT * FROM EMP;
SELECT * FROM EMP2;

INSERT INTO emp2 values(emp21_seq.nextval, '홍길동','사원',7780,
						to_date('2021/05/01', 'YYYY/MM/DD'),3500,100,10);
INSERT INTO emp2 values(emp21_seq.nextval,'김길동','대리',0,
						to_date('2010/12/12', 'YYYY/MM/DD'),4000.0,100.0,20)
SELECT EMP21_SEQ.next FROM DUAL;
CREATE SEQUENCE EMP21_SEQ;
SELECT * FROM EMP2;

CREATE TABLE dept2
AS SELECT * FROM dept;


SELECT * FROM dept10;
SELECT * FROM emp2 where empno =7369;

CREATE TABLE product2 (
	pno NUMBER PRIMARY KEY,
	name VARCHAR2(50),
	price NUMBER,
	cnt NUMBER,
	credte DATE,
	comp VARCHAR2(100),
	incomdte DATE,
	inmanager VARCHAR2(30)
);
CREATE SEQUENCE prod2_seq
	START WITH 10000
	INCREMENT BY 1
	MINVALUE 10000
	MAXVALUE 99999
	NOCYCLE;

DROP TABLE product2;

-- 등록 sql
INSERT INTO product2 VALUES(prod2_seq.nextval, '사과',2000,100,sysdate,
	'좋은농원', sysdate, '홍길동');

-- 조회 sql
SELECT * FROM PRODUCT2 WHERE name LIKE '%'||''||'%'
   AND price BETWEEN 0 AND 99999 ORDER BY pno desc;
-- 상세 sql
SELECT * FROM PRODUCT2 WHERE PNO = 10002;

SELECT * FROM EMP2;
UPDATE EMP2
   SET ename = ename||'(변경)',
   	   job = job||'(변경)',
   	   mgr = mgr+10,
   	   hiredate = to_date('2000-12-12', 'YYYY-MM-DD'),
   	   sal = sal + 1000,
   	   comm = comm+10,
   	   deptno = deptno+10
WHERE empno = 7369;
/*
UPDATE EMP2
   SET ename = ?,
   	   job = ?,
   	   mgr = ?,
   	   hiredate = to_date(?, 'YYYY-MM-DD'),
   	   sal = ?,
   	   comm = ?,
   	   deptno = ?
WHERE empno = ?
*/
select * from dept2 where deptno=10;
select * from dept2;

UPDATE dept2
   SET deptno = deptno+10,
   	   dname = dname||'(변경)',
   	   loc = loc||'(변경)'
WHERE DEPTNO = 50;
/*
UPDATE dept2
   SET deptno = ?,
   	   dname = ?,
   	   loc = ?
WHERE DEPTNO = ?
*/

SELECT * FROM EMP2;
DELETE EMP2 WHERE EMPNO = 7;
SELECT * FROM DEPT2;
DELETE dept2 WHERE deptno = 60;

SELECT * FROM product2;

SELECT * 
FROM MEMBER5
WHERE id=?
AND pass=?;
SELECT * FROM MEMBER5 m ;

SELECT *
FROM MEMBER5;

SELECT * from MEMBER5
WHERE name like '%'||upper(?)||'%'
AND id LIKE '%'||upper(?)||'%'
ORDER BY regdte desc;

SELECT * FROM PRODUCT2 ;

--사원테이블의 부서별 최근입사일과 평균 연봉을 화면에 출력하되
--        - 입사일은 yyyy/MM/dd 형식, 연봉은 소숫점 2자리까지 표현하세요.

SELECT * FROM emp2;
SELECT deptno,
	   MAX(hiredate) hiredate, 
	   ROUND(avg(sal)) sal
  FROM emp2
 GROUP BY deptno
 ORDER BY deptno;