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

## Database

The assignments are written in SQL and tested using SQLite.

SQLite CLI is used to execute the SQL scripts.

## Running the SQL

Run an assignment from PowerShell:

```powershell
Get-Content assignment1.sql | sqlite3 assignment1.db
