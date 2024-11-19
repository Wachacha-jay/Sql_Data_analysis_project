-- Formating date and timezones
select *
from job_postings_fact
limit 100;

select job_posted_date 
from job_postings_fact
limit 100;

select job_posted_date::date as date 
from job_postings_fact
limit 10;

select job_posted_date at TIME zone 'UTC' at TIME zone 'EST'
from job_postings_fact
limit 10;

select
	extract ( month
from
	job_posted_date) as month
from
	job_postings_fact
limit 10;

select
	count(job_id),
	extract(month
from
	job_posted_date) as month
from
	job_postings_fact
where
	job_title_short = 'Data analyst'
group by
	month
order by
	count desc
limit 10;

select
	avg(salary_year_avg) as avg_year,
	avg(salary_hour_avg) as avg_hrs,
	job_schedule_type
from
	job_postings_fact
where
	job_posted_date > '6/1/2023'
group by
	job_schedule_type;

select
	count(job_id),
	job_posted_date at TIME zone 'UTC' at TIME zone 'EST' as new_date,
	extract(month
from
	job_posted_date) as month_date
from
	job_postings_fact
group by
	job_posted_date;


--create tables using the extract statement
create table January_table as
select *
from job_postings_fact
where extract(month from job_posted_date) = 1;

create table February_table as
select *
from job_postings_fact
where extract(month from job_posted_date) = 2;

create table March_table as
select *
from job_postings_fact
where extract(month from job_posted_date) = 3;

--Case statement expression
/** label new column as follows
 * - 'Anywhere' jobs as 'Remote'
 * - 'Kenya' jobs as 'locals'
 * - Otherwise 'Onsite'
 */

select count(job_id), 
case
	when job_location = 'Anywhere' then 'Remote'
	when job_location = 'Kenya' then 'Local'
	else 'Onsite'
end as location_category
from job_postings_fact
--where job_title_short = 'Data analyst'
group by location_category;

--Subqueries and CTEs
select *
from (
select *
from job_postings_fact 
where extract(month from job_posted_date) = 1) as january

with january as(
select * 
from job_postings_fact
where extract(month from job_posted_date) = 1)

select *
from january

select name, company_id
from company_dim
where company_id in (
	select company_id
	from job_postings_fact
	where job_no_degree_mention = true
	order by company_id)

-- determining companiies with the highes number of jobs using CTES
with job_count as(
select company_id, count(company_id) as jobs
from job_postings_fact
group by company_id)

select name, job_count.jobs
from company_dim
left join job_count
	on job_count.company_id = company_dim.company_id
order by job_count.jobs desc


/*
 * Find the count of the number of remote job postings per skill
 * display the top 5 skills by their demand in remote jobs
 * include skill id, name and count of job postings requiring the skill
 */
with job_skill as(
select job_postings_fact.job_id, skills_job_dim.skill_id, job_postings_fact.job_title_short 
from job_postings_fact
join skills_job_dim
	on skills_job_dim.job_id = job_postings_fact.job_id 
where job_work_from_home = true)

select job_skill.skill_id, skills_dim.skills, count(job_skill.job_id) as job_postings
from skills_dim
join job_skill
	on skills_dim.skill_id = job_skill.skill_id
where job_skill.job_title_short = 'Data Analyst'
group by job_skill.skill_id, skills_dim.skills
order by job_postings desc
limit 5;




























