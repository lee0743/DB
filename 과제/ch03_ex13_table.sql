CREATE TABLE Department(
    depno NUMBER NOT NULL PRIMARY KEY,
    deptname VARCHAR2(20),
    manager VARCHAR2(20)
);

CREATE TABLE Employee(
    empno NUMBER NOT NULL PRIMARY KEY,
    name VARCHAR2(20),
    phoneno NUMBER,
    address VARCHAR2(20),
    sex VARCHAR2(20),
    position VARCHAR2(20),
    deptno NUMBER,
    FOREIGN KEY (deptno) REFERENCES Department(deptno)
);

CREATE TABLE Project(
    projno NUMBER NOT NULL PRIMARY KEY,
    projname VARCHAR2(20),
    deptno NUMBER,
    FOREIGN KEY (deptno) REFERENCES Department(deptno)
);

CREATE TABLE Works(
    projno NUMBER NOT NULL PRIMARY KEY,
    empno NUMBER NOT NULL, PRIMARY KEY,
    hoursworked NUMBER,
    PRIMARY KEY(projno, empno),
    FOREIGN KEY (projno) REFERENCES Project(projno),
    FOREIGN KEY (empno) REFERENCES Employee(empno)
);

INSERT INTO Employee
VALUES('김덕성', 01012341232, '서울', '여', 'Programmer', 1),
VALUES('이서울', 01012323122, '서울', '남, 'Programmer', 1),
VALUES('박연세', 01076851231, '대전', '여', 'Salesperson', 2),
VALUES('홍길동', 01012341546, '서울', '남', 'Manager', 1),
VALUES('고남순', 01012311112, '서울', '여', 'Manager', 1)
);

INSERT INTO Project
VALUES(1, '데이터베이스', 1),
VALUES(2, '시장조사', 2)
);

INSERT INTO Works
VALUES(1, 1, 3),
VALUES(1, 2, 1),
VALUES(2, 3, 1),
VALUES(2, 4, 5),
VALUES(1, 5, 1)
);
