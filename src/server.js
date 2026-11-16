'use strict';
// Sample 10 — the API whose data arrives as db/customers.sql (a pg_dump). The platform must find: backend, node, the dump
// as a database to import, the history table knex_migrations inside the dump, DATABASE_URL as a reference.
const express = require('express');
const { Pool } = require('pg');

const pool = new Pool({ connectionString: process.env.DATABASE_URL });
const app = express();

app.get('/api/health', async (_req, res) => {
  await pool.query('select 1');
  res.json({ ok: true });
});
app.get('/api/customers', async (_req, res) => {
  res.json((await pool.query('select id, name, plan from customers order by id')).rows);
});

app.listen(process.env.PORT || 3000);
