#1. Insert twenty new records into the "world" table created in the previous list
INSERT INTO country
VALUES ('001',  'Afghanistan', 'Asia', 'A', 25000, 1000, 10000000, 63.66, 1.0, 1.0, 'a', 'Democracy', 'PM', '00', 'Kabul'),
('002',  'Albania', 'Europe', 'A', 1110, 1000, 486544, 70.66, 1.0, 1.0, 'b', 'Democracy', 'PM', '00', 'Tirana'),
('003',  'Algeria', 'Europe', 'A', 91959, 1000, 485267, 85.66, 1.0, 1.0, 'q', 'Democracy', 'PM', '00', 'Algiers'),
('004',  'Andorra', 'Europe', 'A', 181, 1000, 8524, 75.66, 1.0, 1.0, 'w', 'Democracy', 'PM', '00', 'Andorra'),
('005',  'Angola', 'South America', 'A', 481351, 1000, 20000025, 84.66, 1.0, 1.0, 'e', 'Democracy', 'PM', '00', 'Luanda'),
('006',  'Atigua and Barbuda', 'South America', 'A', 171, 1000, 5246855, 66.66, 1.0, 1.0, 'r', 'Democracy', 'PM', '00', 'Saint Johns'),
('007',  'Armenia', 'Asia', 'A', 11506, 1000, 485215, 63.66, 1.0, 1.0, 't', 'Democracy', 'PM', '00', 'Yerevan'),
('008',  'Australia', 'Oceania', 'A', 2967893, 1000, 852963741, 64.66, 1.0, 1.0, 'y', 'Democracy', 'PM', '00', 'Canberra'),
('009',  'Azerbaijan', 'Asia', 'A', 32382, 1000, 458214, 68.66, 1.0, 1.0, 'u', 'Democracy', 'PM', '00', 'Baku'),
('010',  'Bahamas', 'North America', 'A', 33436, 1000, 2684521, 70.66, 1.0, 1.0, 'i', 'Democracy', 'PM', '00', 'Nassau'),
('011',  'Bahrain', 'Asia', 'A', 5382, 1000, 741852, 71.66, 1.0, 1.0, 'd', 'Democracy', 'PM', '00', 'Manama'),
('012',  'Bangladesh', 'Asia', 'A', 45845, 1000, 951753, 80.66, 1.0, 1.0, 'f', 'Democracy', 'PM', '00', 'Dhaka'),
('013',  'Barbados', 'North America', 'A', 45824, 1000, 741852, 74.66, 1.0, 1.0, 'g', 'Democracy', 'PM', '00', 'Bridgetown'),
('014',  'Belarus', 'Europe', 'A', 6852, 1000, 9582467, 61.66, 1.0, 1.0, 'h', 'Democracy', 'PM', '00', 'Minsk'),
('015',  'Belgium', 'Europe', 'A', 7852, 1000, 852963741, 62.66, 1.0, 1.0, 'j', 'Democracy', 'PM', '00', 'Brussels'),
('016',  'Belize', 'South America', 'A', 954, 1000, 852456, 69.66, 1.0, 1.0, 'k', 'Democracy', 'PM', '00', 'Belmopan'),
('017',  'Benin', 'Africa', 'A', 45824, 1000, 95185, 66.66, 1.0, 1.0, 'k', 'Democracy', 'PM', '00', 'Porto-Novo'),
('018',  'Bhutan', 'Asia', 'A', 68452, 1000, 5869, 71.66, 1.0, 1.0, 'e', 'Democracy', 'PM', '00', 'Thimphu'),
('019',  'Bolivia', 'South America', 'A', 74523, 1000, 741854, 59.66, 1.0, 1.0, 'v', 'Democracy', 'PM', '00', 'Sucre'),
('020',  'Bosnia and Herzegovina', 'Europe', 'A', 548, 1000, 95845, 80.66, 1.0, 1.0, 'm', 'Democracy', 'PM', '00', 'Sarajevo');


#2. Search for records in the "world" table, then sort them in descending order of population
SELECT * 
  FROM country 
 ORDER BY Population DESC;


#3. Change the record population with the smallest population to 20 million
SELECT * 
  FROM country 
 ORDER BY Population ASC 
 LIMIT 1;

UPDATE country 
   SET Population = 20000000 
 WHERE Population = 0;


#4. Search for records with a population below 20 million
SELECT * 
  FROM country 
 WHERE Population < 20000000;

#5. Delete records with a population over 20 million
   SET foreign_key_checks = 0;

DELETE 
  FROM country 
 WHERE Population > 20000000;

   SET foreign_key_checks = 1;



