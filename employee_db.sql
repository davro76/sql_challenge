-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/wsLH9p
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_no" Char(5)  NOT NULL ,
    "dept_name" varchar(30)  NOT NULL ,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
    )
)

GO

CREATE TABLE "employees" (
    "emp_no" Integer  NOT NULL ,
    "emp_title_id" Varchar(8)  NOT NULL ,
    "birth_date" DATE  NOT NULL ,
    "first_name" Varchar(35)  NOT NULL ,
    "last_name" Varchar(35)  NOT NULL ,
    "sex" Char(1)  NOT NULL ,
    "hire_date" DATE  NOT NULL ,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
    )
)

GO

CREATE TABLE "salaries" (
    "emp_no" Integer  NOT NULL ,
    "salary" Integer  NOT NULL 
)

GO

CREATE TABLE "titles" (
    "title_id" Varchar(8)  NOT NULL ,
    "title" Varchar(35)  NOT NULL ,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
    )
)

GO

CREATE TABLE "dept_emp" (
    "emp_no" Integer  NOT NULL ,
    "dept_no" Char(5)  NOT NULL ,
    "PRIMARY" KEY(emp_no,dept_no)  NOT NULL 
)

GO

CREATE TABLE "dept_manager" (
    "dept_no" Char(5)  NOT NULL ,
    "emp_no" Integer  NOT NULL ,
    "PRIMARY" KEY(dept_no,emp_no)  NOT NULL 
)

GO

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id")
GO

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no")
GO

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no")
GO

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no")
GO

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no")
GO

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no")
GO

