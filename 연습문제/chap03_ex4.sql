SELECT * FROM Book;
SELECT * FROM Orders;
SELECT * FROM Customer;

SELECT *
FROM Book, Orders, Customer
WHERE Book.bookid = Orders.bookid AND Customer.custid = Orders.custid AND publisher LIKE '이상미디어';

INSERT INTO Book
VALUES (11, '스포츠 세계', '대한미디어', 10000);

DELETE FROM Book
WHERE publisher LIKE '삼성당';

/* Orders 테이블에서 bookid가 7인(이상미디어) 구매 내역이 Book테이블을 참조 하고 있으므로 작업이 중지된다 */
DELETE FROM Book
WHERE publisher LIKE '이상미디어';

UPDATE Book
SET publisher = '대한출판사'
WHERE publisher = '대한미디어';

CREATE TABLE Bookcompany(
    name VARCHAR(20) PRIMARY KEY,
    address VARCHAR(20),
    begin DATE
);

ALTER TABLE Bookcompany
ADD webaddress VARCHAR(30)
