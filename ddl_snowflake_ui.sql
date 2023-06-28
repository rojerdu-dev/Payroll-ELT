-- DDL to create database, scehma, virtual warehouse, and table inside Snowflake
-- Last line checks that data is loaded correctly once file format uploads csv from project folder into table

CREATE DATABASE IF NOT EXISTS nyc_db; 

SHOW DATABASES LIKE '%nyc_db';  

USE DATABASE nyc_db;

CREATE SCHEMA IF NOT EXISTS open_data; 

SHOW SCHEMAS; 

CREATE OR REPLACE WAREHOUSE project_wh WITH WAREHOUSE_SIZE=XSMALL AUTO_SUSPEND = 300; 

CREATE OR REPLACE TABLE payroll_data( 
    fiscal_year DATE,
    payroll_number INTEGER,
    agency_name VARCHAR,
    last_name VARCHAR,
    first_name VARCHAR, 
    mid_init VARCHAR, 
    agency_start_date TIMESTAMP,
    work_location_borough VARCHAR, 
    title_description VARCHAR, 
    leave_status_as_of_jul_31 VARCHAR, 
    base_salary FLOAT, 
    pay_basis VARCHAR, 
    regular_hours FLOAT, 
    regular_gross_paid FLOAT, 
    ot_hours FLOAT, 
    total_ot_paid FLOAT, 
    total_other_pay FLOAT
);

SELECT TO_DATE('2022-01-01') AS curr_fiscal_year, * EXCLUDE FISCAL_YEAR FROM open_data.payroll_data; 


