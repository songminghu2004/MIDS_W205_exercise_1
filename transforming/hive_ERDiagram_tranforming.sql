-- Create a new table hospitalinfo from the raw hospitals table and copy all data.
DROP TABLE IF EXISTS hospitalinfo;
CREATE TABLE hospitalinfo AS SELECT  FROM hospitals;

-- Create a new table Procedures and union two tables (effective_care and readmissions) with the common columns .
DROP TABLE IF EXISTS procedures;
CREATE TABLE procedures AS
SELECT * FROM (
  SELECT e.measureid, e.measurename, e.score, e.footnote, e.measurestartdate, e.measureenddate,  e.providerid, e.hospitalname  
  FROM effective_care e
  UNION ALL 
  SELECT r.measureid, r.measurename, r.score, r.footnote, r.measurestartdate, r.measureenddate,  r.providerid, r.hospitalname
  FROM readmissions r
 )unioned;

-- Create a new table survey by pulling the subset from the raw hospitals table and copy all data.
DROP TABLE IF EXISTS surveys;
CREATE TABLE surveys AS 
SELECT  Overall_Rating_of_Hospital_Achievement_Points as Achievement_Points,
        Overall_Rating_of_Hospital_Improvement_Points as Improvement_Points,
        Overall_Rating_of_Hospital_Dimension_Score as Dimension_Score,
        HCAHPS_Base_Score as Base_Score,
        HCAHPS_Consistency_Score as  Consistency_Score
FROM surveys_responses;
