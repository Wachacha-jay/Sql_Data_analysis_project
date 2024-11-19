COPY company_dim
FROM "C:\Users\jay\Desktop\Data nerds\Sql_project_data_analysis_jobs\company_dim.csv"
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM "C:\Users\jay\Desktop\Data nerds\Sql_project_data_analysis_jobs\skills_dim.csv"
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM "C:\Users\jay\Desktop\Data nerds\Sql_project_data_analysis_jobs\job_postings_fact.csv"
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM "C:\Users\jay\Desktop\Data nerds\Sql_project_data_analysis_jobs\skills_job_dim.csv"
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy company_dim FROM 'C:\Users\jay\Desktop\Data nerds\Sql_project_data_analysis_jobs\company_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_dim FROM 'C:\Users\jay\Desktop\Data nerds\Sql_project_data_analysis_jobs\skills_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy job_postings_fact FROM 'C:\Users\jay\Desktop\Data nerds\Sql_project_data_analysis_jobs\job_postings_fact.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

\copy skills_job_dim FROM 'C:\Users\jay\Desktop\Data nerds\Sql_project_data_analysis_jobs\skills_job_dim.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');


