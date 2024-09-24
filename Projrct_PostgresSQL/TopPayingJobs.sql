/*
Question 1: What are the top-paying data analyst job?
    - Identify the top 10 highest-paying Data Analyst roles that are available remotely.
    - Focuses on job postings with specified salaries (remove nulls).
    - Why? Highlight the top-paying opportunities for DA, offering insights into employment opportunities
*/

SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    job_posted_date,
    name as company_name
FROM job_postings_fact
RIGHT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst' AND 
job_location = 'Anywhere' AND
salary_year_avg IS NOT NULL

ORDER BY
    salary_year_avg DESC
LIMIT 10