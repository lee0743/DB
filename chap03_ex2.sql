/* ���缭�� ������ �Ѽ� */
SELECT COUNT(*)
FROM Book;

/* ���缭�� ������ ����ϴ� ���ǻ��� �� �� */
SELECT COUNT(DISTINCT publisher)
FROM Book; 

/* ��� ���� �̸�, �ּ� */
SELECT name, address
FROM Customer;

/* 2020�� 7�� 4�� ~7��7�� ���̿� �ֹ����� ������ �ֹ���ȣ */
SELECT orderid
FROM Orders
WHERE orderdate BETWEEN '2020-07-04' AND '2020-07-07';

/* 2020�� 7��4��~7��7�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ*/
SELECT orderid
FROM Orders
WHERE orderdate NOT BETWEEN '20.07.04' AND '20.07.07';

/* ���� '��'���� ���� �̸��� �ּ� */
SELECT name, address
FROM Customer
WHERE name LIKE '��%';

/* ���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ� */
SELECT name, address
FROM Customer
WHERE name LIKE '��%��';