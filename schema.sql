/* Database schema to keep the structure of entire database. */


CREATE TABLE animals(id SERIAL , name CHAR(50), date_of_birth DATE, escape_attempts INT, neutered BOOLEAN, weight_kg DECIMAL);

ALTER TABLE animals ADD COLUMN new_id SERIAL PRIMARY KEY;

ALTER TABLE animals DROP COLUMN id;

ALTER TABLE animals RENAME COLUMN new_id TO id;

ALTER TABLE animals ADD COLUMN species CHAR(50);