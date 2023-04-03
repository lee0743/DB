/* 도서번호가 1인 도서의 이름 */ 
SELECT bookname 
FROM Book 
WHERE bookid = 1;

/* 가격이 20000원 이상인 도서의 이름 */ 
SELECT bookname
FROM Book
WHERE price >= 20000;

SELECT SUM(saleprice)
FROM Orders
WHERE custid = 1;

SELECT COUNT(*)
FROM Orders
WHERE custid = 1;

SELECT COUNT(*) AS "총 도서 수"
FROM Book;

SELECT DISTINCT publisher, COUNT(publisher) AS 도서수
FROM book 
GROUP BY publisher;

SELECT name, address
FROM Customer;

SELECT orderid
FROM Orders
WHERE orderdate BETWEEN '2020-07-04' AND '2020-07-07';

SELECT orderid
FROM Orders
WHERE orderdate NOT BETWEEN '20.07.04' AND '20.07.07';

SELECT name, address
FROM Customer
WHERE name LIKE '김%';

SELECT name, address
FROM Customer
WHERE name LIKE '김%아';
