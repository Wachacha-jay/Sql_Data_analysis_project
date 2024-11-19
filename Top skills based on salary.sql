--top skills based on salary for my role

/*
 * highest paying jobs for my data analyst role
 * top skills associated with the jobs
 * join with skills_job_dim and skills_dim tables
 */
with job_skill as(
select job_postings_fact.job_id, skills_job_dim.skill_id, job_postings_fact.job_title_short, job_postings_fact.salary_year_avg 
from job_postings_fact
join skills_job_dim
	on skills_job_dim.job_id = job_postings_fact.job_id 
where job_postings_fact.salary_year_avg is not null)

select job_skill.skill_id, skills_dim.skills, count(job_skill.job_id) as job_postings, job_skill.salary_year_avg
from skills_dim
join job_skill
	on skills_dim.skill_id = job_skill.skill_id
group by job_skill.skill_id, skills_dim.skills, job_skill.salary_year_avg
order by job_skill.salary_year_avg desc
limit 25;


