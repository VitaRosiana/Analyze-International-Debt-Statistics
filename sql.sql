%%sql
postgresql:///international_debt
SELECT *
from international_debt
limit 10

%%sql
SELECT 
    count(distinct country_name) AS total_distinct_countries
FROM international_debt;

%%sql 
select distinct indicator_code as distinct_debt_indicators
from international_debt
order by distinct_debt_indicators

%%sql
SELECT 
    round(sum(debt)/1000000, 2) as total_debt
FROM international_debt; 

%%sql
SELECT 
    country_name, 
    sum(debt) as total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt desc
limit 1;

%%sql
SELECT 
    indicator_code AS debt_indicator,
    indicator_name,
    avg(debt) as average_debt
FROM international_debt
GROUP BY debt_indicator, indicator_name
ORDER BY average_debt desc
limit 10;

%%sql
SELECT 
    country_name,indicator_name 
FROM international_debt
WHERE debt = (SELECT 
                 max(debt)
             FROM international_debt
             where indicator_code='DT.AMT.DLXF.CD' );
			 
%%sql
select indicator_code, 
     count(indicator_code) as indicator_count
from international_debt
group by indicator_code
order by (COUNT(indicator_code),indicator_code) desc
limit 20;

%%sql
select country_name, indicator_code, max(debt) as maximum_debt
from international_debt
group by country_name, indicator_code
order by maximum_debt desc
limit 10

