--what are the most in-demand skills for my role
/*
 * we will be finding out the skills most required for data analyst role
 * will be required to do a count for for the skills required and order by the most in demand
 *  
 */

select
	sd.skills,
	count(sjd.skill_id) as skill_demand
from
	job_postings_fact jpf
left join skills_job_dim sjd 
	on
	jpf.job_id = sjd.job_id
join skills_dim sd 
	on
	sjd.skill_id = sd.skill_id
where
	jpf.job_title_short = 'Data Analyst'
group by 
	sd.skills 
order by
	skill_demand desc 
limit 5;
