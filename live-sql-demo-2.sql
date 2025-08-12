CREATE TABLE Customer (
  Cust_ID NUMBER(3) PRIMARY KEY,
  C_Name VARCHAR2(30),
  Contact NUMBER(10),
  Username VARCHAR2(30) UNIQUE NOT NULL,
  Password VARCHAR2(30),
  House_No NUMBER(3) CHECK (House_No >= 0),
  Location VARCHAR2(30),
  Street VARCHAR2(30)
);

CREATE TABLE Member (
Mem_ID NUMBER(3) PRIMARY KEY,
Cust_ID NUMBER(3),
Foreign Key (Cust_ID) references Customer(Cust_ID),
Name VARCHAR(30),
Contact NUMBER(10),
Email VARCHAR(30) UNIQUE NOT NULL,
Gender CHAR(3) CHECK (Gender IN ('M','F','OTH')),
Age NUMBER(2) CHECK (Age>=15 and Age<=70),
Joining_Date DATE,
End_of_Mem_Date DATE,
CHECK (End_of_Mem_Date > Joining_Date),
House_No NUMBER(3) CHECK (House_No >= 0),
Location VARCHAR(30),
Street VARCHAR(30)
);

CREATE TABLE Payment (
Pay_ID NUMBER(3) PRIMARY KEY,
Mem_ID NUMBER(3),
Foreign Key (Mem_ID) references Member(Mem_ID),
Cust_ID NUMBER(3),
Foreign Key (Cust_ID) references Customer(Cust_ID),
Amount NUMBER(7,2) CHECK(Amount>0 and Amount<=15000),
Time DATE,
Date_of_pay DATE
);

CREATE TABLE Instructor (
Ins_ID NUMBER(3) PRIMARY KEY,
Cust_ID NUMBER(3),
Foreign Key (Cust_ID) references Customer(Cust_ID),
I_Name VARCHAR(30),
Email VARCHAR(30) UNIQUE NOT NULL,
Contact NUMBER(10),
House_No NUMBER(3) CHECK (House_No >= 0),
Location VARCHAR(30),
Street VARCHAR(30)
);

CREATE TABLE WORKOUT_PLAN (
Plan_ID NUMBER(3) PRIMARY KEY,
Mem_ID NUMBER(3),
Foreign Key (Mem_ID) references Member(Mem_ID),
Ins_ID NUMBER(3),
Foreign Key (Ins_ID) references Instructor(Ins_ID),
Workout_Time DATE,
Workout_Duration NUMBER(3,1) CHECK (Workout_Duration > 0.5)
);

CREATE TABLE PLAN (
Plan_ID NUMBER(3),
FOREIGN KEY(Plan_ID) references WORKOUT_PLAN(Plan_ID),
Workout_Days VARCHAR(3) CHECK (Workout_Days IN
('MON','TUE','WED','THU','FRI','SAT'))
);

CREATE TABLE Workout (
Workout_ID NUMBER(3) PRIMARY KEY,
Plan_ID NUMBER(3),
FOREIGN KEY(Plan_ID) references WORKOUT_PLAN(Plan_ID),
Name VARCHAR(30),
Description VARCHAR(100)
);

CREATE TABLE Health_Records (
Health_ID NUMBER(3)PRIMARY KEY,
Mem_ID NUMBER(3),
Foreign Key (Mem_ID) references Member(Mem_ID),
Height NUMBER(5,2),
Weight NUMBER(5,2),
BMI NUMBER(5,2),
Muscle_Mass NUMBER(5,2)
);

