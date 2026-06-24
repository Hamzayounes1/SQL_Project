select
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
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
limit 10;