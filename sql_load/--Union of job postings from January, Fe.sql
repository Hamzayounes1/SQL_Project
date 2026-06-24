--Union of job postings from January, February, and March
with Q1_job_postings as (
select job_title_short,
       company_id,
       job_location,
         salary_year_avg
from january_job_postings

union ALL

select job_title_short,
       company_id,
       job_location,
       salary_year_avg
from february_job_postings

union all --Union ALL may be used to include duplicates

select job_title_short,
       company_id,
       job_location,
         salary_year_avg
from march_job_postings)

select job_title_short,
       company_id,
       job_location,
       salary_year_avg
from Q1_job_postings
where salary_year_avg> 70000 AND job_title_short ='Data Analyst'
ORDER BY salary_year_avg desc

--problem 1 using cte #####

select quarter1.job_title_short,
       quarter1.company_id,
       quarter1.job_location,
       quarter1.salary_year_avg
from(select *
     from january_job_postings
     union all
     select *
     from february_job_postings
     union all
     select *
     from march_job_postings) as quarter1
where quarter1.salary_year_avg> 70000 AND quarter1.job_title_short ='Data Analyst'
order by quarter1.salary_year_avg desc

--Problem 1 Using Subqueries #####



