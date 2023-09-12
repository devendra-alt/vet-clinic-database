/* Database schema to keep the structure of entire database. */


CREATE TABLE animals(id SERIAL , name CHAR(50), date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL);

ALTER TABLE animals ADD COLUMN new_id SERIAL PRIMARY KEY;

ALTER TABLE animals DROP COLUMN id;

ALTER TABLE animals RENAME COLUMN new_id TO id;

ALTER TABLE animals ADD COLUMN species CHAR(50);

CREATE TABLE owners( id SERIAL PRIMARY KEY, full_name CHAR(50), age INT);

CREATE TABLE species( id SERIAL PRIMARY KEY, name CHAR(50));

ALTER TABLE animals ADD PRIMARY KEY(id);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT;

ALTER TABLE animals ADD COLUMN owner_id INT;

ALTER TABLE animals ADD CONSTRAINT species_id FOREIGN KEY (species_id) REFERENCES species(id);

ALTER TABLE animals ADD CONSTRAINT owner_id FOREIGN KEY (owner_id) REFERENCES owners(id);

CREATE TABLE vets( id SERIAL PRIMARY KEY,name CHAR(50), age INT,date_of_graduation date);

CREATE TABLE specializations(vet_id INT,species_id INT,PRIMARY KEY (vet_id,species_id),FOREIGN KEY (vet_id) REFERENCES vets(id), FOREIGN KEY (species_id) REFERENCES species(id));

CREATE TABLE visits (animal_id INT,vet_id INT,visit_date DATE,PRIMARY KEY (animal_id, vet_id, visit_date),FOREIGN KEY (animal_id) REFERENCES animals(id),FOREIGN KEY (vet_id) REFERENCES vets(id));

ALTER TABLE owners ADD COLUMN email VARCHAR(120);
