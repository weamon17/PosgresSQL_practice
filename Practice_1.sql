/*
Find the count of the number of remote job postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - Include skill ID, name, and count of postings requiring the skill
*/


WITH remote_job_skills AS (
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM skills_job_dim as skills_to_jobs
    INNER JOIN job_postings_fact as jpf ON jpf.job_id = skills_to_jobs.job_id
    WHERE 
        job_work_from_home = TRUE
        and job_title_short = 'Data Analyst'
    GROUP BY skill_id
) 

SELECT 
    skills.skill_id,
    skills as skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim as skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY skill_count DESC


