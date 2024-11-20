--Top paying jobs for my role
/*
 * find the jobs with the highest salaries from jobs postings
 * match the jobs to the company names in the company dim table
 * left join the tables using company id
 * remove null values from salaries
 * then i will filter it with my role which is data analyst
 */

SELECT
	jpf.job_id,
	jpf.company_id,
	jpf.job_title,
	jpf.salary_year_avg,
	jpf.job_location,
	cd.name
FROM
	job_postings_fact jpf
JOIN company_dim cd 
	on
	jpf.company_id = cd.company_id
WHERE
	jpf.salary_year_avg is not null
	AND jpf.job_title_short = 'Data Analyst'
	AND jpf.job_location = 'Anywhere'
ORDER BY
	jpf.salary_year_avg desc
LIMIT
	10;
