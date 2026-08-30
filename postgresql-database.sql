--
-- PostgreSQL database dump
--

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 7 (class 2615 OID 16387)
-- Name: pgagent; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA pgagent;

ALTER SCHEMA pgagent OWNER TO postgres;

--
-- TOC entry 5134 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA pgagent; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA pgagent IS 'pgAgent system tables';

--
-- TOC entry 2 (class 3079 OID 16388)
-- Name: pgagent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgagent WITH SCHEMA pgagent;

--
-- TOC entry 5135 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgagent; Type: COMMENT; Schema: -; Owner:
--

COMMENT ON EXTENSION pgagent IS 'A PostgreSQL job scheduler';

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Tabela: produtos
--

CREATE TABLE public.produtos (
    nome character varying(50)
);

ALTER TABLE public.produtos OWNER TO postgres;

--
-- Tabela: usuarios
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    telefone character varying(50) NOT NULL,
    data_nascimento date NOT NULL,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Sequence: usuarios_id_seq
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- Sequence ownership
--

ALTER SEQUENCE public.usuarios_id_seq
OWNED BY public.usuarios.id;

--
-- Valor padrão do ID
--

ALTER TABLE ONLY public.usuarios
ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);

--
-- Dados da tabela produtos
--

COPY public.produtos (nome) FROM stdin;
\.

--
-- Dados da tabela usuarios
--

COPY public.usuarios
(id, nome, telefone, data_nascimento, data_criacao)
FROM stdin;

1	Usuario Teste	859999999	2000-05-13	2026-08-08 20:00:51.56837
2	Usuario Exemplo	859999998	2001-10-20	2026-08-08 20:54:13.219781
3	Usuario Teste 2	87495	1998-10-10	2026-08-08 22:09:37.409407
4	Usuario Teste 3	85971	1999-08-10	2026-08-09 14:40:23.997983
5	Usuario Teste 4	859369	2002-12-17	2026-08-09 15:00:00.000000
\.

--
-- Sequence set
--

SELECT pg_catalog.setval(
    'public.usuarios_id_seq',
    5,
    true
);

--
-- Chave primária
--

ALTER TABLE ONLY public.usuarios
ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);

--
-- PostgreSQL database dump complete
--
