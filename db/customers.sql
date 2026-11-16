--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);

CREATE TABLE public.customers (
    id integer NOT NULL,
    name public.citext NOT NULL,
    plan text DEFAULT 'free'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20260101000000_create_customers.js	1	2026-01-01 10:00:00+00
2	20260201000000_add_plan.js	2	2026-02-01 10:00:00+00
\.

COPY public.customers (id, name, plan, created_at) FROM stdin;
1	Ada	pro	2026-01-02 09:00:00+00
2	Grace	free	2026-01-03 09:00:00+00
3	Linus	team	2026-02-02 09:00:00+00
\.

ALTER TABLE ONLY public.customers ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.knex_migrations ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);

--
-- PostgreSQL database dump complete
--
