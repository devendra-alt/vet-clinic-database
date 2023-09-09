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

SELECT animals.name as animal_name,owners.full_name as owner_name from animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

SELECT animals.name as animal_name,species.name as species_name from animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT animals.name as animal_name, owners.full_name as owner_name from animals RIGHT JOIN owners ON animals.owner_id = owners.id;

SELECT species.name as species_name,COUNT(animals.id) FROM animals JOIN species ON animals.species_id=species.id GROUP BY species.name;

SELECT animals.name as animal_name,species.name as species_name,owners.full_name as owner_name FROM animals JOIN owners ON animals.owner_id = owners.id JOIN species ON animals.species_id = species.id WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT animals.name as animal_name,owners.full_name as owner_name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';

SELECT COUNT(animals.id) as no_of_animals,owners.full_name as owners_name FROM animals JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY no_of_animals DESC;

-- 

SELECT animals.name AS animal_name FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON visits.vet_id  = vets.id WHERE vets.name = 'William Tatcher' ORDER BY visits.visit_date DESC LIMIT 1;

SELECT COUNT(DISTINCT visits.animal_id) AS no_animals_seen FROM visits JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name,species.name FROM specializations RIGHT JOIN vets ON vets.id = specializations.vet_id LEFT JOIN species ON species.id  = specializations.species_id;

SELECT vets.name, animals.name,visits.visit_date FROM visits JOIN vets ON visits.vet_id = vets.id JOIN animals ON visits.animal_id  = animals.id WHERE vets.name = 'Stephanie Mendez' AND visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name AS animal_name,COUNT(visits.visit_date) as number_of_visits FROM visits JOIN vets ON visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id GROUP BY animals.name ORDER BY number_of_visits DESC LIMIT 1;

SELECT vets.name AS vet_name,animals.name AS animal_name,visits.visit_date FROM visits JOIN vets ON visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id WHERE vets.name = 'Maisy Smith' ORDER BY visit_date LIMIT 1;

SELECT animals.name AS animal_name,animals.date_of_birth,animals.escape_attempts,animals.neutered,animals.weight_kg,animals.species_id,vets.name AS vet_name,vets.age,vets.date_of_graduation,visits.visit_date FROM visits JOIN vets ON visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id ORDER BY visit_date DESC LIMIT 1;

SELECT vets.name AS vet_name,animals.name AS animal_name,animals.species_id AS animal_species_id,specializations.species_id AS vets_specialization_id FROM visits  JOIN vets ON visits.vet_id = vets.id JOIN animals  ON visits.animal_id = animals.id JOIN specializations  ON specializations.vet_id = vets.id WHERE specializations.species_id != animals.species_id;

SELECT vets.name AS vet_name,species.name AS animal_species,COUNT(species.name) AS number_of_animals FROM visits JOIN vets  ON visits.vet_id = vets.id JOIN animals ON visits.animal_id = animals.id JOIN species ON animals.species_id = species.id WHERE vets.name = 'Maisy Smith' GROUP BY species.name,vets.name ORDER BY number_of_animals DESC LIMIT 1;
