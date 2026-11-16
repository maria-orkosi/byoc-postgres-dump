# Customers API with a Postgres dump

Sample repository 10 of the Orkosi bring-your-code test matrix. One backend component (Express on `PORT`, health at
`/api/health`) and a database that arrives as `db/customers.sql`, a plain `pg_dump` with the `knex_migrations` history
table (two migrations applied) and the `citext` extension the restore must have.
