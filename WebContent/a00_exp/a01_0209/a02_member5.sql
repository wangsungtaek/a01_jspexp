/*
[중] 2. 회원아이다, 회원패스워드, 이름, 포인트, 주소, 등록일, 권한이 있고, 
        회원아이디와 이름으로 검색하는 웹화면을 구성할려고 한다.
        위 내용을 새로운 테이블을 만들고 처리해보세요. */

CREATE TABLE member5 (
	id varchar2(50),
	pass varchar2(30),
	name varchar2(100),
	point number,
	address varchar2(500),
	regdte	Date,
	auth varchar2(20)
);
/*

 */

SELECT *
FROM member5
WHERE id LIKE '%'||'a'||'%'
AND name LIKE '%'||'철수'||'%';
INSERT INTO member5 VALUES('himan','7777','홍길동',1000,'서울 강남',sysdate,'admin');
INSERT INTO member5 VALUES('higirl','8888','심영희',1500,'충청 대전',sysdate,'user');
INSERT INTO member5 VALUES('goodman','9999','김철수',2000,'서울 방배',sysdate,'user');
INSERT INTO member5 VALUES('prettyman','5555','김현석',1200,'인천 계양',sysdate,'user');
INSERT INTO member5 VALUES('whitwolf','6666','마동길',5000,'경기 수원',sysdate,'quest');

