--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS itbs;
--
-- Name: itbs; Type: DATABASE; Schema: -; Owner: russ
--

CREATE DATABASE itbs WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE itbs OWNER TO russ;

\connect itbs

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: client_delete(integer); Type: FUNCTION; Schema: public; Owner: russ
--

CREATE FUNCTION client_delete(_id integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
            BEGIN
              delete from clients where id = _id;
            END;
            $$;


ALTER FUNCTION public.client_delete(_id integer) OWNER TO russ;

--
-- Name: client_insert(character varying, character varying, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: russ
--

CREATE FUNCTION client_insert(_name character varying, _surname character varying, _code character varying, _email character varying, _country character varying, _town character varying, _address character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
  client_id integer;
BEGIN
  insert into clients (name, surname, code, email, country, town, address)
    values (_name, _surname, _code, _email, _country, _town, _address) returning id into client_id;
  return client_id;
END;
$$;


ALTER FUNCTION public.client_insert(_name character varying, _surname character varying, _code character varying, _email character varying, _country character varying, _town character varying, _address character varying) OWNER TO russ;

--
-- Name: client_update(integer, character varying, character varying, character varying, character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: russ
--

CREATE FUNCTION client_update(_id integer, _name character varying, _surname character varying, _code character varying, _email character varying, _country character varying, _town character varying, _address character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
            BEGIN
              update clients set 
                name = _name,
                surname = _surname,
                code = _code,
                email = _email,
                country = _country,
                town = _town,
                address = _address
              where
                id = _id;
            END;
            $$;


ALTER FUNCTION public.client_update(_id integer, _name character varying, _surname character varying, _code character varying, _email character varying, _country character varying, _town character varying, _address character varying) OWNER TO russ;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: public; Owner: russ
--

CREATE FUNCTION update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
            BEGIN
                NEW.updated_at = NOW();
                RETURN NEW;
            END;
        $$;


ALTER FUNCTION public.update_updated_at_column() OWNER TO russ;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: clients; Type: TABLE; Schema: public; Owner: russ
--

CREATE TABLE clients (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    surname character varying(64) NOT NULL,
    code character varying(16) NOT NULL,
    email character varying(255) NOT NULL,
    country character varying(128) NOT NULL,
    town character varying(128) NOT NULL,
    address character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT now(),
    updated_at timestamp(0) without time zone DEFAULT now()
);


ALTER TABLE clients OWNER TO russ;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: russ
--

CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE clients_id_seq OWNER TO russ;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: russ
--

ALTER SEQUENCE clients_id_seq OWNED BY clients.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: russ
--

CREATE TABLE migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE migrations OWNER TO russ;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: russ
--

CREATE SEQUENCE migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE migrations_id_seq OWNER TO russ;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: russ
--

ALTER SEQUENCE migrations_id_seq OWNED BY migrations.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: russ
--

CREATE TABLE password_resets (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE password_resets OWNER TO russ;

--
-- Name: users; Type: TABLE; Schema: public; Owner: russ
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE users OWNER TO russ;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: russ
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO russ;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: russ
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: v_clients; Type: VIEW; Schema: public; Owner: russ
--

CREATE VIEW v_clients AS
 SELECT clients.id,
    clients.name,
    clients.surname,
    clients.code,
    clients.email,
    clients.country,
    clients.town,
    clients.address,
    clients.created_at,
    clients.updated_at
   FROM clients;


ALTER TABLE v_clients OWNER TO russ;

--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: russ
--

ALTER TABLE ONLY clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: russ
--

ALTER TABLE ONLY migrations ALTER COLUMN id SET DEFAULT nextval('migrations_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: russ
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: russ
--

COPY clients (id, name, surname, code, email, country, town, address, created_at, updated_at) FROM stdin;
\.


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: russ
--

SELECT pg_catalog.setval('clients_id_seq', 11, true);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: russ
--

COPY migrations (id, migration, batch) FROM stdin;
1	2014_10_12_000000_create_users_table	1
2	2014_10_12_100000_create_password_resets_table	1
3	2017_07_15_142320_create_clients_table	1
4	2017_07_15_162729_create_clients_view	2
5	2017_07_15_163212_fun_client_delete	3
6	2017_07_15_164201_fun_client_insert	4
7	2017_07_15_164710_fun_client_update	5
8	2017_07_16_054816_fix_timestamps	6
\.


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: russ
--

SELECT pg_catalog.setval('migrations_id_seq', 8, true);


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: russ
--

COPY password_resets (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: russ
--

COPY users (id, name, email, password, remember_token, created_at, updated_at) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: russ
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: clients clients_email_unique; Type: CONSTRAINT; Schema: public; Owner: russ
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_email_unique UNIQUE (email);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: russ
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: russ
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: russ
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: russ
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: password_resets_email_index; Type: INDEX; Schema: public; Owner: russ
--

CREATE INDEX password_resets_email_index ON password_resets USING btree (email);


--
-- Name: clients t_clients_updated_at; Type: TRIGGER; Schema: public; Owner: russ
--

CREATE TRIGGER t_clients_updated_at BEFORE UPDATE ON clients FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

