/* ������ȣ�� 1�� ������ �̸� */ 
SELECT bookname 
FROM Book 
WHERE bookid = 1;

/* ������ 20000�� �̻��� ������ �̸� */ 
SELECT bookname
FROM Book
WHERE price >= 20000;

SELECT SUM(saleprice)
FROM Orders
WHERE custid = 1;

SELECT COUNT(*)
FROM Orders
WHERE custid = 1;

SELECT COUNT(*) AS "�� ���� ��"
FROM Book;

SELECT DISTINCT publisher, COUNT(publisher) AS ������
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
WHERE name LIKE '��%';

SELECT name, address
FROM Customer
WHERE name LIKE '��%��';
