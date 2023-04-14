CREATE TABLE Theater(
    tid NUMBER PRIMARY KEY,
    tname VARCHAR2(20),
    loc VARCHAR2(20)
);

CREATE TABLE Cinema(
    tid NUMBER NOT NULL,
    cid NUMBER PRIMARY KEY,
    title VARCHAR2(20),
    price NUMBER CHECK (price <= 20000),
    seat NUMBER,
    FOREIGN KEY (tid) REFERENCES Theater(tid) ON DELETE CASCADE
);

CREATE TABLE Customer(
  custid NUMBER PRIMARY KEY,
  custname VARCHAR2(20),
  addr VARCHAR2(20)
);
  
CREATE TABLE Reservation(
  	tid NUMBER NOT NULL,
    cid NUMBER NOT NULL,
  	custid NUMBER NOT NULL,
    seatnum NUMBER NOT NULL,
  	orderdate DATE,
    FOREIGN KEY (tid) 
    REFERENCES Theater(tid) ON DELETE CASCADE,
  	FOREIGN KEY (cid) 
    REFERENCES Cinema(cid) ON DELETE CASCADE,
  	FOREIGN KEY (custid)
    REFERENCES Customer(custid) ON DELETE CASCADE,
  	PRIMARY KEY (custid, seatnum)
 );

INSERT INTO Theater VALUES (1, '롯데', '잠실');
INSERT INTO Theater VALUES (2, '메가', '강남');
INSERT INTO Theater VALUES (3, '대한', '잠실');

INSERT INTO Cinema VALUES (1, 1, '어려운 영화', 15000, 48);
INSERT INTO Cinema VALUES (3, 1, '멋진 영화', 7500, 120);
INSERT INTO Cinema VALUES (3, 2, '재밌는 영화', 8000, 110);

INSERT INTO Customer VALUES (3, '홍길동', '강남');
INSERT INTO Customer VALUES (4, '김철수', '잠실');
INSERT INTO Customer VALUES (9, '박영희', '강남');

INSERT INTO Reservation VALUES (3, 2, 3, 15, TO_DATE('2020-09-01', 'yyyy-mm-dd'));
INSERT INTO Reservation VALUES (3, 3, 4, 16, TO_DATE('2014-09-01', 'yyyy-mm-dd'));
INSERT INTO Reservation VALUES (1, 1, 9, 48, TO_DATE('2014-09-01', 'yyyy-mm-dd'));

SELECT * FROM Theater;
SELECT * FROM Cinema;
SELECT * FROM Customer;
SELECT * FROM Reservation;

/* 1-1 */
 SELECT tname, loc
 FROM Theater;

/* 1-2 */
SELECT tname
FROM Theater
WHERE loc='잠실';

/* 1-3 */
SELECT name
FROM Customer
WHERE addr='잠실'
ORDER BY name;

/* 1-4 */
SELECT tid, cid, title
FROM Cinema
WHERE price <=8000;

/* 1-5 */
SELECT DISTINCT loc addr
FROM Theater, Customer
WHERE Theater.loc = Customer.addr;

/* 2-1 */
SELECT COUNT(*)
FROM Theater;

/* 2-2 */
SELECT AVG(price)
FROM Cinema;

/* 2-3 */
SELECT COUNT(custid)
FROM Reservation
WHERE orderdate LIKE TO_DATE('2020-09-01', 'yyyy-mm-dd');

/* 3-1 */
SELECT title
FROM Theater, Cinema
WHERE Theater.tid = Cinema.tid
AND tname = '대한';

/* 3-2 */
SELECT name
FROM Theater, Reservation, Customer
WHERE Theater.tid = Reservation.tid
AND Customer.custid = Reservation.custid
AND tname = '대한';

/* 3-3 */
SELECT SUM(price)
FROM Reservation, Cinema, Theater
WHERE Reservation.tid = Cinema.tid
AND Reservation.cid = Cinema.cid
AND Theater.tid = Cinema.tid
AND tname = '대한';

/* 4-1 */
SELECT tname, COUNT(tid)
FROM Theater, Cinema
WHERE Theater.tid = Cinema.cid;
GROUP BY tid;

/* 4-2 */
SELECT DISTINCT tname, cid
FROM Theater, Cinema
WHERE Theater.tid = Cinema.tid
AND loc = '잠실';

/* 4-3 */
SELECT tname, COUNT(*)
FROM Theater, Reservation
WHERE Theater.tid = Reservation.tid
AND date LIKE '2020-09-01'
GROUP BY Reservation.tid, Theater.tname;

/* 4-4 */
SELECT MAX(COUNT(custid))
FROM Theater, Reservation
WHERE Cinema.tid = Reservation.tid
AND Cinema.cid = Reservation.cid
AND date LIKE TO_DATE('2020-09-01', 'yyyy-mm-dd')
GROUP BY title;
