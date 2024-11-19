--optimal- high demand and high paying
/*
 * find the best skills to learn-nhigh salary & high demand
 * combine quriy 3 and 4 using CTES
 */

with high_demand as (
select
	sjd.skill_id,
	sd.skills,
	count(sjd.skill_id) as demand_count
from
	job_postings_fact jpf
left join skills_job_dim sjd 
	on
	jpf.job_id = sjd.job_id
join skills_dim sd 
	on
	sjd.skill_id = sd.skill_id
group by 
	sjd.skill_id, sd.skills 
order by
	demand_count desc), high_salary as(
select
	sd.skill_id,
	count(sjd.skill_id) as skill_demand_pay,
	round(avg(jpf.salary_year_avg), 0) as salary_avg 
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
group by 
	sd.skill_id
order by
	skill_demand_pay desc, salary_avg desc)
	
select high_salary.skill_id, high_demand.skills, high_salary.salary_avg, high_demand.demand_count
from high_demand
join high_salary
	on high_demand.skill_id = high_salary.skill_id
order by high_salary.salary_avg desc;