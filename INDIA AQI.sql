/*DATASET: INDIA AQI
This Dataset India AQI contains 5 Columns named State, District, Most Reached AQI, 
Current AQI and Major source of pollution.*/

-- 1.Select all columns for all entries in the table.
SELECT * from india_aqi;

-- 2.List all unique states present in the dataset.
SELECT distinct(District) from india_aqi;

-- 3.Find all districts in the state of 'Delhi (NCT)’.
SELECT District from india_aqi where State="Delhi (NCT)";

-- 4.Display the Current_AQI and District for all records.
select District, Current_AQI from india_aqi;

-- 5.Find all records where Current_AQI is greater than 300 (Hazardous).
select * from india_aqi where Current_AQI>300;


-- 6.Find all records where Most_AQI_Reached is less than 50 (Good).
select * from india_aqi where Most_AQI_Reached<50;

-- 7.List all states where the Major_Source_of_Pollution is 'Vehicular Emissions'.
select  Distinct State from india_aqi where Major_source_of_pollution="vehicle";

-- 8.Find districts where Current_AQI is between 101 and 200 (Moderate/Poor).
select distinct(State) from india_aqi where Current_AQI between 101 and 200;

-- 9.List all major sources of pollution without duplicates.
select distinct(Major_source_of_pollution) from india_aqi;

-- 10.find the District who has same Most_aqi_reached and Current Aqi;
select District from india_aqi where Most_AQI_Reached=Current_AQI;

-- 11.Count the total number of entries/rows in the table.
select count(*) as Total_entry from india_aqi;

-- 12.Sort the data by Current_AQI in descending order.
select * from india_aqi order by Current_AQI desc;

-- 13.Sort the data by Most_AQI_Reached in ascending order.
select * from india_aqi order by Most_AQI_Reached;

-- 14.Find the entry with the highest Current_AQI.
select * from india_aqi order by Current_AQI desc limit 1;

-- 15.Find the entry with the lowest Most_AQI_Reached.
select * from india_aqi order by Most_AQI_Reached limit 1;

-- 16.Select the District and Current_AQI for five districts with the highest pollution.
select District, Current_AQI from india_aqi order by Current_AQI desc limit 5;

-- 17.Count how many districts have 'Industrial Emissions' as their major source.--
select count(District) as dis_count from india_aqi where Major_source_of_pollution="Industrial Emissions";

-- 18..List districts that have 'Biomass Burning' or 'Construction Activity' as their major source.
select District from india_aqi where Major_source_of_pollution in("Crop Burning","Construction Dust");

-- 19.Find records where the Current_AQI is null or missing.
select * from india_aqi where Current_AQI IS NULL;

-- 20.Update the Major_Source_of_Pollution for a specific district.
update india_aqi set Major_source_of_pollution="Crop Burn" where District="Anantapur";

-- 21.Delete records for a specific DIstrict if necessary.
delete from india_aqi where District="Chitoor";

-- 22.Find all districts in 'Delhi'.
select District from india_aqi where State like "Delhi%";

-- 23.List districts where the current_aqi is greater than 200.
select District from india_aqi where Current_AQI>200;

-- 24.Find districts where major_source_pollution with 'Industrial' ‘ crop burn’.
select District from india_aqi where Major_source_of_pollution in("crop Burning", "Industrial %");

-- 25.Find districts in 'Maharashtra' with a current_aqi > 150.
select District from india_aqi where State="Maharashtra" and Current_AQI>150;

-- 26.List districts where major_source_pollution is NOT 'Vehicular'.
select District from india_aqi where Major_source_of_pollution <> "vehicle";

-- 27.Find districts where the name starts with 'New'.
select District from india_aqi where District like "New%";

-- 28.Find records where major_source_pollution contains the word 'Burn'.
select * from india_aqi where Major_source_of_pollution like "%Burn%";

-- 29.Retrieve districts in 'Uttar Pradesh' or 'Bihar'
select District from india_aqi where State in("Uttar Pradesh", "Bihar");

-- 30. Select districts in Gujarat or Rajasthan
select District from india_aqi where State="gujrat" or State="Rajasthan";

-- 31. Select all records where Most_Reached_AQI is not between 0 and 50.

select * from india_aqi where Most_AQI_Reached not between 0 AND 50;


-- 32. Select districts where the second letter of the district name is 'u'.
		select  District from india_aqi where District like "_u%";
		
-- 33.Find the minimum Current_AQI for each state.
select min(Current_AQI) as min_aqi, State from india_aqi group by State;

-- 34..Count the number of districts in each state.
select count(District) as District_each, State from india_aqi group by State;

