-- Dataset:Table 1: cancer_by_country
-- 		   Table 2:cancer_risk_factor
-- 	   	   Table 3:cancer_survival_by_stage

Create Database BreastCancer_Data;
USE BreastCancer_Data;

-- 1:Display Records For all tables in database
 SELECT * FROM cancer_by_country;
 SELECT * FROM cancer_risk_Factors;
 SELECT * FROM cancer_survival_by_Stage;

-- 2:List all countries: 
	SELECT Country FROM cancer_by_country;

-- 3:Show all modifiable risk factors: 
	SELECT Risk_Factor FROM cancer_risk_factors WHERE Modifiable = "TRUE";

-- 4:Find stages with 10-year survival > 50%: 
	SELECT Stage FROM cancer_survival_by_stage WHERE Ten_Year_Survival_Pct > 50;

-- 5:Retrieve unique continents: 
	SELECT DISTINCT Continent FROM cancer_by_country;
    
-- 6:Get countries with New_Cases_2022 over 10,000:
	SELECT Country FROM cancer_by_country WHERE New_Cases_2022 > 10000;
 
-- 7:List risk factors in the 'Lifestyle' category: 
	SELECT Risk_Factor FROM cancer_risk_factors WHERE Category = "Lifestyle";
    
-- 8:Find countries where Continet is 'Americas':
	 SELECT Country FROM cancer_by_country WHERE Continent = "Americas";
 
-- 9:Show stage and typical treatment for Low-Income regions: 
	SELECT Stage, Typical_Treatment FROM cancer_survival_by_stage WHERE Income_Region = "Low-Income";
    
-- 10:Find countries with mortality rate < 10:
	SELECT Country FROM cancer_by_country WHERE Mortality_Rate_Per_100K < 10;
    
-- 11:Retrieve records where Population_M is between 5 and 50:
	SELECT * FROM cancer_by_country WHERE Population_M BETWEEN 5 AND 50;
    
-- 12: Countries in Asia with over 5,000 cases: 
	SELECT * FROM cancer_by_country WHERE Continent = "ASIA" AND New_Cases_2022 > 5000;
    
-- 13:Countries with mortality rate between 10 and 20:
	SELECT Country FROM cancer_by_country WHERE Mortality_Rate_Per_100K BETWEEN 10 AND 20;
    
-- 14:High treatment access in Europe or Americas: 
	SELECT Country FROM cancer_by_country WHERE (Continent = "Europe" OR Continent = "Americas") 
	AND Treatment_Access_Score > 80;

-- 15:Countries with population between 10M and 100M:
	SELECT Country FROM cancer_by_country WHERE Population_M BETWEEN 10 AND 100;
    
-- 16:Low coverage (<30%) and high mortality (>25):
 SELECT Country FROM cancer_by_country WHERE Mammography_Coverage_Pct < 30 AND Mortality_Rate_Per_100K > 5;
 
-- 17:Extreme cases OR high deaths:
 SELECT Country FROM cancer_by_country WHERE New_Cases_2022 > 100000 OR Deaths_2022 > 20000;
 
-- 18:Early detection (Stage I/II) between 60% and 80%:
	SELECT Country FROM cancer_by_country WHERE Stage_I_II_Pct BETWEEN 60 AND 80;
    
-- 19:Specific records for India or Brazil: 
	SELECT * FROM cancer_by_country WHERE Country IN ("India", "Brazil");
    
-- 20:African countries with incidence between 20 and 50:
	SELECT Country FROM cancer_by_country WHERE Continent = "Africa"
    AND Incidence_Rate_Per_100K BETWEEN 20 AND 50;
    
-- 21:Low access AND low survival (<40%): 
	SELECT Country FROM cancer_by_country WHERE Treatment_Access_Score < 50 AND Five_Year_Survival_Pct < 40;
    
-- 22:Regional  with >50% coverage:
	SELECT Country FROM cancer_by_country WHERE Mammography_Coverage_Pct > 50;
 
-- 23:Small population Oceania countries (<5M):
	 SELECT Country FROM cancer_by_country WHERE Continent = "Oceania" AND Population_M < 20;
 
