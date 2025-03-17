SELECT
    id,
    Gender,
    Age,
    City,
    Profession,
    Academic_Pressure,
    Work_Pressure,
    CGPA,
    Study_Satisfaction,
    Job_Satisfaction,
    Sleep_Duration,
    Dietary_Habits,
    Degree,
    Work_Study_Hours,
    Depression,
    
    -- Rank of students based on CGPA, partitioned by city and ordered descending
    RANK() OVER (PARTITION BY City ORDER BY CGPA DESC) AS cgpa_rank,
    
    -- Calculate the average CGPA by city
    AVG(CGPA) OVER (PARTITION BY City) AS avg_city_cgpa,

    -- Calculate the difference between each student's CGPA and the average CGPA of their city
    CGPA - AVG(CGPA) OVER (PARTITION BY City) AS cgpa_diff_from_avg_city,
    
from {{ source('stu_dep_dst', 'student') }}
ORDER BY
    City,
    cgpa_rank
