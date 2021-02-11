--int pno, String pname, int price, int cnt, String regdate_s, String mfg, String wrhsdate_s,
--			String director
--        물건정보 : 제품번호, 물건명, 물건가격, 물건재고량, 신규등록일, 
--              제조사, 최근입고일, 입고책임자
CREATE TABLE product2 (
	pno NUMBER,
	pname VARCHAR2(30),
	price NUMBER,
	cnt NUMBER,
	regdate DATE,
	mfg VARCHAR2(30),
	wrhsdate DATE,
	director VARCHAR2(20)
);
CREATE SEQUENCE product_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 1000
NOCYCLE
NOCACHE;

INSERT INTO product2
VALUES(product_seq.nextval,'사과',2000,13,to_date('2020/10/18','YYYY/MM/DD'),'애플',
		to_date('2020/11/15','YYYY/MM/DD'),'홍길동');
INSERT INTO product2
VALUES(product_seq.nextval,'바나나',5000,9,to_date('2020/10/18','YYYY/MM/DD'),'애플',
		to_date('2020/11/15','YYYY/MM/DD'),'홍길동');
INSERT INTO product2
VALUES(product_seq.nextval,'망고',8000,10,to_date('2020/10/18','YYYY/MM/DD'),'애플',
		to_date('2020/11/15','YYYY/MM/DD'),'홍길동');
INSERT INTO product2 
VALUES(product_seq.nextval,'사과',4000,5,to_date('2021/01/01','YYYY/MM/DD'),'사과하우스',
		to_date('2021/02/01','YYYY/MM/DD'),'이길동');

SELECT * FROM product2;

SELECT * FROM product2
WHERE pno = 1;
