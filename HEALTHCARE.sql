-- Dataset: Healthcare
-- COlumns				Datatype
--	Name				text
-- Age 					int
-- Gender 				text
-- Blood_Type			text
-- Medical_Condition 	text
-- DOA 					text
-- Doctor 				text
-- Hospital 			text
-- Insurance_Provider	text
-- Billing_Amount		double
-- Room_Number			int
-- Admission_Type 		text
-- DOD 					text
-- Medication 			text
-- test_Results			text


-- Q1:Display all Detailed Dataset.
	SELECT * FROM healthcare;
    
-- Q2:Select specific columns Name, Age and Medical Condition.
	SELECT Name, Age, Medical_Condition  FROM healthcare;
    
-- Q3:Count total patients
	SELECT Count(*) FROM healthcare;
    
-- Q4:Find unique blood types
	SELECT DISTINCT Blood_Type FROM healthcare;
    
-- Q5:Filter by Gender Female
	SELECT * FROM healthcare WHERE Gender="female";
    
-- Q6:Find patients over age 60
	SELECT * FROM healthcare WHERE Age>60;
    
-- Q7:Find patients with Diabetes
	SELECT * FROM healthcare WHERE Medical_Condition="Diabetes";
    
-- Q8:Sort patients by age (Descending)
	SELECT * FROM healthcare ORDER BY Age DESC;
    
-- Q9:Find Top 10 highest billing amounts
	SELECT Billing_Amount From healthcare ORDER BY Billing_Amount DESC limit 10;
    
-- Q10:Find patients in Room 101:
	SELECT * FROM healthcare WHERE Room_Number=101;

-- Q11:Count patients per medical condition
	SELECT Medical_Condition,count(*) AS Total FROM healthcare GROUP BY Medical_Condition;
    
-- Q12:Calculate average billing amount:
	SELECT AVG(Billing_Amount) AS avg_Bill FROM healthcare;
    
-- Q13:Find maximum and minimum age
	SELECT MIN(Age) , MAX(Age) FROM healthcare;
    
-- Q15:Find patients admitted in 2023
	SELECT * FROM healthcare WHERE DOA=2023;
	SELECT * FROM healthcare WHERE DOA LIKE "2023%";
    
-- Q16:Count emergency admissions
	SELECT COUNT(*) FROM healthcare WHERE Admission_Type="Emergency";
    
-- Q17:Find patients treated by a specific doctor
	SELECT * FROM healthcare WHERE Doctor="Krista Smith";
    
-- Q18:List unique hospitals
	SELECT DISTINCT Hospital FROM healthcare;
    
-- Q19:Find patients with Abnormal test results
	SELECT *  FROM healthcare WHERE Test_results="Abnormal";
    
-- Q20:Find patient with highest billing
	SELECT *  FROM healthcare ORDER BY Billing_Amount DESC limit 1;
    
-- Q21:Count patients per insurance provider
	SELECT Insurance_Provider, COUNT(*) FROM healthcare GROUP BY Insurance_Provider;
    
-- Q22:Find female patients with Cancer
	SELECT * FROM healthcare WHERE Gender="Female" AND Medical_Condition="Cancer";
    
-- Q23:Patients with O- blood type
	SELECT * FROM healthcare WHERE Blood_Type="O-";
-- Q25:Average billing amount by gender
	SELECT Gender, AVG(Billing_Amount) AS avg_Bil FROM healthcare GROUP BY Gender;
    
-- Q26:Count patients by medication
	SELECT Medication,COUNT(*) FROM healthcare GROUP BY Medication;
    
-- Q27:Find patients with 'Aspirin'
	SELECT * FROM healthcare WHERE Medication="Aspirin";
    
-- Q28:Count patients admitted in January 2024
	SELECT COUNT(*) FROM healthcare WHERE DOA BETWEEN  "2024-01-01" AND "2024-01-31";
    
-- Q29:Find shortest stay (Assuming date conversion):
 SELECT MIN(DATEDIFF(day, DOA, DOD)) FROM healthcare;
 
-- Q30:Total billing for 'UnitedHealthcare'
	select SUM(Billing_Amount) FROM healthcare WHERE Insurance_Provider="UnitedHealthcare";
    
-- Q31:Find distinct medication types
	SELECT DISTINCT Medication FROM healthcare;
    
-- Q32:Count patients in a specific hospital:
	SELECT COUNT(*) FROM healthcare WHERE Hospital="Sons and Miller" ;
    
-- Q33:Average billing amount by admission type
	SELECT Admission_Type , AVG(Billing_Amount) FROM healthcare GROUP BY Admission_Type;
    
-- Q34:Top 5 doctors by number of patients
	SELECT Doctor, COUNT(*) FROM healthcare GROUP BY Doctor ORDER BY COUNT(*) DESC LIMIT 5;
    
