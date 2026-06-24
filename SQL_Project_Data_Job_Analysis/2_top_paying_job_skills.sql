with top_paying_jobs as (
    select
        job_id,
        job_title,
        salary_year_avg,
        company_dim.name as company_name
    from 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
where 
    job_title_short='Data Analyst' AND
    job_location='Anywhere' AND
    salary_year_avg is NOT NULL
order by
    salary_year_avg desc
limit 10)
select
    top_paying_jobs.*,
    skills
from 
    top_paying_jobs
inner join skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
inner join skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
order by
    salary_year_avg desc