--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.18
-- Dumped by pg_dump version 9.4.4
-- Started on 2015-09-16 14:54:29 ART

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 79895)
-- Name: usuarios; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA usuarios;


ALTER SCHEMA usuarios OWNER TO postgres;

--
-- TOC entry 184 (class 3079 OID 11644)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1990 (class 0 OID 0)
-- Dependencies: 184
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 162 (class 1259 OID 79896)
-- Name: historiales; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE historiales (
    id integer NOT NULL,
    usuario_id integer,
    url character varying,
    parametros character varying,
    navegador character varying,
    ip character varying(30),
    fecha timestamp without time zone DEFAULT now()
);


ALTER TABLE historiales OWNER TO postgres;

--
-- TOC entry 163 (class 1259 OID 79903)
-- Name: historiales_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE historiales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE historiales_id_seq OWNER TO postgres;

--
-- TOC entry 1991 (class 0 OID 0)
-- Dependencies: 163
-- Name: historiales_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE historiales_id_seq OWNED BY historiales.id;


--
-- TOC entry 181 (class 1259 OID 80526)
-- Name: movimientos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movimientos (
    id integer NOT NULL,
    vehiculo_id integer NOT NULL,
    persona_id integer,
    tipo_movimiento character varying(200),
    sector character varying(200),
    interno character varying(20),
    fecha_carga timestamp with time zone DEFAULT now() NOT NULL,
    usuario_id integer NOT NULL,
    horas_predio integer,
    minutos_predio integer
);


ALTER TABLE movimientos OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 80524)
-- Name: movimientos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE movimientos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE movimientos_id_seq OWNER TO postgres;

--
-- TOC entry 1992 (class 0 OID 0)
-- Dependencies: 180
-- Name: movimientos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE movimientos_id_seq OWNED BY movimientos.id;


--
-- TOC entry 166 (class 1259 OID 79919)
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personas (
    id integer NOT NULL,
    nombre character varying(40),
    apellido character varying(40),
    numero_documento character varying(30),
    telefono character varying(30)
);


ALTER TABLE personas OWNER TO postgres;

--
-- TOC entry 167 (class 1259 OID 79922)
-- Name: personas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas_id_seq OWNER TO postgres;

--
-- TOC entry 1993 (class 0 OID 0)
-- Dependencies: 167
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE personas_id_seq OWNED BY personas.id;


--
-- TOC entry 164 (class 1259 OID 79905)
-- Name: vehiculos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE vehiculos (
    id integer NOT NULL,
    patente character varying(20),
    color character varying(30),
    descripcion character varying,
    tipo_autorizacion character varying(20) NOT NULL
);


ALTER TABLE vehiculos OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 88813)
-- Name: v_vehiculos_adentro; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW v_vehiculos_adentro AS
SELECT m1.vehiculo_id, v.patente, v.tipo_autorizacion, m1.id AS movimiento_id, m1.persona_id, m1.sector, m1.interno, m1.fecha_carga, m1.usuario_id FROM (movimientos m1 JOIN vehiculos v ON ((v.id = m1.vehiculo_id))) WHERE ((m1.id IN (SELECT m.id FROM movimientos m WHERE (m.vehiculo_id = m1.vehiculo_id) ORDER BY m.id DESC LIMIT 1)) AND ((m1.tipo_movimiento)::text = 'ENTRADA'::text));


ALTER TABLE v_vehiculos_adentro OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 181289)
-- Name: v_vehiculos_excedidos; Type: VIEW; Schema: public; Owner: jborda
--

CREATE VIEW v_vehiculos_excedidos AS
SELECT m1.vehiculo_id, v.patente, v.tipo_autorizacion, m1.id AS movimiento_id, m1.persona_id, m1.sector, m1.interno, m1.fecha_carga, m1.usuario_id FROM (movimientos m1 JOIN vehiculos v ON ((v.id = m1.vehiculo_id))) WHERE ((((m1.id IN (SELECT m.id FROM movimientos m WHERE (m.vehiculo_id = m1.vehiculo_id) ORDER BY m.id DESC LIMIT 1)) AND ((m1.tipo_movimiento)::text = 'ENTRADA'::text)) AND (((m1.fecha_carga + ((COALESCE(m1.horas_predio, 0) || 'hours'::text))::interval) + ((COALESCE(m1.minutos_predio, 0) || 'minutes'::text))::interval) < now())) AND ((v.tipo_autorizacion)::text <> 'AUTORIZADO'::text));


--ALTER TABLE v_vehiculos_excedidos OWNER TO jborda;

--
-- TOC entry 165 (class 1259 OID 79911)
-- Name: vehiculos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE vehiculos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiculos_id_seq OWNER TO postgres;

--
-- TOC entry 1994 (class 0 OID 0)
-- Dependencies: 165
-- Name: vehiculos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE vehiculos_id_seq OWNED BY vehiculos.id;


SET search_path = usuarios, pg_catalog;