INSERT INTO Customer VALUES (114,'Kavya
Aggarwal',9849034012,'KAggarwal','kavya123',24,'Delhi','Dwarka');

INSERT INTO Customer VALUES (115,'Vikram
Gupta',9478273645,'VGupta','vikram22',37,'Mumbai','Bandra');

INSERT INTO Customer VALUES (116,'Shikha
Singh',9898787678,'SSingh','shikha09',28,'Delhi','Saket');

INSERT INTO Member VALUES (1,114, 'Kavya Aggarwal', 9849034012,
'kavya.aggarwal@example.com', 'F', 24, '01-Jan-2022', '01-Jan-
2023',101, 'Delhi', 'Dwarka');

INSERT INTO Member VALUES (2,115, 'Vikram Gupta', 9478273645,
'vikram.gupta@example.com', 'M', 37, '01-Jan-2022', '31-Dec-2023',201,
'Mumbai', 'Bandra');

INSERT INTO Member VALUES (3,116, 'Shikha Singh', 9898787678,
'shikha.singh@example.com', 'F', 28, '01-Jan-2022', '30-Jun-2023',301,
'Delhi', 'Saket');


INSERT INTO Customer VALUES (
  121, 'Ajay Mehta', 9654321098, 'Amehta', 'ajay123',
  45, 'Kolkata', 'Salt Lake'
);

INSERT INTO Customer VALUES (
  122, 'Ritu Gupta', 9988776655, 'Rgupta', 'ritu123',
  28, 'Bangalore', 'HSR Layout'
);

INSERT INTO Instructor VALUES (
  301, 121, 'Ajay Mehta',
  'ajay.mehta@example.com', 9654321098, 45, 'Kolkata', 'Salt Lake'
);

INSERT INTO Instructor VALUES (
  302, 122, 'Ritu Gupta',
  'ritu.gupta@example.com', 9988776655, 28, 'Bangalore', 'HSR Layout'
);


INSERT INTO Payment VALUES(101,1,114,6000,to_date('2022-Jun-1', 'YYYY-
MON-DD'),'1-Jan- 2022');

INSERT INTO Payment VALUES(102,1,114,6000,to_date('2023-Jan-1', 'YYYY-
MON-DD'),'1-Jun-2022');


INSERT INTO Health_Records VALUES(101,1,170.18,86.4,NULL,NULL);

INSERT INTO Health_Records VALUES(102,2,169.7,72,NULL,NULL);

INSERT INTO Health_Records VALUES(103,3,171.19,82,NULL,NULL);


--2 plans for each member
INSERT INTO Workout_Plan
VALUES(101,1,301,to_date('16:00:00','hh24:mi:ss'),2);

INSERT INTO Workout_Plan
VALUES(102,1,302,to_date('17:00:00','hh24:mi:ss'),1.5);

INSERT INTO Workout_Plan
VALUES(201,2,301,to_date('7:00:00','hh24:mi:ss'),1.5);


INSERT INTO Plan VALUES(101,'MON');
INSERT INTO Plan VALUES(101,'TUE');
INSERT INTO Plan VALUES(101,'SAT');

INSERT INTO Workout VALUES(1,101,'Treadmill','Running practice');
INSERT INTO Workout VALUES(2,101,'Cycling','Thigh control');
INSERT INTO Workout VALUES(3,101,'Dumbell','Weight Training');
INSERT INTO Workout VALUES(4,102,'Burpees','Strength Traning');



select * from customer
select * from member
select * from payment
select * from instructor
select * from Workout_Plan
select * from Workout
select * from Health_Records

--If the customer loses his password, the administrator can give him on the basis of
his Cust_ID.
SELECT C_Name, Contact FROM CUSTOMER WHERE C_Name LIKE 'R%' OR
C_Name LIKE 'r%';

/*If the customer loses his password, the administrator can give him on the basis of
his Cust_ID.*/
SELECT password FROM CUSTOMER WHERE Username='KAggarwal';

/*If any member has ended his membership, that can be updated in the Member
table*/
UPDATE Member SET end_of_mem_date='15-MAY-2023' WHERE Mem_ID=5;

--If the administrator wishes to locate all the members from Mumbai.
SELECT Name from MEMBER where Location='Mumbai';

--If the Administrator wishes to find the Cust_ID of an Instructor.
SELECT Cust_ID from INSTRUCTOR where Ins_ID=302;

--If the Administrator wants to see the members in the descending order of weight.
SELECT * FROM HEALTH_RECORDS ORDER BY weight desc;

--If the Administrator wants to see the average height of all the members.
SELECT AVG(Height) FROM HEALTH_RECORDS;

/*If the Administrator wants to see the number of customers paying the same
amount*/
SELECT COUNT(PAY_ID), AMOUNT FROM Payment WHERE AMOUNT >= 6000 GROUP
BY AMOUNT;

--If the Administrator wants to add column 'age' in the PAYMENT table.
ALTER TABLE Payment add Age NUMBER(2);

/*If the Administrator wants to Change column name from workout_time to
workout_timing.*/
ALTER TABLE workout_plan RENAME COLUMN workout_time TO workout_timing;

/*If the Administrator wants see the number of members having the same workout
duration and order it by plan_id.*/
SELECT COUNT(PLAN_ID),workout_duration FROM workout_plan GROUP BY
workout_duration ORDER BY COUNT(PLAN_ID) DESC;

--JOINING
SELECT M.Name, W.Ins_ID FROM MEMBER M
INNER JOIN WORKOUT_PLAN W ON W.Mem_ID = M.Mem_ID;

SELECT P.Mem_ID, W.Workout_Timing
FROM Payment P
INNER JOIN
WORKOUT_PLAN W
ON W.Mem_ID = P.Mem_ID;