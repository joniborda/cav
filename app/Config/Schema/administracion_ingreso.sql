--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.12
-- Dumped by pg_dump version 9.4.1
-- Started on 2015-05-13 23:53:21

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = femicidio, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 2098 (class 1259 OID 220899)
-- Name: administracion_ingreso; Type: TABLE; Schema: femicidio; Owner: femicidio; Tablespace: 
--

CREATE TABLE administracion_ingreso (
    id integer NOT NULL,
    descripcion character varying(100)
);


ALTER TABLE administracion_ingreso OWNER TO femicidio;

--
-- TOC entry 2097 (class 1259 OID 220897)
-- Name: administracion_ingreso_id_seq; Type: SEQUENCE; Schema: femicidio; Owner: femicidio
--

CREATE SEQUENCE administracion_ingreso_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administracion_ingreso_id_seq OWNER TO femicidio;

--
-- TOC entry 10415 (class 0 OID 0)
-- Dependencies: 2097
-- Name: administracion_ingreso_id_seq; Type: SEQUENCE OWNED BY; Schema: femicidio; Owner: femicidio
--

ALTER SEQUENCE administracion_ingreso_id_seq OWNED BY administracion_ingreso.id;


--
-- TOC entry 10216 (class 2604 OID 220902)
-- Name: id; Type: DEFAULT; Schema: femicidio; Owner: femicidio
--

ALTER TABLE ONLY administracion_ingreso ALTER COLUMN id SET DEFAULT nextval('administracion_ingreso_id_seq'::regclass);


--
-- TOC entry 10410 (class 0 OID 220899)
-- Dependencies: 2098
-- Data for Name: administracion_ingreso; Type: TABLE DATA; Schema: femicidio; Owner: femicidio
--

INSERT INTO administracion_ingreso (id, descripcion) VALUES (1, 'PROPIA');
INSERT INTO administracion_ingreso (id, descripcion) VALUES (2, 'CON PAREJA');
INSERT INTO administracion_ingreso (id, descripcion) VALUES (3, 'CON EX PAREJA');
INSERT INTO administracion_ingreso (id, descripcion) VALUES (4, 'CON PADRES O HIJOS');
INSERT INTO administracion_ingreso (id, descripcion) VALUES (5, 'OTROS FAMILIARES');
INSERT INTO administracion_ingreso (id, descripcion) VALUES (6, 'OTROS');


--
-- TOC entry 10416 (class 0 OID 0)
-- Dependencies: 2097
-- Name: administracion_ingreso_id_seq; Type: SEQUENCE SET; Schema: femicidio; Owner: femicidio
--

SELECT pg_catalog.setval('administracion_ingreso_id_seq', 6, false);


--
-- TOC entry 10218 (class 2606 OID 220904)
-- Name: administracion_ingreso_pk; Type: CONSTRAINT; Schema: femicidio; Owner: femicidio; Tablespace: 
--

ALTER TABLE ONLY administracion_ingreso
    ADD CONSTRAINT administracion_ingreso_pk PRIMARY KEY (id);


-- Completed on 2015-05-13 23:53:22

--
-- PostgreSQL database dump complete
--