-- 24:High mortality OR very low survival (<30%):
	SELECT Country FROM cancer_by_country WHERE Mortality_Rate_Per_100K > 30 OR Five_Year_Survival_Pct < 30;
 
-- 25:Countries with survival between 85% and 100%:
 SELECT Country FROM cancer_by_country WHERE Five_Year_Survival_Pct BETWEEN 85 AND 100;
 
-- 26:South-East Asia with >1000 deaths:
	SELECT Country FROM cancer_by_country WHERE Region = "Southeast Asia" AND Deaths_2022 > 1000;
    
-- 27:Countries witht some coverage: 
	SELECT Country FROM cancer_by_country WHERE Mammography_Coverage_Pct > 0;

-- 28:Huge population OR perfect access score:
	 SELECT Country FROM cancer_by_country WHERE Population_M > 200 OR Treatment_Access_Score = 100;
     
-- 29:Incidence rate between 80 and 120: 
	SELECT Country FROM cancer_by_country WHERE Incidence_Rate_Per_100K BETWEEN 80 AND 120;

-- 30: East countries where incidence > mortality: 
	SELECT Country FROM cancer_by_country WHERE Region = "East Asia"
    AND Incidence_Rate_Per_100K > Mortality_Rate_Per_100K;
    
-- 31:Mid-sized population :
	SELECT Country FROM cancer_by_country WHERE (Population_M BETWEEN 1 AND 10) ;
    
-- 32:Countries with deaths between 500 and 1500:
	 SELECT Country FROM cancer_by_country WHERE Deaths_2022 BETWEEN 500 AND 1500;
     
-- 33:Specific mortality rates of 11.6, 15.8 and 16.5:
	SELECT Country FROM cancer_by_country WHERE Mortality_Rate_Per_100K IN (11.6, 15.8, 16.5);
    
-- 34:Countries with critical Stage I/II detection (<20%): 
	SELECT Country FROM cancer_by_country WHERE Stage_I_II_Pct < 20;
    
-- 35:Extremely low treatment access (0–25):
	 SELECT Country FROM cancer_by_country WHERE Treatment_Access_Score BETWEEN 0 AND 25; 

-- 36:Modifiable lifestyle factors:
 SELECT Risk_Factor FROM cancer_risk_factors WHERE Modifiable = "TRUE" AND Category = "Lifestyle";
 
-- 37:Relative Risk between 1.5 and 3.0: 
	SELECT Risk_Factor FROM cancer_risk_factors WHERE Relative_Risk BETWEEN 1.5 AND 3.0;
    
-- 38:High attributable fraction OR high RR: 
	SELECT Risk_Factor FROM cancer_risk_factors WHERE Population_Attributable_Fraction_Pct > 10 OR Relative_Risk > 2;
    
-- 39:Non-modifiable factors with Level 1 evidence: 
	SELECT Risk_Factor FROM cancer_risk_factors WHERE Modifiable = "FALSE" AND Evidence_Level = "Strong";

-- 40:Unchangeable categories: 
		SELECT Risk_Factor FROM cancer_risk_factors WHERE Category = "Unchangeable";
        
-- 41:Attributable fraction between 5% and 15%:
	SELECT Risk_Factor FROM cancer_risk_factors WHERE Population_Attributable_Fraction_Pct BETWEEN 5 AND 15;
    
-- 42:Relative Risk outside the 1.0–1.2 range:
	SELECT Risk_Factor FROM cancer_risk_factors WHERE Relative_Risk NOT BETWEEN 1.0 AND 1.2;
    
-- 43:Non-modifiable reproductive factors: 
	SELECT Risk_Factor FROM cancer_risk_factors WHERE Category = "Lifestyle" AND Modifiable = "TRUE";
    
-- 44:Evidence Level Modrate: 
		SELECT Risk_Factor FROM cancer_risk_factors WHERE Evidence_Level = "Moderate";

-- 45:Impactful modifiable factors (>5% fraction):

-- 46:Extreme Relative Risk (>5.0): 
SELECT Risk_Factor FROM cancer_risk_factors WHERE Relative_Risk > 5.0;

-- 47:Alcohol Consumption in Lifestyle category:
	 SELECT Risk_Factor FROM cancer_risk_factors WHERE Category = "Lifestyle" 
	 AND Risk_Factor = "Alcohol Consumption";
     
