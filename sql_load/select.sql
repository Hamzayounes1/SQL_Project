select 
    count(job_id) as total_job_postings,
    extract(month from job_posted_date) as month
from job_postings_fact
where job_title_short='Data Analyst'
group by month
order by total_job_postings desc;


select 
    count(job_id) as total_job_postings,
    extract(month from job_posted_date) as month
from job_postings_fact
where extract(month from job_posted_date) in(1,2,3)
group by month
order by total_job_postings desc;



create table january_job_postings as
select *
from job_postings_fact
where extract(month from job_posted_date) = 1;

create table february_job_postings as
select *
from job_postings_fact
where extract(month from job_posted_date) = 2;

create table march_job_postings as
select *
from job_postings_fact
where extract(month from job_posted_date) = 3;

select
    count(job_id) as total_job_postings,
    case
        when job_location = 'New York, NY' then 'Local'
        when job_location like '%Anywhere%' then 'Remote'
        else 'Onsite'
    end as job_location_type
from job_postings_fact
where job_title_short='Data Analyst'
group by job_location_type;
