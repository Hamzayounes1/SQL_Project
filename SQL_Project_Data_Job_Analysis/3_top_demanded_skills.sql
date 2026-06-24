SELECT
    skills,
    Count(skills_job_dim.job_id) as demand_count
FROM job_postings_fact
inner join skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
where 
    job_title_short='Data Analyst' and 
    salary_year_avg >150000 and
    job_work_from_home=true 
group by skills
order by demand_count desc
limit 5