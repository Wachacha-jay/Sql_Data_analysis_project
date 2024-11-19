--Top paying jobs for my role
/*
 * find the jobs with the highest salaries from jobs postings
 * match the jobs to the company names in the company dim table
 * left join the tables using company id
 * remove null values from salaries
 * then i will filter it with my role which is data analyst
 */

select
	jpf.job_id,
	jpf.company_id,
	jpf.job_title_short,
	jpf.salary_year_avg,
	cd.name
from
	job_postings_fact jpf
join company_dim cd 
	on
	jpf.company_id = cd.company_id
where
	jpf.salary_year_avg is not null
	and jpf.job_title_short = 'Data Analyst'
order by
	jpf.salary_year_avg desc;
