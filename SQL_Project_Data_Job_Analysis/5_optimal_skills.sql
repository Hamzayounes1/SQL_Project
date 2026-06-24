SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    Count(skills_job_dim.job_id) as demand_count,
    round(avg(job_postings_fact.salary_year_avg),0) as avg_salary
from job_postings_fact
INNER JOIN skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id=skills_dim.skill_id
where
    job_title_short='Data Analyst' and 
    salary_year_avg is NOT NULL and 
    job_work_from_home= TRUE
group by
    skills_dim.skill_id
Having count(skills_job_dim.job_id)>100
ORDER BY
    avg_salary desc,
    demand_count DESC
LIMIT 25

    
    