-- Q35:Medical condition with highest average billing
	SELECT Medical_Condition, AVG(Billing_Amount) FROM healthcare GROUP BY Medical_Condition 
	ORDER BY AVG(Billing_Amount) LIMIT 1;
    
-- Q36:Find patients with 'Normal' results and 'Asthma'
	SELECT * FROM healthcare WHERE Medical_Condition="Asthma" AND Test_Results="Normal";
    
-- Q37:Total billing by hospital:
	SELECT Hospital, SUM(billing_Amount) FROM healthcare GROUP BY Hospital;
    
-- Q38:Average age of patients per medical condition
	SELECT Medical_Condition, AVG(Age) FROM healthcare GROUP BY Medical_Condition;
    
-- Q39:Find patients with higher than average billing
	SELECT * FROM healthcare WHERE Billing_Amount>(SELECT AVG(Billing_AMOUNT) FROM healthcare);
    
-- Q40:Count female patients in each hospital
	SELECT Hospital,COUNT(*) FROM healthcare WHERE Gender="Female" GROUP BY Hospital;
    
-- Q41:Find patients with 'Inconclusive' results
	SELECT * FROM healthcare WHERE Test_Results="Inconclusive";
    
-- Q42:Average stay duration by admission type: 
	SELECT Admission_Type, AVG(DATEDIFF(day, DOA, DOD)) 
    FROM healthcare GROUP BY Admission_Type;
    
-- Q43:Find doctors treating 'Cancer': 
	SELECT Doctor FROM healthcare WHERE Medical_Condition="Cancer";
    
-- Q44:List patients with 'Aspirin' and 'Obesity': 
	SELECT * FROM healthcare WHERE Medical_Condition="Obesity" AND Medication="Aspirin";
    
-- Q45:Insurance providers with over 1000 patients
	SELECT Insurance_Provider, COUNT(*) FROM healthcare GROUP BY Insurance_Provider HAVING COUNT(*)>1000;
    
-- Q46:Find unique combinations of Blood Type and Gender
	SELECT DISTINCT Blood_Type , Gender FROM healthcare;
    
-- Q47:Total billing by insurance and condition
	SELECT Insurance_Provider,SUM(Billing_Amount), Medical_Condition 
	FROM healthcare group by Insurance_Provider, Medical_Condition;

-- Q48:Find patients discharged after 2024-03-01
	SELECT * FROM healthcare WHERE DOD>"2024-03-01";
    
-- Q49:Patients in room numbers > 300
	SELECT * FROM healthcare WHERE Room_Number>300;
    
-- Q50:Count of 'Abnormal' test results by doctor
	SELECT DISTINCT Doctor,COUNT(*) FROM healthcare 
	WHERE Test_Results="Abnormal" GROUP BY Doctor;

-- Q51:Average billing amount for Urgent cases
	SELECT AVG(Billing_Amount) AS AVG_BILL FROM healthcare WHERE Admission_Type="Urgent";
    
-- Q52:Identify duplicate patient names (potential issue)
	SELECT Name, COUNT(*) FROM healthcare GROUP BY Name HAVING COUNT(*)>1;
    
-- Q53:Find medication prescribed to patients > 70 years
	SELECT DISTINCT Medication FROM healthcare WHERE Age>70;
    
-- Q54:Find all patients who received 'Paracetamol'
	SELECT * FROM healthcare WHERE Medication="Paracetamol";
    
-- Q55:Count patients by blood type and gender
	SELECT COUNT(*),Gender,Blood_Type FROM healthcare GROUP BY Gender,Blood_Type;
    
-- Q56:Find hospitals with > 500 total billing
	SELECT DISTINCT Insurance_Provider FROM healthcare GROUP BY Insurance_Provider HAVING SUM(Billing_Amount)>500;
    
-- Q57:List doctors who treat Diabetes and Obesity:
	SELECT DISTINCT Doctor FROM healthcare WHERE Medical_Condition IN ("Diabetes", "Obesity");
    
-- 58:Patients with no medication (if applicable)
	SELECT * FROM healthcare WHERE Medication IS NULl;
	
-- 59:Count admissions by year-month
	SELECT LEFT(DOA,7) AS Month, COUNT(*) FROM healthcare GROUP BY Month;

-- 60:Highest billing patient for each medical condition
	SELECT Medical_Condition, MAX(Billing_Amount) FROM healthcare GROUP BY Medical_Condition ;
    
-- 61:Find top 3 insurance providers by average bill
	SELECT Insurance_Provider,AVG(Billing_Amount) FROM healthcare 
    GROUP BY Insurance_Provider ORDER BY AVG(Billing_Amount) desc LIMIT 3;

-- 62: Identify patients where Discharge Date < Admission Date
	SELECT * FROM healthcare WHERE DOD > DOA;
    
-- 63:Count patients treated with 'Penicillin' vs 'Aspirin'
	SELECT Medication,COUNT(*) FROM healthcare WHERE Medication IN("Penicilin", "Aspirin") 
	GROUP BY Medication;