-- 48:Level 1 evidence with RR between 1.1 and 2.0: 
	SELECT Risk_Factor FROM cancer_risk_factors WHERE Evidence_Level = "Strong" 
	AND Relative_Risk BETWEEN 1.1 AND 2.0;
    
-- 49:Diet OR Physical Activity factors: 
	SELECT Risk_Factor FROM cancer_risk_factors WHERE Category = "Diet" OR Category = "Physical Activity";

-- 50:High-risk non-modifiable factors (RR > 1.5):
	SELECT Risk_Factor FROM cancer_risk_factors WHERE Modifiable = "FALSE" AND Relative_Risk > 1.5;

-- 51:Stage IV in High-Income regions:
	SELECT * FROM cancer_survival_by_stage WHERE Stage = "Stage IV" AND Income_Region = 'High-Income';
    
-- 52:Stages with 5-year survival between 70% and 90%:
	SELECT Stage FROM cancer_survival_by_stage WHERE Five_Year_Survival_Pct BETWEEN 70 AND 90;
    
-- 53:High 1-year but low 10-year survival:
	SELECT Stage FROM cancer_survival_by_stage WHERE One_Year_Survival_Pct > 95 AND Ten_Year_Survival_Pct < 50;
-- 54:Lower-income region data:
	SELECT * FROM cancer_survival_by_stage WHERE Income_Region = "Low-Income" OR Income_Region = "Lower-Middle-Incom";
    
-- 55:Diagnosis percentage between 5% and 15%:
 SELECT * FROM cancer_survival_by_stage WHERE Pct_Diagnosed_At_Stage BETWEEN 5 AND 15;
 
-- 56:Stage I survival disparities (<90%):
	 SELECT * FROM cancer_survival_by_stage WHERE Stage = "Stage I" AND Five_Year_Survival_Pct < 90;
 
-- 57:Treatments for high long-term survival (>80%): 
	SELECT Typical_Treatment FROM cancer_survival_by_stage WHERE Ten_Year_Survival_Pct > 80;
-- 58:Stages with 1-year survival between 40% and 60%:
	SELECT Stage FROM cancer_survival_by_stage WHERE One_Year_Survival_Pct BETWEEN 40 AND 60;
    
-- 59:High-Income immunotherapy treatments:
	SELECT * FROM cancer_survival_by_stage WHERE Income_Region = "High-Income" AND Typical_Treatment LIKE "%Immunotherapy%";
    
-- 60:High diagnosis rate OR critical survival: 
	SELECT * FROM cancer_survival_by_stage WHERE Pct_Diagnosed_At_Stage > 40 OR Five_Year_Survival_Pct < 20;

-- 61:Countries starting with 'A': 
	SELECT Country FROM cancer_by_country WHERE Country LIKE "A%";
    
-- 62:Risk factors containing 'Diet': 
	SELECT Risk_Factor FROM cancer_risk_factors WHERE Risk_Factor LIKE "%Diet%";
    
-- 63:Treatments mentioning 'Surgery':
	SELECT * FROM cancer_survival_by_stage WHERE Typical_Treatment LIKE "%Surgery%";
    
-- 64:Continents ending in 'a': 
	SELECT DISTINCT Continent FROM cancer_by_country WHERE Continent LIKE "%a";
    
-- 65:Countries with 'o' as the second letter: 
	SELECT Country FROM cancer_by_country WHERE Country LIKE "_o%"; 

-- 66:Total new cases globally: 
	SELECT SUM(New_Cases_2022) FROM cancer_by_country;
    
-- 67:Average mortality rate by continent: 
	SELECT Continent, AVG(Mortality_Rate_Per_100K) FROM cancer_by_country GROUP BY Continent;
    
-- 68:Max survival rate for Stage I:
	SELECT MAX(Five_Year_Survival_Pct) FROM cancer_survival_by_stage WHERE Stage = "Stage I";

-- 69:Count of risk factors per category:
	SELECT Category, COUNT(*) FROM cancer_risk_factors GROUP BY Category;
    
