--SQL file in snowflake sql worksheets

create database sdd;
create schema sdd.stu_dep_dst;

create table sdd.stu_dep_dst.student(
    id INT PRIMARY KEY,  
    gender VARCHAR(10),  -- Gender can be a string (e.g., 'Male', 'Female', 'Other')
    age INT,             -- Age of the student (integer)
    city VARCHAR(100),   -- City where the student resides
    profession VARCHAR(50), -- Profession of the student
    academic_pressure INT,  -- Describes academic pressure (e.g., 'Low', 'Moderate', 'High')
    work_pressure INT,  -- Describes work pressure (e.g., 'Low', 'Moderate', 'High')
    cgpa DECIMAL(3,2),  -- CGPA of the student (up to two decimal places)
    study_satisfaction INT, -- Satisfaction level with studies (e.g., 'High', 'Medium', 'Low')
    job_satisfaction INT,   -- Satisfaction level with job (e.g., 'High', 'Medium', 'Low')
    sleep_duration VARCHAR(100),   -- Sleep duration in hours (e.g., 7.5 hours)
    dietary_habits VARCHAR(100),   -- Dietary habits (e.g., 'Vegetarian', 'Non-Vegetarian', 'Vegan')
    degree VARCHAR(100),   -- Degree program (e.g., 'Bachelor's in Computer Science')
    suicidal_thoughts BOOLEAN,  -- Whether the student has ever had suicidal thoughts (TRUE/FALSE)
    work_study_hours INT,   -- Total work/study hours per week
    financial_stress INT,
    family_history_of_mental_illness BOOLEAN,  -- Whether there is a family history of mental illness (TRUE/FALSE)
    depression INT
);

use database sdd;
use schema stu_dep_dst;
CREATE STAGE file_stage;

ALTER TABLE student
MODIFY COLUMN cgpa DECIMAL(4,2);

COPY INTO sdd.stu_dep_dst.student
from @file_stage/student_depression_dataset.csv
file_format = (
    type = 'CSV'
    field_delimiter = ','
    skip_header = 1
)
ON_ERROR = 'CONTINUE';

SELECT * FROM sdd.stu_dep_dst.student
select * from SDD.STU_DEP_DST.QUERY_VIEW
select * from query2
