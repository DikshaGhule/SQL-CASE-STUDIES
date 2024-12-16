create database last;
use last;

CREATE TABLE student_reg (
    sid INT PRIMARY KEY,
    name VARCHAR(50),
    per FLOAT,
    city VARCHAR(50)
);

INSERT INTO student_reg (sid, name, per, city) VALUES
(1, 'diskhu', 95.26, 'Pune'),
(2, 'siddhu', 98.45, 'Nashik'),
(3, 'Riyaa', 75.69, 'Nagar'),
(4, 'shree', 85.65, 'Thane'),
(5, 'Seema', 89.45, 'Mumbai');

CREATE TABLE student_course (
    cid INT PRIMARY KEY,
    sid INT,
    cname VARCHAR(50),
    branch VARCHAR(50),
    FOREIGN KEY (sid) REFERENCES student_reg(sid)
);

INSERT INTO student_course (cid, sid, cname, branch) VALUES
(1, 1, 'Web designing', 'Mumbai'),
(2, 2, 'Python', 'Pune'),
(3, 4, 'PHP', 'Thane'),
(4, 5, 'DBMS', 'Nashik'),
(5, 1, 'PHP', 'Thane');


select *     -- INNER JOIN --  
from student_reg as sr
inner join student_course as sc
on sr.sid = sc.sid;

select *     --   CROSS JOIN --
 from student_reg 
CROSS join student_course ;