-- 64: Average age of patients by test result
	SELECT DISTINCT Test_Results, AVG(Age) FROM healthcare GROUP BY Test_Results;

-- 65:Patients with 'Cancer' and B+ blood type
	SELECT * FROM healthcare WHERE Medical_Condition="Cancer" AND Blood_Type="B+";

-- 66:Find doctors working in 'General Hospital': 
	SELECT Doctor FROM healthcare WHERE Hospital="Cline-Williams";
    
-- 67:Count of admissions per room number
	SELECT Room_Number, COUNT(*) FROM healthcare GROUP BY Room_Number;

-- 68:List patients with 'Hypertension' and 'Normal' results
	SELECT * FROM healthcare WHERE Medical_Condition="Hypertension" AND Test_Results="Normal";

-- 69:Average bill for patients over 50
	SELECT AVG(Billing_Amount) FROM healthcare WHERE Age>50;

-- 70:Find total billing for Female patients in ICU (if Admission Type exists): 
	SELECT SUM(Billing_Amount) FROM healthcare 
    WHERE Gender = "Female"  AND Admission_Type = "Emergency";
    
-- 71:Count of patients with null discharge dates
	SELECT COUNT(*) FROM healthcare WHERE DOD IS NULL;
    
-- 72:List top 5 doctors by total bill amount
	SELECT Doctor, SUM(Billing_Amount) as TotalBill FROM healthcare 
	GROUP BY Doctor ORDER BY TotalBill DESC LIMIT 5; 
    
-- Advanced Queries (Case, Window Functions, Complex Analysis)

-- 73:Classify age groups by child, Adult and Senior
	SELECT Name,
		CASE 
		WHEN Age < 18 THEN "Child"
        WHEN Age BETWEEN 18 AND 60 THEN "Adult"
        ELSE "Senior" END AS AgeGroup 
        FROM healthcare;
        
-- 74Calculate average billing and identify if it is 'High' or 'Low'
	SELECT AVG(Billing_Amount) as AVGbill,
		CASE 
			WHEN AVG(Billing_Amount)> (SELECT AVG(Billing_Amount) FROM healthcare) THEN "HIGH"
            ELSE "LOW" END AS BillingStatus
            FROM healthcare;

-- 75:Rank patients by billing amount within each hospital
	SELECT Name, Hospital, Billing_Amount, RANK() 
	OVER(PARTITION BY Hospital ORDER BY Billing_Amount DESC)  FROM healthcare;
    
-- 76:Find the difference between patients billing and average billing of their condition
	SELECT Name, Medical_Condition, Billing_Amount-AVG(Billing_Amount) 
    OVER(PARTITION BY Medical_Condition )AS Diffrence
    FROM healthcare ;
    
-- 77P;Calculate the total billing amount
	SELECT ROUND(SUM(Billing_Amount),2) FROM healthcare;
    
-- 78:Calculate the average age of patients.
	SELECT AVG(Age) AS avg_age FROM healthcare;
    
-- 79:Count patients by gender.
	SELECT DISTINCT Gender, COUNT(*) FROM healthcare GROUP BY Gender;
    
-- 80: Identify the doctor with the highest number of patients.
	SELECT DOCTOR, COUNT(*) FROM healthcare GROUP BY Doctor ORDER BY COUNT(*) DESC LIMIT 1;

-- 81:Find the average age of patients per blood type.
	SELECT DISTINCT Blood_Type, AVG(Age) AVG_AGE FROM healthcare GROUP BY Blood_Type;

-- 82: Find the minimum age of patients with cancer.
	SELECT  MIN(Age) FROM healthcare WHERE  Medical_Condition="Cancer";
    
-- 83:Sum of billing amounts for "Diabetes" patients.
	SELECT ROUND(SUM(Billing_Amount),2) FROM healthcare WHERE Medical_Condition="Diabetes";

-- 84:Find the most common blood type in the dataset.
	select COUNT(*) , Blood_Type from healthcare GROUP BY Blood_Type order by Blood_Type DESC LIMIT 1;
    
-- 85:Average age of patients per hospital.
	SELECT Hospital, AVG(AGE) AS AVG_Age FROM healthcare GROUP BY Hospital;
    
-- 86:Count of each Test Result type per Medical Condition
	SELECT Medical_Condition,Test_Results, COUNT(*) FROM healthcare 
	GROUP BY Medical_Condition,Test_Results;
    
-- 87: Calculate the average billing amount for "Emergency" cases.
	SELECT ROUND(AVG(Billing_Amount),2), Admission_Type FROM healthcare WHERE Admission_Type="Emergency";
    
-- 88: Find the hospital with the highest average billing amount.
	SELECT Hospital, AVG(Billing_Amount) FROM healthcare 
    GROUP BY Hospital ORDER BY AVG(Billing_Amount) DESC LIMIT 1;
    
