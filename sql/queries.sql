#1. STUDENTS' PROFILES: NUMBER, AGE, PLACE OF LIVING, GENDER
SELECT 
	EducationSector,
    COUNT(*) AS NbStudents,
    ROUND(SUM(IF(City = 'Yes', 1, NULL))/COUNT(*) * 100, 0) AS PercentLivesInCity,
	ROUND(AVG(Age), 1) AS AgeAverage, 
	ROUND(SUM(IF(gender = 'Male', 1, NULL))/COUNT(*) * 100, 0) AS PercentMale,
	100 - ROUND(SUM(IF(gender = 'Male', 1, NULL))/COUNT(*) * 100, 0) AS PercentFemale
FROM students
GROUP BY EducationSector
ORDER BY NbStudents DESC;

#2. LIKELINESS TO HAVE ENTREPRENEUR COMPETENCY BY EDUCATION SECTOR WITH GENDER SPLIT
SELECT
	EducationSector,
    COUNT(*) AS NbStudents,
    ROUND(SUM(IF(Target_ent_competency = 1, 1, NULL))/COUNT(*) * 100, 0) AS PercentLikelyEntrepreneur,
    ROUND(SUM(IF((Target_ent_competency = 1) AND (gender = 'Male'), 1, NULL))/SUM(IF(gender = 'Male', 1, NULL)) * 100, 0) AS PercentLikelyEntrepreneurMale,
    ROUND(SUM(IF((Target_ent_competency = 1) AND (gender = 'Female'), 1, NULL))/SUM(IF(gender = 'Female', 1, NULL)) * 100, 0) AS PercentLikelyEntrepreneurFemale
FROM students
GROUP BY EducationSector 
ORDER BY NbStudents DESC;

#3. AVERAGE TRAITS FOR ENTREPRENEUR vs. NON ENTREPRENEUR COMPETENCY
SELECT
	IF(Target_ent_competency = 1, 'Entrepreneur', 'NonEntrepreneur') AS Competency,
    COUNT(*) AS NbStudents,
    ROUND(AVG(Perseverance), 1) AS PerseveranceAvg,
    ROUND(AVG(DesireToTakeInitiative), 1) AS DesireToTakeInitiativeAvg,
    ROUND(AVG(Competitiveness), 1) AS CompetitivenessAvg,
    ROUND(AVG(SelfReliance), 1) AS SelfRelianceAvg,
    ROUND(AVG(StrongNeedToAchieve), 1) AS StrongNeedToAchieveAvg,
    ROUND(AVG(SelfConfidence), 1) AS SelfConfidenceAvg,
    ROUND(AVG(GoodPhysicalHealth), 1) AS GoodPhysicalHealthAvg,
    ROUND(SUM(IF(gender = 'Male', 1, NULL))/COUNT(*) * 100, 0) AS PercentMentalDisorder
FROM students
GROUP BY Competency;

#4. REASONS FOR NOT HAVING ENTREPRENEUR COMPETENCY
WITH non_entrepreneurs AS (
SELECT Target_ent_competency, NotInterested, ParentalPressure, LackKnowledge, NotAbleFinancialRisk, MentalBlock, RiskAdverse, AcademicPressure, FutureRelocation
FROM students
WHERE Target_ent_competency = 0
)
SELECT
	Reasons, NbStudents, PercentNonEntrepreneurs
    FROM (
		SELECT 'TotalNonEntrepreneurs' AS Reasons, COUNT(*) AS NbStudents, 100 as PercentNonEntrepreneurs FROM non_entrepreneurs
        UNION ALL
        SELECT 'NotInterested' AS Reasons, SUM(NotInterested) AS NbStudents, ROUND(SUM(NotInterested) / COUNT(*) * 100, 0) AS PercentNonEntrepreneurs FROM non_entrepreneurs
        UNION ALL
        SELECT 'ParentalPressure', SUM(ParentalPressure), ROUND(SUM(ParentalPressure) / COUNT(*) * 100, 0) FROM non_entrepreneurs
        UNION ALL
        SELECT 'LackKnowledge', SUM(LackKnowledge), ROUND(SUM(LackKnowledge) / COUNT(*) * 100, 0) FROM non_entrepreneurs
        UNION ALL
        SELECT 'NotAbleFinancialRisk', SUM(NotAbleFinancialRisk), ROUND(SUM(NotAbleFinancialRisk) / COUNT(*) * 100, 0) FROM non_entrepreneurs
        UNION ALL
        SELECT 'MentalBlock', SUM(MentalBlock), ROUND(SUM(MentalBlock) / COUNT(*) * 100, 0) FROM non_entrepreneurs
        UNION ALL
        SELECT 'RiskAdverse', SUM(RiskAdverse), ROUND(SUM(RiskAdverse) / COUNT(*) * 100, 0) FROM non_entrepreneurs
        UNION ALL
        SELECT 'AcademicPressure', SUM(AcademicPressure), ROUND(SUM(AcademicPressure) / COUNT(*) * 100, 0) FROM non_entrepreneurs
        UNION ALL
        SELECT 'FutureRelocation', SUM(FutureRelocation), ROUND(SUM(FutureRelocation) / COUNT(*) * 100, 0) FROM non_entrepreneurs
        ) AS pivoted
    ORDER BY NbStudents DESC;

