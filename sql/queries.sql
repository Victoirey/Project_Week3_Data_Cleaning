# STUDENTS' PROFILES
SELECT 
	EducationSector, 
	ROUND(AVG(Age), 1) AS AgeAverage, 
	ROUND(COUNT(IF(gender = 'Male', 1, NULL))/COUNT(*) * 100, 0) as PercentMale,
	100 - ROUND(COUNT(IF(gender = 'Male', 1, NULL))/COUNT(*) * 100, 0) as PercentFemale
FROM students
GROUP BY EducationSector
ORDER BY EducationSector;


select COUNT(IF("Target-ent_competency" = 1, 1, NULL))/(select COUNT("Target-ent_competency") from students) as PercentEntrepComp from students;
select COUNT(IF("Target-ent_competency" = '1', 1, NULL)) from students;