-- 89: List doctors with more than 50 patients.
	SELECT Doctor, COUNT(Name) FROM healthcare GROUP BY Doctor HAVING COUNT(Name) >=10;
    
-- 90 :Find the total billing amount for "Blue Cross" insurance.
	SELECT Insurance_Provider, ROUND(SUM(Billing_Amount),2) AS Total_amnt
	FROM healthcare WHERE Insurance_Provider="Blue Cross";

-- 91: Average billing amount per blood type.
	SELECT DISTINCT Blood_Type, AVG(Billing_Amount) FROM healthcare 
    GROUP BY Blood_Type;
    
-- 92:Identify the top 3 most common medical conditions.
	SELECT DISTINCT Medical_Condition,COUNT(Medical_Condition) 
    FROM healthcare GROUP BY Medical_Condition ORDER BY COUNT(Medical_Condition) DESC LIMIT 3;

-- 93 Find the youngest patient per hospital.
	SELECT DISTINCT Hospital, MIN(Age) FROM healthcare 
    GROUp BY Hospital;
    
-- 94:Total billing amount for "Urgent" cases in "Clark-Mayo".
	SELECT ROUND(SUM(Billing_Amount),2) AS total_amnt FROM healthcare
    WHERE Admission_Type="Urgent" AND Hospital="Clark-Mayo";
 
-- 95:Count patients treated by each doctor, ordered descending.
	SELECT DISTINCT Doctor, COUNT(Name) as Total FROM healthcare 
    GROUP BY Doctor ORDER BY COUNT(Name) DESC;
    
-- 96: Average age of patients with "Normal" results.
	SELECT AVG(Age) from healthcare where Test_Results="Normal";
	
-- 97:Find patients with 'Abnormal' tests in two or more conditions
	SELECT Name, COUNT(DISTINCT Medical_Condition) FROM healthcare 
    WHERE Test_Results="Abnormal" GROUP BY Name HAVING COUNT(DISTINCT Medical_Condition) >= 2;
    
-- 98:Count patients by decade of age:
	SELECT (Age/10)*10 AS Decade, COUNT(*) FROM healthcare GROUP BY Decade;

-- 99:Find percentage of female patients
	SELECT (SUM(CASE WHEN Gender = "Female" THEN 1 
			ELSE 0 END) * 100.0 / COUNT(*)) AS FPer 
    FROM healthcare;
    
-- 100:Find hospitals that have all 3 test result types ('Normal', 'Abnormal', 'Inconclusive')
	SELECT Hospital FROM healthcare GROUP BY Hospital HAVING COUNT(DISTINCT Test_Results) = 3;
 
-- 101:Calculate percentage of 'Emergency' vs 'Elective' vs 'Urgent':
	SELECT Admission_Type, COUNT(*) * 100.0 / SUM(COUNT(*)) 
	OVER() AS Percentage FROM healthcare GROUP BY Admission_Type;
 
-- 102:Find patients admitted on a weekend:
	SELECT * FROM healthcare WHERE DAYOFWEEK(DOA) IN (1, 7);

-- 103:Find the median billing amount (approximate)
	 SELECT ROUND(AVG(Billing_Amount),2) FROM (SELECT Billing_Amount,
	 ROW_NUMBER() OVER(ORDER BY Billing_Amount) as rn, COUNT(*) 
	 OVER() as total FROM healthcare) tmp WHERE rn BETWEEN total/2.0 AND total/2.0 + 1;
 
-- 104:Find patients with the same name (potential duplicates) and same admission date
	SELECT Name, DOA, COUNT(*) FROM healthcare GROUP BY Name,
	 DOA HAVING COUNT(*) > 1;
     
-- 105:Calculate average billing for patients who had an 'Abnormal' test vs 'Normal'
	SELECT Test_Results, AVG(Billing_Amount) FROM healthcare GROUP BY Test_Results;
    
-- 106: Find the month with the highest billing:
	 SELECT LEFT(DOA, 7) as Month, SUM(Billing_Amount) as TotalBill 
	 FROM healthcare GROUP BY Month ORDER BY TotalBill DESC LIMIT 1;

-- 107:Categorize billing as Low (<2k), Medium (2k-5k), High (>5k)
	 SELECT Name, Billing_Amount,
			CASE
				WHEN Billing_Amount < 20000 THEN "Low"
                WHEN Billing_Amount BETWEEN 20000 AND 50000 THEN "Medium"
                ELSE "High"
                END AS BillCategory FROM healthcare;
                
-- 108:Count patients per Gender, divided by Insurance Provider:
		SELECT DISTINCT Gender, Insurance_Provider, COUNT(*) 
		FROM healthcare GROUP BY Gender, Insurance_Provider;

