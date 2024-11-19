--what are the skills required for this top paying roles
/*
 * find the top paying roles from job postings table
 * match the job with the skill id in the skill job dim using the job id
 * match the skill id with the skill from skills dim
 * we will have to join the three tables one left join and and inner join
 * order with the salary
 */

select
	jpf.job_id,
	jpf.company_id,
	sjd.skill_id,
	jpf.job_title_short,
	jpf.salary_year_avg,
	sd.skills
from
	job_postings_fact jpf
left join skills_job_dim sjd 
	on
	jpf.job_id = sjd.job_id
join skills_dim sd 
	on
	sjd.skill_id = sd.skill_id
where
	jpf.salary_year_avg is not null
order by
	jpf.salary_year_avg desc;
