--CTE and Joins Real Use Example
with remote_jobs_skills as (
select skill_id,
           count(*) as skill_count
    from skills_job_dim
    inner join job_postings_fact on job_postings_fact.job_id=skills_job_dim.job_id
    where job_postings_fact.job_work_from_home=true and job_title_short='Data Analyst'
    group by skill_id)

select skills.skill_id,
         skills as skill_name,
            skill_count
from remote_jobs_skills
inner join skills_dim as skills on skills.skill_id=remote_jobs_skills.skill_id
order by skill_count desc
limit 5
