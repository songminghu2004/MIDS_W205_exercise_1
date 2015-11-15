-- data were stored under the HDFS directory /user/songm/hospital_compare/  
-- raw unzip data were converted into the txt format delimited by tab,instead of comma  

-- create an external table hospitals
drop table if exists hospitals;
CREATE EXTERNAL TABLE hospitals 
(PROVIDERID varchar(6),
HOSPITALNAME string,
ADDRESS string,
CITY string,
STATE string,
ZIPCODE string,
COUNTYNAME string,
PHONENUMBER string,
HOSPITALTYPE string,
HOSPITALOWNSHIP string,
EMERGENCYSERVICES string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/user/songm/hospital_compare/hospitals';

SELECT STATE,COUNTYNAME,HOSPITALOWNSHIP from hospitals limit 20;

-- create an external table effective_care
DROP TABLE IF EXISTS effective_care;
CREATE EXTERNAL TABLE effective_care
(PROVIDERID varchar(6),
HOSPITALNAME string,
ADDRESS string,
CITY string,
STATE string,
ZIPCODE string,
COUNTYNAME string,
PHONENUMBER int,
CONDITION string,
MEASUREID string,
MEASURENAME string,
SCORE string,
SAMPLE string,
FOOTNOTE  string,
MEASURESTARTDATE string,
MEASUREENDDATE string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/user/songm/hospital_compare/effective_care';

SELECT SCORE, SAMPLE, MEASURESTARTDATE from effective_care limit 20;


-- create an external table readmissions
DROP TABLE IF EXISTS readmissions;
CREATE EXTERNAL TABLE readmissions
(PROVIDERID varchar(6),
HOSPITALNAME string,
ADDRESS string,
CITY string,
STATE string,
ZIPCODE string,
COUNTYNAME string,
PHONENUMBER int,
MEASURENAME string,
MEASUREID string,
COMPARETONATIONAL string,
DENOMINATOR string,
SCORE string,
LOWERESTIMATE  string,
HIGHERESTIMATE string,
FOOTNOTE  string,
MEASURESTARTDATE string,
MEASUREENDDATE string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/user/songm/hospital_compare/readmissions';

SELECT SCORE,LOWERESTIMATE, MEASURESTARTDATE from   readmissions limit 20; 

-- create an external table measure_dates
DROP TABLE IF EXISTS  measure_dates;
CREATE EXTERNAL TABLE  measure_dates
(MEASURENAME string,
MEASUREID string,
MEASURESTARTQUARTER string,
MEASURESTARTDATE string,
MEASUREENDQUARTER string,
MEASUREENDDATE string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/user/songm/hospital_compare/measure_dates';

SELECT MEASURENAME,MEASUREID, MEASURESTARTQUARTER,MEASURESTARTDATE from measure_dates limit 20;


-- create an external table surveys_responses
DROP TABLE IF EXISTS surveys_responses;
CREATE EXTERNAL TABLE surveys_responses
(PROVIDERID varchar(6),
HOSPITALNAME string,
ADDRESS string,
CITY string,
STATE string,
ZIPCODE string,
COUNTYNAME string,
Communication_with_Nurses_Achievement_Points string,
Communication_with_Nurses_Improvement_Points string,
Communication_with_Nurses_Dimension_Score string,
Communication_with_Doctors_Achievement_Points string,
Communication_with_Doctors_Improvement_Points string,
Communication_with_Doctors_Dimension_Score string,
Responsiveness_of_Hospital_Staff_Achievement_Points string,
Responsiveness_of_Hospital_Staff_Improvement_Points string,
Responsiveness_of_Hospital_Staff_Dimension_Score string,
Pain_Management_Achievement_Points string,
Pain_Management_Improvement_Points string,
Pain_Management_Dimension_Score string,
Communication_about_Medicines_Achievement_Points string,
Communication_about_Medicines_Improvement_Points string,
Communication_about_Medicines_Dimension_Score string,
Cleanliness_and_Quietness_of_Hospital_Environment_Achievement_Points string,
Cleanliness_and_Quietness_of_Hospital_Environment_Improvement_Points string,
Cleanliness_and_Quietness_of_Hospital_Environment_Dimension_Score string,
Discharge_Information_Achievement_Points string,
Discharge_Information_Improvement_Points string,
Discharge_Information_Dimension_Score string,
Overall_Rating_of_Hospital_Achievement_Points string,
Overall_Rating_of_Hospital_Improvement_Points string,
Overall_Rating_of_Hospital_Dimension_Score string,
HCAHPS_Base_Score string,
HCAHPS_Consistency_Score string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
STORED AS TEXTFILE
LOCATION '/user/songm/hospital_compare/surveys_responses';

select HCAHPS_Consistency_Score from surveys_responses limit 30;
