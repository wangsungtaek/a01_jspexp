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


SELECT * FROM dept2;
SELECT * FROM emp2 where empno =7369;