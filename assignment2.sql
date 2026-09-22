/*
1.Find out the names of all the customers.
*/

SELECT fname || ' ' || lname AS names FROM Cust;

/*
2. Print the entire customer table.
*/

SELECT * FROM Cust;

/*
3. Retrieve the list of first name and the area of all the customers.
*/

SELECT fname,area FROM Cust;

/*
4. List the various movie types available from the movie table.
*/

SELECT DISTINCT type FROM Movie;

/*
5. Print the information of invoice table in the following format for all records :
a. The invoice no. of customer Id {cust_id} is {inv_no} and movie no is {mv_no}
b. {cust_id} has taken Movie_no {mv_no} on {issue_date} and will return on {return_date}
*/

SELECT 'The invoice no. of customer Id ' || cust_id || ' is ' || inv_no || ' and movie no is ' || mv_no AS Result FROM Invoice;
SELECT cust_id || ' has taken Movie_no ' || mv_no || ' on ' || issue_date || ' and will return on ' || return_date AS Result FROM Invoice; 

/*
6. Change the telephone no of Pramada to 466389
*/

UPDATE Cust SET phone_no = 466389 WHERE fname = 'Pramada';
SELECT fname, phone_no FROM Cust;

/*
7. Change the issue_date of cust_id 'a01' to 24/07/93.
*/

UPDATE Invoice SET issue_date = '1993-07-24' WHERE cust_id = 'a01';
SELECT cust_id, issue_date FROM Invoice;

/*
8. Change the price of 'Gone with the wind' to Rs.250.00
*/

UPDATE Movie SET price = 250.00 WHERE title = 'Gone with the wind';
SELECT title,price FROM Movie;

/*
9. Delete the record with invoice number 'i08' from table.
*/

DELETE FROM Invoice WHERE inv_no = 'i08';
SELECT * FROM Invoice;
INSERT INTO Invoice (inv_no, mv_no, cust_id, issue_date, return_date) VALUES ('i08', '9', 'a01', '1993-08-11', '1993-08-14');
/*
10. Delete all the records having return date before 10th July 1993.
*/

DELETE FROM Invoice WHERE return_date < '1993-07-10';
SELECT * FROM Invoice;

/*
11. Change the return date of invoice number 'i08' to 16-08-93.
*/

UPDATE Invoice SET return_date = '1993-08-16' WHERE inv_no = 'i08';
SELECT * FROM Invoice;

/*
12. Change the area of cust_id 'a05' to 'vs'
*/

UPDATE Cust SET area = 'vs' WHERE cust_id = 'a05';
SELECT cust_id,area FROM Cust;