/* 도서번호가 1인 도서의 이름 */ 
SELECT bookname 
FROM Book 
WHERE bookid = 1;

/* 가격이 20000원 이상인 도서의 이름 */ 
SELECT bookname
FROM Book
WHERE price >= 20000;

/* 박지성의 총 구매액 */
SELECT SUM(saleprice)
FROM Orders
WHERE custid = 1;

/* 박지성의 총 구매액 2*/
SELECT SUM(saleprice)
FROM Orders, Customer
WHERE Orders.custid = Customer.custid AND Customer.name LIKE '박지성'; 

/* 박지성이 구매한 도서의 수 */
SELECT COUNT(*)
FROM Orders
WHERE custid = 1;

/* 박지성이 구매한 도서의 출판사의 수 */
SELECT COUNT(publisher)
FROM Orders, Customer, Book
WHERE Book.bookid = Orders.bookid AND Orders.custid = Customer.custid AND Customer.name LIKE '박지성'; 

/* 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이 */
SELECT bookname, price, price - saleprice
FROM Customer, Orders, Book
WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid AND Customer.name LIKE '박지성';

/* 박지성이 구매하지 않은 도서의 이름 */
SELECT bookname
FROM book
WHERE NOT EXISTS(
    SELECT bookname
    FROM customer, orders
    WHERE customer.custid = orders.custid AND orders.bookid = book.bookid AND customer.name LIKE '박지성');
