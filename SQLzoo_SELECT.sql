
world(name, continent, area, population, gdp)

1.
List each country name where the population is larger than that of 'Russia'. 

SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
	  
2.
Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.

Wrong answer. Too many rows:

SELECT name
  FROM world
WHERE gdp/population >
  (SELECT gdp/population FROM world
     WHERE name='United Kingdom')

	 
3.
List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.

SELECT name, continent 
  FROM world
WHERE continent IN (SELECT continent FROM world 
                    WHERE name = 'Argentina')
  OR  continent IN (SELECT continent FROM world 
                    WHERE name = 'Australia')
ORDER BY name

4.
Which country has a population that is more than Canada but less than Poland? Show the name and the population.

SELECT name, population FROM world
  WHERE population
   BETWEEN (SELECT population FROM world
           WHERE name = 'Canada')
       AND (SELECT population FROM world
           WHERE name = 'Poland')
   AND name NOT IN ('Poland', 'Canada')

5.
Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.
Decimal places
You can use the function ROUND to remove the decimal places.
Percent symbol %
You can use the function CONCAT to add the percentage symbol.

SELECT name, 
  CONCAT (ROUND (population/ (SELECT population FROM world 
                             WHERE name = 'Germany') *100 ), '%')
 FROM world
  WHERE continent = 'Europe'
  
 6.
 We can use the word ALL to allow >= or > or < or <=to act over a list. For example, you can find the largest country in the world, by population with this query:

SELECT name
  FROM world
 WHERE population >= ALL(SELECT population
                           FROM world
                          WHERE population>0)

You need the condition population>0 in the sub-query as some countries have null for population. 

Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values) 