-- 70:Countries with average treatment score > 70: 
	SELECT Region, AVG(Treatment_Access_Score) FROM cancer_by_country 
    GROUP BY Region HAVING AVG(Treatment_Access_Score) > 70;
    
-- 71:Total deaths in the 'Asia' continent: 
	SELECT SUM(Deaths_2022) FROM cancer_by_country WHERE Continent = "Asia";
    
-- 72:Min mammography coverage recorded:
	SELECT MIN(Mammography_Coverage_Pct) FROM cancer_by_country;

-- 73:Total population per region: 
	SELECT Region, SUM(Population_M) FROM cancer_by_country GROUP BY Region;
    
-- 74:Average incidence rate for countries :
	SELECT AVG(Incidence_Rate_Per_100K) FROM cancer_by_country ;
    
-- 75:Count of modifiable vs. non-modifiable factors:
 SELECT Modifiable, COUNT(*) FROM cancer_risk_factors GROUP BY Modifiable; 

-- 76:Countries with incidence rate above global average: 
	SELECT Country FROM cancer_by_country WHERE Incidence_Rate_Per_100K > (SELECT AVG(Incidence_Rate_Per_100K)
	 FROM cancer_by_country);
	 
-- 77:Stages with survival higher than Stage III average: 
SELECT Stage FROM cancer_survival_by_stage WHERE Five_Year_Survival_Pct > (SELECT AVG(Five_Year_Survival_Pct)
 FROM cancer_survival_by_stage WHERE Stage = 'Stage III');

-- 78:Risk factors with Evidence_Level higher than Early Menarche (<12): 
	SELECT Risk_Factor FROM cancer_risk_factors WHERE Evidence_Level > (SELECT Evidence_Level FROM cancer_risk_factors 
	WHERE Risk_Factor = "Early Menarche (<12)");

-- 79:Find the country with the highest deaths: 
	SELECT Country FROM cancer_by_country WHERE Deaths_2022 = (SELECT MAX(Deaths_2022) FROM cancer_by_country);
    
-- 80:List countries in regions that have a Treatment_Access_Score average > 80: 
	SELECT Country FROM cancer_by_country WHERE Region IN (SELECT Region FROM cancer_by_country 
    GROUP BY Region HAVING AVG(Treatment_Access_Score) > 80); 

-- 81:Categorize survival rates: 
	SELECT Stage, 
    CASE
		WHEN Five_Year_Survival_Pct > 80 THEN "High" 
		WHEN Five_Year_Survival_Pct > 50 THEN "Medium" 
        ELSE "Low" END AS Survival_Category
        FROM cancer_survival_by_stage;
        
-- 82:Label modifiable factors as 'Priority':
 SELECT Risk_Factor,	
	CASE
		WHEN Modifiable = "Yes" THEN "Actionable" 
	ELSE "Observational" END AS Type
    FROM cancer_risk_factors;
    
-- 83:Identify countries by access level: 
	SELECT Country, 	
		CASE
			WHEN Treatment_Access_Score >= 75 THEN "Tier 1"
		ELSE 'Tier 2' END AS Access_Tier FROM cancer_by_country;
        
-- 84:Relate country screening to survival (Conceptual Join): 
	SELECT c.Country, s.Five_Year_Survival_Pct FROM cancer_by_country c 
	JOIN cancer_survival_by_stage s ON c.Continent = s.Income_Region;  

-- 85:Total cases by Access Tier: 
	SELECT SUM(CASE WHEN Treatment_Access_Score >= 80 THEN New_Cases_2022 ELSE 0 END)
	 AS High_Access_Cases, SUM(CASE WHEN Treatment_Access_Score < 80 THEN New_Cases_2022 ELSE 0 END) 
	 AS Low_Access_Cases FROM cancer_by_country;
     
-- 86:Count of countries by screening type: 
	SELECT SUM(CASE WHEN Screening_Program = "National" THEN 1 ELSE 0 END) AS National_Count,
    SUM(CASE WHEN Screening_Program = "Regional" THEN 1 ELSE 0 END) AS Regional_Count FROM cancer_by_country;
    
-- 87:Total deaths in high-population countries (>50M):
	SELECT SUM(CASE WHEN Population_M > 50 THEN Deaths_2022 ELSE 0 END) AS Large_Country_Deaths 
    FROM cancer_by_country;
    
