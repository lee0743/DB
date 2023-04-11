CREATE TABLE NewBook (
    bookid NUMBER PRIMARY KEY,
    bookname VARCHAR2(20) NOT NULL,
    publisher VARCHAR2(20) UNIQUE,
    price NUMBER DEFAULT 10000 CHECK (price >= 1000)
);

CREATE TABLE NewCustomer (
    custid NUMBER PRIMARY KEY,
    name VARCHAR2(20),
    address VARCHAR2(20),
    phone VARCHAR2(20)
); 

CREATE TABLE NewOrders (
    orderid NUMBER,
    custid NUMBER NOT NULL,
    bookid NUMBER NOT NULL,
    saleprice NUMBER,
    orderdate DATE,
    PRIMARY KEY(orderid),
    FOREIGN KEY(custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE
);    

/* 속성 추가 */
ALTER TABLE NewBook
ADD isbn VARCHAR2(13);

/* 제약사항 변경 */
ALTER TABLE NewBook
MODIFY isbn NUMBER;

/* 테이블 제거 */
DROP TABLE NewBook;

SELECT * FROM NewBook;
SELECT * FROM NewCustomer;
SELECT * FROM NewOrders;
SELECT * FROM Imported_Book;
SELECT * FROM Book;
SELECT * FROM Customer;
SELECT * FROM Orders;

INSERT INTO Book(bookid, bookname, publisher, price)
VALUES (11, '스포츠 의학', '한솔의학서적', 90000);

INSERT INTO Book(bookid, bookname, publisher)
VALUES (14, '스포츠 의학', '한솔의학서적');

INSERT INTO Book(bookid, bookname, publisher, price)
    SELECT bookid, bookname, publisher, price
    FROM Imported_Book;
    
/* 튜플 업데이트 */
UPDATE Customer
SET address='대한민국 부산'
WHERE custid=5;

UPDATE Customer
SET address=(SELECT address 
             FROM Customer
             WHERE name = '김연아')
WHERE name = '박세리';

/* 튜플 삭제 */
DELETE FROM Customer
WHERE custid=5;

ROLLBACK;