--
-- TOC entry 168 (class 1259 OID 79924)
-- Name: grupos; Type: TABLE; Schema: usuarios; Owner: postgres; Tablespace: 
--

CREATE TABLE grupos (
    id integer NOT NULL,
    descripcion character varying(30)
);


ALTER TABLE grupos OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 79927)
-- Name: grupos_urls; Type: TABLE; Schema: usuarios; Owner: postgres; Tablespace: 
--

CREATE TABLE grupos_urls (
    id integer NOT NULL,
    grupo_id integer,
    url_id integer
);


ALTER TABLE grupos_urls OWNER TO postgres;

--
-- TOC entry 170 (class 1259 OID 79930)
-- Name: ruv_actions_ruv_groups_id_seq; Type: SEQUENCE; Schema: usuarios; Owner: postgres
--

CREATE SEQUENCE ruv_actions_ruv_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ruv_actions_ruv_groups_id_seq OWNER TO postgres;

--
-- TOC entry 1995 (class 0 OID 0)
-- Dependencies: 170
-- Name: ruv_actions_ruv_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: usuarios; Owner: postgres
--

ALTER SEQUENCE ruv_actions_ruv_groups_id_seq OWNED BY grupos_urls.id;


--
-- TOC entry 171 (class 1259 OID 79932)
-- Name: ruv_groups_id_seq; Type: SEQUENCE; Schema: usuarios; Owner: postgres
--

CREATE SEQUENCE ruv_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ruv_groups_id_seq OWNER TO postgres;

--
-- TOC entry 1996 (class 0 OID 0)
-- Dependencies: 171
-- Name: ruv_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: usuarios; Owner: postgres
--

ALTER SEQUENCE ruv_groups_id_seq OWNED BY grupos.id;


--
-- TOC entry 172 (class 1259 OID 79934)
-- Name: urls; Type: TABLE; Schema: usuarios; Owner: postgres; Tablespace: 
--

CREATE TABLE urls (
    id integer NOT NULL,
    descripcion character varying(100)
);


ALTER TABLE urls OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 79937)
-- Name: urls_id_seq; Type: SEQUENCE; Schema: usuarios; Owner: postgres
--

CREATE SEQUENCE urls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE urls_id_seq OWNER TO postgres;

--
-- TOC entry 1997 (class 0 OID 0)
-- Dependencies: 173
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: usuarios; Owner: postgres
--

ALTER SEQUENCE urls_id_seq OWNED BY urls.id;


--
-- TOC entry 174 (class 1259 OID 79939)
-- Name: usuarios; Type: TABLE; Schema: usuarios; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
    id integer NOT NULL,
    password character varying(32),
    usuario_login character varying(50) NOT NULL,
    modified timestamp without time zone,
    created timestamp without time zone,
    apellido character varying(50),
    nombre character varying(50),
    email character varying(255),
    tokenhash character varying(255)
);


ALTER TABLE usuarios OWNER TO postgres;

--
-- TOC entry 1998 (class 0 OID 0)
-- Dependencies: 174
-- Name: COLUMN usuarios.id; Type: COMMENT; Schema: usuarios; Owner: postgres
--

COMMENT ON COLUMN usuarios.id IS 'id del pescadito -- no se usa por el momento';


--
-- TOC entry 175 (class 1259 OID 79945)
-- Name: usuarios_grupos; Type: TABLE; Schema: usuarios; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios_grupos (
    id integer NOT NULL,
    usuario_id integer,
    grupo_id integer
);


ALTER TABLE usuarios_grupos OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 79948)
-- Name: usuarios_grupos_id_seq; Type: SEQUENCE; Schema: usuarios; Owner: postgres
--

CREATE SEQUENCE usuarios_grupos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuarios_grupos_id_seq OWNER TO postgres;

--
-- TOC entry 1999 (class 0 OID 0)
-- Dependencies: 176
-- Name: usuarios_grupos_id_seq; Type: SEQUENCE OWNED BY; Schema: usuarios; Owner: postgres
--

ALTER SEQUENCE usuarios_grupos_id_seq OWNED BY usuarios_grupos.id;


--
-- TOC entry 177 (class 1259 OID 79950)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: usuarios; Owner: postgres
--

CREATE SEQUENCE usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 2000 (class 0 OID 0)
-- Dependencies: 177
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: usuarios; Owner: postgres
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- TOC entry 178 (class 1259 OID 79952)
-- Name: usuarios_table_id; Type: SEQUENCE; Schema: usuarios; Owner: postgres
--

CREATE SEQUENCE usuarios_table_id
    START WITH 72
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuarios_table_id OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 79954)
-- Name: usuarios_table_id_seq; Type: SEQUENCE; Schema: usuarios; Owner: postgres
--

CREATE SEQUENCE usuarios_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuarios_table_id_seq OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 1817 (class 2604 OID 79956)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY historiales ALTER COLUMN id SET DEFAULT nextval('historiales_id_seq'::regclass);


