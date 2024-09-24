WITH TopPayingJobs AS
(
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        name as company_name
    FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE 
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    TopPayingJobs.*,
    skills
FROM TopPayingJobs
INNER JOIN skills_job_dim  AS skills ON TopPayingJobs.job_id = skills.job_id
INNER JOIN skills_dim on skills.skill_id = skills_dim.skill_id

ORDER BY 
    salary_year_avg DESC
