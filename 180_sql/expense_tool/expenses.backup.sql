--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: expenses; Type: TABLE; Schema: public; Owner: walidwahed
--

CREATE TABLE expenses (
    id integer NOT NULL,
    amount numeric(6,2) NOT NULL,
    memo text NOT NULL,
    created_on date NOT NULL,
    CONSTRAINT expenses_amount_check CHECK ((amount > 0.00))
);


ALTER TABLE expenses OWNER TO walidwahed;

--
-- Name: expenses_id_seq; Type: SEQUENCE; Schema: public; Owner: walidwahed
--

CREATE SEQUENCE expenses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE expenses_id_seq OWNER TO walidwahed;

--
-- Name: expenses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: walidwahed
--

ALTER SEQUENCE expenses_id_seq OWNED BY expenses.id;


--
-- Name: expenses id; Type: DEFAULT; Schema: public; Owner: walidwahed
--

ALTER TABLE ONLY expenses ALTER COLUMN id SET DEFAULT nextval('expenses_id_seq'::regclass);


--
-- Data for Name: expenses; Type: TABLE DATA; Schema: public; Owner: walidwahed
--

INSERT INTO expenses VALUES (1, 3.50, 'cookies', '2017-05-08');
INSERT INTO expenses VALUES (2, 4.50, 'bread', '2017-05-08');
INSERT INTO expenses VALUES (3, 2.00, 'coffee', '2017-05-08');
INSERT INTO expenses VALUES (5, 20.00, 'large pizza', '2017-05-08');
INSERT INTO expenses VALUES (6, 15.00, 'premium water', '2017-05-08');
INSERT INTO expenses VALUES (7, 20.00, 'Gas for car', '2017-05-08');


--
-- Name: expenses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: walidwahed
--

SELECT pg_catalog.setval('expenses_id_seq', 7, true);


--
-- Name: expenses expenses_pkey; Type: CONSTRAINT; Schema: public; Owner: walidwahed
--

ALTER TABLE ONLY expenses
    ADD CONSTRAINT expenses_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

