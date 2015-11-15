# the unzip csv file were first converted into the txt file delimited by the tab 
# rename txt files under the local directory /root/temp/exercise1 
# remove the header lines from the files before loading them into HDFS 
tail -n +2 "/root/temp/exercise1/Hospital General Information.txt"  > /root/temp/exercise1/hospitals.txt  
tail -n +2 "/root/temp/exercise1/Timely and Effective Care - Hospital.txt" > /root/temp/exercise1/effective_care.txt 
tail -n +2 "/root/temp/exercise1/Readmissions and Deaths - Hospital.txt" > /root/temp/exercise1/readmissions.txt 
tail -n +2 "/root/temp/exercise1/Measure Dates.txt" > /root/temp/exercise1/measure_dates.txt 
tail -n +2 /root/temp/exercise1/hvbp_hcahps_05_28_2015.txt > /root/temp/exercise1/surveys_responses.txt 
 
 
# Make new HDFS folder “/user/songm/hospital_compare” on AWS 
# Load the data files from the local folder into HDFS 
hadoop fs -mkdir /user/songm/ 
hadoop fs -mkdir /user/songm/hospital_compare 
hadoop fs -mkdir /user/songm/hospital_compare/hospitals
hadoop fs -mkdir /user/songm/hospital_compare/effective_care
hadoop fs -mkdir /user/songm/hospital_compare/readmissions
hadoop fs -mkdir /user/songm/hospital_compare/measure_dates
hadoop fs -mkdir /user/songm/hospital_compare/surveys_responses
hadoop fs -copyFromLocal /root/temp/exercise1/hospitals.txt /user/songm/hospital_compare/hospitals/hospitals.txt 
hadoop fs -copyFromLocal /root/temp/exercise1/effective_care.txt /user/songm/hospital_compare/effective_care/effective_care.txt 
hadoop fs -copyFromLocal /root/temp/exercise1/readmissions.txt /user/songm/hospital_compare/readmissions/readmissions.txt 
hadoop fs -copyFromLocal /root/temp/exercise1/measure_dates.txt /user/songm/hospital_compare/measure_dates/measure_dates.txt 
hadoop fs -copyFromLocal /root/temp/exercise1/surveys_responses.txt /user/songm/hospital_compare/surveys_responses/surveys_responses.txt 

