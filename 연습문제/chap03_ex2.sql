/* 마당서점 도서의 총수 */
SELECT COUNT(*)
FROM Book;

/* 마당서점 도서를 출고하는 출판사의 총 수 */
SELECT COUNT(DISTINCT publisher)
FROM Book; 

/* 모든 고객의 이름, 주소 */
SELECT name, address
FROM Customer;

/* 2020년 7월 4일 ~7월7일 사이에 주문받은 도서의 주문번호 */
SELECT orderid
FROM Orders
WHERE orderdate BETWEEN '2020-07-04' AND '2020-07-07';

/* 2020년 7월4일~7월7일 사이에 주문받은 도서를 제외한 도서의 주문번호*/
SELECT orderid
FROM Orders
WHERE orderdate NOT BETWEEN '20.07.04' AND '20.07.07';

/* 성이 '김'씨인 고객의 이름과 주소 */
SELECT name, address
FROM Customer
WHERE name LIKE '김%';

/* 성이 '김'씨이고 이름이 '아'로 끝나는 고객의 이름과 주소 */
SELECT name, address
FROM Customer
WHERE name LIKE '김%아';

/* 박지성이 구매한 도서의 출판사 수*/
SELECT COUNT(DISTINCT publisher)
FROM Orders, Customer, Book
WHERE Orders.custid = Customer.custid AND Orders.bookid = Book.bookid AND Customer.name LIKE '박지성';

/* 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이 */
SELECT bookname, price, price - saleprice
FROM Customer, Orders, Book
WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid AND Customer.name LIKE '박지성';

/* 박지성이 구매하지 않은 도서의 이름 */
SELECT bookname
FROM Book
WHERE NOT EXISTS(
    SELECT bookname
    FROM Customer, Orders
    WHERE Customer.custid = Orders.custid AND Orders.bookid = Book.bookid AND Customer.name LIKE '박지성');

/* 주문하지 않은 고객의 이름(부속절의 사용) */
SELECT name
FROM Customer
WHERE name NOT IN (SELECT name
                     FROM Customer, Orders
                     WHERE Customer.custid = Orders.custid);  
                     
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
SELECT *
FROM book, orders
WHERE book.bookid = orders.bookid AND price-saleprice = (SELECT max(price - saleprice)
                                                            FROM book, orders
                                                            WHERE book.bookid = orders.bookid);
                                                            
/* 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름 */
select name, avg(saleprice)
from customer, orders
where customer.custid = orders.custid
group by name
having avg(saleprice) > (select avg(orders.saleprice)
                        from orders);
