/* 7장 Summer 테이블 */

DROP TABLE Summer;

CREATE TABLE Summer(
    sid NUMBER,
    class VARCHAR2(20),
    price NUMBER
);

INSERT INTO Summer VALUES (100, 'Fortran', 20000);
INSERT INTO Summer VALUES (150, 'PASCAL', 15000);
INSERT INTO Summer VALUES (200, 'C', 10000);
INSERT INTO Summer VALUES (250, 'Fortran', 20000);

SELECT *
FROM Summer;

SELECT sid, class
FROM Summer;

SELECT price
FROM Summer
WHERE class = 'C';

SELECT distinct class
FROM Summer
WHERE price = (
    SELECT MAX(price)
    FROM Summer
);

SELECT COUNT(*), SUM(price)
FROM Summer;

DELETE FROM Summer
WHERE sid = 200;

SELECT sid
FROM SUMMER
WHERE sid = 'C';

/* INSERT INTO Summer VALUES (300, 'C++', NULL); */
INSERT INTO Summer VALUES (NULL, 'JAVA', 25000);

SELECT COUNT(*) AS "수강인원"
FROM Summer;

SELECT COUNT(sid) AS "수강인원"
FROM Summer;

SELECT COUNT(*) AS "수강인원"
FROM SUMMER
WHERE sid IS NOT NULL;

UPDATE Summer 
SET price = 15000
WHERE class = 'Fortran';

SELECT distinct price as "Fortran 수강료"
FROM Summer
WHERE class = 'Fortran';

UPDATE Summer
SET price = 20000
WHERE class = 'Fortran';

SELECT *
FROM Summer;

UPDATE Summer
Set price = 15000
WHERE class = 'Fortran' AND sid = 100;

/*===========================================================================*/
DROP TABLE Summer;
DROP TABLE SummerPrice;
DROP TABLE SummerEnroll;

CREATE TABLE Summer(
    sid NUMBER,
    class VARCHAR2(20),
    price NUMBER
);

CREATE TABLE SummerPrice(
    class VARCHAR2(20),
    price NUMBER
);

CREATE TABLE SummerEnroll(
    sid NUMBER,
    class VARCHAR2(20)
);
    
INSERT INTO SummerPrice VALUES('Fortran', 20000);
INSERT INTO SummerPrice VALUES('Pascal', 15000);
INSERT INTO SummerPrice VALUES('C', 10000);

INSERT INTO SummerEnroll VALUES(100, 'Fortran');
INSERT INTO SummerEnroll VALUES(150, 'Pascal');
INSERT INTO SummerEnroll VALUES(200, 'C');
INSERT INTO SummerEnroll VALUES(250, 'Fortran');

SELECT *
FROM SummerPrice;

SELECT *
FROM SummerEnroll;

SELECT sid, class
FROM SummerEnroll;

SELECT price
FROM SummerPrice;

SELECT distinct class
FROM SummerPrice
WHERE price = (
    SELECT MAX(price)
    FROM SummerPrice
);

SELECT COUNT(*), SUM(price)
FROM SummerPrice, SummerEnroll
WHERE SummerPrice.class = SummerEnroll.class;

SELECT price AS "C 수강료"
FROM SummerPrice
WHERE class = 'C';

DELETE FROM SummerEnroll
WHERE sid = 200;

SELECT *
FROM SummerEnroll;

SELECT price AS "C 수강료"
FROM SummerPrice
WHERE class = 'C';

INSERT INTO SummerPrice VALUES('Java', 25000);

SELECT COUNT(*)
FROM SummerEnroll;

UPDATE SummerPrice
SET price = 15000
WHERE class = 'Fortran';

SELECT price as "Fortran 수강료"
FROM SummerPrice
WHERE class = 'Fortran';