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