-- 35.Count the number of districts for each Major_Source_of_Pollution.
select count(District) as District_each, Major_source_of_pollution from india_aqi group by Major_source_of_pollution;

-- 36.Find the state with the highest average Current_AQI.
select avg(Current_AQI) as avg_aqi, State from india_aqi group by state order by avg_aqi desc limit 1;

-- 37.Find the major source of pollution that affects the most districts.
select Major_source_of_pollution, count(distinct District) as district_count
from india_aqi group by Major_source_of_pollution order by district_count desc limit 1 ;

-- 38.Calculate the total number of districts affected by each pollution source, but only for sources affecting more than 10 districts.
select Major_source_of_pollution, count(distinct District) as district_count
from india_aqi group by Major_source_of_pollution having count(distinct District)>10 order by district_count desc;

-- 39. SELECT District FROM AQI_Data WHERE Major_Reason_of_Pollution LIKE '%fuels';
select  District from india_aqi where Major_source_of_pollution like "%fuel";

-- 40.Find states where the average Most_AQI_Reached is above 200.
Select avg(Most_AQI_Reached) as most_aqi , State from india_aqi  group by State having avg(Most_AQI_Reached)>200;

-- 41.List the top 3 states with the lowest average Current_AQI.
select avg(Current_AQI) as cur_aqi , State from india_aqi  group by State order by avg(Current_AQI) limit 3;

-- 42..Find the standard deviation of Current_AQI for a specific state, like 'Maharashtra'.

select stddev(Current_AQI) stdAQI_maharashtra from india_aqi
where State="Maharashtra” AND Current_AQI IS NOT NULL;

-- 43.Find the median Current_AQI for the entire dataset requires more complex SQL, e.g., window functions

WITH india_aqi AS (
    SELECT 
        Current_AQI,
        ROW_NUMBER() OVER (ORDER BY Current_AQI) as rn,
        COUNT(*) OVER () as total_count
    FROM india_aqi
)
SELECT AVG(Current_AQI) AS Median_AQI
FROM india_aqi WHERE rn IN (FLOOR((total_count + 1) / 2.0), CEIL((total_count + 1) / 2.0));

-- 44.Count how many districts in 'Uttar Pradesh' have a Current_AQI over 400
SELECT COUNT(District) from india_aqi where State= "Uttar Pradesh" AND Current_AQI>400;

-- 45.Find the average difference between Most_AQI_Reached and Current_AQI for each state.
SELECT State, AVG(Current_AQI) AS avg_current, AVG(Most_AQI_Reached)AS avg_most, 
(AVG(Current_AQI)-AVG(Most_AQI_Reached)) AS Difference From india_aqi group by State;

-- 46.Identify states where every district has a Current_AQI below 100.
SELECT DIstinct(State) from india_aqi GROUP BY State HAVING
AVG(Current_AQI)<=100;

-- 47.Find the districts where the Current_AQI is exactly the same as the Most_AQI_Reached.
select District from india_aqi where Most_AQI_Reached=Current_AQI;

-- 48. List all states, ordered alphabetically.
		select distinct State  from india_aqi order by State;

-- 49.Show states with more than 5 districts where the average Current_AQI is above 150.
select State, avg(Current_AQI) as avg_current_aqi from india_aqi group by State having avg_current_aqi>150;

-- 50.List districts in the same state as the district with the absolute highest Most_AQI_Reached.
SELECT DIstrict,State,Current_aqi FROM india_aqi as a1
where Current_AQI>(SELECT avg(Current_AQI) from india_Aqi as a2 where a2.State=a1.State);

-- 51.find the major pollution source count which has affected maximum districts
select distinct Major_source_of_pollution, count( Major_source_of_pollution) AS count
from india_aqi group by Major_source_of_pollution order by count desc limit 1;

-- 52.Find major pollution sources that only appear in a single state.
select Major_source_of_pollution, max(State) AS single_state
from india_aqi group by Major_source_of_pollution
having count(distinct State)=1 ;

-- 53.Use a Common Table Expression (CTE) to find the top 5 most polluted districts
  and then list their major sources.
  
-- 54.Find districts with a Current_AQI above the national average using a subquery.
select DIstrict, Current_AQI  from india_aqi where Current_AQI>(select avg(Current_AQI) from india_aqi);

-- 55.Identify states where the average Current_AQI is lower than the      average Most_AQI_Reached of 'Delhi'.
select State, avg(Current_AQI) as avg_c from india_aqi
group by State having avg(Current_AQI)<( select avg(Most_AQI_Reached) from india_aqi where State="Delhi (NCT)");

