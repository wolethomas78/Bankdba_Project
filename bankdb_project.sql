CREATE DATABASE bankdb;

USE bankdb;
--- ----------------------------------------CREATION OF CUSTOMERS TABLE---------------------------
--- ----------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS customer(
customer_id VARCHAR(5) PRIMARY KEY,
first_name VARCHAR(20) NOT NULL,
middle_name VARCHAR(20) NOT NULL,
last_name VARCHAR(20) NOT NULL,
city VARCHAR(15) NOT NULL,
mobile_no INT NOT NULL,
occupation VARCHAR(20) NOT NULL,
dob DATE NOT NULL,
cust_address VARCHAR(50) NOT NULL
);
DESC customer;

ALTER TABLE customer
MODIFY COLUMN mobile_no VARCHAR(15);

ALTER TABLE customer
ADD COLUMN country VARCHAR(20);

ALTER TABLE customer
MODIFY COLUMN country VARCHAR(25) NOT NULL;

ALTER TABLE customer
DROP COLUMN cust_address;

SELECT * FROM customer;
--- -----------------------------------------CREATION OF BRANCH TABLE ---------------------------------
--- ---------------------------------------------------------------------------------------------------

CREATE TABLE branch(
branch_id INT PRIMARY KEY,
branch_name VARCHAR(15) NOT NULL,
branch_address VARCHAR(30) NOT NULL
);

--- ------------------------------CREATION OF ACCOUNT TABLE ----------------------------------------------
--- ------------------------------------------------------------------------------------------------------
CREATE TABLE account(
account_no INT,
customer_id VARCHAR(5),
branch_id INT,
acount_opening_date DATE,
opening_bal DECIMAL(10, 3),
closing_bal DECIMAL(10, 3),
account_type VARCHAR(10),
account_status VARCHAR(10),
constraint account_account_no_pk PRIMARY  KEY (account_no),
constraint account_customer_id_fk FOREIGN KEY(customer_id) REFERENCES customer (customer_id),
constraint account_branch_id_fk FOREIGN KEY(branch_id) REFERENCES branch (branch_id)
);

--- ----------------------------------------CREATION OF TRANSACSION DETAIL TABLE ------------------------------
--- ------------------------------------------------------------------------------------------------------------

CREATE TABLE tranx_detail(
tranx_no INT NOT NULL,
account_no INT NOT NULL,
date_of_tranx DATE NOT NULL,
medium_of_tranx VARCHAR(10),
tranx_type VARCHAR(10),
tranx_amount DECIMAL(10,3),
constraint tranx_detail_tranx_no_pk PRIMARY KEY(tranx_no),
constraint tranx_detail_account_no_fk FOREIGN KEY(account_no) REFERENCES account(account_no)
);

ALTER TABLE tranx_detail
MODIFY COLUMN account_no VARCHAR(15);
--- -----------------------------------CREATION OF LOAN TABLE --------------------------------------------
----------------------------------------------------------------------------------------------------------
CREATE TABLE loan(
customer_id VARCHAR(5),
branch_id INT,
loan_amount DECIMAL(10,3),
loan_type VARCHAR(10),
loan_account DECIMAL(10,3),
constraint loan_loan_account_pk PRIMARY KEY(loan_account),
constraint loan_customer_fk FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
constraint loan_branch_id_fk FOREIGN KEY(branch_id) REFERENCES branch(branch_id)
);

SELECT * FROM tranx_detail;

