/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals where TRIM(name) like '%mon';

SELECT name FROM animals WHERE EXTRACT(YEAR from date_of_birth) BETWEEN 2016 AND 2019;

SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon','Pikachu');

SELECT name,escape_attempts FROM animals WHERE  weight_kg > 10.5;

SELECT name FROM animals WHERE neutered = true;

BEGIN;

SELECT * FROM animals WHERE name NOT IN ('Gabumon');

UPDATE animals SET species = 'unspecified';

SELECT * FROM animals;

ROLLBACK;

BEGIN;

UPDATE animals SET species = 'digimon' WHERE TRIM(name) LIKE '%mon';

UPDATE animals SET species = 'pokemon' WHERE species='';

SELECT * FROM animals;

COMMIT;

SELECT * FROM animals;

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

DELETE FROM animals WHERE date_of_birth > '2022-01-01';

SAVEPOINT delete_data_dob_after_2022;

UPDATE animals SET weight_kg = weight_kg * 1;

ROLLBACK TO delete_data_dob_after_2022;

UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;

COMMIT;

SELECT COUNT(*) from animals;

SELECT COUNT(*) from animals WHERE escape_attempts=0;

SELECT AVG(weight_kg)::NUMERIC(10,2) As weight_kg_avg from animals;

SELECT SUM(escape_attempts) AS escape_attempts,neutered from animals GROUP BY neutered;

SELECT MIN(weight_kg) AS minimum_weight,MAX(weight_kg) as maximum_weight,species from animals GROUP BY species;

SELECT AVG(escape_attempts)::NUMERIC(10,2) from animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY species;

SELECT animal.id as animal_id, name as animal_name, full_name  as owner_name FROM animals animal JOIN owners owner ON animal.owner_id = owner.id;

-- 

SELECT animals.name as animal_name,owners.full_name as owner_name from animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody P
ond';

SELECT animals.name as animal_name,species.name as species_name from animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT animals.name as animal_name, owners.full_name as owner_name from animals RIGHT JOIN owners ON animals.owner_id = owners.id;

SELECT species.name as species_name,COUNT(animals.id) FROM animals JOIN species ON animals.species_id=species.id GROUP BY species.name;

SELECT animals.name as animal_name,species.name as species_name,owners.full_name as owner_name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT animals.name as animal_name,owners.full_name as owner_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

 SELECT COUNT(animals.id) as no_of_animals,owners.full_name as owners_name FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY no_of_animals DESC;