-- 109:Identify if 'Cancer' patients have higher average bills than 'Diabetes' patients: 
	SELECT Medical_Condition, AVG(Billing_Amount)
	 FROM healthcare WHERE Medical_Condition IN ("Cancer", "Diabetes") GROUP BY Medical_Condition;
 
-- 110:Find the top 5 most common medications:
	SELECT Medication, COUNT(*) FROM healthcare GROUP BY Medication ORDER BY COUNT(*) DESC LIMIT 5;

-- 111:Find the average age of patients in each hospital for 'Emergency' type
	SELECT Hospital, AVG(Age) FROM healthcare WHERE Admission_Type= "Emergency" GROUP BY Hospital; 

-- 112: Highest billing amount for "Elective" admission.
	SELECT MAX(Billing_Amount) AS MAX_BILL FROM healthcare WHERE Admission_Type="Elective";
    
-- 113: Count of patients taking "Lipitor".
	SELECT COUNT(*) FROM healthcare WHERE Medication="Lipitor";
    
-- 114: Find the most common medication prescribed.
	SELECT Medication, COUNT(*) FROM HEALTHCARE GROUP BY Medication ORDER BY count(*) limit 1;

-- 115Find rows with missing Gender information. 
	SELECT * FROM healthcare WHERE Gender IS NULL;
    
-- 116 Total patients with "Abnormal" test results.
	SELECT COUNT(*) AS Total FROM healthcare  WHERE Test_Results="Abnormal";

-- 117 Find the doctor with the lowest average billing amount.
	SELECT Doctor, AVG(Billing_Amount) FROM healthcare GROUP BY Doctor ORDER BY AVG(Billing_Amount) limit 1; 
    
-- 118  Count patients with blood type AB+.
	SELECT COUNt(*) FROM healthcare WHERE Blood_Type="AB+";

-- 119 Total billing for "UnitedHealthcare" and "Wallace-Hamilton" hospital.
	SELECT COUNT(*) FROM healthcare WHERE Hospital IN("Jones LLC","Wilson Group");

-- 120  Find the hospital with the most "Emergency" cases.
	SELECT Hospital, COUNT(*) AS TOTAL FROM healthcare WHERE Admission_Type="Emergency" GROUP BY Hospital Order by COUNT(*) DESC LIMIT 1;
	
-- 121 Count patients whose name ends in 's'.
	SELECT COUNT(*) FROM healthcare WHERE Name LIKE "%s";

-- 122 Count of patients with arthritis.
	SELECT COUNT(*) FROM healthcare WHERE Medical_Condition="Arthritis";

-- 123 Max age of patients with normal results.
	SELECT MAX(Age) FROM healthcare WHERE Test_Results="Normal";
    
-- 124 Min bill amount for "Aetna" patients.
	SELECT MIN(Billing_Amount) FROM healthcare WHERE Insurance_Provider="Aetna";

-- 125 Count of patients by hospital, sorted descending.
	SELECT Hospital, COUNT(*) FROM healthcare GROUP BY Hospital ORDER BY COUNT(*) DESC;
    
-- 126 Count patients in room 300-400.
	SELECT COUNT(*) FROM healthcare WHERE Room_Number BETWEEN 300 AND 400;

-- 127 Total billed in 2022.
	SELECT COUNT(*) FROM Healthcare WHERE DOA=2022;

-- 128 Find doctors with "Abnormal" results > 1.
	SELECT COUNT(*) , Doctor FROM healthcare WHERE Test_Results="Abnormal" GROUP BY Doctor HAVING COUNT(*)>1 ;
    
-- 129 Average bill for each admission type.
	SELECT Admission_Type, AVG(Billing_Amount) FROM healthcare GROUP BY Admission_Type;
    
-- 130 Highest number of patients in a single hospital.
	SELECT COUNT(*) , Hospital FROM healthcare GROUP BY Hospital ORDER BY COUNT(*) DESC LIMIT 1;
    
-- 131 Find the 2nd highest billing amount.
	SELECT Billing_Amount FROM healthcare ORDER BY Billing_Amount DESC limit 1 Offset 1;
    
-- 132 Create a report showing: Doctor, Total Patients, Total Billing.
	SELECT DISTINCT Doctor, COUNT(*) AS TOtal_PT, ROUND(SUM(Billing_Amount),2) AS Total_Bill
    FROM healthcare GROUP BY Doctor;

-- 133: Find the most common condition for patients over 60.
		SELECT Medical_Condition, COUNT(Medical_Condition) FROM healthcare
        WHERE Age>60 GROUP BY Medical_Condition ORDER BY COUNT(Medical_Condition) desc limit 1;
        
-- 134: Find doctors who treat at least 3 different conditions.
	SELECT Doctor, COUNT(Medical_Condition) FROM healthcare GROUP BY Doctor HAVING COUNT(Medical_Condition)>=3;

-- 135: Find patients who were admitted and discharged on the same day.
	SELECT * FROM healthcare WHERE DOA=DOD;
    
