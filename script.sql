WITH pay AS ( 
  SELECT
    TO_DATE('2022-01-01') AS fiscal_year
    , last_name
    , work_location_borough AS borough
    , title_description AS job_title
    , leave_status_as_of_jul_31 AS leave_status
    , SUM(regular_gross_paid + total_ot_paid + total_other_pay) AS total_compensation
  FROM
    nyc_db.open_data.payroll_data
  WHERE
    LOWER(leave_status_as_of_jul_31) = 'active'
  GROUP BY
    fiscal_year
    , last_name
    , borough
    , job_title
    , leave_status
),

top_five AS (
  SELECT
    fiscal_year
    , job_title
    , SUM(total_compensation) AS aggregate_total_comp
    , DENSE_RANK() OVER(ORDER BY SUM(total_compensation) DESC) AS ranking
  FROM
    pay
  GROUP BY
    fiscal_year
    , job_title
)

--Query 1 - Compensation by NYC Borough
SELECT
    fiscal_year
    , borough
    , SUM(total_compensation) AS aggregate_total_comp
    , DENSE_RANK() OVER(ORDER BY SUM(total_compensation) DESC) AS ranking
FROM
    pay
GROUP BY
    fiscal_year
    , borough

--Query 2 - Top 5 Job Titles by Total Compensation
SELECT
    fiscal_year
    , job_title
    , aggregate_total_comp
    , ranking
FROM
    top_five
WHERE
    ranking <= 5
