 CREATE DATABASE IF NOT EXISTS jobs_mart;
 SHOW DATABASES;

 --DROP DATABASE jobs_mart;

 SELECT catalog_name, schema_name
 FROM information_schema.schemata;

CREATE SCHEMA jobs_mart.staging;

CREATE TABLE jobs_mart.staging.preferred_roles (
    role_id INTEGER PRIMARY KEY,
    role_name VARCHAR
);

SELECT *
FROM information_schema.tables
WHERE table_catalog = 'jobs_mart';

--DROP TABLE jobs_mart.preferred_roles;

USE jobs_mart;

INSERT INTO staging.preferred_roles (role_id, role_name)
VALUES 
 (1, 'Data Engineer'),
 (2, 'Senior Data Engineer'),
 (3, 'Software Engineer');

 SELECT *
 FROM staging.preferred_roles;

ALTER TABLE staging.preferred_roles
ADD COLUMN preferred_role BOOLEAN;

UPDATE staging.preferred_roles
SET preferred_role = TRUE
WHERE role_id = 1 OR role_id = 2;

UPDATE staging.preferred_roles
SET preferred_role = FALSE
WHERE role_id = 3;

ALTER TABLE staging.preferred_roles
RENAME TO priority_roles;

 SELECT *
 FROM staging.priority_roles;

 ALTER TABLE staging.priority_roles
RENAME COLUMN preferred_role TO priority_lvl;

 ALTER TABLE staging.priority_roles
ALTER COLUMN  priority_lvl TYPE INTEGER;

UPDATE staging.priority_roles
SET priority_lvl = 3
WHERE role_id = 3;

UPDATE staging.priority_roles
SET priority_lvl = 1
WHERE role_id = 2;