-- 136: Identify patients with "Aspirin" and a bill > $40,00.
	SELECT * FROM healthcare WHERE Medication="Aspirin" AND Billing_Amount>4000;
	
-- 137: Find doctors who have only "Normal" test results for their patients.
	SELECT DISTINCT Doctor FROM healthcare WHERE Test_Results="Normal";
    
-- 138 Calculate the total bill for patients with blood type O-, O+, A-, A+.
	SELECT ROUND(SUM(Billing_Amount),2) FROM healthcare WHERE Blood_Type IN("O-","O+","A-","A+");

-- 139:Find the doctor with the highest number of, and lowest average bill for, patients.
	SELECT Doctor, COUNT(*) AS Total_pt, AVG(Billing_Amount) AVG_Bill FROM healthcare 
    GROUP BY Doctor ORDER BY  COUNT(*) DESC,AVG(Billing_Amount);

-- 140: Find the most common insurance provider for each age group.
	SELECT DISTINCT Age  , COUNT(Insurance_Provider),Insurance_Provider FROM healthcare
    GROUP BY Age, Insurance_Provider ORDER BY COUNT(Insurance_Provider) DESC;
	
-- 141 Calculate the percentage of total billing for each hospital.
	SELECT COUNT(*)*100.0/ SUM(Billing_Amount) AS Percentage , Hospital FROM healthcare GROUP BY Hospital;
    
-- 142: Find patients with missing Test Results.
	SELECT * FROM healthcare WHERE Test_Results IS NULL;

-- 143: Find patients whose name contains 'Li'.
	SELECT * FROM healthcare WHERE NAME LIKE "%li%";
    
-- 144: Find patients with a billing amount between $4k and $6k.
	SELECT * FROM healthcare WHERE Billing_Amount BETWEEN 4000 AND 6000;
    
-- 145: Find the most common "Test_Results" for "Cancer" patients.
	SELECT  COUNT(Test_Results) , Test_Results FROM healthcare
    WHERE Medical_Condition="Cancer" GROUP BY Test_Results ORDER BY COUNT(Test_Results) DESC limit 1;
	
-- 146: Count patients by insurance provider and test result.
	SELECT COUNT(*) Total_pt, Insurance_Provider, Test_Results FROM healthcare
    GROUP BY Insurance_Provider,Test_Results;
    
-- 147: Identify the top 10 most common combinations of condition and medication.
	SELECT DISTINCT Medical_Condition, Medication FROM healthcare LIMIT 10;
    
-- 148: Find the average bill for each unique medication.
	SELECT DISTINCT Medication, AVG(Billing_Amount) AVG_Bill FROM healthcare GROUP BY Medication;
    
-- 149:Calculate the average bill per room number.
		SELECT DISTINCT Room_Number, AVG(Billing_Amount) AVG_Bill FROM healthcare GROUP BY Room_Number;

-- 150: Find patients who had a "Normal" test, yet "Emergency" admission.
		SELECT * FROm healthcare WHERE Test_Results="Normal" AND Admission_Type="Emergency";
        
-- 151: List the top 5 most common blood types for female patients.
		SELECT COUNT(Blood_Type), Blood_Type FROM healthcare WHERE Gender="Female"
        GROUP BY Blood_Type ORDER BY COUNT(Blood_Type) DESC LIMIT 5;

-- 152 Find the number of patients with "Cancer" in each hospital.
	SELECT Hospital,COUNT(*) FROM healthcare  WHERE Medical_Condition="Cancer" GROUP BY Hospital;
	
-- 153: Identify rows with a negative billing amount.
	SELECT * FROM healthcare WHERE Billing_Amount <0;
    
-- 154: Count how many times each doctors name appears (to check for typos).
	SELECT Doctor, COUNT(*) FROM healthcare GROUP BY Doctor ORDER BY COUNT(*) DESC;

-- 155: Find patients with an invalid blood type (e.g., not A, B, AB, O).
	SELECT * FROM healthcare WHERE Blood_Type NOT IN("A-","A+","B-","B+","AB-","AB+","O-","O+");

-- 156: Find patients with missing Test Results.
	SELECT * from healthcare WHERE Test_Results IS NULL;
	
-- 157 Count occurrences of "Unknown" or "Other" in the Insurance Provider column.
	SELECT * FROM healthcare WHERE Insurance_Provider IN("Unknown", "Other");
    
-- 158: List rows where the Room Number is 0 or negative.
	SELECT * FROm healthcare WHERE Room_Number=0 OR Room_Number<0;
    
-- 159: List patients where Test Results are not ('Normal', 'Abnormal', 'Inconclusive').
	SELECT * FROM healthcare WHERE Test_Results NOT IN("Normal","Abnormal","Inconclusive");
    
-- 160: Find duplicate entries (same name, same admission date).
	SELECT NAME, DOA, COUNT(*) FROM healthcare GROUP BY NAME,DOA HAVING COUNT(*)>1;
    
