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
/*
[중] 2. 회원아이다, 회원패스워드, 이름, 포인트, 주소, 등록일, 권한이 있고, 
        회원아이디와 이름으로 검색하는 웹화면을 구성할려고 한다.
        위 내용을 새로운 테이블을 만들고 처리해보세요.
