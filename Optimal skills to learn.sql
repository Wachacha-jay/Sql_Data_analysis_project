--what are the most optimal skills to learn
	
select
	sd.skills,
	count(sjd.skill_id) as skill_demand,
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
	jpf.job_title_short = 'Data Analyst' and salary_year_avg is not null
group by 
	sd.skills 
order by
	skill_demand desc, salary_avg desc
limit 25;	
	
	
