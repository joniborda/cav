--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.16
-- Dumped by pg_dump version 9.3.1
-- Started on 2015-07-29 10:13:31

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
-- TOC entry 182 (class 3079 OID 11644)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1979 (class 0 OID 0)
-- Dependencies: 182
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


ALTER TABLE public.historiales OWNER TO postgres;

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


ALTER TABLE public.historiales_id_seq OWNER TO postgres;

--
-- TOC entry 1980 (class 0 OID 0)
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
    usuario_id integer NOT NULL
);


ALTER TABLE public.movimientos OWNER TO postgres;

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


ALTER TABLE public.movimientos_id_seq OWNER TO postgres;

--
-- TOC entry 1981 (class 0 OID 0)
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


ALTER TABLE public.personas OWNER TO postgres;

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


ALTER TABLE public.personas_id_seq OWNER TO postgres;

--
-- TOC entry 1982 (class 0 OID 0)
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


ALTER TABLE public.vehiculos OWNER TO postgres;

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


ALTER TABLE public.vehiculos_id_seq OWNER TO postgres;

--
-- TOC entry 1983 (class 0 OID 0)
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


ALTER TABLE usuarios.grupos OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 79927)
-- Name: grupos_urls; Type: TABLE; Schema: usuarios; Owner: postgres; Tablespace: 
--

CREATE TABLE grupos_urls (
    id integer NOT NULL,
    grupo_id integer,
    url_id integer
);


ALTER TABLE usuarios.grupos_urls OWNER TO postgres;

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


ALTER TABLE usuarios.ruv_actions_ruv_groups_id_seq OWNER TO postgres;

--
-- TOC entry 1984 (class 0 OID 0)
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


ALTER TABLE usuarios.ruv_groups_id_seq OWNER TO postgres;

--
-- TOC entry 1985 (class 0 OID 0)
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


ALTER TABLE usuarios.urls OWNER TO postgres;

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


ALTER TABLE usuarios.urls_id_seq OWNER TO postgres;

--
-- TOC entry 1986 (class 0 OID 0)
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


ALTER TABLE usuarios.usuarios OWNER TO postgres;

--
-- TOC entry 1987 (class 0 OID 0)
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


ALTER TABLE usuarios.usuarios_grupos OWNER TO postgres;

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


ALTER TABLE usuarios.usuarios_grupos_id_seq OWNER TO postgres;

--
-- TOC entry 1988 (class 0 OID 0)
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


ALTER TABLE usuarios.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 1989 (class 0 OID 0)
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


ALTER TABLE usuarios.usuarios_table_id OWNER TO postgres;

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


ALTER TABLE usuarios.usuarios_table_id_seq OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- TOC entry 1808 (class 2604 OID 79956)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY historiales ALTER COLUMN id SET DEFAULT nextval('historiales_id_seq'::regclass);


--
-- TOC entry 1816 (class 2604 OID 80529)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimientos ALTER COLUMN id SET DEFAULT nextval('movimientos_id_seq'::regclass);


--
-- TOC entry 1810 (class 2604 OID 79958)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personas ALTER COLUMN id SET DEFAULT nextval('personas_id_seq'::regclass);


--
-- TOC entry 1809 (class 2604 OID 79959)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY vehiculos ALTER COLUMN id SET DEFAULT nextval('vehiculos_id_seq'::regclass);


SET search_path = usuarios, pg_catalog;

--
-- TOC entry 1811 (class 2604 OID 79960)
-- Name: id; Type: DEFAULT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY grupos ALTER COLUMN id SET DEFAULT nextval('ruv_groups_id_seq'::regclass);


--
-- TOC entry 1812 (class 2604 OID 79961)
-- Name: id; Type: DEFAULT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY grupos_urls ALTER COLUMN id SET DEFAULT nextval('ruv_actions_ruv_groups_id_seq'::regclass);


--
-- TOC entry 1813 (class 2604 OID 79962)
-- Name: id; Type: DEFAULT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY urls ALTER COLUMN id SET DEFAULT nextval('urls_id_seq'::regclass);


