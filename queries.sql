/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-30';
SELECT * FROM animals WHERE neutered = TRUE AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = TRUE;
SELECT * FROM animals WHERE name NOT LIKE 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 and weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT species FROM animals;
ROLLBACK;
SELECT species FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS Null;
COMMIT;
SELECT * FROM animals;

BEGIN;
TRUNCATE animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
SELECT * FROM animals;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, date_of_birth, COUNT(escape_attempts), AVG(escape_attempts) FROM animals 
GROUP BY species, date_of_birth
HAVING date_of_birth > '1990-01-01' AND date_of_birth < '2000-01-01';

SELECT animals.id, name FROM owners INNER JOIN animals ON owner_id = owners.id WHERE owners.id = 4;
SELECT animals.id, animals.name FROM animals INNER JOIN species ON species_id = species.id WHERE species.id = 1;
SELECT owners.id,full_name, animals.id, name FROM owners LEFT JOIN animals ON owner_id = owners.id; 
SELECT species.name, COUNT(*) FROM animals INNER JOIN species ON species_id = species.id GROUP BY species.name;
SELECT species.id, animals.name, species.name FROM species INNER JOIN animals ON species_id = species.id WHERE species.id = 2 AND owner_id = 2;
SELECT animals.id, name FROM owners INNER JOIN animals ON owner_id = owners.id WHERE owner_id = 5 AND escape_attempts = 0;
SELECT full_name,  COUNT(owner_id) FROM owners INNER JOIN animals ON owner_id = owners.id GROUP BY full_name ORDER BY COUNT(owner_id) DESC LIMIT 1;