--- --------------------------------------------INSERTING RECORDS INTO CUSTOMER TABLE------------------------------------------------------
--- ---------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO customer VALUES('C001','Rontimi','Charles','Shola','Lagos','08054319834','Service','1976-12-06','Nigeria');
INSERT INTO customer VALUES('C002','Aetola','Sunday','Muibi','Ogun','0908765321','Jounalist','1974-10-16','Nigeria');
INSERT INTO customer VALUES('C003','Raheed','Niniola','Adetola','Osun','09076517890','Student','1981-09-26','Nigeria');
INSERT INTO customer VALUES('C004','Parul','Arthum','Gandhi','Delhi','9876532109','Housewife','1976-11-03','India');
INSERT INTO customer VALUES('C005','Naveen','Chandra','Aedekar','Mumbai','8976523190','Pilot','1976-09-19','Indian');
INSERT INTO customer VALUES('C006','Chitresh','Fuh','Barwe','Rome','7651298321','Student','1992-11-06','Italy');
INSERT INTO customer VALUES('C007','Amit','Kumar','Borkar','Wales','9875189761','Student','1981-09-06','United Kingdom');
INSERT INTO customer VALUES('C008','Nisha','bush','Damle','New York','7954198761','Driver','1975-12-03','United Kingdom');
INSERT INTO customer VALUES('C009','Abhishek','Fahad','Dutta','Kolkata','9856198761','Teacher','1973-05-22','India');
INSERT INTO customer  VALUES('C010','Shankar','Athum','Nair','Lagos','8765489076','Carpenter','1976-07-12','Nigeria');
INSERT INTO customer VALUES('C011','Oluwole','Thomas','Fagbemi','London','07345617517','Data Analyst','1978-06-25','United Kingdom');
INSERT INTO customer VALUES('CO12','Omobolanle','Queenie','Fagbemi','London','0732459393','Nurse','1985-11-29','United Kingdom');
INSERT INTO customer VALUES('C013','Iteoluwa','Temiloluwa','Fagbemi','London','07325469861','Student','2015-08-22','United Kingdom');
INSERT INTO customer VALUES('C014','Mercy','Oyinola','Thomas','London','07567834511','Student','2010-01-01','United Kingdom');
INSERT INTO customer VALUES('C015','Muyiwa','Thomas','Olayiwola','London','07567342187','Accountant','1965-06-15','United Kingdom');
INSERT INTO customer VALUES('C016','Gbenga','Adeola','Adelabu','Ekiti','08020996502','Banking','1977-01-13','Nigeria');

SELECT * FROM customer;

ALTER TABLE customer
ADD COLUMN dob_year VARCHAR(5);

SELECT dob, YEAR(dob) FROM customer;

UPDATE customer
SET dob_year = YEAR(dob);

SET SQL_SAFE_UPDATES = 0;
SET sql_safe_updates = 1;

--- --------------------------------------------INSERT RECORDS INTO BRANCH TABLE------------------------------------------------------
--- -----------------------------------------------------------------------------------------------------------------------------------


INSERT INTO branch VALUES('001','Asaf','Delhi');
INSERT INTO branch VALUES('002','Lagos branch','Nigeria');
INSERT INTO branch VALUES('003','London','United Kingdom');
INSERT INTO branch VALUES('004','Scotland','United Kingdom');
INSERT INTO branch VALUES('005','New York','United State');
INSERT INTO branch VALUES('006','Vile parle','Mumbai');
INSERT INTO branch VALUES('007','Ogun','Nigeria');
INSERT INTO branch VALUES('008','Osun','Nigeria');
INSERT INTO branch VALUES('009','Kodambakkam','Chennai');

SELECT * FROM branch;
Desc branch;


--- -------------------------------------------INSERT RECORDS INTO ACCOUNT TABLE--------------------------------------------------------
--- ------------------------------------------------------------------------------------------------------------------------------------


INSERT INTO account VALUES('5611','C001','001','2012-12-15',1500,2600,'Saving','Active');
INSERT INTO account VALUES('4367','C002','001','2012-06-12',100,4300,'Current','Active');
INSERT INTO account VALUES('7683','C003','002','2012-05-17',500,2343,'Saving','Active');
INSERT INTO account VALUES('3404','C002','005','2013-01-27',100,45,'Saving','Dormant');
INSERT INTO account VALUES('8943','C006','006','2012-12-17',1784,20,'Saving','Dormant');
INSERT INTO account VALUES('7656','C007','007','2010-08-12',453,23,'Current','Suspended');
INSERT INTO account VALUES('5467','C007','001','2012-10-02',2365,6797,'Saving','Active');
INSERT INTO account VALUES('6708','C001','003','2009-11-09',2354,0,'Current','Terminated');
INSERT INTO account VALUES('7324','C003','007','2008-11-30',3453,8076,'Saving','Active');
INSERT INTO account VALUES('3476','C004','002','2013-03-01',5674,2341,'Saving','Active');

