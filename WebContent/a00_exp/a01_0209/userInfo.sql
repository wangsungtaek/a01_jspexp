/*
[중] 2. 회원아이다, 회원패스워드, 이름, 포인트, 주소, 등록일, 권한이 있고, 
        회원아이디와 이름으로 검색하는 웹화면을 구성할려고 한다.
        위 내용을 새로운 테이블을 만들고 처리해보세요. */

CREATE TABLE userinfo (
	u_id VARCHAR2(20),
	u_pw VARCHAR2(20),
	name VARCHAR2(20),
	point NUMBER,
	address VARCHAR2(50),
	regdate DATE,
	authority NUMBER(1)
);
DROP TABLE userinfo;
SELECT * FROM userinfo;

INSERT INTO userinfo(u_id, u_pw, name, point, address, regdate) 
	 VALUES ('aaaa', '1111', 'wang', 1000, '서울 방배', sysdate);
INSERT INTO userinfo(u_id, u_pw, name, point, address, regdate) 
	 VALUES ('bbbb', '2222', 'kim', 2000, '서울 신림', sysdate);
INSERT INTO userinfo(u_id, u_pw, name, point, address, regdate) 
	 VALUES ('cccc', '3333', 'young', 1300, '수원 매탄', sysdate);
INSERT INTO userinfo(u_id, u_pw, name, point, address, regdate) 
	 VALUES ('dddd', '4444', 'song', 2000, '청주 개신동', sysdate);
	
SELECT * FROM userinfo;
	 