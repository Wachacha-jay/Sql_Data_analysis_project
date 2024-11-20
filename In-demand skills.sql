--what are the most in-demand skills for my role
/*
 * we will be finding out the skills most required for data analyst role
 * will be required to do a count for for the skills required and order by the most in demand
 *  
 */

SELECT
	sd.skills,
	count(sjd.skill_id) as skill_demand
FROM
	job_postings_fact jpf
LEFT JOIN skills_job_dim sjd 
	ON
	jpf.job_id = sjd.job_id
JOIN skills_dim sd 
	ON
	sjd.skill_id = sd.skill_id
WHERE
	jpf.job_title_short = 'Data Analyst'
GROUP BY 
	sd.skills 
ORDER BY
	skill_demand desc 
LIMIT 5;