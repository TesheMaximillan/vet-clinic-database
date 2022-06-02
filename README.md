# Vet clinic database: create animals table

> In this project I use a relational database to create the initial data structure for a vet clinic. I create a table to store animals' information, insert some data into it, and query it.
> In the second milestone of this project, I used transactions to update and delete records. Also, I used aggregate functions and GROUP BY to answer analytical questions.
> In the third milestone of this project, I did add some new tables and add foreign key columns to the existing animals table to model one-to-many relationships. Afterward, I used JOIN to query the data.

## Basic Requirements Milestone I:

* I created a database named `vet_clinic`.
* I created a table named `animals` with the following columns:

  - id: integer
  - name: string
  - date_of_birth: date
  - escape_attempts: integer
  - neutered: boolean
  - weight_kg: decimal

* I inserted a data to the `animals` table
* I write queries from the `animals`

## Basic Requirements Milestone II:

* A `species` column is added with a type of string to the `animals` table.
* I inserted a data to the `animals` table
* Inside a transaction I updated the `animals` table by setting the `species` column to unspecified. 
Also I Verified that change was made. Then I rolled back the change and verify that `species` columns went back to the state before transaction.
* Inside a transaction I updated and Commit the transaction.
* Inside the transaction I deleted all records in the `animals` table, the I rolled back the transaction;
* Inside the transaction I used a Savepoint for rollback;
* Finally, I wrote a query to answer the listed question in the requirement.

## Basic Requirements Milestone III:

* `owners` and `species`tables are created.
* `animals` table are modified by removing `species` column, and add `species_id` and `owner_id` for referencing foreign key. 
* datas are `inserted` to owners and `species` table.
* Modify `animals` table to include a value for `owner_id` and `species_id`.
* Write queries using `JOIN`

## Technologies

- Postgres
- SQL

## Authors

👤 **Teshome Kurabachew**

- GitHub: [@githubhandle](https://github.com/TesheMaximillan)
- Twitter: [@twitterhandle](https://twitter.com/TesheKura)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/teshome-kurabachew-aa8067180/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/TesheMaximillan/vet-clinic-database/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse

## 📝 License

This project is [MIT](./MIT.md) licensed.
