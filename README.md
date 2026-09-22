# DBMS-Lab

This repository contains the lab assignments I coded during my university DBMS course.

## Contents

### Assignment 1
- Creating `Cust`, `Movie` and `Invoice` tables
- Primary Key constraints
- Foreign Key constraints
- `NOT NULL` constraints
- Altering tables
- Adding columns
- Inserting data
- SQLite database operations

### Assignment 2
- Retrieving data using `SELECT`
- Concatenating columns using `||`
- Using `DISTINCT` to retrieve unique values
- Formatting query output
- Updating records using `UPDATE`
- Deleting records using `DELETE`
- Filtering records using `WHERE`
- Comparing dates using comparison operators
- Inserting records using `INSERT INTO`

## Database

The assignments are written in SQL and tested using SQLite.

SQLite CLI is used to execute the SQL scripts.

## Running the SQL

Run an assignment from PowerShell:

```powershell
Get-Content assignment1.sql | sqlite3 main.db
```
Note that you need to run assigment1.sql first to work on Assignment 2.
```powershell
Get-Content assignment2.sql | sqlite3 main.db
```
