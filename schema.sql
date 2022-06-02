/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id              INT GENERATED ALWAYS AS IDENTITY,
    name            VARCHAR(100),
    date_of_birth   DATE,
    escape_attempts INT,
    neutered        BOOLEAN,
    weight_kg       DECIMAL,
    PRIMARY KEY(id)
);

ALTER TABLE animals
ADD COLUMN species VARCHAR(250);

CREATE TABLE owners (
    id              INT GENERATED ALWAYS AS IDENTITY,
    full_name       VARCHAR(100),
    age             INT,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id              INT GENERATED ALWAYS AS IDENTITY,
    name            VARCHAR(100),
    PRIMARY KEY(id)
);

ALTER TABLE animals
  DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT,
ADD COLUMN owner_id INT;

CREATE TABLE vets (
    id                  INT GENERATED ALWAYS AS IDENTITY,
    name                VARCHAR(100),
    age                 INT,
    date_of_gradudation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    species_id  INT,
    vets_id     INT
);

CREATE TABLE visits (
    animals_id  INT,
    vets_id     INT
);
