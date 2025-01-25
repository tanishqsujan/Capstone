CREATE TABLE Salesman1(
    Salesman_id TEXT PRIMARY KEY,
    name TEXT,
    city TEXT,
    Comission TEXT
);

INSERT INTO Salesman1(Salesman_id,name,city, Comission)
VALUES
   ("5001","James Hoog","New York","0.15"),
   ("5002","Nail Knite","Paris","0.13"),
   ("5005","Pit Alex","London","0.11"),
   ("5006","Mc Lyon","Paris","0.14"),
   ("5007","Paul Adam","Rome","0.13"),
   ("5003","Lauson Hen","San Jose","0.12");


CREATE TABLE Customer1(
    Customer_id TEXT,
    cust_name TEXT PRIMARY KEY,
    city TEXT,
    grade TEXT,
    Salesman_id TEXT
);

INSERT INTO Customer1(Customer_id,cust_name,city,grade,Salesman_id)
VALUES
  ("3002","nick rimando","new york","100","5001"),
  ("3007","brad davis","new york","200","5001"),
  ("3005","graham zusi","california","200","5002"),
  ("3008","julian green","london","300","5002"),
  ("3004","fabian johnson","paris","300","5006"),
  ("3009","geoff cameron","berlin","100","5003"),
  ("3003","jozy altidor","moscow","200","5007"),
  ("3001","brad guzan","london","100","5005");


CREATE TABLE Orders1(
    ord_no TEXT PRIMARY KEY,
    purch_amt TEXT,
    ord_date TEXT,
    Customer_id TEXT,
    Salesman_id TEXT
);

INSERT INTO Orders1(ord_no,purch_amt,ord_date,Customer_id,Salesman_id)
VALUES
  ("70001","150.5","2012-10-05","3005","5002"),
  ("70009","270.65","2012-09-10","3001","5001"),
  ("70002","65.26","2012-10-05","3002","5003"),
  ("70004","110.5","2012-08-17","3009","5007"),
  ("70007","948.5","2012-09-10","3005","5005"),
  ("70005","2400.6","2012-07-27","3007","5006");


SELECT Customer1.cust_name,
Salesman1.name, Customer1.city
FROM Salesman1, Customer1
WHERE Salesman1.city= Customer1.city;

SELECT Customer1.cust_name, Salesman1.name
FROM Customer1, Salesman1
WHERE Salesman1.Salesman_id= Customer1.Salesman_id;

SELECT ord_no, cust_name, Orders1.Customer_id, Orders1.Salesman_id
FROM Salesman1, Customer1, Orders1
WHERE Customer1.city <> Salesman1.city
AND Orders1.Customer_id= Customer1.Customer_id
AND Orders1.Salesman_id= Salesman1.Salesman_id;

SELECT Orders1.ord_no, Customer1.cust_name
FROM Orders1, Customer1
WHERE Orders1.Customer_id= Customer1.Customer_id;

SELECT Customer1.cust_name AS "Customer",
Customer1.grade AS "Grade"
FROM Orders1, Salesman1, Customer1
WHERE Orders1.Customer_id= Customer1.Customer_id
AND Orders1.Salesman_id= Salesman1.Salesman_id
AND Salesman1.city IS NOT NULL
AND Customer1.grade IS NOT NULL;

SELECT Customer1.cust_name AS "Customer",
Customer1.city AS "City",
Salesman1.name AS "Salesman",
Salesman1.Comission
FROM Customer1, Salesman1
WHERE Customer1.Salesman_id= Salesman1.Salesman_id
AND Salesman1.Comission
BETWEEN .12 AND .14;

SELECT ord_no, cust_name, Comission AS "Comission%",
purch_amt*Comission AS "Comission"
FROM Salesman1, Orders1, Customer1
WHERE Orders1.Customer_id= Customer1.Customer_id
AND Orders1.Salesman_id= Salesman1.Salesman_id
AND Customer1.grade>= 200;

SELECT*
FROM Customer1 a, Orders1 b 
WHERE a.Customer_id= B.Customer_id
AND b.ord_date= '2012-10-05';







