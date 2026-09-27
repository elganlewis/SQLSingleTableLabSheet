SELECT * FROM pet;

SELECT DISTINCT owner FROM pet;

-- Q1-1. The names of owners and their pet's name for all pets who are female.
SELECT owner, name FROM pet WHERE sex = "f";

-- Q1-2. The names and birth dates of pets which are dogs.
SELECT name, birth FROM pet WHERE species = "dog";

-- Q1-3. The names of the owners of birds.
SELECT DISTINCT owner FROM pet WHERE species = "bird";

-- Q1-4. The species of pets who are female. 
SELECT DISTINCT species FROM pet WHERE sex = "f";

-- Q1-5. The names and birth dates of pets which are cats or birds. 
SELECT name, birth FROM pet WHERE species = "cat" OR species = "bird";

-- Q1-6. The names and species of pets which are cats or birds and which are female. 
SELECT name, species FROM pet WHERE (species = "cat" OR species = "bird") AND sex = "f";

-- ---

SELECT * FROM pet WHERE sex < "m";

SELECT * FROM pet WHERE name > "F" and owner > "F";

-- Q2-1. The names of owners and their pets where the pet's name ends with “er” or “all” 
SELECT owner, name FROM pet WHERE name LIKE "%er" OR name LIKE "%all";

-- Q2-2. The names of any pets whose owner's name contains an "e" 
SELECT name FROM pet WHERE owner LIKE "%e%";

-- Q2-3. The names of all pets whose name does not end with "fy" 
SELECT name FROM pet WHERE name NOT LIKE "%fy";

-- Q2-4. All pet names whose owners name is only four characters long 
SELECT name FROM pet WHERE length(owner) = 4;

-- Q2-5. All owners whose names begin and end with one of the first five letters of the alphabet 
SELECT DISTINCT owner FROM pet WHERE owner GLOB "[A-Ea-e]*[A-Ea-e]";

-- Q2-6. Repeat the previous query, but make the query sensitive to the case of letters of the alphabet the characters in the name
SELECT DISTINCT owner FROM pet WHERE owner GLOB "[A-E]*[a-e]";


SELECT name, birth FROM pet ORDER BY birth;
SELECT name, birth FROM pet ORDER BY birth DESC;
SELECT name, species, birth FROM pet ORDER BY species DESC, birth;

SELECT name FROM pet WHERE strftime('%m',birth) = strftime('%m','now');

SELECT name, birth,
       (strftime('%Y', 'now') - strftime('%Y', birth)) -
       (strftime('%m-%d', 'now') < strftime('%m-%d', birth)) AS Age
FROM pet;

SELECT owner, name, (checkups * 20) AS income FROM pet;

SELECT owner, name, birth, MIN(strftime('%Y',birth)) AS birth FROM pet GROUP BY owner;

-- Q3-1. The average number of check-ups that each owner has made with their pets
SELECT AVG(checkups) FROM pet;

-- Q3-2. The number of pets of each species in ascending order
SELECT species, COUNT(*) AS Count FROM pet GROUP BY species ORDER BY Count;

-- Q3-3. The number of pets of each species that each owner has
SELECT owner, species, COUNT(*) AS Pet_Count FROM pet GROUP BY owner, species;

-- Q3-4. The number of distinct species of pet each owner has
SELECT owner, COUNT(DISTINCT species) AS Species_Count FROM pet GROUP BY owner;

-- Q3-5. The number of pets of each gender there are in the database, where the gender is known
SELECT sex, COUNT(*) FROM pet WHERE sex<>"" GROUP BY sex;

-- Q3-6. The number of birds each owner has
SELECT owner, COUNT(CASE WHEN species="bird" THEN 1 END) AS Bird_Count FROM pet GROUP BY owner;

-- Q3-7. The total number of check-ups each owner has made with all their pets
SELECT owner, SUM(checkups) FROM pet GROUP BY owner;
