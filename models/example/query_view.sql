SELECT * from {{ source('stu_dep_dst', 'student') }}
WHERE depression = 0 and suicidal_thoughts = false