-- 88:Sum of cases in the Americas vs. Others:
	SELECT SUM(CASE WHEN Continent = "Americas" THEN New_Cases_2022 ELSE 0 END) AS Americas_Total, 
    SUM(CASE WHEN Continent != "Americas" THEN New_Cases_2022 ELSE 0 END) AS Rest_of_World FROM cancer_by_country;
    
-- 89:Average survival score category:
	SELECT AVG(CASE WHEN Five_Year_Survival_Pct > 70 THEN 1 ELSE 0 END) * 100 AS Pct_High_Survival_Countries
    FROM cancer_by_country;
    
-- 90:Total population in modifiable vs non-modifiable risk categories (Count): 
	SELECT SUM(CASE WHEN Modifiable = "TRUE" THEN 1 ELSE 0 END) AS Modifiable_Count FROM cancer_risk_factors;

-- 91:Rank countries by New_Cases per continent: 
	SELECT Country, Continent, New_Cases_2022, RANK() OVER(PARTITION BY Continent ORDER BY New_Cases_2022 DESC)
    AS Rank_1 FROM cancer_by_country;

-- 92:Top 3 countries by Survival Rate per Continent:
	SELECT * FROM (SELECT Country, Continent, Five_Year_Survival_Pct, ROW_NUMBER() OVER(PARTITION BY Continent 
    ORDER BY Five_Year_Survival_Pct DESC) as Rank_2 FROM cancer_by_country) WHERE Rank_2 <= 3;

-- 93:Rank risk factors by Attributable Fraction:
	SELECT Risk_Factor, Population_Attributable_Fraction_Pct, 
    RANK() OVER(ORDER BY Population_Attributable_Fraction_Pct DESC) AS Impact_Rank FROM cancer_risk_factors;

-- 94:Find the median-ish country for Treatment Access: 

	SELECT Country, Treatment_Access_Score, NTILE(4) OVER(ORDER BY Treatment_Access_Score) AS Quartile
    FROM cancer_by_country;
    
-- 95:Row number for stages by diagnosis percentage:
	SELECT Stage, Pct_Diagnosed_At_Stage, ROW_NUMBER() OVER(ORDER BY Pct_Diagnosed_At_Stage DESC) AS Popularity_Rank
    FROM cancer_survival_by_stage;
    
-- 96:Dense Rank of countries by Mammography coverage:
	SELECT Country, DENSE_RANK() OVER(ORDER BY Mammography_Coverage_Pct DESC) AS Coverage_Rank
    FROM cancer_by_country;
    
-- 97:List all modifiable risk factors that have a Population_Attributable_Fraction_Pct 
	-- greater than 5%, ordered from highest to lowest impact.
		SELECT Risk_Factor, Population_Attributable_Fraction_Pct, Description 
	FROM cancer_risk_factors 
	WHERE Modifiable = "TRUE" AND Population_Attributable_Fraction_Pct > 5 
	ORDER BY Population_Attributable_Fraction_Pct DESC;
    
-- 98:Find countries where the Stage_I_II_Pct (early detection) is above 70% but the 
	-- Mortality_Rate_Per_100K is still higher than 15.
		SELECT Country, Stage_I_II_Pct, Mortality_Rate_Per_100K 
		FROM cancer_by_country 
		WHERE Stage_I_II_Pct > 70 AND Mortality_Rate_Per_100K > 15;
        
-- 99:Calculate the percentage difference between One_Year_Survival_Pct 
-- and Ten_Year_Survival_Pct for each stage in 'High-Income' regions.
		SELECT Stage, One_Year_Survival_Pct, Ten_Year_Survival_Pct, 
		   (One_Year_Survival_Pct - Ten_Year_Survival_Pct) AS Survival_Drop_Pct
	FROM cancer_survival_by_stage 
	WHERE Income_Region = "High-Income";

-- 100:Identify the country with the highest Deaths_2022 for each Continent.
	SELECT Continent, Country, Deaths_2022
	FROM cancer_by_country c1
	WHERE Deaths_2022 = (SELECT MAX(Deaths_2022) 
                     FROM cancer_by_country c2 
                     WHERE c2.Continent = c1.Continent);