--
-- TOC entry 1825 (class 2604 OID 80529)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimientos ALTER COLUMN id SET DEFAULT nextval('movimientos_id_seq'::regclass);


--
-- TOC entry 1819 (class 2604 OID 79958)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas ALTER COLUMN id SET DEFAULT nextval('personas_id_seq'::regclass);


--
-- TOC entry 1818 (class 2604 OID 79959)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculos ALTER COLUMN id SET DEFAULT nextval('vehiculos_id_seq'::regclass);


SET search_path = usuarios, pg_catalog;

--
-- TOC entry 1820 (class 2604 OID 79960)
-- Name: id; Type: DEFAULT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY grupos ALTER COLUMN id SET DEFAULT nextval('ruv_groups_id_seq'::regclass);


--
-- TOC entry 1821 (class 2604 OID 79961)
-- Name: id; Type: DEFAULT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY grupos_urls ALTER COLUMN id SET DEFAULT nextval('ruv_actions_ruv_groups_id_seq'::regclass);


--
-- TOC entry 1822 (class 2604 OID 79962)
-- Name: id; Type: DEFAULT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY urls ALTER COLUMN id SET DEFAULT nextval('urls_id_seq'::regclass);


--
-- TOC entry 1823 (class 2604 OID 79963)
-- Name: id; Type: DEFAULT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- TOC entry 1824 (class 2604 OID 79964)
-- Name: id; Type: DEFAULT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios_grupos ALTER COLUMN id SET DEFAULT nextval('usuarios_grupos_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 1963 (class 0 OID 79896)
-- Dependencies: 162
-- Data for Name: historiales; Type: TABLE DATA; Schema: public; Owner: postgres
--
--
-- TOC entry 2001 (class 0 OID 0)
-- Dependencies: 163
-- Name: historiales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('historiales_id_seq', 371, true);


--
-- TOC entry 1982 (class 0 OID 80526)
-- Dependencies: 181
-- Data for Name: movimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2002 (class 0 OID 0)
-- Dependencies: 180
-- Name: movimientos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('movimientos_id_seq', 1, true);


--
-- TOC entry 1967 (class 0 OID 79919)
-- Dependencies: 166
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2003 (class 0 OID 0)
-- Dependencies: 167
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personas_id_seq', 1, true);


--
-- TOC entry 1965 (class 0 OID 79905)
-- Dependencies: 164
-- Data for Name: vehiculos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2004 (class 0 OID 0)
-- Dependencies: 165
-- Name: vehiculos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vehiculos_id_seq', 1, true);


SET search_path = usuarios, pg_catalog;

--
-- TOC entry 1969 (class 0 OID 79924)
-- Dependencies: 168
-- Data for Name: grupos; Type: TABLE DATA; Schema: usuarios; Owner: postgres
--

INSERT INTO grupos VALUES (1, 'administrador');
INSERT INTO grupos VALUES (3, 'CAV_ADMIN');
INSERT INTO grupos VALUES (2, 'seguridad');


--
-- TOC entry 1970 (class 0 OID 79927)
-- Dependencies: 169
-- Data for Name: grupos_urls; Type: TABLE DATA; Schema: usuarios; Owner: postgres
--

INSERT INTO grupos_urls VALUES (1, 3, 1);
INSERT INTO grupos_urls VALUES (2, 3, 20);
INSERT INTO grupos_urls VALUES (3, 3, 21);
INSERT INTO grupos_urls VALUES (4, 3, 22);
INSERT INTO grupos_urls VALUES (5, 3, 23);
INSERT INTO grupos_urls VALUES (6, 3, 24);
INSERT INTO grupos_urls VALUES (7, 3, 25);
INSERT INTO grupos_urls VALUES (8, 3, 26);
INSERT INTO grupos_urls VALUES (9, 3, 27);
INSERT INTO grupos_urls VALUES (10, 3, 28);
INSERT INTO grupos_urls VALUES (11, 3, 29);
INSERT INTO grupos_urls VALUES (12, 3, 30);
INSERT INTO grupos_urls VALUES (13, 3, 31);
INSERT INTO grupos_urls VALUES (14, 3, 32);
INSERT INTO grupos_urls VALUES (15, 3, 33);
INSERT INTO grupos_urls VALUES (16, 3, 34);
INSERT INTO grupos_urls VALUES (17, 3, 35);
INSERT INTO grupos_urls VALUES (18, 3, 36);
INSERT INTO grupos_urls VALUES (19, 3, 37);
INSERT INTO grupos_urls VALUES (20, 3, 38);
INSERT INTO grupos_urls VALUES (21, 3, 39);
INSERT INTO grupos_urls VALUES (22, 3, 40);
INSERT INTO grupos_urls VALUES (23, 3, 41);
INSERT INTO grupos_urls VALUES (24, 3, 42);
INSERT INTO grupos_urls VALUES (25, 3, 43);
INSERT INTO grupos_urls VALUES (26, 3, 44);
INSERT INTO grupos_urls VALUES (27, 3, 45);
INSERT INTO grupos_urls VALUES (28, 3, 46);
INSERT INTO grupos_urls VALUES (29, 3, 47);
INSERT INTO grupos_urls VALUES (30, 3, 48);
INSERT INTO grupos_urls VALUES (31, 3, 49);
INSERT INTO grupos_urls VALUES (32, 3, 50);
INSERT INTO grupos_urls VALUES (33, 3, 51);
INSERT INTO grupos_urls VALUES (34, 3, 52);
INSERT INTO grupos_urls VALUES (35, 3, 59);
INSERT INTO grupos_urls VALUES (36, 3, 60);
INSERT INTO grupos_urls VALUES (37, 3, 61);
INSERT INTO grupos_urls VALUES (38, 3, 62);
INSERT INTO grupos_urls VALUES (39, 3, 63);
INSERT INTO grupos_urls VALUES (40, 3, 64);
INSERT INTO grupos_urls VALUES (41, 3, 65);
INSERT INTO grupos_urls VALUES (42, 3, 66);
INSERT INTO grupos_urls VALUES (43, 3, 67);
INSERT INTO grupos_urls VALUES (44, 3, 68);
INSERT INTO grupos_urls VALUES (45, 3, 69);
INSERT INTO grupos_urls VALUES (46, 3, 70);
INSERT INTO grupos_urls VALUES (47, 3, 71);
INSERT INTO grupos_urls VALUES (48, 3, 72);
INSERT INTO grupos_urls VALUES (49, 3, 73);
INSERT INTO grupos_urls VALUES (50, 3, 74);
INSERT INTO grupos_urls VALUES (51, 3, 75);
INSERT INTO grupos_urls VALUES (52, 3, 76);
INSERT INTO grupos_urls VALUES (53, 3, 77);
INSERT INTO grupos_urls VALUES (54, 3, 78);
INSERT INTO grupos_urls VALUES (55, 3, 79);
INSERT INTO grupos_urls VALUES (56, 2, 20);
INSERT INTO grupos_urls VALUES (57, 2, 21);
INSERT INTO grupos_urls VALUES (58, 2, 22);
INSERT INTO grupos_urls VALUES (59, 2, 23);
INSERT INTO grupos_urls VALUES (60, 2, 24);
INSERT INTO grupos_urls VALUES (61, 2, 25);
INSERT INTO grupos_urls VALUES (62, 2, 26);
INSERT INTO grupos_urls VALUES (63, 2, 27);
INSERT INTO grupos_urls VALUES (64, 2, 28);
INSERT INTO grupos_urls VALUES (65, 2, 29);
INSERT INTO grupos_urls VALUES (66, 2, 30);
INSERT INTO grupos_urls VALUES (67, 2, 31);
INSERT INTO grupos_urls VALUES (68, 2, 32);
INSERT INTO grupos_urls VALUES (69, 2, 33);
INSERT INTO grupos_urls VALUES (70, 2, 34);
INSERT INTO grupos_urls VALUES (71, 2, 35);
INSERT INTO grupos_urls VALUES (72, 2, 42);
INSERT INTO grupos_urls VALUES (73, 2, 43);
INSERT INTO grupos_urls VALUES (74, 2, 44);
INSERT INTO grupos_urls VALUES (75, 2, 45);
INSERT INTO grupos_urls VALUES (76, 2, 47);
INSERT INTO grupos_urls VALUES (77, 2, 49);
INSERT INTO grupos_urls VALUES (78, 2, 50);
INSERT INTO grupos_urls VALUES (79, 2, 52);
INSERT INTO grupos_urls VALUES (80, 2, 59);
INSERT INTO grupos_urls VALUES (81, 2, 60);
INSERT INTO grupos_urls VALUES (82, 2, 61);
INSERT INTO grupos_urls VALUES (83, 2, 62);
INSERT INTO grupos_urls VALUES (84, 2, 63);
INSERT INTO grupos_urls VALUES (85, 2, 64);
INSERT INTO grupos_urls VALUES (86, 2, 65);
INSERT INTO grupos_urls VALUES (87, 2, 66);
INSERT INTO grupos_urls VALUES (88, 2, 67);
INSERT INTO grupos_urls VALUES (89, 2, 68);
INSERT INTO grupos_urls VALUES (90, 2, 69);
INSERT INTO grupos_urls VALUES (91, 2, 70);
INSERT INTO grupos_urls VALUES (92, 2, 71);
INSERT INTO grupos_urls VALUES (93, 2, 72);
INSERT INTO grupos_urls VALUES (94, 2, 73);
INSERT INTO grupos_urls VALUES (95, 2, 74);
INSERT INTO grupos_urls VALUES (96, 2, 75);
INSERT INTO grupos_urls VALUES (97, 2, 76);
INSERT INTO grupos_urls VALUES (98, 2, 77);
INSERT INTO grupos_urls VALUES (99, 2, 78);
INSERT INTO grupos_urls VALUES (100, 2, 79);


--
-- TOC entry 2005 (class 0 OID 0)
-- Dependencies: 170
-- Name: ruv_actions_ruv_groups_id_seq; Type: SEQUENCE SET; Schema: usuarios; Owner: postgres
--

SELECT pg_catalog.setval('ruv_actions_ruv_groups_id_seq', 100, true);


--
-- TOC entry 2006 (class 0 OID 0)
-- Dependencies: 171
-- Name: ruv_groups_id_seq; Type: SEQUENCE SET; Schema: usuarios; Owner: postgres
--

SELECT pg_catalog.setval('ruv_groups_id_seq', 3, true);


--
-- TOC entry 1973 (class 0 OID 79934)
-- Dependencies: 172
-- Data for Name: urls; Type: TABLE DATA; Schema: usuarios; Owner: postgres
--

INSERT INTO urls VALUES (1, 'admin/admin/index');
INSERT INTO urls VALUES (2, 'admin/grupos/index');
INSERT INTO urls VALUES (3, 'admin/grupos/view');
INSERT INTO urls VALUES (4, 'admin/grupos/add');
INSERT INTO urls VALUES (5, 'admin/grupos/edit');
INSERT INTO urls VALUES (6, 'admin/grupos/delete');
INSERT INTO urls VALUES (7, 'admin/grupos/find');
INSERT INTO urls VALUES (8, 'admin/grupos_urls/index');
INSERT INTO urls VALUES (9, 'admin/grupos_urls/view');
INSERT INTO urls VALUES (10, 'admin/grupos_urls/add');
INSERT INTO urls VALUES (11, 'admin/grupos_urls/edit');
INSERT INTO urls VALUES (12, 'admin/grupos_urls/delete');
INSERT INTO urls VALUES (13, 'admin/grupos_urls/find');
INSERT INTO urls VALUES (14, 'admin/historiales/index');
INSERT INTO urls VALUES (15, 'admin/historiales/view');
INSERT INTO urls VALUES (16, 'admin/historiales/add');
INSERT INTO urls VALUES (17, 'admin/historiales/edit');
INSERT INTO urls VALUES (18, 'admin/historiales/delete');
INSERT INTO urls VALUES (19, 'admin/historiales/find');
INSERT INTO urls VALUES (20, 'admin/movimientos/index');
INSERT INTO urls VALUES (21, 'admin/movimientos/view');
INSERT INTO urls VALUES (22, 'admin/movimientos/add');
INSERT INTO urls VALUES (23, 'admin/movimientos/edit');
INSERT INTO urls VALUES (24, 'admin/movimientos/delete');
INSERT INTO urls VALUES (25, 'admin/movimientos/find');
INSERT INTO urls VALUES (26, 'admin/pages/display');
INSERT INTO urls VALUES (27, 'admin/pages/display');
INSERT INTO urls VALUES (28, 'admin/personas/index');
INSERT INTO urls VALUES (29, 'admin/personas/view');
INSERT INTO urls VALUES (30, 'admin/personas/add');
INSERT INTO urls VALUES (31, 'admin/personas/edit');
INSERT INTO urls VALUES (32, 'admin/personas/delete');
INSERT INTO urls VALUES (33, 'admin/personas/find');
INSERT INTO urls VALUES (34, 'admin/personas/busqueda_dni');
INSERT INTO urls VALUES (35, 'admin/personas/add_ajax');
INSERT INTO urls VALUES (36, 'admin/urls/index');
INSERT INTO urls VALUES (37, 'admin/urls/view');
INSERT INTO urls VALUES (38, 'admin/urls/add');
INSERT INTO urls VALUES (39, 'admin/urls/edit');
INSERT INTO urls VALUES (40, 'admin/urls/delete');
INSERT INTO urls VALUES (41, 'admin/urls/find');
INSERT INTO urls VALUES (42, 'admin/usuarios/forgetpwd');
INSERT INTO urls VALUES (43, 'admin/usuarios/reset');
INSERT INTO urls VALUES (44, 'admin/usuarios/index');
INSERT INTO urls VALUES (45, 'admin/usuarios/view');
INSERT INTO urls VALUES (46, 'admin/usuarios/add');
INSERT INTO urls VALUES (47, 'admin/usuarios/edit');
INSERT INTO urls VALUES (48, 'admin/usuarios/delete');
INSERT INTO urls VALUES (49, 'admin/usuarios/login');
INSERT INTO urls VALUES (50, 'admin/usuarios/logout');
INSERT INTO urls VALUES (51, 'admin/usuarios/find');
INSERT INTO urls VALUES (52, 'admin/usuarios/perfil');
INSERT INTO urls VALUES (53, 'admin/usuarios_grupos/index');
INSERT INTO urls VALUES (54, 'admin/usuarios_grupos/view');
INSERT INTO urls VALUES (55, 'admin/usuarios_grupos/add');
INSERT INTO urls VALUES (56, 'admin/usuarios_grupos/edit');
INSERT INTO urls VALUES (57, 'admin/usuarios_grupos/delete');
INSERT INTO urls VALUES (58, 'admin/usuarios_grupos/find');
INSERT INTO urls VALUES (59, 'admin/v_vehiculos_adentros/index');
INSERT INTO urls VALUES (60, 'admin/v_vehiculos_adentros/view');
INSERT INTO urls VALUES (61, 'admin/v_vehiculos_adentros/add');
INSERT INTO urls VALUES (62, 'admin/v_vehiculos_adentros/edit');
INSERT INTO urls VALUES (63, 'admin/v_vehiculos_adentros/delete');
INSERT INTO urls VALUES (64, 'admin/v_vehiculos_adentros/find');
INSERT INTO urls VALUES (65, 'admin/v_vehiculos_excedidos/index');
INSERT INTO urls VALUES (66, 'admin/v_vehiculos_excedidos/view');
INSERT INTO urls VALUES (67, 'admin/v_vehiculos_excedidos/add');
INSERT INTO urls VALUES (68, 'admin/v_vehiculos_excedidos/edit');
INSERT INTO urls VALUES (69, 'admin/v_vehiculos_excedidos/delete');
INSERT INTO urls VALUES (70, 'admin/v_vehiculos_excedidos/find');
INSERT INTO urls VALUES (71, 'admin/vehiculos/index');
INSERT INTO urls VALUES (72, 'admin/vehiculos/view');
INSERT INTO urls VALUES (73, 'admin/vehiculos/add');
INSERT INTO urls VALUES (74, 'admin/vehiculos/edit');
INSERT INTO urls VALUES (75, 'admin/vehiculos/delete');
INSERT INTO urls VALUES (76, 'admin/vehiculos/find');
INSERT INTO urls VALUES (77, 'admin/vehiculos/busqueda_patente');
INSERT INTO urls VALUES (78, 'admin/vehiculos/add_ajax');
INSERT INTO urls VALUES (79, 'admin/vehiculos/cargar_modelos');


--
-- TOC entry 2007 (class 0 OID 0)
-- Dependencies: 173
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: usuarios; Owner: postgres
--

SELECT pg_catalog.setval('urls_id_seq', 79, true);


--
-- TOC entry 1975 (class 0 OID 79939)
-- Dependencies: 174
-- Data for Name: usuarios; Type: TABLE DATA; Schema: usuarios; Owner: postgres
--

INSERT INTO usuarios VALUES (2, 'fd09accffacf03d7393c2a23a9601b43', 'melizondo', '2015-09-16 13:14:14', '2015-09-16 13:13:53', '', '', '', NULL);
INSERT INTO usuarios VALUES (3, 'fd09accffacf03d7393c2a23a9601b43', 'dzuretti', '2015-09-16 13:21:50', '2015-09-16 13:20:52', '', '', '', NULL);
INSERT INTO usuarios VALUES (4, 'fd09accffacf03d7393c2a23a9601b43', 'babasolo', '2015-09-16 13:22:49', '2015-09-16 13:22:33', '', '', '', NULL);
INSERT INTO usuarios VALUES (1, '5405eff412e4238815bf020cdcde72e5', 'admin', '2015-09-16 13:23:47', NULL, NULL, NULL, NULL, NULL);
INSERT INTO usuarios VALUES (5, 'fd09accffacf03d7393c2a23a9601b43', 'atarnopolsky', '2015-09-16 13:34:44', '2015-09-16 13:24:38', '', '', '', NULL);
INSERT INTO usuarios VALUES (6, 'fd09accffacf03d7393c2a23a9601b43', 'jdonadon', '2015-09-16 13:35:01', '2015-09-16 13:34:35', '', '', '', NULL);
INSERT INTO usuarios VALUES (7, 'fd09accffacf03d7393c2a23a9601b43', 'operez', '2015-09-16 13:38:34', '2015-09-16 13:38:08', '', '', '', NULL);
INSERT INTO usuarios VALUES (8, 'fd09accffacf03d7393c2a23a9601b43', 'descobar', '2015-09-16 13:40:28', '2015-09-16 13:40:15', '', '', '', NULL);
INSERT INTO usuarios VALUES (9, 'fd09accffacf03d7393c2a23a9601b43', 'fbeuzer', '2015-09-16 13:42:03', '2015-09-16 13:41:50', '', '', '', NULL);
INSERT INTO usuarios VALUES (10, 'fd09accffacf03d7393c2a23a9601b43', 'cgallardo', '2015-09-16 13:43:07', '2015-09-16 13:42:57', '', '', '', NULL);
INSERT INTO usuarios VALUES (11, 'fd09accffacf03d7393c2a23a9601b43', 'jtamae', '2015-09-16 13:44:28', '2015-09-16 13:43:46', '', '', '', NULL);
INSERT INTO usuarios VALUES (12, 'fd09accffacf03d7393c2a23a9601b43', 'fmarkich', '2015-09-16 13:50:28', '2015-09-16 13:50:06', '', '', '', NULL);
INSERT INTO usuarios VALUES (13, 'fd09accffacf03d7393c2a23a9601b43', 'nbrum', '2015-09-16 13:57:01', '2015-09-16 13:56:42', '', '', '', NULL);
INSERT INTO usuarios VALUES (14, 'fd09accffacf03d7393c2a23a9601b43', 'gteguidengui', '2015-09-16 14:03:49', '2015-09-16 14:03:40', '', '', '', NULL);
INSERT INTO usuarios VALUES (15, 'fd09accffacf03d7393c2a23a9601b43', 'mmendez', '2015-09-16 14:04:54', '2015-09-16 14:04:43', '', '', '', NULL);
INSERT INTO usuarios VALUES (16, 'fd09accffacf03d7393c2a23a9601b43', 'abuiatti', '2015-09-16 14:17:37', '2015-09-16 14:05:43', '', '', '', NULL);


--
-- TOC entry 1976 (class 0 OID 79945)
-- Dependencies: 175
-- Data for Name: usuarios_grupos; Type: TABLE DATA; Schema: usuarios; Owner: postgres
--

INSERT INTO usuarios_grupos VALUES (1, 1, 1);
INSERT INTO usuarios_grupos VALUES (2, 2, 3);
INSERT INTO usuarios_grupos VALUES (3, 3, 3);
INSERT INTO usuarios_grupos VALUES (4, 4, 3);
INSERT INTO usuarios_grupos VALUES (5, 5, 3);
INSERT INTO usuarios_grupos VALUES (6, 6, 2);
INSERT INTO usuarios_grupos VALUES (7, 7, 2);
INSERT INTO usuarios_grupos VALUES (8, 8, 2);
INSERT INTO usuarios_grupos VALUES (9, 9, 2);
INSERT INTO usuarios_grupos VALUES (10, 10, 2);
INSERT INTO usuarios_grupos VALUES (11, 11, 2);
INSERT INTO usuarios_grupos VALUES (12, 12, 2);
INSERT INTO usuarios_grupos VALUES (13, 13, 2);
INSERT INTO usuarios_grupos VALUES (14, 14, 2);
INSERT INTO usuarios_grupos VALUES (15, 15, 2);
INSERT INTO usuarios_grupos VALUES (16, 16, 2);


--
-- TOC entry 2008 (class 0 OID 0)
-- Dependencies: 176
-- Name: usuarios_grupos_id_seq; Type: SEQUENCE SET; Schema: usuarios; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_grupos_id_seq', 16, true);


--
-- TOC entry 2009 (class 0 OID 0)
-- Dependencies: 177
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: usuarios; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_id_seq', 16, true);


--
-- TOC entry 2010 (class 0 OID 0)
-- Dependencies: 178
-- Name: usuarios_table_id; Type: SEQUENCE SET; Schema: usuarios; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_table_id', 72, false);


--
-- TOC entry 2011 (class 0 OID 0)
-- Dependencies: 179
-- Name: usuarios_table_id_seq; Type: SEQUENCE SET; Schema: usuarios; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_table_id_seq', 1, false);


SET search_path = public, pg_catalog;

--
-- TOC entry 1828 (class 2606 OID 79966)
-- Name: historial_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY historiales
    ADD CONSTRAINT historial_pk PRIMARY KEY (id);


--
-- TOC entry 1852 (class 2606 OID 80532)
-- Name: movimientos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movimientos
    ADD CONSTRAINT movimientos_pk PRIMARY KEY (id);


--
-- TOC entry 1834 (class 2606 OID 79970)
-- Name: personas_dni; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT personas_dni UNIQUE (numero_documento);


--
-- TOC entry 1836 (class 2606 OID 79972)
-- Name: personas_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT personas_pk PRIMARY KEY (id);


--
-- TOC entry 1830 (class 2606 OID 80039)
-- Name: vehiculos_patente_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vehiculos
    ADD CONSTRAINT vehiculos_patente_unique UNIQUE (patente);


--
-- TOC entry 1832 (class 2606 OID 79976)
-- Name: vehiculos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vehiculos
    ADD CONSTRAINT vehiculos_pk PRIMARY KEY (id);


SET search_path = usuarios, pg_catalog;

--
-- TOC entry 1842 (class 2606 OID 79978)
-- Name: ruv_acciones_pkey; Type: CONSTRAINT; Schema: usuarios; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY urls
    ADD CONSTRAINT ruv_acciones_pkey PRIMARY KEY (id);


--
-- TOC entry 1840 (class 2606 OID 79980)
-- Name: ruv_acciones_ruv_grupos_pkey; Type: CONSTRAINT; Schema: usuarios; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY grupos_urls
    ADD CONSTRAINT ruv_acciones_ruv_grupos_pkey PRIMARY KEY (id);


--
-- TOC entry 1838 (class 2606 OID 79982)
-- Name: ruv_groups_pk; Type: CONSTRAINT; Schema: usuarios; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY grupos
    ADD CONSTRAINT ruv_groups_pk PRIMARY KEY (id);


--
-- TOC entry 1850 (class 2606 OID 79984)
-- Name: usuarios_grupos_pk; Type: CONSTRAINT; Schema: usuarios; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios_grupos
    ADD CONSTRAINT usuarios_grupos_pk PRIMARY KEY (id);


--
-- TOC entry 1844 (class 2606 OID 79986)
-- Name: usuarios_index; Type: CONSTRAINT; Schema: usuarios; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_index UNIQUE (usuario_login);


--
-- TOC entry 1846 (class 2606 OID 79988)
-- Name: usuarios_pk; Type: CONSTRAINT; Schema: usuarios; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pk PRIMARY KEY (id);


--
-- TOC entry 1847 (class 1259 OID 79989)
-- Name: fki_usuarios_grupos_grupos_fk; Type: INDEX; Schema: usuarios; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_usuarios_grupos_grupos_fk ON usuarios_grupos USING btree (grupo_id);


--
-- TOC entry 1848 (class 1259 OID 79990)
-- Name: fki_usuarios_grupos_usuarios_fk; Type: INDEX; Schema: usuarios; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_usuarios_grupos_usuarios_fk ON usuarios_grupos USING btree (usuario_id);


SET search_path = public, pg_catalog;

--
-- TOC entry 1857 (class 2606 OID 80533)
-- Name: movimientos_personas_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimientos
    ADD CONSTRAINT movimientos_personas_fk FOREIGN KEY (persona_id) REFERENCES personas(id);


--
-- TOC entry 1858 (class 2606 OID 80538)
-- Name: movimientos_usuarios_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimientos
    ADD CONSTRAINT movimientos_usuarios_fk FOREIGN KEY (usuario_id) REFERENCES usuarios.usuarios(id);


--
-- TOC entry 1859 (class 2606 OID 80543)
-- Name: movimientos_vehiculos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimientos
    ADD CONSTRAINT movimientos_vehiculos_fk FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(id);


SET search_path = usuarios, pg_catalog;

--
-- TOC entry 1853 (class 2606 OID 80006)
-- Name: grupo_urls_grupos_fk; Type: FK CONSTRAINT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY grupos_urls
    ADD CONSTRAINT grupo_urls_grupos_fk FOREIGN KEY (grupo_id) REFERENCES grupos(id);


--
-- TOC entry 1854 (class 2606 OID 80011)
-- Name: grupos_urls_urls_fk; Type: FK CONSTRAINT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY grupos_urls
    ADD CONSTRAINT grupos_urls_urls_fk FOREIGN KEY (url_id) REFERENCES urls(id);


--
-- TOC entry 1855 (class 2606 OID 80016)
-- Name: usuarios_grupos_grupos_fk; Type: FK CONSTRAINT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios_grupos
    ADD CONSTRAINT usuarios_grupos_grupos_fk FOREIGN KEY (grupo_id) REFERENCES grupos(id);


--
-- TOC entry 1856 (class 2606 OID 80021)
-- Name: usuarios_grupos_usuarios_fk; Type: FK CONSTRAINT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios_grupos
    ADD CONSTRAINT usuarios_grupos_usuarios_fk FOREIGN KEY (usuario_id) REFERENCES usuarios(id);


--
-- TOC entry 1989 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-09-16 14:54:29 ART

--
-- PostgreSQL database dump complete
--

-- Table: dias_vehiculos

-- DROP TABLE dias_vehiculos;

SET search_path = public, pg_catalog;

CREATE TABLE public.dias_vehiculos
(
  id serial NOT NULL,
  vehiculo_id integer,
  dia integer,
  CONSTRAINT dias_vehiculos_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.dias_vehiculos
  OWNER TO postgres;



ALTER TABLE public.vehiculos ADD COLUMN desde date;
ALTER TABLE public.vehiculos ADD COLUMN hasta date;
ALTER TABLE public.vehiculos ADD COLUMN nombre character varying;
ALTER TABLE public.vehiculos ADD COLUMN apellido character varying;
ALTER TABLE public.vehiculos ADD COLUMN dni character varying;


ALTER TABLE public.vehiculos ADD COLUMN persona_id integer;

ALTER TABLE public.personas ADD COLUMN celular character varying (30);

ALTER TABLE public.vehiculos ADD COLUMN tipo_vehiculo_id integer;

CREATE TABLE public.tipo_vehiculos
(
  id serial NOT NULL,
  descripcion character varying(30),
  CONSTRAINT tipo_vehiculos_pk PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);

INSERT INTO tipo_vehiculos (descripcion) VALUES ('AUTO'), ('MOTO'), ('PATENTE ESPECIAL');