2.
How to use WHERE to filter records.
 Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros. 
 
 SELECT name FROM world
 WHERE population>200000000

3.
Give the name and the per capita GDP for those countries with a population of at least 200 million.
per capita GDP is the GDP divided by the population GDP/population

SELECT name, GDP/population
from world where population >=200000000

4.
Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions. 

select name, population/1000000
from world where continent ='South America'

5.
Show the name and population for France, Germany, Italy 

select name, population
from world  WHERE name IN ('France', 'Germany', 'Italy');

6.
Show the countries which have a name that includes the word 'United' 

select name from world 
where name like '%United%'

7.
Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
Show the countries that are big by area or big by population. Show name, population and area.

select name, population, area
from world where area>3000000 or population>250000000

8.
Exclusive OR (XOR). Show the countries that are big by area or big by population but not both. Show name, population and area.
    Australia has a big area but a small population, it should be included.
    Indonesia has a big population but a small area, it should be included.
    China has a big population and big area, it should be excluded.
    United Kingdom has a small population and a small area, it should be excluded.

select name, population, area 
from world where area>3000000 xor population>250000000

9.
Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'.
Use the ROUND function to show the values to two decimal places.
For South America show population in millions and GDP in billions both to 2 decimal places.

select name, round(population/1000000,2), round(gdp/1000000000,2) 
from world where continent = 'South America'

10.
Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros).
Round this value to the nearest 1000.
Show per-capita GDP for the trillion dollar countries to the nearest $1000.

select name, round(gdp/population,-3) 
from world where gdp>1000000000000

11.
'The CASE statement shown is used to substitute North America for Caribbean in the third column.
Show the name - but substitute Australasia for Oceania - for countries beginning with N.'

SELECT name,
       CASE WHEN continent='Oceania' THEN 'Australasia'
            ELSE continent END
  FROM world
 WHERE name LIKE 'N%'

 12.
 Show the name and the continent - but substitute Eurasia for Europe and Asia; 
 substitute America - for each country in North America or South America or Caribbean. 
 Show countries beginning with A or B
 
 
SELECT name, 
  CASE 
    WHEN continent in ('Europe', 'Asia') THEN 'Eurasia'
WHEN continent in ('North America', 'South America', 'Caribbean') THEN 'America'

   ELSE continent END
FROM world
WHERE name LIKE 'A%' OR name LIKE 'B%'

13.
Put the continents right...
    Oceania becomes Australasia
    Countries in Eurasia and Turkey go to Europe/Asia
    Caribbean islands starting with 'B' go to North America, other Caribbean islands go to South America
    Order by country name in ascending order
Show the name, the original continent and the new continent of all countries.

SELECT name, continent, 
   CASE WHEN continent ='Oceania' THEN 'Australasia'
        WHEN continent IN ('Eurasia') THEN 'Europe/Asia'
        WHEN name ='Turkey' THEN 'Europe/Asia'
        WHEN name LIKE 'B%' AND continent = 'Caribbean' THEN 'North America'
        WHEN name NOT LIKE 'B%' AND continent = 'Caribbean' THEN 'South America'
   ELSE continent END
FROM world
ORDER BY name ASC;
