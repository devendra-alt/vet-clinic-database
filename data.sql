/* Populate database with sample data. */

INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (1,'Agumon','2020-02-03',0,TRUE,10.23);
INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (2,'Gabumon','2018-11-15',2,TRUE,8);
INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (3,'Pikachu','2021-01-07',1,FALSE,15.04);
INSERT INTO animals(id,name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (4,'Devimon','2017-05-12',5,TRUE,11);

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Charmander', '2020-02-08', 0, FALSE, -11.00);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Plantmon', '2021-11-15', 2, TRUE, -5.70);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Squirtle', '1993-04-02', 3, FALSE, -12.13);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Angemon', '2005-06-12', 1, TRUE, -45.00);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Boarmon', '2005-06-07', 7, TRUE, 20.40);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Blossom', '1998-10-13', 3, TRUE, 17.00);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES ('Ditto', '2022-05-14', 4, TRUE, 22.00);

INSERT INTO owners (full_name,age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name,age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name,age) VALUES ('Bob', 45);
INSERT INTO owners (full_name,age) VALUES  ('Melody Pond', 77);
INSERT INTO owners (full_name,age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name,age) VALUES ('Jodie Whittaker', 38);

UPDATE animals SET species_id = 2 WHERE TRIM(name) LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE TRIM(name) NOT LIKE '%mon';

UPDATE animals SET owner_id = (SELECT ID FROM owners WHERE TRIM(full_name) LIKE 'Jennifer Orwell') WHERE TRIM(name) LIKE 'Gabumon';
UPDATE animals SET owner_id = (SELECT ID FROM owners WHERE TRIM(full_name) LIKE 'Jennifer Orwell') WHERE TRIM(name) LIKE 'Pikachu';
UPDATE animals SET owner_id = (SELECT ID FROM owners WHERE TRIM(full_name) LIKE 'Bob') WHERE TRIM(name) LIKE 'Devimon';
UPDATE animals SET owner_id = (SELECT ID FROM owners WHERE TRIM(full_name) LIKE 'Bob') WHERE TRIM(name) LIKE 'Plantmon';
UPDATE animals SET owner_id = (SELECT ID FROM owners WHERE TRIM(full_name) LIKE 'Melody Pond') WHERE TRIM(name) LIKE 'Charmander';
UPDATE animals SET owner_id = (SELECT ID FROM owners WHERE TRIM(full_name) LIKE 'Melody Pond') WHERE TRIM(name) LIKE 'Squirtle';
UPDATE animals SET owner_id = (SELECT ID FROM owners WHERE TRIM(full_name) LIKE 'Melody Pond') WHERE TRIM(name) LIKE 'Blossom';
UPDATE animals SET owner_id = (SELECT ID FROM owners WHERE TRIM(full_name) LIKE 'Dean Winchester') WHERE TRIM(name) LIKE 'Angemon';
UPDATE animals SET owner_id = (SELECT ID FROM owners WHERE TRIM(full_name) LIKE 'Dean Winchester') WHERE TRIM(name) LIKE 'Boarmon';
