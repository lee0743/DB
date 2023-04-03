/* ������ȣ�� 1�� ������ �̸� */ 
SELECT bookname 
FROM Book 
WHERE bookid = 1;

/* ������ 20000�� �̻��� ������ �̸� */ 
SELECT bookname
FROM Book
WHERE price >= 20000;

/* �������� �� ���ž� */
SELECT SUM(saleprice)
FROM Orders
WHERE custid = 1;

/* �������� �� ���ž� 2*/
SELECT SUM(saleprice)
FROM Orders, Customer
WHERE Orders.custid = Customer.custid AND Customer.name LIKE '������'; 

/* �������� ������ ������ �� */
SELECT COUNT(*)
FROM Orders
WHERE custid = 1;

/* �������� ������ ������ ���ǻ��� �� */
SELECT COUNT(publisher)
FROM Orders, Customer, Book
WHERE Book.bookid = Orders.bookid AND Orders.custid = Customer.custid AND Customer.name LIKE '������'; 