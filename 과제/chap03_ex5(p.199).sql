CREATE TABLE Theater(
    tid NUMBER PRIMARY KEY,
    tname VARCHAR2(20),
    loc VARCHAR2(20)
);


CREATE TABLE Cinema(
    tid NUMBER NOT NULL,
    cid NUMBER CHECK (price BETWEEN 1 AND 10) PRIMARY KEY,
    title VARCHAR2(20),
    price NUMBER CHECK (price <= 20000),
    seat NUMBER,
    FOREIGN KEY (tid) REFERENCES Theater(tid) ON DELETE CASCADE
);

CREATE TABLE Customer(
  custid NUMBER PRIMARY KEY,
  name VARCHAR2(20),
  addr VARCHAR2(20)
);
  
CREATE TABLE Reservation(
  	tid NUMBER NOT NULL,
    cid NUMBER CHECK (price BETWEEN 1 AND 10) NOT NULL,
  	custid NUMBER NOT NULL,
    seatnum NUMBER NOT NULL,
  	date DATE
    FOREIGN KEY (tid) REFERENCES Theater(tid) ON DELETE CASCADE,
  	FOREIGN KEY (cid) REFERENCES Cinema(cid) ON DELETE CASCADE,
  	FOREIGN KEY (custid) REFERENCES Customer(custid) ON DELETE CASCADE,
  	PRIMARY KEY (custid, seatnum)
 );

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
WHERE loc='잠실'
ORDER BY name;

/* 1-4 */
SELECT tid, cid, title
FROM Cinema
WHERE 가격 <=8000;

/* 1-5 */
SELECT DISTINCT Theater.loc Customer.addr
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
WHERE 날짜='2020-09-01';

/* 3-1 */
SELECT Cinema.title
FROM Theater, Cinema
WHERE Theater.tid = Cinema.tid
AND tname = '대한';

/* 3-2 */
SELECT Customer.name
FROM Theater, Reservation, Customer
WHERE Theater.tid = Reservation.tid
AND Cuustomer.custid = Reservation.custid
AND tname = '대한';

/* 3-3 */
SELECT SUM(price)
FROM Reservation, Cinema, Theater
WHERE Reservation.tid = Cinema.tid
AND Reservation.cid = Cinema.cid
AND Theater.tid = Cinema.tid
AND tname = '대한';

/* 4-1 */
SELECT Theater.tname, COUNT(tid)
FROM Theater, Cinema
WHERE Theater.tid = Cinema.cid
GROUP BY tname;

/* 4-2 */
SELECT DISTINCT tname, cid
FROM Theater, Cinema
WHERE Theater.tid = Cinema.tid
AND loc = '잠실';

/* 4-3 */
SELECT Theater.tname, COUNT(*)
FROM Theater, Reservation
WHERE Theater.tid = Reservation.tid
AND date='2020-09-01'
GROUP BY Reservation.tid, Theater.tname;

/* 4-4 */
SELECT MAX(COUNT(custid))
FROM Theater, Reservation
WHERE Cinema.tid = Reservation.tid
AND Cinema.cid = Reservation.cid
AND date='2020-09-01'
GROUP BY title;