DESC account;
ALTER TABLE account
MODIFY COLUMN account_no VARCHAR(15);

SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1; 
DELETE FROM account;

SELECT * FROM account WHERE account_no IS NOT NULL;

--- -------------------------------------INSERT RECORDS INTO LOAN TABLE ---------------------------------------------------------------
--- ------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO loan VALUES('C001','001',100000,'Personal',54675);
INSERT INTO loan VALUES('C002','002',200000,'Mortgage',23454);
INSERT INTO loan VALUES('C009','008',400000,'Mortgage',29876);
INSERT INTO loan VALUES('C010','009',500000,'Personal',18765);
INSERT INTO loan VALUES('C001','003',600000,'Mortgage',15437);
INSERT INTO loan VALUES('C003','004',70000,'Mortgage',12347);
INSERT INTO loan VALUES('C002','001',60000,'investment',43287);

DESC loan;
SELECT * FROM loan;

ALTER TABLE loan
MODIFY COLUMN loan_account INT;




--- -------------------------------INSERT RECORDS INTO TRANSACTION TABLE----------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO tranx_detail VALUES('221','3404','2013-01-01','Cheque','Deposit',2000);
INSERT INTO tranx_detail VALUES('112','3476','2013-02-01','Cash','Withdrawal',1000);
INSERT INTO tranx_detail VALUES('433','4367','2013-01-01','ATM','Deposit',2000);
INSERT INTO tranx_detail VALUES('674','5467','2013-02-01','Cash','Deposit',3000);
INSERT INTO tranx_detail VALUES('805','7324','2013-01-11','Cash','Deposit',7000);
INSERT INTO tranx_detail VALUES('436','3404','2013-01-13','Cash','Deposit',9000);
INSERT INTO tranx_detail VALUES('117','7656','2013-03-13','Cash','Deposit',4000);
INSERT INTO tranx_detail VALUES('648','3476','2013-03-14','Cheque','Deposit',3000);
INSERT INTO tranx_detail VALUES('199','5611','2013-03-21','Cash','Withdrawal',9000);
INSERT INTO tranx_detail VALUES('610','7656','2013-03-22','Cash','Deposit',2000);
INSERT INTO tranx_detail VALUES('211','6708','2013-03-25','Cash','Withdrawal',7000);
INSERT INTO tranx_detail VALUES('512','7324','2013-03-26','Cash','Withdrawal',2000);

DESC tranx_detail;

DROP TABLE tranx_detail;

ALTER TABLE tranx_detail
MODIFY COLUMN tranx_amount DECIMAL(10,2);

--- ---------------------------------------PERFORMING EXPLORATORY DATA ANALYSIS-------------------------------------------------------
--- ----------------------------------------------------------------------------------------------------------------------------------

--- Problem#1:------------------
--- Write a query to display the customer phone number, firstname, customer’s date of birth. 
--- Display in sorted order of date of birth year and within that sort by firstname.

SELECT first_name, YEAR(dob) AS year, mobile_no
FROM customer
ORDER BY year ASC;

--- Problem#2:
--- Write a query to display account number, customer’s firstname,lastname,account opening date and account opening balance of more than 3000.
SELECT account_no, first_name, last_name, acount_opening_date, opening_bal
FROM customer
JOIN account
ON customer.customer_id = account.customer_id
WHERE opening_bal > 2000;

--- Problem#3:
--- Write a query to display the list of customers who reside in Nigeria, and there account balance.

SELECT last_name, first_name, country, YEAR(dob), opening_bal
FROM customer
JOIN account
ON customer.customer_id = account.customer_id
WHERE country = 'Nigeria';

--- Problem#4:
--- Write a query to show the list of customers borne after 2000 (minor accounts) in our database

SELECT first_name, last_name, YEAR(dob) AS minor
FROM customer
WHERE YEAR(dob) >= 2000;

--- Problem#5:
--- Wrie a query to show customers with loan amount of 3000 and above
SELECT first_name, last_name, loan_amount, loan_type
FROM customer
JOIN loan
on customer.customer_id = loan.customer_id
WHERE loan_amount >= 3000;

--- Problem4#6
--- Write a query to display Account numbers with active accounts.

SELECT *
FROM account
WHERE account_status = 'Active';