-- 56.List districts that share the same Major_Source_of_Pollution as 'Mumbai   city' but are in a different state.
select DIstrict from india_aqi where Major_source_of_pollution=(select Major_source_of_pollution from india_aqi where District="Mumbai City")  AND State Not Like "Maharashtra";

-- 57.List states that have districts with both 'Vehicular Emissions' and 'Industrial Emissions' as major sources.
select distinct State from india_aqi where Major_source_of_pollution in ("Industrial Emissions", "Vehicle") ;

-- 58.Use a self-join to compare the Current_AQI of a district with another district In the same state
select A.District as district1,  A.Current_AQI as aqi1, B.District as district2,
B.Current_AQI as aqi2,  A.State as State1
From india_aqi as A
Join india_aqi as B on A.State = B.State And	A.District <> B.District
where	A.Current_AQI > B.Current_AQI order by A.State,District1,District2;

-- 59.Find districts whose Current_AQI is higher than the maximum Most_AQI_Reached of any district in 'Kerala'
select State, avg(Current_AQI) as avg_c from india_aqi group by State
having avg(Current_AQI)>( select avg(Most_AQI_Reached) from india_aqi where State like "kerala");

-- 60. Which 5 districts in Gujrat had the highest 'most reached aqi'  and what was the 'major source of aqi' for each?"
select Most_AQI_Reached, Major_source_of_pollution from india_aqi order by Most_AQI_Reached DESC limit 5;

-- 61. List districts in Karnataka, ordered by Most_Reached_AQI in ascending orders
select District, Most_AQI_Reached from india_aqi where State="karnataka" order by Most_AQI_Reached;

-- 62.List districts where the Major_Source_of_Pollution is unique within that state.
select State, District, Major_source_of_pollution from india_aqi
where Major_source_of_pollution in( select Major_source_of_pollution from india_aqi group by State, Major_source_of_pollution having count(*)=1);

-- 63.find top 10 most polluted district
Select District, Most_AQI_Reached from india_aqi order by Most_AQI_Reached desc limit 10;

-- 64. Order all records first by State (alphabetical), then by Current_AQI (highest to lowest).
    select * from india_aqi order by State asc, Current_AQI desc;

-- 65. Find the district with the lowest Current_AQI.
		select District from india_aqi order by Current_AQI limit 1;

-- 66. : List the top 3 major reasons for pollution by frequency across all districts.
	select Major_source_of_pollution,COUNT(*) as frequency 
FROM india_aqi group by Major_source_of_pollution order by frequency desc limit 3;
-- 67. List all records where Current_AQI is above 100, sorted by State and District.
select * from india_aqi where Current_AQI>100 order by State, District;

-- 68. Count the total number of districts in the dataset.
		select count(district) as total_dis from india_aqi;

-- 69. Count how many districts are in the state of Tamil Nadu
select count(district) as total_dis from india_aqi where State="Tamil Nadu";

-- 70. Find the highest Current_AQI in the state of West Bengals
select max(Current_aqi) as higest_aqi from india_aqi where State="West Bengal";

-- 71. List the number of districts in each state
select State,count(District) as total_dis from india_aqi group by State;

-- 72. Count the number of districts for each Major_Reason_of_Pollution where the count is greater than 5.
select distinct Major_source_of_pollution,count(District) as total_dis 
from india_aqi group by Major_source_of_pollution having count(District)>5;

-- 73. Count how many distinct reasons for pollution are listed in the dataset.
		select count(distinct Major_source_of_pollution) from india_aqi;

-- 74. Insert a new record for a district 'Mumbai' in 'Maharashtra' with a current AQI of 150, most reached AQI of 210, and reason 'Vehicle Emissions'
insert into india_aqi(State,District,Most_AQI_Reached,Current_AQI,Major_source_of_pollution) 
values("Mumbai","Maharashtra",210,150,"Vehicle Emission");

-- 75. Update the Major_Reason_of_Pollution to 'Industrial Activity' for districts Bharuch in 'Gujarat'.
Update india_aqi set Major_source_of_pollution="Industrial Activity" where District="Bharuch";

-- 76. Delete the record for the district 'Chennai'.
		Delete from india_aqi where District="chennai";


-- 77. Add a new column AQI_Bucket to the table to store the AQI category
		alter table india_aqi add aqi_bucket varchar(50);

-- 78. Populate the new AQI_Bucket column based on    the Current_AQI values (using CASE statement logic, simplified).
		update india_aqi set 
aqi_bucket = case
 when Current_AQI <= 50 then 'Good'
 when Current_AQI <= 100 then 'Satisfactory'
 		when Current_AQI <= 200 then 'Moderate'
 		else 'Poor'
 end;

