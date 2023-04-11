CREATE TABLE Theater(
    tid NUMBER PRIMARY KEY,
    tname VARCHAR2(20),
    loc VARCHAR2(20)
);

ALTER

CREATE TABLE Cinema(
    tid NUMBER NOT NULL,
    cid NUMBER CHECK (price BETWEEN 1 AND 10) PRIMARY KEY,
    title VARCHAR2(20),
    price NUMBER CHECK (price <= 20000),
    seat NUMBER,
    FOREIGN KEY (tid) REFERENCES Theater(tid) ON DELETE CASCADE
);
    
