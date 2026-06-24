ALTER TABLE job_applied
ADD Contact VARCHAR(50);

SELECT* FROM job_applied;


UPDATE job_applied
SET Contact = 'John Doe'
WHERE job_id = 1;

UPDATE job_applied
SET Contact = 'Jane Smith'
WHERE job_id = 2;

UPDATE job_applied
SET Contact = 'Michael Johnson'
WHERE job_id = 3;

UPDATE job_applied
SET Contact = 'Emily Davis'
WHERE job_id = 4;

UPDATE job_applied
SET Contact = 'David Wilson'
WHERE job_id = 5;

SELECT* FROM job_applied;


ALTER TABLE job_applied
rename Contact to Contact_Name;

ALTER TABLE job_applied
alter column Contact_Name Type text;

ALTER TABLE job_applied
drop column Contact_Name;