-- 79. List districts that do not have the minimum Current_AQI among all records.	
select District from india_aqi where Current_AQI<>(select min(Current_AQI) from india_aqi);

-- 80. List all states that have at least one district with a Current_AQI above 300.
select  distinct State from india_aqi where Current_AQI>(Select District from india_aqi where Current_AQI>300 limit 1);

-- 81. Categorize each district's Current_AQI as 'Healthy' (<=50), 'Moderate' (51-100), or 'Unhealthy' (>100).
		select District, Current_AQI,
		case
			when Current_AQI <= 50 then "HEALTHY"
        			when Current_AQI between 51 AND 100 then "MODeRATE"
		else "UNHEALTHY"
    		end AS Health_category
   		 from india_aqi;

-- 82. Count the number of districts in each health category
		select 
	case
		when Current_AQI <= 50 then "HEALTHY"
        		when Current_AQI between 51 AND 100 then "MODeRATE"
	else "UNHEALTHY"
   		 end AS Health_category, COUNT(*) as count
    		from india_aqi group by health_category;

-- 83. Replace all occurrences of 'crop burn' with 'biomass burning' in the Major_Reason_of_Pollution column.
update india_aqi set Major_Source_of_pollution="Biomass burning" where Major_Source_of_pollution="crop burn";

-- 84. Find districts where the Current_AQI is exactly 0.
	select District from india_aqi where Current_AQI=0;

-- 85. List states that appear more than once in the dataset (implying multiple districts listed).
	select State from india_aqi group by State having count(State)>1;

-- 86. Show the top 10 most polluted cities based on Current_AQI, including their state.
	select District, State from india_aqi order by Current_AQI desc limit 10;

-- 87. Find states where all districts have a Current_AQI below 200.
select State from india_aqi group by State having max(Current_AQI)<200;

-- 88. List all records but add a new calculated column AQI_Difference showing the difference between Most_Reached_AQI and Current_AQI.
select * , (Most_AQI_Reached-Current_AQI) as Diffrence from india_aqi;

-- 89. Calculate the percentage of districts in each state with 'Biomass Burning' as a major source.
select State, scount(distinct 
CASE
	when Major_Source_of_pollution ="Biomass Burning" then District
	else null 
    END) AS Dis_biomass, count(DISTINCT District ) as total_dis,
(count(distinct
 CASE 
	when Major_Source_of_pollution ="Biomass Burning" then District
else null 
END) * 100.0/count(DISTINCT District))as per_biomass
from india_AQI group by State order by per_biomass DESC;

-- 90.find the Most_reached aqi more than average aqi
select District, Most_AQI_Reached from india_aqi where Most_AQI_Reached>(Select avg(Most_AQI_Reached) from india_aqi);

-- 91.display total number of District in “Andhra Pradesh”
select count(DIstrict) from india_aqi where State="Andhra Pradesh";

-- 92. Count how many districts have a NULL value in the Most_Reached_AQI column.

	select District from india_aqi where Most_AQI_Reached = null;

-- 93.Find the total number of 'Satisfactory' Current_AQI readings (51-100).
select COUNT(*) from india_aqi WHERE Current_AQI BETWEEN 51 AND 100;

-- 94. List states where the average Most_Reached_AQI is 'Severe' (above 400).
select State, AVG(Most_AQI_Reached) FROM india_aqi GROUP BY State HAVING AVG(Most_AQI_Reached) > 400;
	
-- 95.List all districts whose Major_Source_of_Pollution is the same as the most common source nationwide.
	select District, Major_source_of_pollution
From india_aqi
Where Major_source_of_pollution=(select Major_source_of_pollution from india_aqi 
group by Major_source_of_pollution order by count(*) desc limit 1)
;
-- 96.Find states where every single district's Current_AQI is lower than the average Current_AQI of Gujarat
	select State, District from india_aqi 
Where Current_AQI=(select avg(Current_AQI) from india_aqi where State="Gujarat");

-- 97. List the data types of all 5 columns.
	SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'india_aqi';

-- 98.find 20 district with current aqi when current_aqi is highest
	select District, Current_AQI, State from india_aqi order by Current_AQI desc;

-- 99. Find the count of districts for each state.
	select distinct State, COUNT(*) from india_aqi group by State;


-- 100.Check if avg Most Reached AQI is always >= avg Current AQI
	select AVG(Current_AQI), AVG(Most_AQI_Reached),
	case 
		when AVG(Current_AQI) >= AVG(Most_AQI_Reached) Then "YES"
	else "NO"
    END AS status
    from india_aqi;
    
	

	
