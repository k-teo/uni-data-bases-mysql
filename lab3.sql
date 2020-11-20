CREATE SCHEMA LAB3;

# 1. Create a country table: 
#2. Ensure that the codes found in the country. 
#The code consisted of a minimum of three characters
CREATE TABLE country(
	Code char (3) NOT NULL DEFAULT 'UNK',
    	Name VARCHAR (255) NOT NULL DEFAULT '',
    	Code2 char (2) NOT NULL DEFAULT '',
    	UNIQUE KEY unique_Code2 (Code2),
    	PRIMARY KEY (Code)
);

#3. Create a city table:
CREATE TABLE city (
	ID int NOT NULL,
	Name VARCHAR (255) NOT NULL DEFAULT '',
	CountryCode char (3) NOT NULL DEFAULT '',
	District VARCHAR (255) NOT NULL DEFAULT '',
	Info json DEFAULT NULL,
	PRIMARY KEY (ID)
);
    
#4. Add a foreign key to the country table: Capital int DEFAULT NULL associated with the city.ID column
ALTER TABLE country
ADD Capital INT DEFAULT NULL;

ALTER TABLE country 
ADD FOREIGN KEY (Capital) 
REFERENCES city(ID);

#5. Create a countrylanguage table:
CREATE TABLE countrylanguage(
	CountryCode char (3) NOT NULL DEFAULT '',
	FOREIGN KEY (CountryCode) REFERENCES country(Code),
    	Language char (30) NOT NULL DEFAULT '',
	IsOfficial Enum ('T', 'F') NOT NULL DEFAULT 'F',
	Percentage double precision NOT NULL DEFAULT 0.0,
	PRIMARY KEY (CountryCode, Language)
);
    
#6. Create an index for countrylanguage.CountryCode
CREATE INDEX CountryCodeIdx
ON countrylanguage (CountryCode);

#7. Create a countryinfo table:
CREATE TABLE countryinfo (
	doc json,
    	_id int NOT NULL AUTO_INCREMENT,
    	PRIMARY KEY (_id) 
);                                                                                      