--
-- TOC entry 1814 (class 2604 OID 79963)
-- Name: id; Type: DEFAULT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- TOC entry 1815 (class 2604 OID 79964)
-- Name: id; Type: DEFAULT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios_grupos ALTER COLUMN id SET DEFAULT nextval('usuarios_grupos_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 1952 (class 0 OID 79896)
-- Dependencies: 162
-- Data for Name: historiales; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO historiales VALUES (1, NULL, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:34:44.863');
INSERT INTO historiales VALUES (2, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:34:45.158');
INSERT INTO historiales VALUES (3, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:38:15.655');
INSERT INTO historiales VALUES (4, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:40:47.061');
INSERT INTO historiales VALUES (5, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:41:23.265');
INSERT INTO historiales VALUES (6, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:41:43.528');
INSERT INTO historiales VALUES (7, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:43:09.118');
INSERT INTO historiales VALUES (8, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:43:28.141');
INSERT INTO historiales VALUES (9, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:43:52.42');
INSERT INTO historiales VALUES (10, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:43:54.891');
INSERT INTO historiales VALUES (11, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:43:58.226');
INSERT INTO historiales VALUES (12, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:43:58.526');
INSERT INTO historiales VALUES (13, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:45:04.648');
INSERT INTO historiales VALUES (14, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:46:16.088');
INSERT INTO historiales VALUES (15, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:46:53.625');
INSERT INTO historiales VALUES (16, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:02.888');
INSERT INTO historiales VALUES (17, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:26.164');
INSERT INTO historiales VALUES (18, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:26.533');
INSERT INTO historiales VALUES (19, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:26.912');
INSERT INTO historiales VALUES (20, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:27.235');
INSERT INTO historiales VALUES (21, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:27.48');
INSERT INTO historiales VALUES (22, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:27.823');
INSERT INTO historiales VALUES (23, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:28.057');
INSERT INTO historiales VALUES (24, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:28.358');
INSERT INTO historiales VALUES (25, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:28.597');
INSERT INTO historiales VALUES (26, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:28.901');
INSERT INTO historiales VALUES (27, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:29.122');
INSERT INTO historiales VALUES (28, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:29.421');
INSERT INTO historiales VALUES (29, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:29.645');
INSERT INTO historiales VALUES (30, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:29.939');
INSERT INTO historiales VALUES (31, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:30.162');
INSERT INTO historiales VALUES (32, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:30.46');
INSERT INTO historiales VALUES (33, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:30.686');
INSERT INTO historiales VALUES (112, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:30.622');
INSERT INTO historiales VALUES (34, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:30.999');
INSERT INTO historiales VALUES (35, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:31.223');
INSERT INTO historiales VALUES (36, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:31.54');
INSERT INTO historiales VALUES (37, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:31.772');
INSERT INTO historiales VALUES (38, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:32.189');
INSERT INTO historiales VALUES (39, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:32.409');
INSERT INTO historiales VALUES (40, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:32.711');
INSERT INTO historiales VALUES (41, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:32.936');
INSERT INTO historiales VALUES (42, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:33.232');
INSERT INTO historiales VALUES (43, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:33.454');
INSERT INTO historiales VALUES (44, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:33.754');
INSERT INTO historiales VALUES (45, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:33.974');
INSERT INTO historiales VALUES (46, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:34.274');
INSERT INTO historiales VALUES (47, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:34.495');
INSERT INTO historiales VALUES (48, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:34.818');
INSERT INTO historiales VALUES (49, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:35.039');
INSERT INTO historiales VALUES (50, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:35.341');
INSERT INTO historiales VALUES (51, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:35.571');
INSERT INTO historiales VALUES (52, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:35.872');
INSERT INTO historiales VALUES (53, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:36.094');
INSERT INTO historiales VALUES (54, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:36.408');
INSERT INTO historiales VALUES (55, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:36.698');
INSERT INTO historiales VALUES (56, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:36.996');
INSERT INTO historiales VALUES (57, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:37.243');
INSERT INTO historiales VALUES (58, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:37.611');
INSERT INTO historiales VALUES (59, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:42.923');
INSERT INTO historiales VALUES (60, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:43.148');
INSERT INTO historiales VALUES (61, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:43.481');
INSERT INTO historiales VALUES (62, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:43.723');
INSERT INTO historiales VALUES (63, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:44.066');
INSERT INTO historiales VALUES (64, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:44.305');
INSERT INTO historiales VALUES (65, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:44.654');
INSERT INTO historiales VALUES (66, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:44.91');
INSERT INTO historiales VALUES (67, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:45.232');
INSERT INTO historiales VALUES (68, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:45.472');
INSERT INTO historiales VALUES (69, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:45.795');
INSERT INTO historiales VALUES (70, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:46.038');
INSERT INTO historiales VALUES (71, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:46.355');
INSERT INTO historiales VALUES (72, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:46.593');
INSERT INTO historiales VALUES (73, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:46.915');
INSERT INTO historiales VALUES (74, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:47.152');
INSERT INTO historiales VALUES (75, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:47.461');
INSERT INTO historiales VALUES (76, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:47.69');
INSERT INTO historiales VALUES (77, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:48.03');
INSERT INTO historiales VALUES (78, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:48.287');
INSERT INTO historiales VALUES (79, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:47:48.672');
INSERT INTO historiales VALUES (80, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:08.62');
INSERT INTO historiales VALUES (81, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:08.859');
INSERT INTO historiales VALUES (82, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:22.578');
INSERT INTO historiales VALUES (83, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:22.991');
INSERT INTO historiales VALUES (84, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:23.217');
INSERT INTO historiales VALUES (85, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:23.545');
INSERT INTO historiales VALUES (86, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:23.763');
INSERT INTO historiales VALUES (87, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:24.067');
INSERT INTO historiales VALUES (88, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:24.293');
INSERT INTO historiales VALUES (89, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:24.598');
INSERT INTO historiales VALUES (90, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:24.818');
INSERT INTO historiales VALUES (91, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:25.119');
INSERT INTO historiales VALUES (92, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:25.352');
INSERT INTO historiales VALUES (93, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:25.67');
INSERT INTO historiales VALUES (94, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:25.884');
INSERT INTO historiales VALUES (95, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:26.184');
INSERT INTO historiales VALUES (96, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:26.401');
INSERT INTO historiales VALUES (97, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:26.707');
INSERT INTO historiales VALUES (98, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:26.922');
INSERT INTO historiales VALUES (99, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:27.225');
INSERT INTO historiales VALUES (100, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:27.444');
INSERT INTO historiales VALUES (101, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:27.745');
INSERT INTO historiales VALUES (102, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:27.972');
INSERT INTO historiales VALUES (103, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:28.323');
INSERT INTO historiales VALUES (104, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:28.539');
INSERT INTO historiales VALUES (105, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:28.85');
INSERT INTO historiales VALUES (106, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:29.068');
INSERT INTO historiales VALUES (107, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:29.366');
INSERT INTO historiales VALUES (108, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:29.582');
INSERT INTO historiales VALUES (109, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:29.884');
INSERT INTO historiales VALUES (110, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:30.101');
INSERT INTO historiales VALUES (111, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:30.403');
INSERT INTO historiales VALUES (113, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:30.927');
INSERT INTO historiales VALUES (114, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:31.765');
INSERT INTO historiales VALUES (115, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:32.102');
INSERT INTO historiales VALUES (116, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:32.397');
INSERT INTO historiales VALUES (117, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:32.615');
INSERT INTO historiales VALUES (118, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:32.914');
INSERT INTO historiales VALUES (119, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:33.148');
INSERT INTO historiales VALUES (120, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:33.519');
INSERT INTO historiales VALUES (121, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:33.741');
INSERT INTO historiales VALUES (122, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:34.069');
INSERT INTO historiales VALUES (123, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:34.293');
INSERT INTO historiales VALUES (124, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:34.605');
INSERT INTO historiales VALUES (125, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:34.826');
INSERT INTO historiales VALUES (126, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:35.128');
INSERT INTO historiales VALUES (127, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:35.342');
INSERT INTO historiales VALUES (128, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:35.645');
INSERT INTO historiales VALUES (129, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:35.862');
INSERT INTO historiales VALUES (130, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:36.181');
INSERT INTO historiales VALUES (131, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:36.395');
INSERT INTO historiales VALUES (132, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:36.702');
INSERT INTO historiales VALUES (133, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:36.919');
INSERT INTO historiales VALUES (134, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:37.219');
INSERT INTO historiales VALUES (135, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:37.476');
INSERT INTO historiales VALUES (136, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:37.781');
INSERT INTO historiales VALUES (137, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:38.01');
INSERT INTO historiales VALUES (138, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:38.317');
INSERT INTO historiales VALUES (139, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:38.54');
INSERT INTO historiales VALUES (140, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:38.848');
INSERT INTO historiales VALUES (141, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:39.065');
INSERT INTO historiales VALUES (142, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:39.374');
INSERT INTO historiales VALUES (143, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:39.59');
INSERT INTO historiales VALUES (144, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:39.891');
INSERT INTO historiales VALUES (145, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:40.107');
INSERT INTO historiales VALUES (146, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:40.411');
INSERT INTO historiales VALUES (147, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:40.633');
INSERT INTO historiales VALUES (148, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:40.934');
INSERT INTO historiales VALUES (149, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:41.149');
INSERT INTO historiales VALUES (150, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:41.449');
INSERT INTO historiales VALUES (151, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:41.666');
INSERT INTO historiales VALUES (152, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:42.002');
INSERT INTO historiales VALUES (153, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:42.308');
INSERT INTO historiales VALUES (154, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:42.626');
INSERT INTO historiales VALUES (155, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:42.842');
INSERT INTO historiales VALUES (156, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:48.185');
INSERT INTO historiales VALUES (157, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:48.58');
INSERT INTO historiales VALUES (158, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:48.812');
INSERT INTO historiales VALUES (159, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:49.135');
INSERT INTO historiales VALUES (160, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:49.35');
INSERT INTO historiales VALUES (161, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:49.717');
INSERT INTO historiales VALUES (162, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:49.932');
INSERT INTO historiales VALUES (163, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:50.345');
INSERT INTO historiales VALUES (164, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:50.653');
INSERT INTO historiales VALUES (165, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:51.097');
INSERT INTO historiales VALUES (166, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:51.386');
INSERT INTO historiales VALUES (167, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:51.69');
INSERT INTO historiales VALUES (168, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:51.902');
INSERT INTO historiales VALUES (169, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:52.201');
INSERT INTO historiales VALUES (170, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:52.414');
INSERT INTO historiales VALUES (171, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:52.719');
INSERT INTO historiales VALUES (172, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:52.935');
INSERT INTO historiales VALUES (173, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:53.24');
INSERT INTO historiales VALUES (174, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:53.458');
INSERT INTO historiales VALUES (175, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:53.761');
INSERT INTO historiales VALUES (176, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:48:53.979');
INSERT INTO historiales VALUES (177, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:49:07.174');
INSERT INTO historiales VALUES (178, 1, 'http://localhost/cav/admin/pages/display/home', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:49:07.759');
INSERT INTO historiales VALUES (179, 1, 'http://localhost/cav/admin/pages/display/home', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 09:49:33.062');
INSERT INTO historiales VALUES (180, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:00:39.98');
INSERT INTO historiales VALUES (181, 1, 'http://localhost/cav/admin/pages/display/home', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:00:40.399');
INSERT INTO historiales VALUES (182, 1, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:00:52.696');
INSERT INTO historiales VALUES (183, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:00:53.069');
INSERT INTO historiales VALUES (184, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:00:54.713');
INSERT INTO historiales VALUES (185, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:00:58.705');
INSERT INTO historiales VALUES (186, 1, 'http://localhost/cav/admin/pages/display/home', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:00:58.989');
INSERT INTO historiales VALUES (187, 1, 'http://localhost/cav/admin/pages/display/home', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:01:31.191');
INSERT INTO historiales VALUES (188, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:01:39.615');
INSERT INTO historiales VALUES (189, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:01:45.84');
INSERT INTO historiales VALUES (190, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:01:46.245');
INSERT INTO historiales VALUES (191, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:01:50.046');
INSERT INTO historiales VALUES (192, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:01:50.4');
INSERT INTO historiales VALUES (193, 1, 'http://localhost/cav/admin/personas', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:01:58.899');
INSERT INTO historiales VALUES (194, 1, 'http://localhost/cav/admin/personas', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:02:23.137');
INSERT INTO historiales VALUES (195, 1, 'http://localhost/cav/admin/personas/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:02:27.321');
INSERT INTO historiales VALUES (196, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:03:02.484');
INSERT INTO historiales VALUES (197, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:04:32.049');
INSERT INTO historiales VALUES (198, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:05:44.956');
INSERT INTO historiales VALUES (199, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:09:13.519');
INSERT INTO historiales VALUES (200, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:10:06.301');
INSERT INTO historiales VALUES (474, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:42:59.169521');
INSERT INTO historiales VALUES (201, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:10:20.306');
INSERT INTO historiales VALUES (202, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:20:41.881');
INSERT INTO historiales VALUES (203, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:21:20.635');
INSERT INTO historiales VALUES (204, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:21:32.584');
INSERT INTO historiales VALUES (205, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:26:31.047');
INSERT INTO historiales VALUES (206, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:26:53.843');
INSERT INTO historiales VALUES (207, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:27:14.611');
INSERT INTO historiales VALUES (208, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:28:05.28');
INSERT INTO historiales VALUES (209, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:28:16.102');
INSERT INTO historiales VALUES (210, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:30:34.377');
INSERT INTO historiales VALUES (211, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:33:18.544');
INSERT INTO historiales VALUES (212, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:35:51.303');
INSERT INTO historiales VALUES (213, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:36:25.864');
INSERT INTO historiales VALUES (214, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:37:08.213');
INSERT INTO historiales VALUES (215, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:41:57.09');
INSERT INTO historiales VALUES (216, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:42:02.952');
INSERT INTO historiales VALUES (217, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:42:15.474');
INSERT INTO historiales VALUES (218, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:42:21.053');
INSERT INTO historiales VALUES (219, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:42:36.298');
INSERT INTO historiales VALUES (220, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:42:55.299');
INSERT INTO historiales VALUES (221, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:43:56.985');
INSERT INTO historiales VALUES (222, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:44:20.401');
INSERT INTO historiales VALUES (223, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:46:30.955');
INSERT INTO historiales VALUES (224, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 10:47:35.205');
INSERT INTO historiales VALUES (225, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:39:15.888');
INSERT INTO historiales VALUES (226, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:39:24.038');
INSERT INTO historiales VALUES (227, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:41:19.513');
INSERT INTO historiales VALUES (228, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:41:42.491');
INSERT INTO historiales VALUES (229, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:42:47.006');
INSERT INTO historiales VALUES (230, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:42:56.421');
INSERT INTO historiales VALUES (231, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:43:14.277');
INSERT INTO historiales VALUES (232, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:43:42.941');
INSERT INTO historiales VALUES (233, 1, 'http://localhost/cav/admin/movimientos/add/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:43:46.667');
INSERT INTO historiales VALUES (234, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:44:11.801');
INSERT INTO historiales VALUES (235, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:44:45.322');
INSERT INTO historiales VALUES (236, 1, 'http://localhost/cav//vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:44:49.815');
INSERT INTO historiales VALUES (237, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:45:07.861');
INSERT INTO historiales VALUES (238, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:45:10.402');
INSERT INTO historiales VALUES (239, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:45:15.334');
INSERT INTO historiales VALUES (240, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:46:41.941');
INSERT INTO historiales VALUES (241, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:47:19.166');
INSERT INTO historiales VALUES (242, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:50:15.714');
INSERT INTO historiales VALUES (243, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:52:31.506');
INSERT INTO historiales VALUES (244, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:52:52.647');
INSERT INTO historiales VALUES (245, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:52:56.408');
INSERT INTO historiales VALUES (246, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 11:53:13.026');
INSERT INTO historiales VALUES (247, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:03:07.205');
INSERT INTO historiales VALUES (248, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:03:12.013');
INSERT INTO historiales VALUES (249, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:03:13.87');
INSERT INTO historiales VALUES (250, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:06:29.61');
INSERT INTO historiales VALUES (251, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:06:46.31');
INSERT INTO historiales VALUES (252, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:06:53.936');
INSERT INTO historiales VALUES (253, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:07:44.535');
INSERT INTO historiales VALUES (254, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:07:53.323');
INSERT INTO historiales VALUES (255, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:07:55.358');
INSERT INTO historiales VALUES (256, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:09:46.208');
INSERT INTO historiales VALUES (257, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:09:51.463');
INSERT INTO historiales VALUES (258, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:09:52.891');
INSERT INTO historiales VALUES (259, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:12:51.042');
INSERT INTO historiales VALUES (260, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:12:54.462');
INSERT INTO historiales VALUES (261, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:12:55.965');
INSERT INTO historiales VALUES (262, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:16:57.759');
INSERT INTO historiales VALUES (263, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:17:31.43');
INSERT INTO historiales VALUES (264, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:18:19.842');
INSERT INTO historiales VALUES (265, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:18:35.462');
INSERT INTO historiales VALUES (266, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:19:03.805');
INSERT INTO historiales VALUES (267, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:19:31.709');
INSERT INTO historiales VALUES (268, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:22:00.519');
INSERT INTO historiales VALUES (269, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:22:11.433');
INSERT INTO historiales VALUES (270, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:22:25.413');
INSERT INTO historiales VALUES (271, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:22:34.168');
INSERT INTO historiales VALUES (272, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:24:31.429');
INSERT INTO historiales VALUES (273, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:26:57.323');
INSERT INTO historiales VALUES (274, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:27:02.091');
INSERT INTO historiales VALUES (275, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:27:49.776');
INSERT INTO historiales VALUES (276, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:27:54.445');
INSERT INTO historiales VALUES (277, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:27:56.255');
INSERT INTO historiales VALUES (278, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:28:19.437');
INSERT INTO historiales VALUES (279, 1, 'http://localhost/cav/theme/Cakestrap/css/bootstrap.min.css', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:28:20.703');
INSERT INTO historiales VALUES (280, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:28:32.183');
INSERT INTO historiales VALUES (281, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:28:43.69');
INSERT INTO historiales VALUES (282, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:28:51.338');
INSERT INTO historiales VALUES (283, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:29:08.067');
INSERT INTO historiales VALUES (284, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:29:35.775');
INSERT INTO historiales VALUES (285, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:29:38.547');
INSERT INTO historiales VALUES (286, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:29:47.007');
INSERT INTO historiales VALUES (287, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:30:07.187');
INSERT INTO historiales VALUES (288, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:30:27.016');
INSERT INTO historiales VALUES (289, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:30:29.651');
INSERT INTO historiales VALUES (290, 1, 'http://localhost/cav/admin/movimientos/add/1', 'a:1:{s:10:"Movimiento";a:5:{s:15:"tipo_movimiento";s:1:"1";s:11:"vehiculo_id";s:1:"3";s:10:"persona_id";s:1:"1";s:6:"sector";s:1:"1";s:7:"interno";s:1:"1";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:30:45.73');
INSERT INTO historiales VALUES (291, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:30:46.144');
INSERT INTO historiales VALUES (292, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:30:52.051');
INSERT INTO historiales VALUES (293, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:30:58.172');
INSERT INTO historiales VALUES (294, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:31:00.173');
INSERT INTO historiales VALUES (295, 1, 'http://localhost/cav/admin/movimientos/add', 'a:1:{s:10:"Movimiento";a:5:{s:15:"tipo_movimiento";s:1:"2";s:11:"vehiculo_id";s:1:"3";s:10:"persona_id";s:1:"1";s:6:"sector";s:5:"bueno";s:7:"interno";s:4:"dale";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:31:03.432');
INSERT INTO historiales VALUES (296, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:31:03.797');
INSERT INTO historiales VALUES (297, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:31:20.61');
INSERT INTO historiales VALUES (298, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:32:22.431');
INSERT INTO historiales VALUES (299, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:32:50.321');
INSERT INTO historiales VALUES (300, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:32:54.156');
INSERT INTO historiales VALUES (301, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:32:55.443');
INSERT INTO historiales VALUES (302, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:34:21.416');
INSERT INTO historiales VALUES (303, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:34:26.311');
INSERT INTO historiales VALUES (304, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:34:42.493');
INSERT INTO historiales VALUES (305, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:34:58.451');
INSERT INTO historiales VALUES (306, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:36:04.537');
INSERT INTO historiales VALUES (307, 1, 'http://localhost/cav/admin/personas/view/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:36:09.461');
INSERT INTO historiales VALUES (308, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 12:36:15.411');
INSERT INTO historiales VALUES (309, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:33:45.536');
INSERT INTO historiales VALUES (310, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:33:47.32');
INSERT INTO historiales VALUES (311, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:36:21.737');
INSERT INTO historiales VALUES (312, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:36:26.568');
INSERT INTO historiales VALUES (313, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:36:28.633');
INSERT INTO historiales VALUES (314, 1, 'http://localhost/cav/admin/personas/busqueda_dni/11', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:36:32.699');
INSERT INTO historiales VALUES (315, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:36:36.234');
INSERT INTO historiales VALUES (316, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:40:02.461');
INSERT INTO historiales VALUES (317, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:42:19.012');
INSERT INTO historiales VALUES (318, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:43:23.52');
INSERT INTO historiales VALUES (319, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:43:54.291');
INSERT INTO historiales VALUES (320, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:44:06.824');
INSERT INTO historiales VALUES (321, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:44:20.44');
INSERT INTO historiales VALUES (322, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:44:45.562');
INSERT INTO historiales VALUES (323, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:45:00.919');
INSERT INTO historiales VALUES (324, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:45:08.549');
INSERT INTO historiales VALUES (325, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:33:55.01287');
INSERT INTO historiales VALUES (326, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:34:03.185679');
INSERT INTO historiales VALUES (327, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1234', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:34:08.260841');
INSERT INTO historiales VALUES (328, NULL, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:34:10.620073');
INSERT INTO historiales VALUES (329, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:34:11.242428');
INSERT INTO historiales VALUES (330, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:34:13.863085');
INSERT INTO historiales VALUES (331, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:34:16.474406');
INSERT INTO historiales VALUES (332, 1, 'http://localhost/cav/admin/movimientos/add', 'a:1:{s:10:"Movimiento";a:5:{s:15:"tipo_movimiento";s:1:"1";s:11:"vehiculo_id";s:1:"3";s:10:"persona_id";s:1:"1";s:6:"sector";s:1:"1";s:7:"interno";s:1:"1";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:34:19.039841');
INSERT INTO historiales VALUES (333, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:34:21.416264');
INSERT INTO historiales VALUES (334, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:34:27.964775');
INSERT INTO historiales VALUES (335, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:34:33.508202');
INSERT INTO historiales VALUES (336, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:34:35.112989');
INSERT INTO historiales VALUES (337, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:35:17.817325');
INSERT INTO historiales VALUES (338, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:35:22.968589');
INSERT INTO historiales VALUES (339, 1, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:36:36.669842');
INSERT INTO historiales VALUES (340, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:36:39.326045');
INSERT INTO historiales VALUES (341, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:40:05.726676');
INSERT INTO historiales VALUES (342, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:40:32.358325');
INSERT INTO historiales VALUES (343, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:41:00.714596');
INSERT INTO historiales VALUES (344, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:42:08.48077');
INSERT INTO historiales VALUES (345, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:42:48.127584');
INSERT INTO historiales VALUES (346, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:43:20.013663');
INSERT INTO historiales VALUES (347, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/12', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:43:26.800486');
INSERT INTO historiales VALUES (348, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:44:12.420795');
INSERT INTO historiales VALUES (349, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/12', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:44:30.167973');
INSERT INTO historiales VALUES (350, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:44:50.428077');
INSERT INTO historiales VALUES (351, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/12', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:44:56.810272');
INSERT INTO historiales VALUES (352, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:45:41.33399');
INSERT INTO historiales VALUES (353, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/23', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:45:47.950527');
INSERT INTO historiales VALUES (354, NULL, 'http://localhost/cav/admin/vehiculos/busqueda_patente/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:45:57.567304');
INSERT INTO historiales VALUES (355, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:46:15.994447');
INSERT INTO historiales VALUES (356, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:46:17.515495');
INSERT INTO historiales VALUES (357, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:46:34.600286');
INSERT INTO historiales VALUES (358, NULL, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:46:48.115565');
INSERT INTO historiales VALUES (359, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:46:49.105588');
INSERT INTO historiales VALUES (360, NULL, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:46:50.830832');
INSERT INTO historiales VALUES (361, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:46:51.638449');
INSERT INTO historiales VALUES (362, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:46:53.316875');
INSERT INTO historiales VALUES (363, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:46:56.18867');
INSERT INTO historiales VALUES (364, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:46:57.726358');
INSERT INTO historiales VALUES (365, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/12', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:47:05.718324');
INSERT INTO historiales VALUES (366, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/12', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:47:19.313314');
INSERT INTO historiales VALUES (367, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:47:29.532944');
INSERT INTO historiales VALUES (368, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:47:45.727778');
INSERT INTO historiales VALUES (369, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:48:14.111361');
INSERT INTO historiales VALUES (370, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1234', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:48:21.743218');
INSERT INTO historiales VALUES (371, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1234', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:48:41.591254');
INSERT INTO historiales VALUES (372, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:48:54.673951');
INSERT INTO historiales VALUES (373, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:49:25.798207');
INSERT INTO historiales VALUES (374, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:50:13.830033');
INSERT INTO historiales VALUES (375, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/12', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:50:20.288679');
INSERT INTO historiales VALUES (376, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/12', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:50:24.867322');
INSERT INTO historiales VALUES (377, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:51:12.368668');
INSERT INTO historiales VALUES (378, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:53:46.562505');
INSERT INTO historiales VALUES (379, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:53:55.364655');
INSERT INTO historiales VALUES (380, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/123', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:53:57.392556');
INSERT INTO historiales VALUES (381, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/123', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:54:00.858209');
INSERT INTO historiales VALUES (382, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:54:35.31014');
INSERT INTO historiales VALUES (383, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1234', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:54:41.893307');
INSERT INTO historiales VALUES (384, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1234', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:54:45.937123');
INSERT INTO historiales VALUES (385, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:56:54.748998');
INSERT INTO historiales VALUES (386, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:57:32.506014');
INSERT INTO historiales VALUES (387, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:57:42.418279');
INSERT INTO historiales VALUES (388, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 13:59:42.028507');
INSERT INTO historiales VALUES (389, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 13:59:55.354193');
INSERT INTO historiales VALUES (390, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1243', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:00:03.881937');
INSERT INTO historiales VALUES (391, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:00:36.223495');
INSERT INTO historiales VALUES (392, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:00:49.583334');
INSERT INTO historiales VALUES (393, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:00:56.654081');
INSERT INTO historiales VALUES (394, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1234', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:01:04.541826');
INSERT INTO historiales VALUES (395, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:01:35.83245');
INSERT INTO historiales VALUES (396, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:01:39.247719');
INSERT INTO historiales VALUES (397, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1234', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:01:41.852373');
INSERT INTO historiales VALUES (398, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:02:08.13528');
INSERT INTO historiales VALUES (399, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:02:15.893186');
INSERT INTO historiales VALUES (400, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:02:17.224589');
INSERT INTO historiales VALUES (401, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:02:32.839523');
INSERT INTO historiales VALUES (402, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/2134', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:02:38.915744');
INSERT INTO historiales VALUES (403, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/2134', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:02:43.156583');
INSERT INTO historiales VALUES (404, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/2134', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:02:46.340594');
INSERT INTO historiales VALUES (405, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:03:50.756167');
INSERT INTO historiales VALUES (406, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:04:26.582431');
INSERT INTO historiales VALUES (407, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/2134', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:05:58.501154');
INSERT INTO historiales VALUES (408, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:07:03.34836');
INSERT INTO historiales VALUES (409, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:07:30.561329');
INSERT INTO historiales VALUES (410, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:07:43.471335');
INSERT INTO historiales VALUES (411, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1234', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:07:59.062749');
INSERT INTO historiales VALUES (412, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:08:00.452442');
INSERT INTO historiales VALUES (413, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1234', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:08:09.407909');
INSERT INTO historiales VALUES (414, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:08:11.822562');
INSERT INTO historiales VALUES (415, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:08:43.514973');
INSERT INTO historiales VALUES (416, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1234', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:09:09.071289');
INSERT INTO historiales VALUES (417, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:09:39.417477');
INSERT INTO historiales VALUES (418, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1234', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:10:18.646149');
INSERT INTO historiales VALUES (419, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:10:23.202388');
INSERT INTO historiales VALUES (420, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/123', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:10:36.376688');
INSERT INTO historiales VALUES (421, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/123', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:11:30.014663');
INSERT INTO historiales VALUES (422, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:12:48.119916');
INSERT INTO historiales VALUES (423, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:14:06.976409');
INSERT INTO historiales VALUES (424, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:14:36.758971');
INSERT INTO historiales VALUES (425, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:15:59.7282');
INSERT INTO historiales VALUES (426, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:17:03.549267');
INSERT INTO historiales VALUES (427, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:17:30.536169');
INSERT INTO historiales VALUES (428, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:17:46.680386');
INSERT INTO historiales VALUES (429, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:18:53.064189');
INSERT INTO historiales VALUES (430, NULL, 'http://localhost/cav/admin/presunto_femicidas', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:19:01.296416');
INSERT INTO historiales VALUES (431, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:19:47.072356');
INSERT INTO historiales VALUES (432, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:21:59.514827');
INSERT INTO historiales VALUES (433, NULL, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:22:11.693664');
INSERT INTO historiales VALUES (434, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:22:12.538935');
INSERT INTO historiales VALUES (435, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:23:02.804751');
INSERT INTO historiales VALUES (436, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:23:46.311294');
INSERT INTO historiales VALUES (437, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:24:20.936649');
INSERT INTO historiales VALUES (438, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:24:54.826009');
INSERT INTO historiales VALUES (439, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:25:38.782465');
INSERT INTO historiales VALUES (440, 1, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:25:47.52974');
INSERT INTO historiales VALUES (441, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:25:48.951839');
INSERT INTO historiales VALUES (442, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:26:51.174808');
INSERT INTO historiales VALUES (443, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/123', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:26:58.337047');
INSERT INTO historiales VALUES (444, 1, 'http://localhost/cav/admin/movimientos/add', 'a:2:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:2:"32";s:5:"color";s:2:"32";s:11:"descripcion";s:2:"23";s:17:"tipo_autorizacion";s:2:"32";}s:10:"Movimiento";a:1:{s:10:"usuario_id";i:1;}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:27:08.194899');
INSERT INTO historiales VALUES (445, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:27:38.498226');
INSERT INTO historiales VALUES (446, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:27:52.552997');
INSERT INTO historiales VALUES (447, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:28:18.902512');
INSERT INTO historiales VALUES (448, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:28:48.605835');
INSERT INTO historiales VALUES (449, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:29:33.265588');
INSERT INTO historiales VALUES (450, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/23', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:29:40.234529');
INSERT INTO historiales VALUES (451, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:3:"234";s:5:"color";s:4:"1243";s:11:"descripcion";s:2:"12";s:17:"tipo_autorizacion";s:2:"12";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:29:48.325367');
INSERT INTO historiales VALUES (452, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:30:18.293525');
INSERT INTO historiales VALUES (453, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:31:52.927152');
INSERT INTO historiales VALUES (454, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:32:10.170347');
INSERT INTO historiales VALUES (455, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:32:18.29726');
INSERT INTO historiales VALUES (456, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:32:19.7023');
INSERT INTO historiales VALUES (457, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:32:37.051072');
INSERT INTO historiales VALUES (458, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:33:44.244902');
INSERT INTO historiales VALUES (459, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:33:57.306799');
INSERT INTO historiales VALUES (460, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:34:10.014858');
INSERT INTO historiales VALUES (461, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/2', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:34:20.011597');
INSERT INTO historiales VALUES (462, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:34:26.018498');
INSERT INTO historiales VALUES (463, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:2:"12";s:5:"color";s:1:"2";s:11:"descripcion";s:1:"2";s:17:"tipo_autorizacion";s:1:"2";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:34:28.899007');
INSERT INTO historiales VALUES (464, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:36:10.413412');
INSERT INTO historiales VALUES (465, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:36:41.419525');
INSERT INTO historiales VALUES (466, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:39:06.609618');
INSERT INTO historiales VALUES (467, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:39:58.424431');
INSERT INTO historiales VALUES (468, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:41:30.740811');
INSERT INTO historiales VALUES (469, 1, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:42:26.641732');
INSERT INTO historiales VALUES (470, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:42:29.14712');
INSERT INTO historiales VALUES (471, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:42:39.717452');
INSERT INTO historiales VALUES (472, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:42:51.741516');
INSERT INTO historiales VALUES (473, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:42:57.818011');
INSERT INTO historiales VALUES (475, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:43:14.183224');
INSERT INTO historiales VALUES (476, 1, 'http://localhost/cav/admin/movimientos/index/sort:interno/direction:asc', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:43:40.864612');
INSERT INTO historiales VALUES (477, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:44:27.52977');
INSERT INTO historiales VALUES (478, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:44:56.743366');
INSERT INTO historiales VALUES (479, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1123', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:45:05.740089');
INSERT INTO historiales VALUES (480, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:6:"123123";s:5:"color";s:4:"1231";s:11:"descripcion";s:2:"12";s:17:"tipo_autorizacion";s:2:"12";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:45:17.222567');
INSERT INTO historiales VALUES (481, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:6:"123123";s:5:"color";s:4:"1231";s:11:"descripcion";s:2:"12";s:17:"tipo_autorizacion";s:2:"12";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:46:56.656481');
INSERT INTO historiales VALUES (482, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:47:31.148649');
INSERT INTO historiales VALUES (483, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/134', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:48:03.014751');
INSERT INTO historiales VALUES (484, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:48:34.751924');
INSERT INTO historiales VALUES (485, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/2134', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:48:42.810167');
INSERT INTO historiales VALUES (486, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:4:"2134";s:5:"color";s:3:"123";s:11:"descripcion";s:2:"12";s:17:"tipo_autorizacion";s:1:"1";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:48:52.105993');
INSERT INTO historiales VALUES (487, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:49:10.513788');
INSERT INTO historiales VALUES (488, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:50:13.813734');
INSERT INTO historiales VALUES (489, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/123', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:50:23.945106');
INSERT INTO historiales VALUES (490, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:3:"123";s:5:"color";s:2:"12";s:11:"descripcion";s:2:"12";s:17:"tipo_autorizacion";s:2:"12";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:50:29.839159');
INSERT INTO historiales VALUES (491, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:3:"123";s:5:"color";s:2:"12";s:11:"descripcion";s:2:"12";s:17:"tipo_autorizacion";s:2:"12";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:50:39.310207');
INSERT INTO historiales VALUES (492, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:51:10.70096');
INSERT INTO historiales VALUES (493, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/123', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:51:29.248226');
INSERT INTO historiales VALUES (494, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:3:"123";s:5:"color";s:2:"12";s:11:"descripcion";s:2:"12";s:17:"tipo_autorizacion";s:2:"12";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:51:45.108756');
INSERT INTO historiales VALUES (495, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:3:"123";s:5:"color";s:2:"12";s:11:"descripcion";s:2:"12";s:17:"tipo_autorizacion";s:2:"12";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:51:57.051167');
INSERT INTO historiales VALUES (496, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:3:"123";s:5:"color";s:2:"12";s:11:"descripcion";s:2:"12";s:17:"tipo_autorizacion";s:2:"12";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:52:57.288655');
INSERT INTO historiales VALUES (497, 1, 'http://localhost/cav/admin/movimientos/index/sort:interno/direction:asc', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:54:00.42737');
INSERT INTO historiales VALUES (498, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 14:54:29.582659');
INSERT INTO historiales VALUES (499, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:55:28.210734');
INSERT INTO historiales VALUES (500, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1233', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:55:36.606217');
INSERT INTO historiales VALUES (501, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:4:"1233";s:5:"color";s:1:"1";s:11:"descripcion";s:1:"1";s:17:"tipo_autorizacion";s:1:"1";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:55:46.945759');
INSERT INTO historiales VALUES (502, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1233', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:56:02.570277');
INSERT INTO historiales VALUES (503, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/12331', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:56:27.334137');
INSERT INTO historiales VALUES (504, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:57:03.489129');
INSERT INTO historiales VALUES (505, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/12354', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:57:11.790201');
INSERT INTO historiales VALUES (540, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:10:16.363046');
INSERT INTO historiales VALUES (506, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:5:"12354";s:5:"color";s:6:"blanco";s:11:"descripcion";s:25:"nos enose nose nosen osen";s:17:"tipo_autorizacion";s:1:"1";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:57:24.074673');
INSERT INTO historiales VALUES (507, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/123541', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:57:52.268321');
INSERT INTO historiales VALUES (508, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:5:"12354";s:5:"color";s:0:"";s:11:"descripcion";s:0:"";s:17:"tipo_autorizacion";s:0:"";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:58:00.87071');
INSERT INTO historiales VALUES (509, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:5:"12354";s:5:"color";s:0:"";s:11:"descripcion";s:0:"";s:17:"tipo_autorizacion";s:0:"";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:58:09.612676');
INSERT INTO historiales VALUES (510, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/123541', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:58:16.227879');
INSERT INTO historiales VALUES (511, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/12354', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:58:22.478886');
INSERT INTO historiales VALUES (512, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/12354', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:58:46.121328');
INSERT INTO historiales VALUES (513, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/123541', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:58:52.396094');
INSERT INTO historiales VALUES (514, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/123541', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 14:59:32.664698');
INSERT INTO historiales VALUES (515, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:00:25.044413');
INSERT INTO historiales VALUES (516, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:00:27.38019');
INSERT INTO historiales VALUES (517, 1, 'http://localhost/cav/admin/movimientos/add/1', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:00:42.882266');
INSERT INTO historiales VALUES (518, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:00:48.946123');
INSERT INTO historiales VALUES (519, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/123451', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:00:51.515997');
INSERT INTO historiales VALUES (520, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:3:{s:5:"color";s:1:"1";s:11:"descripcion";s:1:"1";s:17:"tipo_autorizacion";s:1:"1";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:00:58.97839');
INSERT INTO historiales VALUES (521, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:01:06.829537');
INSERT INTO historiales VALUES (522, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:02:00.163562');
INSERT INTO historiales VALUES (523, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:3:{s:5:"color";s:1:"1";s:11:"descripcion";s:1:"1";s:17:"tipo_autorizacion";s:1:"1";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:02:13.308876');
INSERT INTO historiales VALUES (524, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:03:45.513075');
INSERT INTO historiales VALUES (525, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/12', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:03:54.551077');
INSERT INTO historiales VALUES (526, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:2:"12";s:5:"color";s:2:"12";s:11:"descripcion";s:2:"12";s:17:"tipo_autorizacion";s:2:"12";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:04:01.259514');
INSERT INTO historiales VALUES (527, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:04:29.070365');
INSERT INTO historiales VALUES (528, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:05:06.613124');
INSERT INTO historiales VALUES (529, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:06:25.961649');
INSERT INTO historiales VALUES (530, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:06:28.688156');
INSERT INTO historiales VALUES (531, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:08:12.057177');
INSERT INTO historiales VALUES (532, 1, 'http://localhost/cav/admin/grupos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:08:27.333103');
INSERT INTO historiales VALUES (533, 1, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:09:06.794133');
INSERT INTO historiales VALUES (534, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:09:09.614107');
INSERT INTO historiales VALUES (535, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:09:12.850335');
INSERT INTO historiales VALUES (536, 1, 'http://localhost/cav/admin/grupos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:09:14.483964');
INSERT INTO historiales VALUES (537, 1, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:10:08.777275');
INSERT INTO historiales VALUES (538, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:10:11.65105');
INSERT INTO historiales VALUES (539, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:10:14.765378');
INSERT INTO historiales VALUES (541, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:11:28.375115');
INSERT INTO historiales VALUES (542, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:14:12.515758');
INSERT INTO historiales VALUES (543, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:15:53.861337');
INSERT INTO historiales VALUES (544, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:16:15.687889');
INSERT INTO historiales VALUES (545, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:19:57.2075');
INSERT INTO historiales VALUES (546, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:20:20.650146');
INSERT INTO historiales VALUES (547, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:21:03.972866');
INSERT INTO historiales VALUES (548, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:21:56.930513');
INSERT INTO historiales VALUES (549, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:25:18.568076');
INSERT INTO historiales VALUES (550, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:25:34.783845');
INSERT INTO historiales VALUES (551, 1, 'http://localhost/cav/admin/personas/busqueda_dni/2', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:25:47.704636');
INSERT INTO historiales VALUES (552, 1, 'http://localhost/cav/admin/personas/add_ajax', 'a:1:{s:11:"persona_add";a:4:{s:6:"nombre";s:1:"1";s:8:"apellido";s:1:"1";s:16:"numero_documento";s:1:"2";s:8:"telefono";s:1:"1";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:26:08.408795');
INSERT INTO historiales VALUES (553, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:26:56.386553');
INSERT INTO historiales VALUES (554, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/12', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:27:08.858135');
INSERT INTO historiales VALUES (555, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:27:13.788772');
INSERT INTO historiales VALUES (556, 1, 'http://localhost/cav/admin/personas/busqueda_dni/12', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:27:15.866934');
INSERT INTO historiales VALUES (557, 1, 'http://localhost/cav/admin/personas/add_ajax', 'a:1:{s:11:"persona_add";a:4:{s:6:"nombre";s:8:"Jonathan";s:8:"apellido";s:5:"Borda";s:16:"numero_documento";s:2:"12";s:8:"telefono";s:1:"1";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:27:29.173262');
INSERT INTO historiales VALUES (558, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:27:34.250781');
INSERT INTO historiales VALUES (559, 1, 'http://localhost/cav/admin/movimientos/add', 'a:1:{s:10:"Movimiento";a:5:{s:15:"tipo_movimiento";s:1:"1";s:11:"vehiculo_id";s:1:"9";s:10:"persona_id";s:1:"3";s:6:"sector";s:4:"AHÌ";s:7:"interno";s:6:"SEÑOR";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:27:44.464478');
INSERT INTO historiales VALUES (560, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:27:47.940367');
INSERT INTO historiales VALUES (561, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:27:51.55652');
INSERT INTO historiales VALUES (562, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:27:59.502124');
INSERT INTO historiales VALUES (563, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:28:11.49159');
INSERT INTO historiales VALUES (564, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:28:34.979466');
INSERT INTO historiales VALUES (565, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:29:00.08673');
INSERT INTO historiales VALUES (566, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:29:04.022613');
INSERT INTO historiales VALUES (567, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:29:05.718832');
INSERT INTO historiales VALUES (568, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:29:13.877897');
INSERT INTO historiales VALUES (569, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:29:15.424874');
INSERT INTO historiales VALUES (570, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:29:19.86381');
INSERT INTO historiales VALUES (571, 1, 'http://localhost/cav/admin/movimientos/add', 'a:1:{s:10:"Movimiento";a:5:{s:15:"tipo_movimiento";s:1:"1";s:11:"vehiculo_id";s:1:"3";s:10:"persona_id";s:1:"1";s:6:"sector";s:1:"1";s:7:"interno";s:1:"1";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:29:26.862179');
INSERT INTO historiales VALUES (572, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:30:52.814979');
INSERT INTO historiales VALUES (573, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/HXW321', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:31:03.568892');
INSERT INTO historiales VALUES (574, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:31:51.50643');
INSERT INTO historiales VALUES (575, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:34:31.601729');
INSERT INTO historiales VALUES (576, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/451321', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:34:40.39699');
INSERT INTO historiales VALUES (577, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:34:51.523888');
INSERT INTO historiales VALUES (578, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/121', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:35:01.095511');
INSERT INTO historiales VALUES (579, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:35:10.17657');
INSERT INTO historiales VALUES (580, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/123', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:35:17.352705');
INSERT INTO historiales VALUES (581, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1232222', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:35:27.535419');
INSERT INTO historiales VALUES (582, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:35:42.922919');
INSERT INTO historiales VALUES (583, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:36:34.027629');
INSERT INTO historiales VALUES (584, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:39:40.748635');
INSERT INTO historiales VALUES (585, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:39:49.59608');
INSERT INTO historiales VALUES (586, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:41:08.492818');
INSERT INTO historiales VALUES (587, NULL, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', '127.0.0.1', '2015-07-28 15:41:58.439005');
INSERT INTO historiales VALUES (588, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', '127.0.0.1', '2015-07-28 15:41:59.31128');
INSERT INTO historiales VALUES (589, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', '127.0.0.1', '2015-07-28 15:42:05.122536');
INSERT INTO historiales VALUES (590, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:37.0) Gecko/20100101 Firefox/37.0', '127.0.0.1', '2015-07-28 15:42:06.828048');
INSERT INTO historiales VALUES (591, 1, 'http://localhost/cav/admin/movimientos/add/111', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-28 15:43:30.194336');
INSERT INTO historiales VALUES (592, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:44:35.559607');
INSERT INTO historiales VALUES (593, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/HXW321', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:46:02.997616');
INSERT INTO historiales VALUES (594, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:5:{s:15:"patente_mostrar";s:6:"HXW321";s:7:"patente";s:6:"HXW321";s:5:"color";s:6:"blanco";s:11:"descripcion";s:12:"muchas cosas";s:17:"tipo_autorizacion";s:1:"2";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:46:17.803746');
INSERT INTO historiales VALUES (595, 1, 'http://localhost/cav/admin/personas/busqueda_dni/36274686', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:46:31.434451');
INSERT INTO historiales VALUES (596, 1, 'http://localhost/cav/admin/personas/add_ajax', 'a:1:{s:11:"persona_add";a:4:{s:6:"nombre";s:5:"Borda";s:8:"apellido";s:8:"Jonathan";s:16:"numero_documento";s:8:"36274686";s:8:"telefono";s:3:"011";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:46:43.38531');
INSERT INTO historiales VALUES (597, 1, 'http://localhost/cav/admin/movimientos/add', 'a:1:{s:10:"Movimiento";a:5:{s:15:"tipo_movimiento";s:1:"1";s:11:"vehiculo_id";s:2:"10";s:10:"persona_id";s:1:"4";s:6:"sector";s:3:"Aca";s:7:"interno";s:4:"Alla";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:46:52.843852');
INSERT INTO historiales VALUES (598, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:47:02.406845');
INSERT INTO historiales VALUES (599, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.134 Safari/537.36', '127.0.0.1', '2015-07-28 15:47:11.464095');
INSERT INTO historiales VALUES (600, NULL, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 07:45:32.132996');
INSERT INTO historiales VALUES (601, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 07:45:33.533809');
INSERT INTO historiales VALUES (602, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 07:51:44.068258');
INSERT INTO historiales VALUES (603, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 07:51:46.275149');
INSERT INTO historiales VALUES (604, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:40:13.526648');
INSERT INTO historiales VALUES (605, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:40:40.829559');
INSERT INTO historiales VALUES (606, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1234123412', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:41:06.120291');
INSERT INTO historiales VALUES (607, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:41:37.079537');
INSERT INTO historiales VALUES (608, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/q12341234', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:41:44.653203');
INSERT INTO historiales VALUES (609, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:47:28.147986');
INSERT INTO historiales VALUES (610, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:48:26.696091');
INSERT INTO historiales VALUES (611, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:48:52.719372');
INSERT INTO historiales VALUES (612, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:49:09.585094');
INSERT INTO historiales VALUES (613, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:49:35.710243');
INSERT INTO historiales VALUES (614, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:50:15.706488');
INSERT INTO historiales VALUES (615, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:50:53.287644');
INSERT INTO historiales VALUES (616, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/133', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:51:16.982865');
INSERT INTO historiales VALUES (617, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:55:52.855992');
INSERT INTO historiales VALUES (618, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:57:43.764764');
INSERT INTO historiales VALUES (619, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:58:05.153');
INSERT INTO historiales VALUES (620, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:58:39.008894');
INSERT INTO historiales VALUES (621, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:58:59.224255');
INSERT INTO historiales VALUES (622, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 08:59:32.471644');
INSERT INTO historiales VALUES (623, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:00:03.871282');
INSERT INTO historiales VALUES (624, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:01:18.936922');
INSERT INTO historiales VALUES (625, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:02:35.697391');
INSERT INTO historiales VALUES (626, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:05:26.757447');
INSERT INTO historiales VALUES (627, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:06:31.098454');
INSERT INTO historiales VALUES (628, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:07:02.846907');
INSERT INTO historiales VALUES (629, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:07:19.030493');
INSERT INTO historiales VALUES (630, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:07:56.587034');
INSERT INTO historiales VALUES (631, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:08:00.033188');
INSERT INTO historiales VALUES (632, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:09:11.804767');
INSERT INTO historiales VALUES (633, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:10:53.849548');
INSERT INTO historiales VALUES (634, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:11:16.688581');
INSERT INTO historiales VALUES (635, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:11:32.028332');
INSERT INTO historiales VALUES (636, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:12:21.099411');
INSERT INTO historiales VALUES (637, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:12:30.913484');
INSERT INTO historiales VALUES (638, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:13:51.243793');
INSERT INTO historiales VALUES (639, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:14:33.448211');
INSERT INTO historiales VALUES (640, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:15:22.685065');
INSERT INTO historiales VALUES (641, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:15:50.720022');
INSERT INTO historiales VALUES (642, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:19:18.322208');
INSERT INTO historiales VALUES (643, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:20:30.619455');
INSERT INTO historiales VALUES (644, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:21:01.310796');
INSERT INTO historiales VALUES (645, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:22:33.307266');
INSERT INTO historiales VALUES (646, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:24:02.964574');
INSERT INTO historiales VALUES (647, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:25:17.764066');
INSERT INTO historiales VALUES (648, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:25:31.255153');
INSERT INTO historiales VALUES (649, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:30:02.647408');
INSERT INTO historiales VALUES (650, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:30:10.44548');
INSERT INTO historiales VALUES (651, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:31:56.999602');
INSERT INTO historiales VALUES (652, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:32:10.437658');
INSERT INTO historiales VALUES (690, 1, 'http://localhost/cav/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:51:26.726949');
INSERT INTO historiales VALUES (653, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:32:16.72988');
INSERT INTO historiales VALUES (654, NULL, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:32:53.468404');
INSERT INTO historiales VALUES (655, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:32:54.341214');
INSERT INTO historiales VALUES (656, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:33:53.978901');
INSERT INTO historiales VALUES (657, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:34:00.987207');
INSERT INTO historiales VALUES (658, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:34:06.082776');
INSERT INTO historiales VALUES (659, 1, 'http://localhost/cav/admin/movimientos/add', 'a:1:{s:10:"Movimiento";a:5:{s:15:"tipo_movimiento";s:1:"1";s:11:"vehiculo_id";s:1:"3";s:10:"persona_id";s:1:"1";s:6:"sector";s:1:"1";s:7:"interno";s:1:"1";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:34:31.172667');
INSERT INTO historiales VALUES (660, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:35:17.371905');
INSERT INTO historiales VALUES (661, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:35:56.036089');
INSERT INTO historiales VALUES (662, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:36:13.328017');
INSERT INTO historiales VALUES (663, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:36:46.136196');
INSERT INTO historiales VALUES (664, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:36:53.831088');
INSERT INTO historiales VALUES (665, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:36:59.30338');
INSERT INTO historiales VALUES (666, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:37:58.749473');
INSERT INTO historiales VALUES (667, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:38:04.492302');
INSERT INTO historiales VALUES (668, 1, 'http://localhost/cav/admin/movimientos/add', 'a:1:{s:10:"Movimiento";a:5:{s:15:"tipo_movimiento";s:1:"1";s:11:"vehiculo_id";s:1:"3";s:10:"persona_id";s:1:"1";s:6:"sector";s:1:"1";s:7:"interno";s:1:"1";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:38:09.846069');
INSERT INTO historiales VALUES (669, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/12', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:41:48.670423');
INSERT INTO historiales VALUES (670, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/1222', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:41:54.615517');
INSERT INTO historiales VALUES (671, 1, 'http://localhost/cav/admin/vehiculos/add_ajax', 'a:1:{s:12:"vehiculo_add";a:4:{s:7:"patente";s:4:"1222";s:5:"color";s:2:"21";s:11:"descripcion";s:1:"1";s:17:"tipo_autorizacion";s:1:"1";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:42:00.476711');
INSERT INTO historiales VALUES (672, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:45:27.43573');
INSERT INTO historiales VALUES (673, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:45:29.297119');
INSERT INTO historiales VALUES (674, 1, 'http://localhost/cav/admin/personas/busqueda_dni/1', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:45:57.964545');
INSERT INTO historiales VALUES (675, 1, 'http://localhost/cav/admin/movimientos/add', 'a:1:{s:10:"Movimiento";a:5:{s:15:"tipo_movimiento";s:1:"1";s:11:"vehiculo_id";s:2:"11";s:10:"persona_id";s:1:"1";s:6:"sector";s:1:"1";s:7:"interno";s:1:"1";}}', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:46:05.0742');
INSERT INTO historiales VALUES (676, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:47:56.610716');
INSERT INTO historiales VALUES (677, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:48:21.291447');
INSERT INTO historiales VALUES (678, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:48:30.987504');
INSERT INTO historiales VALUES (679, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:48:39.264691');
INSERT INTO historiales VALUES (680, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:49:17.655293');
INSERT INTO historiales VALUES (681, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:50:18.746419');
INSERT INTO historiales VALUES (682, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:50:32.130905');
INSERT INTO historiales VALUES (683, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:50:32.835932');
INSERT INTO historiales VALUES (684, 1, 'http://localhost/cav/admin/fichas', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:50:35.534303');
INSERT INTO historiales VALUES (685, 1, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:50:40.792978');
INSERT INTO historiales VALUES (686, 1, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:50:41.463229');
INSERT INTO historiales VALUES (687, 1, 'http://localhost/cav/admin/fichas', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:50:44.082187');
INSERT INTO historiales VALUES (688, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:50:50.421397');
INSERT INTO historiales VALUES (689, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:50:59.464021');
INSERT INTO historiales VALUES (691, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', '127.0.0.1', '2015-07-29 09:51:39.4849');
INSERT INTO historiales VALUES (692, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:51:42.817223');
INSERT INTO historiales VALUES (693, 1, 'http://localhost/cav/admin/movimientos/add/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:51:51.26146');
INSERT INTO historiales VALUES (694, 1, 'http://localhost/cav/admin/movimientos/add/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:52:22.771727');
INSERT INTO historiales VALUES (695, 1, 'http://localhost/cav/admin/vehiculos/busqueda_patente/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:52:29.854505');
INSERT INTO historiales VALUES (696, 1, 'http://localhost/cav/admin/personas/busqueda_dni/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:52:33.727027');
INSERT INTO historiales VALUES (697, 1, 'http://localhost/cav/admin/movimientos/add/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:53:17.044992');
INSERT INTO historiales VALUES (698, 1, 'http://localhost/cav/admin/movimientos/add/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:53:20.105248');
INSERT INTO historiales VALUES (699, 1, 'http://localhost/cav/admin/movimientos/add/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:55:04.193654');
INSERT INTO historiales VALUES (700, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-07-29 09:56:29.743471');


--
-- TOC entry 1990 (class 0 OID 0)
-- Dependencies: 163
-- Name: historiales_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('historiales_id_seq', 700, true);


--
-- TOC entry 1971 (class 0 OID 80526)
-- Dependencies: 181
-- Data for Name: movimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 1991 (class 0 OID 0)
-- Dependencies: 180
-- Name: movimientos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('movimientos_id_seq', 1, false);


--
-- TOC entry 1956 (class 0 OID 79919)
-- Dependencies: 166
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO personas VALUES (1, 'Juanito', 'Laguna', '1', NULL);
INSERT INTO personas VALUES (2, '1', '1', '2', '1');
INSERT INTO personas VALUES (3, 'Jonathan', 'Borda', '12', '1');
INSERT INTO personas VALUES (4, 'Borda', 'Jonathan', '36274686', '011');


--
-- TOC entry 1992 (class 0 OID 0)
-- Dependencies: 167
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personas_id_seq', 4, true);


--
-- TOC entry 1954 (class 0 OID 79905)
-- Dependencies: 164
-- Data for Name: vehiculos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO vehiculos VALUES (3, '1', NULL, NULL, '1');
INSERT INTO vehiculos VALUES (4, '123', '12', '12', '12');
INSERT INTO vehiculos VALUES (5, '1233', '1', '1', '1');
INSERT INTO vehiculos VALUES (6, '12354', 'blanco', 'nos enose nose nosen osen', '1');
INSERT INTO vehiculos VALUES (7, NULL, '1', '1', '1');
INSERT INTO vehiculos VALUES (8, NULL, '1', '1', '1');
INSERT INTO vehiculos VALUES (9, '12', '12', '12', '12');
INSERT INTO vehiculos VALUES (10, 'HXW321', 'blanco', 'muchas cosas', '2');
INSERT INTO vehiculos VALUES (11, '1222', '21', '1', '1');


--
-- TOC entry 1993 (class 0 OID 0)
-- Dependencies: 165
-- Name: vehiculos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('vehiculos_id_seq', 11, true);


SET search_path = usuarios, pg_catalog;

--
-- TOC entry 1958 (class 0 OID 79924)
-- Dependencies: 168
-- Data for Name: grupos; Type: TABLE DATA; Schema: usuarios; Owner: postgres
--

INSERT INTO grupos VALUES (1, 'administrador');


--
-- TOC entry 1959 (class 0 OID 79927)
-- Dependencies: 169
-- Data for Name: grupos_urls; Type: TABLE DATA; Schema: usuarios; Owner: postgres
--



--
-- TOC entry 1994 (class 0 OID 0)
-- Dependencies: 170
-- Name: ruv_actions_ruv_groups_id_seq; Type: SEQUENCE SET; Schema: usuarios; Owner: postgres
--

SELECT pg_catalog.setval('ruv_actions_ruv_groups_id_seq', 1, false);


--
-- TOC entry 1995 (class 0 OID 0)
-- Dependencies: 171
-- Name: ruv_groups_id_seq; Type: SEQUENCE SET; Schema: usuarios; Owner: postgres
--

SELECT pg_catalog.setval('ruv_groups_id_seq', 1, true);


--
-- TOC entry 1962 (class 0 OID 79934)
-- Dependencies: 172
-- Data for Name: urls; Type: TABLE DATA; Schema: usuarios; Owner: postgres
--



--
-- TOC entry 1996 (class 0 OID 0)
-- Dependencies: 173
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: usuarios; Owner: postgres
--

SELECT pg_catalog.setval('urls_id_seq', 1, false);


--
-- TOC entry 1964 (class 0 OID 79939)
-- Dependencies: 174
-- Data for Name: usuarios; Type: TABLE DATA; Schema: usuarios; Owner: postgres
--

INSERT INTO usuarios VALUES (1, '11e9114dcf750daada135250f5163f3e', 'admin', NULL, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 1965 (class 0 OID 79945)
-- Dependencies: 175
-- Data for Name: usuarios_grupos; Type: TABLE DATA; Schema: usuarios; Owner: postgres
--

INSERT INTO usuarios_grupos VALUES (1, 1, 1);


--
-- TOC entry 1997 (class 0 OID 0)
-- Dependencies: 176
-- Name: usuarios_grupos_id_seq; Type: SEQUENCE SET; Schema: usuarios; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_grupos_id_seq', 1, true);


--
-- TOC entry 1998 (class 0 OID 0)
-- Dependencies: 177
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: usuarios; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_id_seq', 1, true);


--
-- TOC entry 1999 (class 0 OID 0)
-- Dependencies: 178
-- Name: usuarios_table_id; Type: SEQUENCE SET; Schema: usuarios; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_table_id', 72, false);


--
-- TOC entry 2000 (class 0 OID 0)
-- Dependencies: 179
-- Name: usuarios_table_id_seq; Type: SEQUENCE SET; Schema: usuarios; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_table_id_seq', 1, false);


SET search_path = public, pg_catalog;

--
-- TOC entry 1819 (class 2606 OID 79966)
-- Name: historial_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY historiales
    ADD CONSTRAINT historial_pk PRIMARY KEY (id);


--
-- TOC entry 1843 (class 2606 OID 80532)
-- Name: movimientos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movimientos
    ADD CONSTRAINT movimientos_pk PRIMARY KEY (id);


--
-- TOC entry 1825 (class 2606 OID 79970)
-- Name: personas_dni; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT personas_dni UNIQUE (numero_documento);


--
-- TOC entry 1827 (class 2606 OID 79972)
-- Name: personas_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personas
    ADD CONSTRAINT personas_pk PRIMARY KEY (id);


--
-- TOC entry 1821 (class 2606 OID 80039)
-- Name: vehiculos_patente_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vehiculos
    ADD CONSTRAINT vehiculos_patente_unique UNIQUE (patente);


--
-- TOC entry 1823 (class 2606 OID 79976)
-- Name: vehiculos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY vehiculos
    ADD CONSTRAINT vehiculos_pk PRIMARY KEY (id);


SET search_path = usuarios, pg_catalog;

--
-- TOC entry 1833 (class 2606 OID 79978)
-- Name: ruv_acciones_pkey; Type: CONSTRAINT; Schema: usuarios; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY urls
    ADD CONSTRAINT ruv_acciones_pkey PRIMARY KEY (id);


--
-- TOC entry 1831 (class 2606 OID 79980)
-- Name: ruv_acciones_ruv_grupos_pkey; Type: CONSTRAINT; Schema: usuarios; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY grupos_urls
    ADD CONSTRAINT ruv_acciones_ruv_grupos_pkey PRIMARY KEY (id);


--
-- TOC entry 1829 (class 2606 OID 79982)
-- Name: ruv_groups_pk; Type: CONSTRAINT; Schema: usuarios; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY grupos
    ADD CONSTRAINT ruv_groups_pk PRIMARY KEY (id);


--
-- TOC entry 1841 (class 2606 OID 79984)
-- Name: usuarios_grupos_pk; Type: CONSTRAINT; Schema: usuarios; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios_grupos
    ADD CONSTRAINT usuarios_grupos_pk PRIMARY KEY (id);


--
-- TOC entry 1835 (class 2606 OID 79986)
-- Name: usuarios_index; Type: CONSTRAINT; Schema: usuarios; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_index UNIQUE (usuario_login);


--
-- TOC entry 1837 (class 2606 OID 79988)
-- Name: usuarios_pk; Type: CONSTRAINT; Schema: usuarios; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pk PRIMARY KEY (id);


--
-- TOC entry 1838 (class 1259 OID 79989)
-- Name: fki_usuarios_grupos_grupos_fk; Type: INDEX; Schema: usuarios; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_usuarios_grupos_grupos_fk ON usuarios_grupos USING btree (grupo_id);


--
-- TOC entry 1839 (class 1259 OID 79990)
-- Name: fki_usuarios_grupos_usuarios_fk; Type: INDEX; Schema: usuarios; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_usuarios_grupos_usuarios_fk ON usuarios_grupos USING btree (usuario_id);


SET search_path = public, pg_catalog;

--
-- TOC entry 1848 (class 2606 OID 80533)
-- Name: movimientos_personas_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimientos
    ADD CONSTRAINT movimientos_personas_fk FOREIGN KEY (persona_id) REFERENCES personas(id);


--
-- TOC entry 1849 (class 2606 OID 80538)
-- Name: movimientos_usuarios_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimientos
    ADD CONSTRAINT movimientos_usuarios_fk FOREIGN KEY (usuario_id) REFERENCES usuarios.usuarios(id);


--
-- TOC entry 1850 (class 2606 OID 80543)
-- Name: movimientos_vehiculos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimientos
    ADD CONSTRAINT movimientos_vehiculos_fk FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(id);


SET search_path = usuarios, pg_catalog;

--
-- TOC entry 1844 (class 2606 OID 80006)
-- Name: grupo_urls_grupos_fk; Type: FK CONSTRAINT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY grupos_urls
    ADD CONSTRAINT grupo_urls_grupos_fk FOREIGN KEY (grupo_id) REFERENCES grupos(id);


--
-- TOC entry 1845 (class 2606 OID 80011)
-- Name: grupos_urls_urls_fk; Type: FK CONSTRAINT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY grupos_urls
    ADD CONSTRAINT grupos_urls_urls_fk FOREIGN KEY (url_id) REFERENCES urls(id);


--
-- TOC entry 1846 (class 2606 OID 80016)
-- Name: usuarios_grupos_grupos_fk; Type: FK CONSTRAINT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios_grupos
    ADD CONSTRAINT usuarios_grupos_grupos_fk FOREIGN KEY (grupo_id) REFERENCES grupos(id);


--
-- TOC entry 1847 (class 2606 OID 80021)
-- Name: usuarios_grupos_usuarios_fk; Type: FK CONSTRAINT; Schema: usuarios; Owner: postgres
--

ALTER TABLE ONLY usuarios_grupos
    ADD CONSTRAINT usuarios_grupos_usuarios_fk FOREIGN KEY (usuario_id) REFERENCES usuarios(id);


--
-- TOC entry 1978 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-07-29 10:13:37

--
-- PostgreSQL database dump complete
--

CREATE OR REPLACE VIEW v_vehiculos_adentro AS 
 SELECT m1.vehiculo_id
   FROM movimientos m1
  WHERE (m1.id IN ( SELECT m.id
           FROM movimientos m
          WHERE m.vehiculo_id = m1.vehiculo_id
          ORDER BY m.id DESC
         LIMIT 1)) AND m1.tipo_movimiento::text = 'ENTRADA'::text;

ALTER TABLE v_vehiculos_adentro
  OWNER TO postgres;

CREATE OR REPLACE VIEW v_vehiculos_excedidos AS 
 SELECT m1.vehiculo_id, v.patente, v.tipo_autorizacion, m1.id AS movimiento_id, m1.persona_id, m1.sector, m1.interno, m1.fecha_carga, m1.usuario_id
   FROM movimientos m1
   JOIN vehiculos v ON v.id = m1.vehiculo_id
  WHERE (m1.id IN ( SELECT m.id
      FROM movimientos m
     WHERE m.vehiculo_id = m1.vehiculo_id
     ORDER BY m.id DESC
    LIMIT 1)) AND m1.tipo_movimiento::text = 'ENTRADA'::text AND (m1.fecha_carga + ((COALESCE(m1.horas_predio, 0) || 'hours'::text)::interval) + ((COALESCE(m1.minutos_predio, 0) || 'minutes'::text)::interval)) > now();

ALTER TABLE v_vehiculos_excedidos
  OWNER TO jborda;