-- 161: Find missing or null hospital names.
	SELECT * FROM healthcare WHERE Hospital IS NULL;

-- 162:Check for potential data entry errors in Billing Amount (e.g., 0.00).
	SELECT * FROM healthcare WHERE Billing_Amount=0;
    
-- 163: List rows where the doctors name is just an initial.
	SELECT * FROM healthcare WHERE Name LIKE "_";
	
-- 164: Count cases where the medication is listed as "None".
	SELECT * FROM healthcare WHERE Medication="None";
    
-- 165: Find rows with missing Gender information. 
	SELECT * FROM healthcare WHERE Gender IS NULL;
    
-- 166:Find patients who have the same condition as 'John Doe'.
	SELECT * FROM healthcare
    WHERE Medical_Condition=(SELECT Medical_Condition 
		FROM healthcare WHERE Name="Leslie Terry");
	
-- 167:List patients whose billing amount is higher than the average billing amount.
	SELECT * FROM healthcare WHERE Billing_Amount>(SELECT AVG(Billing_Amount) FROM healthcare);

-- 168:Find patients admitted to the same hospital as 'Leslie Terry'
	SELECT * FROM healthcare WHERE Hospital=(SELECT Hospital FROm healthcare
    WHERE Name="Leslie Terry");
    
-- 169:   Identify the highest billing amount for each medical condition.
	SELECT Name,Medical_Condition, Billing_Amount FROM healthcare h1
    WHERE Billing_Amount=(SELECT MAX(Billing_Amount) FROM healthcare h2
    WHERE h1.Medical_Condition=h2.Medical_Condition);
    
-- 170:List all patients treated by doctors who work at 'Cline-WIlliams'.
	SELECT * FROM healthcare WHERE Doctor=(SELECT Doctor 
    FROM healthcare WHERE Hospital="Cline-WIlliams");

-- 171:Find patients with 'Normal' test results who have the same insurance 
	-- provider as 'Bobby Jackson'.
    SELECT * FROm healthcare WHERE Test_Results="Normal" AND Insurance_Provider=
    (SELECT Insurance_Provider FROM healthcare WHERE Name="Bobby Jackson");
 
-- 172:Identify patients who were admitted on the earliest date in the dataset.
	SELECT Name, DOA FROM healthcare WHERE DOA = (SELECT MIN(DOA) FROM healthcare);

-- 173:List patients whose age is greater than the average age of all patients.
	SELECT Name, Age FROM healthcare WHERE Age > (SELECT AVG(Age) FROM healthcare);

-- 174:Find the medication prescribed for patients who have 'Diabetes'.
	SELECT DISTINCT Medication FROM healthcare WHERE Medical_Condition = "Diabetes";

-- 175:Find all patients who had an 'Emergency' admission type with a 'Normal' test result.
	SELECT Name,Test_Results FROM healthcare WHERE Admission_Type = "Emergency"
    AND Test_Results="Normal";
    
-- 176:Find the doctors who have treated more than 100 patients.
	SELECT Doctor, COUNT(Name) AS cnt_pt FROM healthcare GROUP BY Doctor
    HAVING COUNT(Name) > 100;
    
-- 177:List patients with an insurance provider that covers 'Medicare'.
		SELECT Name, Insurance_Provider FROM healthcare
		WHERE Insurance_Provider = "Medicare";
        
-- 178:Find the most common blood type in the dataset.
SELECT Blood_Type FROM healthcare GROUP BY Blood_Type ORDER BY COUNT(*) DESC LIMIT 1;

-- 179:Identify patients who have both 'Arthritis' and 'UnitedHealthcare' insurance.
SELECT Name FROM healthcare WHERE Medical_Condition= "Arthritis" AND Insurance_Provider = "UnitedHealthcare";

-- 180:Find the average age of patients by medical condition.
SELECT Medical_Condition , AVG(Age) FROM healthcare GROUP BY Medical_Condition;

-- 181:List patients with a 'Billing Amount' higher than the average 'Billing Amount' 
-- for their specific 'Medical Condition'.
	SELECT h1.Name, h1.Medical_Condition, h1.Billing_Amount FROM healthcare h1
	WHERE h1.Billing_Amount > (SELECT AVG(h2.Billing_Amount) FROM healthcare h2
	 WHERE h2.Medical_Condition = h1.Medical_Condition);
 
-- 182:Find the total billing amount for each hospital.
	SELECT Hospital, SUM(Billing_Amount) AS Total_bill FROM healthcare
    GROUP BY Hospital;

-- 184:Find the top 5 hospitals with the highest average billing amount.
	SELECT Hospital, AVG(Billing_Amount) AS AvgBill FROM healthcare
    GROUP BY Hospital ORDER BY AvgBill DESC LIMIT 5; 
    
