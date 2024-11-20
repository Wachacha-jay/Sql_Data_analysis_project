--optimal- high demand and high paying
/*
 * find the best skills to learn-nhigh salary & high demand
 * combine quriy 3 and 4 using CTES
 */

WITH high_demand AS (
SELECT
	sjd.skill_id,
	sd.skills,
	count(sjd.skill_id) AS demand_count
FROM
	job_postings_fact jpf
LEFT JOIN skills_job_dim sjd 
	ON
	jpf.job_id = sjd.job_id
JOIN skills_dim sd 
	ON
	sjd.skill_id = sd.skill_id
GROUP BY 
	sjd.skill_id, sd.skills 
ORDER BY
	demand_count DESC), high_salary AS(
SELECT
	sd.skill_id,
	count(sjd.skill_id) AS skill_demand_pay,
	round(avg(jpf.salary_year_avg), 0) AS salary_avg 
FROM
	job_postings_fact jpf
LEFT JOIN skills_job_dim sjd 
	ON
	jpf.job_id = sjd.job_id
JOIN skills_dim sd 
	ON
	sjd.skill_id = sd.skill_id
WHERE
	jpf.salary_year_avg is not null
GROUP BY 
	sd.skill_id
ORDER BY
	skill_demand_pay desc, salary_avg desc)
	
SELECT high_salary.skill_id, high_demand.skills, high_salary.salary_avg, high_demand.demand_count
FROM high_demand
JOIN high_salary
	ON high_demand.skill_id = high_salary.skill_id
ORDER BY high_salary.salary_avg desc
LIMIT 10;