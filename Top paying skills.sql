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
	jpWITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;f.job_title_short,
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
