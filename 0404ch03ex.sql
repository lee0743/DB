SELECT *
FROM Customer, Orders
WHERE Customer.custid = Orders.custid AND customer.name LIKE '박지성';

SELECT name, bookname, saleprice
FROM Customer, Orders
WHERE Customer.custid = Orders.custid AND customer.name LIKE '박지성';

SELECT bookid
FROM Customer, Orders
WHERE Customer.custid = Orders.custid AND customer.name LIKE '박지성';
