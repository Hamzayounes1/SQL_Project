--Subqueries and CTEs

select * 
from (
    select *
    from job_postings_fact
    where
    extract(month from job_posted_date)=1) as january_postings; ---Subquery to filter job postings for the month of January

########
with january_postings as (
    select *
    from job_postings_fact
    where extract(month from job_posted_date) = 1
)  
select *
from january_postings; ---Using CTE to filter job postings for the month of January

########
select name as Company_name,
       company_id
from company_dim
where company_id in(
select company_id
from job_postings_fact
where job_no_degree_mention = true
order by company_id); ---Subquery to find companies that have job postings mentioning no degree requirement 

########
with company_job_count as ( 
    select company_id, count(*) as job_postings_count
    from job_postings_fact
    group by company_id
)
select * 
from company_job_count
where job_postings_count > 10; ---Using CTE to find companies with more than 10 job postings



with Company_job_count as (
    select 
        company_id, 
        count(*) as Job_Count
    from job_postings_fact
    group by company_id
)

select 
    name as company_name,
     Job_Count
from company_dim
left join Company_job_count
on company_dim.company_id = Company_job_count.company_id
ORDER BY Job_count DESC; ---Using CTE to find companies and their job posting counts, ordered by count in descending order