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

SELECT animals.name FROM visits INNER JOIN animals on animals_id = animals.id WHERE vets_id = 1 GROUP BY animals.name ORDER BY MAX(date_of_visits) DESC LIMIT 1;
SELECT COUNT(*) FROM visits WHERE vets_id = 3;
SELECT vets.name, vets_id FROM vets LEFT JOIN specializations ON vets_id = vets.id;
SELECT animals.name, date_of_visits FROM visits INNER JOIN animals on animals_id = animals.id WHERE vets_id = 3 AND date_of_visits > '2020-04-01' AND date_of_visits < '2020-08-30';
SELECT animals.name, COUNT(animals_id) FROM visits INNER JOIN animals ON animals_id = animals.id GROUP BY animals.name ORDER BY COUNT(animals_id) DESC LIMIT 1;
SELECT animals.name FROM visits INNER JOIN animals on animals_id = animals.id WHERE vets_id = 2 GROUP BY animals.name ORDER BY MIN(date_of_visits) LIMIT 1;
SELECT animals.name, vets.name, date_of_visits FROM visits INNER JOIN animals ON animals_id = animals.id INNER JOIN vets ON vets_id = vets.id;
SELECT COUNT(*) FROM visits JOIN vets ON vets_id = vets.id JOIN animals ON visits.animals_id = animals.id WHERE vets.id NOT IN (
  SELECT vets.id FROM vets JOIN specializations ON vets.id = specializations.vets_id WHERE specializations.species_id = animals.species_id
  );
SELECT species.name, COUNT(*) FROM visits JOIN vets on vets_id = vets.id JOIN animals ON animals_id = animals.id JOIN species ON species_id = species.id WHERE vets_id = 2 GROUP BY species.name ORDER BY species.name DESC LIMIT 1;
