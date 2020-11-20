#1. Create a query that returns all the values of the "GovernmentForm" field (countryinfo) without any
#repetitions
SELECT DISTINCT doc->>'$.government.GovernmentForm' AS 'govenmmentForms'
  FROM countryinfo
 GROUP BY doc->>'$.government.GovernmentForm';


#2. Create a query listing the most common value in the database for the field "Continent" (countryinfo)
SELECT u.Continent AS 'mostComonContient'
  FROM 
	(SELECT DISTINCT doc->>'$.geography.Continent' AS 'Continent', doc->>"$.Name" AS 'Country' 
	   FROM countryinfo) as u
 GROUP BY u.Continent
 ORDER BY COUNT(u.Country) DESC LIMIT 1;


#3. Create a query listing country names with the IndepYear value in descending order of 'IndepYear'
#(countryinfo)
SELECT DISTINCT doc->>'$.Name' AS 'Country', doc->>'$.IndepYear' AS 'yearOfIndependence'
  FROM countryinfo
 WHERE doc->>'$.IndepYear' NOT LIKE '%null%'
 ORDER BY CAST(doc->>'$.IndepYear' AS SIGNED) DESC;


#4. Create a query listing the languages and the number of times they are official languages in descending
#order
SELECT Language, COUNT(IsOfficial) AS 'NumberOfCountries'
  FROM countrylanguage
 WHERE IsOfficial LIKE '%T%'
 GROUP BY Language
 ORDER BY COUNT(IsOfficial) DESC;


#5. Create a query listing the languages and the number of people using them around the world in
#descending order
SELECT f.Language, ROUND(SUM(f.Number)/100) AS 'NumberOfPeople'
  FROM
	(SELECT m.Language, m.Percentage, n.Population, (m.Percentage * n.Population) AS 'Number'
	   FROM
		(SELECT s.Name AS 'Country', u.Language, u.Percentage
		   FROM
			(SELECT Language, Percentage, CountryCode
 			   FROM countrylanguage
			  WHERE Percentage > 0) u
		  INNER JOIN
			(SELECT Code, Name
			   FROM country) s
		     ON u.CountryCode = s.Code) m
	  INNER JOIN
		(SELECT doc->>'$.Name' AS 'Country', doc->>'$.demographics.Population' AS 'Population'
		   FROM countryinfo
		  ORDER BY CAST(doc->>'$.IndepYear' AS SIGNED) DESC) n
	     ON m.Country = n.Country) f
 GROUP BY f.Language
 ORDER BY SUM(f.Number) DESC;