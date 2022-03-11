# Project_Week3_Data_Cleaning


# Profile table 
select EducationSector, 
round(avg(Age),1) as Average_Age, 
COUNT(IF(gender = 'Male', 1, NULL))/COUNT(*) as PercentMale,
COUNT(IF(gender = 'Female', 1, NULL))/COUNT(*) as PercentFemale
from students
group by EducationSector;

PENDING
(100-PercentMale) as PercentFemale
select COUNT(IF("Target-ent_competency" = 1, 1, NULL))/(select COUNT("Target-ent_competency") from students) as PercentEntrepComp from students;
select COUNT(IF("Target-ent_competency" = '1', 1, NULL)) from students;
