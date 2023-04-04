/* 왼쪽 외부 조인(+) */
SELECT name,saleprice
FROM Customer LEFT OUTER JOIN Orders
ON Customer.custid = Orders.custid;

/* 왼쪽 외부 조인(+) */
SELECT name,saleprice
FROM customer, orders
WHERE customer.custid = orders.custid(+);

/* 가장 비싼 도서의 가격 표시 */
SELECT MAX(price)
FROM Book;

/* 가장 비싼 도서의 이름 */
SELECT bookname
FROM Book
WHERE price = 35000;

/* 가장 비싼 도서의 이름 */
SELECT bookname
FROM Book
WHERE price = (SELECT MAX(price)
                FROM Book);
                
/* 도서를 주문한적이 있는 고객 아이디 찾기 */
SELECT custid
FROM Orders;

/* 고객 아이디에 해당 하는 고객의 이름 찾기 */
SELECT name
FROM Customer
WHERE custid IN (1, 2, 3, 4);

/* 도서를 주문한 적이 있는 고객의 이름 찾기 */
SELECT name
FROM Customer
WHERE custid IN (SELECT custid
                    FROM Orders);

/* 출판사별 출판사의 평균 도서 가격보다 비싼 도서를 구하시오. */
SELECT b1.bookname
FROM Book b1
WHERE b1.price > (SELECT AVG(b2.price)
                    FROM Book b2
                    WHERE b1.publisher = b2.publisher);
