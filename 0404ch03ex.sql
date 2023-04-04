/* 박지성이 구매한 도서의 출판사 수*/
SELECT COUNT(publisher)
FROM Orders, Customer, Book
WHERE Orders.custid = Customer.custid AND Orders.bookid = Book.bookid AND Customer.name LIKE '박지성';

/* 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이 */
SELECT bookname, price, price - saleprice
FROM Customer, Orders, Book
WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid AND Customer.name LIKE '박지성';

/* 박지성이 구매하지 않은 도서의 이름 */
SELECT bookname
FROM Book, Orders, Customer
MINUS
SELECT bookname
FROM Customer, Orders, Book
WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid AND Customer.name LIKE '박지성';

/* 주문하지 않은 고객의 이름(부속절의 사용) */
SELECT name
FROM Customer
WHERE custid NOT IN (SELECT custid 
                        FROM Orders);
                        
/* 주문 금액의 총액과 주문의 평균 금액 */
SELECT SUM(saleprice), AVG(saleprice)
FROM Orders;

/* 고객의 이름과 고객별 구매액 */
SELECT name, SUM(saleprice)
FROM Customer, Orders
WHERE Customer.custid = Orders.custid
GROUP BY name;

/* 고객의 이름과 고객이 구매한 도서 목록 */
SELECT name, bookname
FROM Orders, Customer, Book
WHERE Customer.custid = Orders.custid AND Book.bookid = Orders.bookid;

/* 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문 */
SELECT MAX(price - saleprice)
FROM Orders, Book
WHERE Orders.bookid = Book.bookid;
