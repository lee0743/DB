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