-- 185:Find pairs of patients admitted to the same hospital on the same day.
	SELECT h1.Name, h2.Name, h1.Hospital, h1.DOA FROM healthcare h1 
    JOIN healthcare h2 ON h1.Hospital = h2.Hospital 
    AND h1.DOA = h2.DOA AND h1.Name < h2.Name;

-- 186:Identify patients who have the same 'Medical Condition' and 'Blood Type'.
	SELECT h1.Name, h2.Name, h1.Medical_Condition, h1.Blood_Type FROM healthcare h1 
	JOIN healthcare h2 ON h1.Medical_Condition = h2.Medical_Condition 
	AND h1.Blood_Type = h2.Blood_Type AND h1.Name < h2.Name;

-- 187:Find patients who were in the same room but at different times.
	SELECT h1.Name, h2.Name, h1.Room_number, h1.DOA, h2.DOA FROM healthcare h1 
	JOIN healthcare h2 ON h1.Room_number = h2.Room_number
	 AND h1.DOA <> h2.DOA AND h1.Name < h2.Name;

-- 189 Find doctors who treated patients with the same medical condition.
	SELECT h1.Doctor, h2.Doctor, h1.Medical_Condition FROM healthcare h1
    JOIN healthcare h2 ON h1.Medical_Condition=h2.Medical_Condition 
    AND h1.Doctor > h2.Doctor;
	
-- 190:List patients with the same name (suggesting potential data duplication) but different admission dates.
	SELECT h1.Name, h2.Name,h1.DOA ,h2.DOA FROM healthcare h1
    join healthcare h2 on h1.Name=h2.Name AND 
    h1.DOA <> h2.DOA;

-- 191:Find patients with the same insurance provider and same admission type.
	SELECT h1.Name, h2.Name, h1.Insurance_Provider, h1.Admission_Type
	 FROM healthcare h1 JOIN healthcare h2 ON h1.Insurance_Provider = h2.Insurance_Provider
	 AND h1.Admission_Type = h2.Admission_Type AND h1.Name < h2.Name;
 
-- 192:Identify pairs of patients where one patients billing amount is double the other.
	SELECT h1.Name, h1.Billing_Amount, h2.Name, h2.Billing_Amount 
	FROM healthcare h1 JOIN healthcare_dataset h2 ON h1.Billing_Amount >= (h2Billing_Amount * 2)
	 AND h1.Name <> h2.Name;

-- 193:Find patients with the same blood type and age.
	SELECT h1.Name, h2.Name, h1.Blood_Type ,h1.Age FROM healthcare h1
	 JOIN healthcare_dataset h2 ON h1.Blood_Type = h2.Blood_Type AND 
	 h1.Age = h2.Age AND h1.Name < h2.Name;

-- 194:Find doctors who work at the same hospital.
	SELECT DISTINCT h1.Doctor, h2.Doctor, h1.Hospital FROM healthcare h1
	 JOIN healthcare h2 ON h1.Hospital = h2.Hospital AND h1.Doctor < h2.Doctor;

-- 195:Find patients who have the same medication prescribed.
	SELECT h1.Name, h2.Name, h1.Medication FROM healthcare h1 JOIN healthcare h2
	 ON h1.Medication = h2.Medication AND h1.Name < h2.Name;
 
-- 196:Identify patients who were discharged on the same day.
	SELECT h1.Name, h2.Name, h1.DOD FROM healthcare h1 
	JOIN healthcare h2 ON h1.DOD = h2.DOD AND h1.Name < h2.Name;

-- 197:Find patients who have the same condition and were treated by different doctors.
	SELECT h1.Name, h2.Name, h1.Medical_Condition, h1.Doctor, h2.Doctor
	 FROM healthcaret h1 JOIN healthcare h2 ON h1.Medical_Condition = h2.Medical_Condition
	 AND h1.Doctor <> h2.Doctor AND h1.Name < h2.Name;

-- 198:Identify patients with the same insurance provider and same blood type.
	SELECT h1.Name, h2.Name, h1.Insurance_Provider, h1.Blood_Type FROM healthcare h1 
	JOIN healthcare h2 ON h1.Insurance_Provider= h2.Insurance_Provider 
	AND h1.Blood_Type = h2.Blood_Type AND h1.Name < h2.Name;

-- 199 199Find patients who had the same test results and same condition.
	SELECT h1.Name, h2.Name, h1.Test_Results, h1.M FROM healthcare h1 
	JOIN healthcare h2 ON h1.Test_Results = h2.Test_Results
	 AND h1.Medical_Condition = h2.Medical_Condition AND h1.Name < h2.Name;

--  200:Find pairs of patients with similar billing amounts (within 100 of each other).
	SELECT h1.Name, h1.Billing_Amount, h2.Name, h2.Billing_Amount FROM healthcare h1 
	JOIN healthcare h2 ON ABS(h1.Billing_Amount - h2.Billing_Amount) < 100 AND h1.Name < h2.Name;
