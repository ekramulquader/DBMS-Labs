
-- If Tables are not dropped because of foreign_keys
PRAGMA foreign_keys = OFF;

-- This file is going go be read multiple times, that is why start everything from fresh
DROP TABLE IF EXISTS Invoice;
DROP TABLE IF EXISTS Cust;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Cust_old;
DROP TABLE IF EXISTS Movie_old;
DROP TABLE IF EXISTS Invoice_old;

-- Special Keyword SQLite3 requires to create foreign keys properly
PRAGMA foreign_keys = ON;

/*
1. Create the tables cust, movie and invoice according to the given formats.
*/

CREATE TABLE Cust(
  cust_id VARCHAR2(3) PRIMARY KEY NOT NULL,
  lname VARCHAR2(15),
  fname VARCHAR2(15),
  area VARCHAR2(2),
  phone_no INTEGER
);

CREATE TABLE Movie(
  mv_no VARCHAR2(2) PRIMARY KEY NOT NULL,
  title VARCHAR2(25),
  type VARCHAR2(10),
  star VARCHAR2(25)
);

CREATE TABLE Invoice(
  inv_no VARCHAR2(3) PRIMARY KEY NOT NULL,
  mv_no VARCHAR2(2),
  cust_id VARCHAR2(3),
  issue_date DATE,
  return_date DATE
);

/*
2. Add the following constraints :
a. Invoice(cust_id) references Cust(cust_ id).
b. Invoice(mv_no) references Movie(mv_no).
c. Declare NOT NULL: lname,fname in Cust and title, type in Movie. 
*/

-- Inserting Foreign Keys, Primary Keys or similar constraints directly is not possible in SQLite3
-- We rename existing table and create the required table, renaming it to original name
-- Then we copy entries of old table to new, and drop old table
-- If you had already referenced any table to old table, every reference will be deleted when you drop
-- You need to recreate the referenced table too, just assume it was also referenced to some other table
-- Callback Hell, but in DataBase instead of JavaScript!
-- WHICH IDIOT THOUGHT IT WAS A GOOD IDEA TO NOT ADD SUCH AN IMPORTANT FEATURE IN A DBMS LANGUAGE!!!!

ALTER TABLE Invoice RENAME TO Invoice_old;
ALTER TABLE Cust RENAME TO Cust_old;
ALTER TABLE Movie RENAME TO Movie_old;

CREATE TABLE Cust(
  cust_id VARCHAR2(3) PRIMARY KEY NOT NULL,
  lname VARCHAR2(15),
  fname VARCHAR2(15) NOT NULL,
  area VARCHAR2(2),
  phone_no INTEGER
);

CREATE TABLE Movie(
  mv_no VARCHAR2(2) PRIMARY KEY NOT NULL,
  title VARCHAR2(25) NOT NULL,
  type VARCHAR2(10) NOT NULL,
  star VARCHAR2(25)
);

CREATE TABLE Invoice(
  inv_no VARCHAR2(3) PRIMARY KEY NOT NULL,
  mv_no VARCHAR2(2),
  cust_id VARCHAR2(3),
  issue_date DATE,
  return_date DATE,
  FOREIGN KEY (cust_id) REFERENCES Cust(cust_id),
  FOREIGN KEY (mv_no) REFERENCES Movie(mv_no)
);

INSERT INTO Cust SELECT * FROM Cust_old;
INSERT INTO Movie SELECT * FROM Movie_old;
INSERT INTO Invoice SELECT * FROM Invoice_old;

DROP TABLE Cust_old;
DROP TABLE Movie_old;
DROP TABLE Invoice_old;

/*
3. Add a new column price in Movie table with datatype number (8,2).
*/

ALTER TABLE Movie ADD COLUMN price NUMERIC(8,2);

/*
4. Insert data into the cust, movie and invoice tables as provided. 
*/

INSERT INTO Cust (cust_id, lname, fname, area, phone_no) VALUES
('a01', 'Bayross',    'Ivan',     'sa', 6125467),
('a02', 'Saitwal',    'Vandana',  'mu', 5560379),
('a03', 'Jaguste',    'Pramada',  'da', 4563891),
('a04', 'Navindgi',   'Basu',     'ba', 6125401),
('a05', 'Sreedharan', 'Ravi',     'va', NULL),
('a06', NULL,         'Rukmini',  'gh', 5125274);

INSERT INTO Movie (mv_no, title, type, star, price) VALUES
('1',  'Bloody Vengeance',   'Action',   'Jackie Chan',      180.05),
('2',  'The Firm',           'Thriller', 'Tom Cruise',       200.00),
('3',  'Pretty Woman',       'Romance',  'Richard Gere',     150.55),
('4',  'Home Alone',         'Comedy',   'Macaulay Culkin',  150.00),
('5',  'The Fugitive',       'Thriller', 'Harrison Ford',    200.00),
('6',  'Coma',               'Suspense', 'Michael Douglas',   100.00),
('7',  'Dracula',            'Horror',   'Gary Oldman',      150.25),
('8',  'Quick Change',       'Comedy',   'Bill Murray',      100.00),
('9',  'Gone with the Wind', 'Drama',    'Clarke Gable',     200.00),
('10', 'Carry on Doctor',    'Comedy',   'Leslie Phillips',  100.00);

INSERT INTO Invoice (inv_no, mv_no, cust_id, issue_date, return_date) VALUES
('i01', '4',  'a01', '23-Jul-93', '25-Jul-93'),
('i02', '3',  'a02', '12-Aug-93', '15-Aug-93'),
('i03', '1',  'a02', '15-Aug-93', '18-Aug-93'),
('i04', '6',  'a03', '10-Sep-93', '12-Sep-93'),
('i05', '7',  'a04', '05-Aug-93', '08-Aug-93'),
('i06', '2',  'a06', '18-Sep-93', '21-Sep-93'),
('i07', '9',  'a05', '07-Jul-93', '10-Jul-93'),
('i08', '9',  'a01', '11-Aug-93', '14-Aug-93'),
('i09', '5',  'a03', '06-Jul-93', '07-Jul-93'),
('i10', '8',  'a06', '03-Sep-93', '06-Sep-93');

