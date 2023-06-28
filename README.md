# Payroll-ELT 
This project is a Snowflake Extract, Load, & Transform (ELT) project using payroll data from [NYC OpenData](https://data.cityofnewyork.us/City-Government/Citywide-Payroll-Data-Fiscal-Year-/k397-673e) for the current fiscal year. 

The project aims to answer 2 questions about NYC's payroll data: 
* What borough gets paid the most?
* What are the top 5 most compensated professions in NYC?

# Architecture Diagram 
![Alt text](https://github.com/rojerdu-dev/Payroll-ELT/blob/main/Diagrams/ELT%20Diagram.png)
[_Diagram made using Excalidraw_](https://excalidraw.com/) 

# Process 
1. Python extracts the data from the API (JSON) and converts it to a CSV (`data.csv`)
2. In the Snowflake UI, create the database, schema, virtual warehouse, and table (refer to `ddl_snowflake_ui.sql`)
3. In Snowflake, upload `data.csv` using the UI (select database, schema, table, and create file format)
4. Use SQL to transform data in Snowflake
5. Visualize with Snowflake's charts function

# Data Visualization  
**Ranking Boroughs by Pay**

![alt text](https://github.com/rojerdu-dev/Payroll-ELT/blob/main/Diagrams/Total_Comp_by_Borough.png) 



**Top 5 Job Titles by Compensation** 

![alt_text](https://github.com/rojerdu-dev/Payroll-ELT/blob/main/Diagrams/top_five_chart.png)

_This chart didn't come out too neat in Snowflake_ 

**Screenshot of Results of Final Query - Job Titles by Aggregate Total Comp** 

![alt_text](https://github.com/rojerdu-dev/Payroll-ELT/blob/main/Screenshots/Job%20Title%20Rankings.png) 



# Conclusion
The findings of this project are that: 
1. More of NYC's payroll budget goes to Manhattan than any other borough
2. After aggregating total compensation by job title, the top 5 jobs that NYC spends the most money on include: 
  * Child Protective Specialist
  * Child Protective Specialist Supervisor
  * Youth Development Specialist
  * Director of Field Operations
  * Administrative Director of Social Services 
