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

INSERT INTO historiales VALUES (1564, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-08-13 06:47:53.36756');
INSERT INTO historiales VALUES (1565, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-08-13 06:47:57.546727');
INSERT INTO historiales VALUES (1566, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-08-13 06:47:57.775305');
INSERT INTO historiales VALUES (1567, 1, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-08-13 06:48:10.408189');
INSERT INTO historiales VALUES (1568, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-08-13 06:48:10.614941');
INSERT INTO historiales VALUES (1569, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-08-13 06:48:20.512358');
INSERT INTO historiales VALUES (1570, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-08-13 06:51:44.819855');
INSERT INTO historiales VALUES (1571, NULL, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.125 Safari/537.36', '127.0.0.1', '2015-08-13 06:53:41.59353');
INSERT INTO historiales VALUES (1572, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.125 Safari/537.36', '127.0.0.1', '2015-08-13 06:53:41.788558');
INSERT INTO historiales VALUES (1573, NULL, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.125 Safari/537.36', '127.0.0.1', '2015-08-13 07:00:39.266542');
INSERT INTO historiales VALUES (1574, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.125 Safari/537.36', '127.0.0.1', '2015-08-13 07:00:39.395181');
INSERT INTO historiales VALUES (1575, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.125 Safari/537.36', '127.0.0.1', '2015-08-13 07:00:50.579834');
INSERT INTO historiales VALUES (1576, NULL, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-08-13 07:39:10.538801');
INSERT INTO historiales VALUES (1577, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0', '127.0.0.1', '2015-08-13 07:39:10.676188');
INSERT INTO historiales VALUES (1578, 64, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-08 12:27:28.467798');
INSERT INTO historiales VALUES (1579, NULL, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:29:01.390516');
INSERT INTO historiales VALUES (1580, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:29:02.421159');
INSERT INTO historiales VALUES (1581, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:29:07.57617');
INSERT INTO historiales VALUES (1582, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:29:17.591164');
INSERT INTO historiales VALUES (1583, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:29:21.134075');
INSERT INTO historiales VALUES (1584, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:29:21.560765');
INSERT INTO historiales VALUES (1585, 1, 'http://localhost/cav-master/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:33:27.102057');
INSERT INTO historiales VALUES (1586, 1, 'http://localhost/cav-master/admin/usuarios/logout', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:33:32.876847');
INSERT INTO historiales VALUES (1587, NULL, 'http://localhost/cav-master/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:33:33.494691');
INSERT INTO historiales VALUES (1588, NULL, 'http://localhost/cav-master/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:33:37.56665');
INSERT INTO historiales VALUES (1589, 1, 'http://localhost/cav-master/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:33:38.009539');
INSERT INTO historiales VALUES (1590, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:38:01.313685');
INSERT INTO historiales VALUES (1591, 1, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:38:04.777286');
INSERT INTO historiales VALUES (1592, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:38:05.212084');
INSERT INTO historiales VALUES (1593, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:38:08.373595');
INSERT INTO historiales VALUES (1594, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:38:10.595617');
INSERT INTO historiales VALUES (1595, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:38:10.976634');
INSERT INTO historiales VALUES (1596, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:38:21.029555');
INSERT INTO historiales VALUES (1597, 1, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-08 12:38:24.614495');
INSERT INTO historiales VALUES (1598, NULL, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-16 08:55:17.348327');
INSERT INTO historiales VALUES (1599, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-16 08:55:18.799839');
INSERT INTO historiales VALUES (1600, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-16 08:55:24.935798');
INSERT INTO historiales VALUES (1601, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-16 08:55:25.688354');
INSERT INTO historiales VALUES (1602, 1, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-16 08:55:46.249954');
INSERT INTO historiales VALUES (1603, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-16 08:55:46.729988');
INSERT INTO historiales VALUES (1604, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-16 08:55:48.486871');
INSERT INTO historiales VALUES (1605, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-16 08:55:48.852217');
INSERT INTO historiales VALUES (1606, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-16 08:55:52.648732');
INSERT INTO historiales VALUES (1607, 1, 'http://localhost/cav/admin/grupos', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-16 08:56:13.665232');
INSERT INTO historiales VALUES (1608, 1, 'http://localhost/cav/admin/urls', NULL, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', '::1', '2015-09-16 08:56:23.599806');
INSERT INTO historiales VALUES (1609, NULL, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:03:46.304257');
INSERT INTO historiales VALUES (1610, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:03:46.476377');
INSERT INTO historiales VALUES (1611, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:03:59.14275');
INSERT INTO historiales VALUES (1612, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:04:04.09531');
INSERT INTO historiales VALUES (1613, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:04:09.897723');
INSERT INTO historiales VALUES (1614, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:04:10.069529');
INSERT INTO historiales VALUES (2, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:11:30.438164');
INSERT INTO historiales VALUES (3, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:11:45.631231');
INSERT INTO historiales VALUES (4, 1, 'http://localhost/cav/admin/urls', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:11:49.063307');
INSERT INTO historiales VALUES (5, 1, 'http://localhost/cav/admin/urls/index/page:4', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:11:56.782847');
INSERT INTO historiales VALUES (6, 1, 'http://localhost/cav/admin/urls/index/page:3', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:12:10.286841');
INSERT INTO historiales VALUES (7, 1, 'http://localhost/cav/admin/urls/index/page:2', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:12:14.367994');
INSERT INTO historiales VALUES (8, 1, 'http://localhost/cav/admin/urls/index/page:1', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:12:18.070763');
INSERT INTO historiales VALUES (9, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:13:08.21202');
INSERT INTO historiales VALUES (10, 1, 'http://localhost/cav/admin/vehiculos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:13:12.437199');
INSERT INTO historiales VALUES (11, 1, 'http://localhost/cav/admin/v_vehiculos_adentros', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:13:14.511563');
INSERT INTO historiales VALUES (12, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:13:16.288581');
INSERT INTO historiales VALUES (13, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:13:17.068942');
INSERT INTO historiales VALUES (14, 1, 'http://localhost/cav/admin/vehiculos/index', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:13:31.276655');
INSERT INTO historiales VALUES (15, 1, 'http://localhost/cav/admin/v_vehiculos_adentros', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:16:58.183571');
INSERT INTO historiales VALUES (16, 1, 'http://localhost/cav/admin/vehiculos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:16:59.528822');
INSERT INTO historiales VALUES (17, 1, 'http://localhost/cav/admin/vehiculos/index', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:18:32.39934');
INSERT INTO historiales VALUES (18, 1, 'http://localhost/cav/admin/vehiculos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:18:35.296822');
INSERT INTO historiales VALUES (19, 1, 'http://localhost/cav/admin/v_vehiculos_adentros', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:21:09.846825');
INSERT INTO historiales VALUES (20, 1, 'http://localhost/cav/admin/vehiculos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:21:11.522141');
INSERT INTO historiales VALUES (21, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:21:12.456719');
INSERT INTO historiales VALUES (22, 1, 'http://localhost/cav/admin/vehiculos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:21:13.868955');
INSERT INTO historiales VALUES (23, 1, 'http://localhost/cav/admin/v_vehiculos_adentros', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:21:19.416645');
INSERT INTO historiales VALUES (24, 1, 'http://localhost/cav/admin/v_vehiculos_excedidos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:21:20.149518');
INSERT INTO historiales VALUES (25, 1, 'http://localhost/cav/admin/v_vehiculos_adentros', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:21:22.14002');
INSERT INTO historiales VALUES (26, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:21:23.196514');
INSERT INTO historiales VALUES (27, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:21:23.976535');
INSERT INTO historiales VALUES (28, 1, 'http://localhost/cav/admin/vehiculos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:21:36.298911');
INSERT INTO historiales VALUES (29, 1, 'http://localhost/cav/admin/vehiculos/index', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:21:41.384296');
INSERT INTO historiales VALUES (30, 1, 'http://localhost/cav/admin/vehiculos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 09:21:46.251101');
INSERT INTO historiales VALUES (31, 1, 'http://localhost/cav/admin/vehiculos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:05:36.998847');
INSERT INTO historiales VALUES (32, 1, 'http://localhost/cav/admin/v_vehiculos_adentros', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:07:19.835895');
INSERT INTO historiales VALUES (33, 1, 'http://localhost/cav/admin/v_vehiculos_excedidos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:07:21.399177');
INSERT INTO historiales VALUES (34, 1, 'http://localhost/cav/admin/v_vehiculos_adentros', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:07:23.240673');
INSERT INTO historiales VALUES (35, 1, 'http://localhost/cav/admin/vehiculos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:07:24.029741');
INSERT INTO historiales VALUES (36, 1, 'http://localhost/cav/admin/v_vehiculos_adentros', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:07:25.530959');
INSERT INTO historiales VALUES (37, 1, 'http://localhost/cav/admin/vehiculos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:07:26.985411');
INSERT INTO historiales VALUES (38, 1, 'http://localhost/cav/admin/movimientos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:07:41.159747');
INSERT INTO historiales VALUES (39, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:07:56.93188');
INSERT INTO historiales VALUES (40, 1, 'http://localhost/cav/admin/usuarios/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:08:00.292811');
INSERT INTO historiales VALUES (41, 1, 'http://localhost/cav/admin/grupos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:08:48.781191');
INSERT INTO historiales VALUES (42, 1, 'http://localhost/cav/admin/grupos/add', 'a:3:{s:5:"Grupo";a:1:{s:11:"descripcion";s:9:"seguridad";}s:3:"Url";a:1:{s:3:"Url";s:0:"";}s:7:"Usuario";a:1:{s:7:"Usuario";s:0:"";}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:09:49.331226');
INSERT INTO historiales VALUES (43, 1, 'http://localhost/cav/admin/grupos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:09:49.577023');
INSERT INTO historiales VALUES (44, 1, 'http://localhost/cav/admin/grupos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:10:00.140437');
INSERT INTO historiales VALUES (45, 1, 'http://localhost/cav/admin/grupos/add', 'a:3:{s:5:"Grupo";a:1:{s:11:"descripcion";s:9:"CAV_ADMIN";}s:3:"Url";a:1:{s:3:"Url";s:0:"";}s:7:"Usuario";a:1:{s:7:"Usuario";s:0:"";}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:10:16.578005');
INSERT INTO historiales VALUES (46, 1, 'http://localhost/cav/admin/grupos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:10:16.808714');
INSERT INTO historiales VALUES (47, 1, 'http://localhost/cav/admin/usuarios/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:14:00.977799');
INSERT INTO historiales VALUES (48, 1, 'http://localhost/cav/admin/usuarios/add', 'a:2:{s:7:"Usuario";a:7:{s:15:"nombre_completo";s:15:"Manuel Elizondo";s:13:"usuario_login";s:9:"melizondo";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:11:"contrasenia";s:10:"secretaria";s:7:"borrado";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"3";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:14:40.932066');
INSERT INTO historiales VALUES (49, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:14:41.181834');
INSERT INTO historiales VALUES (50, 1, 'http://localhost/cav/admin/usuarios/edit/2', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:14:53.103787');
INSERT INTO historiales VALUES (51, 1, 'http://localhost/cav/admin/usuarios/edit/2', 'a:2:{s:7:"Usuario";a:8:{s:15:"nombre_completo";s:0:"";s:8:"password";s:10:"secretaria";s:13:"usuario_login";s:9:"melizondo";s:7:"borrado";s:0:"";s:11:"id_anterior";s:0:"";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"3";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:01.759732');
INSERT INTO historiales VALUES (52, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:01.920877');
INSERT INTO historiales VALUES (53, 1, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:08.354538');
INSERT INTO historiales VALUES (54, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:08.559486');
INSERT INTO historiales VALUES (55, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:17.434949');
INSERT INTO historiales VALUES (56, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:17.604221');
INSERT INTO historiales VALUES (57, 2, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:17.747423');
INSERT INTO historiales VALUES (58, 2, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:17.849741');
INSERT INTO historiales VALUES (59, 2, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:17.98404');
INSERT INTO historiales VALUES (60, 2, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:18.083172');
INSERT INTO historiales VALUES (61, 2, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:18.21873');
INSERT INTO historiales VALUES (62, 2, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:18.317582');
INSERT INTO historiales VALUES (63, 2, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:18.462192');
INSERT INTO historiales VALUES (64, 2, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:18.560848');
INSERT INTO historiales VALUES (65, 2, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:18.696244');
INSERT INTO historiales VALUES (66, 2, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:18.792916');
INSERT INTO historiales VALUES (67, 2, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:18.929223');
INSERT INTO historiales VALUES (68, 2, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:19.035188');
INSERT INTO historiales VALUES (69, 2, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:19.17051');
INSERT INTO historiales VALUES (70, 2, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:19.270942');
INSERT INTO historiales VALUES (71, 2, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:19.405712');
INSERT INTO historiales VALUES (72, 2, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:19.536443');
INSERT INTO historiales VALUES (73, 2, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:19.698708');
INSERT INTO historiales VALUES (74, 2, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:19.792507');
INSERT INTO historiales VALUES (75, 2, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:19.936487');
INSERT INTO historiales VALUES (76, 2, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:23.657933');
INSERT INTO historiales VALUES (77, 2, 'http://localhost/cav/admin', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:23.751582');
INSERT INTO historiales VALUES (78, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:23.896886');
INSERT INTO historiales VALUES (79, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:24.028781');
INSERT INTO historiales VALUES (80, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:24.17809');
INSERT INTO historiales VALUES (81, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:24.322596');
INSERT INTO historiales VALUES (82, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:24.475028');
INSERT INTO historiales VALUES (83, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:24.616754');
INSERT INTO historiales VALUES (84, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:24.751036');
INSERT INTO historiales VALUES (85, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:24.89773');
INSERT INTO historiales VALUES (86, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:25.03234');
INSERT INTO historiales VALUES (87, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:25.162787');
INSERT INTO historiales VALUES (88, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:25.290937');
INSERT INTO historiales VALUES (89, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:25.427735');
INSERT INTO historiales VALUES (90, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:25.56716');
INSERT INTO historiales VALUES (91, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:25.691472');
INSERT INTO historiales VALUES (92, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:25.814846');
INSERT INTO historiales VALUES (93, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:25.940247');
INSERT INTO historiales VALUES (94, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:26.065023');
INSERT INTO historiales VALUES (95, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:26.19094');
INSERT INTO historiales VALUES (96, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:26.327884');
INSERT INTO historiales VALUES (97, 2, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:29.049964');
INSERT INTO historiales VALUES (98, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:29.186815');
INSERT INTO historiales VALUES (99, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:29.324513');
INSERT INTO historiales VALUES (100, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:29.471379');
INSERT INTO historiales VALUES (101, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:29.599945');
INSERT INTO historiales VALUES (102, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:29.739684');
INSERT INTO historiales VALUES (103, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:29.881494');
INSERT INTO historiales VALUES (104, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:30.015197');
INSERT INTO historiales VALUES (105, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:30.148571');
INSERT INTO historiales VALUES (106, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:30.287343');
INSERT INTO historiales VALUES (107, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:30.41935');
INSERT INTO historiales VALUES (108, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:30.607701');
INSERT INTO historiales VALUES (109, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:30.742109');
INSERT INTO historiales VALUES (110, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:30.866077');
INSERT INTO historiales VALUES (111, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:30.995881');
INSERT INTO historiales VALUES (112, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:31.111743');
INSERT INTO historiales VALUES (113, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:31.308184');
INSERT INTO historiales VALUES (114, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:31.428141');
INSERT INTO historiales VALUES (115, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:31.547915');
INSERT INTO historiales VALUES (116, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:31.663377');
INSERT INTO historiales VALUES (117, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:31.782847');
INSERT INTO historiales VALUES (118, 2, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:42.941785');
INSERT INTO historiales VALUES (119, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:43.144333');
INSERT INTO historiales VALUES (120, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:43.283925');
INSERT INTO historiales VALUES (121, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:43.420295');
INSERT INTO historiales VALUES (122, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:43.563718');
INSERT INTO historiales VALUES (123, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:43.699076');
INSERT INTO historiales VALUES (124, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:43.826584');
INSERT INTO historiales VALUES (125, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:43.960957');
INSERT INTO historiales VALUES (126, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:44.096848');
INSERT INTO historiales VALUES (127, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:44.22471');
INSERT INTO historiales VALUES (128, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:44.361141');
INSERT INTO historiales VALUES (129, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:44.49194');
INSERT INTO historiales VALUES (130, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:44.631931');
INSERT INTO historiales VALUES (131, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:44.773448');
INSERT INTO historiales VALUES (132, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:44.910702');
INSERT INTO historiales VALUES (133, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:45.057398');
INSERT INTO historiales VALUES (134, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:45.188366');
INSERT INTO historiales VALUES (135, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:45.324089');
INSERT INTO historiales VALUES (136, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:45.450273');
INSERT INTO historiales VALUES (137, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:45.594816');
INSERT INTO historiales VALUES (138, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:45.731889');
INSERT INTO historiales VALUES (139, 2, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:49.440485');
INSERT INTO historiales VALUES (140, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:49.572327');
INSERT INTO historiales VALUES (141, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:49.707854');
INSERT INTO historiales VALUES (142, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:49.833839');
INSERT INTO historiales VALUES (143, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:49.971331');
INSERT INTO historiales VALUES (144, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:50.10702');
INSERT INTO historiales VALUES (145, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:50.25074');
INSERT INTO historiales VALUES (146, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:50.380598');
INSERT INTO historiales VALUES (147, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:50.525911');
INSERT INTO historiales VALUES (148, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:50.65508');
INSERT INTO historiales VALUES (149, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:50.790214');
INSERT INTO historiales VALUES (150, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:50.931959');
INSERT INTO historiales VALUES (151, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:51.077704');
INSERT INTO historiales VALUES (152, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:51.215208');
INSERT INTO historiales VALUES (153, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:51.352567');
INSERT INTO historiales VALUES (154, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:51.489791');
INSERT INTO historiales VALUES (155, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:51.624246');
INSERT INTO historiales VALUES (156, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:51.771813');
INSERT INTO historiales VALUES (157, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:51.894085');
INSERT INTO historiales VALUES (158, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:52.021569');
INSERT INTO historiales VALUES (159, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:15:52.143796');
INSERT INTO historiales VALUES (160, 2, 'http://localhost/cav/admin/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:16:59.346981');
INSERT INTO historiales VALUES (161, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:16:59.535123');
INSERT INTO historiales VALUES (162, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:16:59.664647');
INSERT INTO historiales VALUES (163, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:16:59.811765');
INSERT INTO historiales VALUES (164, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:16:59.955491');
INSERT INTO historiales VALUES (165, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:00.096418');
INSERT INTO historiales VALUES (166, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:00.242209');
INSERT INTO historiales VALUES (167, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:00.379889');
INSERT INTO historiales VALUES (168, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:00.51571');
INSERT INTO historiales VALUES (169, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:00.639686');
INSERT INTO historiales VALUES (170, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:00.779832');
INSERT INTO historiales VALUES (171, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:00.926493');
INSERT INTO historiales VALUES (172, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:01.059891');
INSERT INTO historiales VALUES (173, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:01.19747');
INSERT INTO historiales VALUES (174, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:01.340832');
INSERT INTO historiales VALUES (175, 2, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:01.466013');
INSERT INTO historiales VALUES (176, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:01.607768');
INSERT INTO historiales VALUES (177, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:01.743916');
INSERT INTO historiales VALUES (178, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:01.875724');
INSERT INTO historiales VALUES (179, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:02.006756');
INSERT INTO historiales VALUES (180, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:02.127632');
INSERT INTO historiales VALUES (181, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:02.260929');
INSERT INTO historiales VALUES (182, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:02.400483');
INSERT INTO historiales VALUES (183, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:02.541754');
INSERT INTO historiales VALUES (184, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:02.687031');
INSERT INTO historiales VALUES (185, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:02.8148');
INSERT INTO historiales VALUES (186, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:02.961813');
INSERT INTO historiales VALUES (187, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:03.092946');
INSERT INTO historiales VALUES (188, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:03.226571');
INSERT INTO historiales VALUES (189, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:03.366452');
INSERT INTO historiales VALUES (190, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:03.509875');
INSERT INTO historiales VALUES (191, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:03.633144');
INSERT INTO historiales VALUES (192, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:03.761307');
INSERT INTO historiales VALUES (193, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:03.880908');
INSERT INTO historiales VALUES (194, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:03.997712');
INSERT INTO historiales VALUES (195, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:04.148083');
INSERT INTO historiales VALUES (196, 2, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:22.054715');
INSERT INTO historiales VALUES (197, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:22.266374');
INSERT INTO historiales VALUES (198, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:22.414959');
INSERT INTO historiales VALUES (199, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:22.545591');
INSERT INTO historiales VALUES (200, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:22.685869');
INSERT INTO historiales VALUES (201, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:22.81905');
INSERT INTO historiales VALUES (202, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:22.959836');
INSERT INTO historiales VALUES (203, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:23.087038');
INSERT INTO historiales VALUES (204, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:23.238177');
INSERT INTO historiales VALUES (205, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:23.371281');
INSERT INTO historiales VALUES (206, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:23.490974');
INSERT INTO historiales VALUES (207, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:23.6171');
INSERT INTO historiales VALUES (208, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:23.755872');
INSERT INTO historiales VALUES (209, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:23.886055');
INSERT INTO historiales VALUES (210, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:24.021679');
INSERT INTO historiales VALUES (211, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:24.15622');
INSERT INTO historiales VALUES (212, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:24.29926');
INSERT INTO historiales VALUES (213, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:24.435629');
INSERT INTO historiales VALUES (214, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:24.571328');
INSERT INTO historiales VALUES (215, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:24.707605');
INSERT INTO historiales VALUES (216, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:24.837875');
INSERT INTO historiales VALUES (217, 2, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:34.686903');
INSERT INTO historiales VALUES (218, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:34.889561');
INSERT INTO historiales VALUES (219, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:40.747321');
INSERT INTO historiales VALUES (220, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:45.862274');
INSERT INTO historiales VALUES (221, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:46.01096');
INSERT INTO historiales VALUES (222, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:17:59.191539');
INSERT INTO historiales VALUES (223, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:18:01.165198');
INSERT INTO historiales VALUES (224, 1, 'http://localhost/cav/admin/grupos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:18:07.35467');
INSERT INTO historiales VALUES (225, 1, 'http://localhost/cav/admin/grupos/edit/3', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:18:11.654912');
INSERT INTO historiales VALUES (226, 1, 'http://localhost/cav/css/tagsinput/jquery.tagit.css', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:18:11.981826');
INSERT INTO historiales VALUES (227, 1, 'http://localhost/cav/css/tagsinput/jquery.tagit.css', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:18:12.134383');
INSERT INTO historiales VALUES (228, 1, 'http://localhost/cav/admin/grupos/edit/3', 'a:3:{s:5:"Grupo";a:2:{s:2:"id";s:1:"3";s:11:"descripcion";s:9:"CAV_ADMIN";}s:3:"Url";a:1:{s:3:"Url";a:55:{i:0;s:1:"1";i:1;s:2:"20";i:2;s:2:"21";i:3;s:2:"22";i:4;s:2:"23";i:5;s:2:"24";i:6;s:2:"25";i:7;s:2:"26";i:8;s:2:"27";i:9;s:2:"28";i:10;s:2:"29";i:11;s:2:"30";i:12;s:2:"31";i:13;s:2:"32";i:14;s:2:"33";i:15;s:2:"34";i:16;s:2:"35";i:17;s:2:"36";i:18;s:2:"37";i:19;s:2:"38";i:20;s:2:"39";i:21;s:2:"40";i:22;s:2:"41";i:23;s:2:"42";i:24;s:2:"43";i:25;s:2:"44";i:26;s:2:"45";i:27;s:2:"46";i:28;s:2:"47";i:29;s:2:"48";i:30;s:2:"49";i:31;s:2:"50";i:32;s:2:"51";i:33;s:2:"52";i:34;s:2:"59";i:35;s:2:"60";i:36;s:2:"61";i:37;s:2:"62";i:38;s:2:"63";i:39;s:2:"64";i:40;s:2:"65";i:41;s:2:"66";i:42;s:2:"67";i:43;s:2:"68";i:44;s:2:"69";i:45;s:2:"70";i:46;s:2:"71";i:47;s:2:"72";i:48;s:2:"73";i:49;s:2:"74";i:50;s:2:"75";i:51;s:2:"76";i:52;s:2:"77";i:53;s:2:"78";i:54;s:2:"79";}}s:7:"Usuario";a:1:{s:7:"Usuario";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:20:31.18049');
INSERT INTO historiales VALUES (229, 1, 'http://localhost/cav/admin/grupos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:20:31.480084');
INSERT INTO historiales VALUES (230, 1, 'http://localhost/cav/admin/grupos/edit/3', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:20:34.045981');
INSERT INTO historiales VALUES (231, 1, 'http://localhost/cav/css/tagsinput/jquery.tagit.css', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:20:34.29538');
INSERT INTO historiales VALUES (232, 1, 'http://localhost/cav/css/tagsinput/jquery.tagit.css', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:20:34.438878');
INSERT INTO historiales VALUES (233, 1, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:20:38.848586');
INSERT INTO historiales VALUES (234, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:20:38.982761');
INSERT INTO historiales VALUES (235, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:20:44.972698');
INSERT INTO historiales VALUES (236, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:20:45.133743');
INSERT INTO historiales VALUES (237, 2, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:20:50.926763');
INSERT INTO historiales VALUES (238, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:20:51.074767');
INSERT INTO historiales VALUES (239, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:20:55.367385');
INSERT INTO historiales VALUES (240, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:20:59.603637');
INSERT INTO historiales VALUES (241, NULL, 'http://localhost/cav/', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:21:03.482816');
INSERT INTO historiales VALUES (242, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:21:03.595605');
INSERT INTO historiales VALUES (243, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:21:09.661014');
INSERT INTO historiales VALUES (244, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:21:09.821861');
INSERT INTO historiales VALUES (245, 1, 'http://localhost/cav/admin/usuarios/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:21:15.393653');
INSERT INTO historiales VALUES (246, 1, 'http://localhost/cav/admin/usuarios/add', 'a:2:{s:7:"Usuario";a:7:{s:15:"nombre_completo";s:13:"Diego Zuretti";s:13:"usuario_login";s:7:"Duretti";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:11:"contrasenia";s:0:"";s:7:"borrado";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";s:0:"";}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:21:39.836571');
INSERT INTO historiales VALUES (247, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:21:40.050178');
INSERT INTO historiales VALUES (248, 1, 'http://localhost/cav/admin/usuarios/edit/3', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:21:42.91321');
INSERT INTO historiales VALUES (249, 1, 'http://localhost/cav/admin/usuarios/edit/3', 'a:2:{s:7:"Usuario";a:8:{s:15:"nombre_completo";s:13:"Diego Zuretti";s:8:"password";s:10:"secretaria";s:13:"usuario_login";s:8:"dzuretti";s:7:"borrado";s:0:"";s:11:"id_anterior";s:0:"";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"3";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:22:37.910502');
INSERT INTO historiales VALUES (250, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:22:38.153336');
INSERT INTO historiales VALUES (251, 1, 'http://localhost/cav/admin/usuarios/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:22:55.058517');
INSERT INTO historiales VALUES (252, 1, 'http://localhost/cav/admin/usuarios/add', 'a:2:{s:7:"Usuario";a:7:{s:15:"nombre_completo";s:17:"Bernardo Abásolo";s:13:"usuario_login";s:8:"babasolo";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:11:"contrasenia";s:10:"secretaria";s:7:"borrado";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"3";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:23:20.456868');
INSERT INTO historiales VALUES (253, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:23:20.677976');
INSERT INTO historiales VALUES (254, 1, 'http://localhost/cav/admin/usuarios/edit/4', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:23:32.216543');
INSERT INTO historiales VALUES (353, 2, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:32:31.690988');
INSERT INTO historiales VALUES (255, 1, 'http://localhost/cav/admin/usuarios/edit/4', 'a:2:{s:7:"Usuario";a:8:{s:15:"nombre_completo";s:0:"";s:8:"password";s:10:"secretaria";s:13:"usuario_login";s:8:"babasolo";s:7:"borrado";s:0:"";s:11:"id_anterior";s:0:"";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"3";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:23:36.934181');
INSERT INTO historiales VALUES (256, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:23:37.078543');
INSERT INTO historiales VALUES (257, 1, 'http://localhost/cav/admin/usuarios/perfil/1', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:24:15.64429');
INSERT INTO historiales VALUES (258, 1, 'http://localhost/cav/admin/usuarios/perfil/1', 'a:1:{s:7:"Usuario";a:3:{s:15:"nombre_completo";s:5:"Admin";s:8:"password";s:14:"francella31415";s:6:"imagen";a:5:{s:4:"name";s:0:"";s:4:"type";s:0:"";s:8:"tmp_name";s:0:"";s:5:"error";i:4;s:4:"size";i:0;}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:24:34.704696');
INSERT INTO historiales VALUES (259, 1, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:24:39.773452');
INSERT INTO historiales VALUES (260, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:24:39.915793');
INSERT INTO historiales VALUES (261, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:24:46.41741');
INSERT INTO historiales VALUES (262, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:24:46.570654');
INSERT INTO historiales VALUES (263, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:24:52.075684');
INSERT INTO historiales VALUES (264, 1, 'http://localhost/cav/admin/usuarios/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:25:02.253426');
INSERT INTO historiales VALUES (265, 1, 'http://localhost/cav/admin/usuarios/add', 'a:2:{s:7:"Usuario";a:7:{s:15:"nombre_completo";s:19:"Antoine Tarnopolsky";s:13:"usuario_login";s:12:"atarnopolsky";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:11:"contrasenia";s:10:"secretaria";s:7:"borrado";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"3";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:25:25.647932');
INSERT INTO historiales VALUES (266, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:25:25.859376');
INSERT INTO historiales VALUES (267, 1, 'http://localhost/cav/admin/usuarios/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:35:05.267695');
INSERT INTO historiales VALUES (268, 1, 'http://localhost/cav/admin/usuarios/add', 'a:2:{s:7:"Usuario";a:7:{s:15:"nombre_completo";s:13:"Juan Donadón";s:13:"usuario_login";s:8:"jdonadon";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:11:"contrasenia";s:0:"";s:7:"borrado";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:35:22.837914');
INSERT INTO historiales VALUES (269, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:35:23.063388');
INSERT INTO historiales VALUES (270, 1, 'http://localhost/cav/admin/usuarios/edit/5', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:35:26.771873');
INSERT INTO historiales VALUES (271, 1, 'http://localhost/cav/admin/usuarios/edit/5', 'a:2:{s:7:"Usuario";a:8:{s:15:"nombre_completo";s:0:"";s:8:"password";s:10:"secretaria";s:13:"usuario_login";s:12:"atarnopolsky";s:7:"borrado";s:0:"";s:11:"id_anterior";s:0:"";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"3";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:35:31.415451');
INSERT INTO historiales VALUES (272, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:35:31.567515');
INSERT INTO historiales VALUES (273, 1, 'http://localhost/cav/admin/usuarios/edit/5', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:35:34.137047');
INSERT INTO historiales VALUES (274, 1, 'http://localhost/cav/admin/usuarios/edit/6', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:35:37.827473');
INSERT INTO historiales VALUES (275, 1, 'http://localhost/cav/admin/usuarios/edit/6', 'a:2:{s:7:"Usuario";a:8:{s:15:"nombre_completo";s:12:"Juan Donadon";s:8:"password";s:10:"secretaria";s:13:"usuario_login";s:8:"jdonadon";s:7:"borrado";s:0:"";s:11:"id_anterior";s:0:"";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:35:48.759268');
INSERT INTO historiales VALUES (276, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:35:48.986657');
INSERT INTO historiales VALUES (277, 1, 'http://localhost/cav/admin/usuarios/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:38:42.022603');
INSERT INTO historiales VALUES (278, 1, 'http://localhost/cav/admin/usuarios/add', 'a:2:{s:7:"Usuario";a:7:{s:15:"nombre_completo";s:13:"Orlando Perez";s:13:"usuario_login";s:6:"operez";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:11:"contrasenia";s:0:"";s:7:"borrado";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:38:55.369443');
INSERT INTO historiales VALUES (279, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:38:55.590521');
INSERT INTO historiales VALUES (280, 1, 'http://localhost/cav/admin/usuarios/edit/7', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:39:18.033249');
INSERT INTO historiales VALUES (281, 1, 'http://localhost/cav/admin/usuarios/edit/7', 'a:2:{s:7:"Usuario";a:8:{s:15:"nombre_completo";s:0:"";s:8:"password";s:10:"secretaria";s:13:"usuario_login";s:6:"operez";s:7:"borrado";s:0:"";s:11:"id_anterior";s:0:"";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:39:21.571617');
INSERT INTO historiales VALUES (282, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:39:21.73605');
INSERT INTO historiales VALUES (283, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:40:23.424128');
INSERT INTO historiales VALUES (284, 1, 'http://localhost/cav/admin/usuarios/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:40:26.632802');
INSERT INTO historiales VALUES (285, 1, 'http://localhost/cav/admin/usuarios/add', 'a:2:{s:7:"Usuario";a:7:{s:15:"nombre_completo";s:13:"Diego Escobar";s:13:"usuario_login";s:8:"descobar";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:11:"contrasenia";s:10:"secretaria";s:7:"borrado";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:41:02.167288');
INSERT INTO historiales VALUES (286, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:41:02.373122');
INSERT INTO historiales VALUES (287, 1, 'http://localhost/cav/admin/usuarios/edit/8', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:41:07.179189');
INSERT INTO historiales VALUES (288, 1, 'http://localhost/cav/admin/usuarios/edit/8', 'a:2:{s:7:"Usuario";a:8:{s:15:"nombre_completo";s:0:"";s:8:"password";s:10:"secretaria";s:13:"usuario_login";s:8:"descobar";s:7:"borrado";s:0:"";s:11:"id_anterior";s:0:"";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:41:15.998606');
INSERT INTO historiales VALUES (289, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:41:16.238168');
INSERT INTO historiales VALUES (290, 1, 'http://localhost/cav/admin/usuarios/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:42:15.613884');
INSERT INTO historiales VALUES (291, 1, 'http://localhost/cav/admin/usuarios/add', 'a:2:{s:7:"Usuario";a:7:{s:15:"nombre_completo";s:12:"Fabio Beuzer";s:13:"usuario_login";s:7:"fbeuzer";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:11:"contrasenia";s:10:"secretaria";s:7:"borrado";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:42:37.59721');
INSERT INTO historiales VALUES (292, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:42:37.811349');
INSERT INTO historiales VALUES (293, 1, 'http://localhost/cav/admin/usuarios/edit/9', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:42:45.938141');
INSERT INTO historiales VALUES (294, 1, 'http://localhost/cav/admin/usuarios/edit/9', 'a:2:{s:7:"Usuario";a:8:{s:15:"nombre_completo";s:0:"";s:8:"password";s:10:"secretaria";s:13:"usuario_login";s:7:"fbeuzer";s:7:"borrado";s:0:"";s:11:"id_anterior";s:0:"";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:42:50.659379');
INSERT INTO historiales VALUES (295, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:42:50.871174');
INSERT INTO historiales VALUES (296, 1, 'http://localhost/cav/admin/usuarios/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:43:19.316219');
INSERT INTO historiales VALUES (297, 1, 'http://localhost/cav/admin/usuarios/add', 'a:2:{s:7:"Usuario";a:7:{s:15:"nombre_completo";s:17:"Cristian Gallardo";s:13:"usuario_login";s:9:"cgallardo";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:11:"contrasenia";s:10:"secretaria";s:7:"borrado";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:43:44.921148');
INSERT INTO historiales VALUES (298, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:43:45.148903');
INSERT INTO historiales VALUES (299, 1, 'http://localhost/cav/admin/usuarios/edit/10', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:43:49.073242');
INSERT INTO historiales VALUES (300, 1, 'http://localhost/cav/admin/usuarios/edit/10', 'a:2:{s:7:"Usuario";a:8:{s:15:"nombre_completo";s:0:"";s:8:"password";s:10:"secretaria";s:13:"usuario_login";s:9:"cgallardo";s:7:"borrado";s:0:"";s:11:"id_anterior";s:0:"";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:43:54.439915');
INSERT INTO historiales VALUES (301, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:43:54.597029');
INSERT INTO historiales VALUES (302, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:44:08.313554');
INSERT INTO historiales VALUES (303, 1, 'http://localhost/cav/admin/usuarios/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:44:10.579096');
INSERT INTO historiales VALUES (304, 1, 'http://localhost/cav/admin/usuarios/add', 'a:2:{s:7:"Usuario";a:7:{s:15:"nombre_completo";s:11:"Julio Tamae";s:13:"usuario_login";s:6:"jtamae";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:11:"contrasenia";s:10:"secretaria";s:7:"borrado";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:44:33.368877');
INSERT INTO historiales VALUES (305, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:44:33.588125');
INSERT INTO historiales VALUES (306, 1, 'http://localhost/cav/admin/usuarios/edit/11', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:45:10.733769');
INSERT INTO historiales VALUES (307, 1, 'http://localhost/cav/admin/usuarios/edit/11', 'a:2:{s:7:"Usuario";a:8:{s:15:"nombre_completo";s:0:"";s:8:"password";s:10:"secretaria";s:13:"usuario_login";s:6:"jtamae";s:7:"borrado";s:0:"";s:11:"id_anterior";s:0:"";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:45:16.172534');
INSERT INTO historiales VALUES (308, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:45:16.335377');
INSERT INTO historiales VALUES (309, 1, 'http://localhost/cav/admin/usuarios/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:50:34.189006');
INSERT INTO historiales VALUES (310, 1, 'http://localhost/cav/admin/usuarios/add', 'a:2:{s:7:"Usuario";a:7:{s:15:"nombre_completo";s:16:"Fernando Markich";s:13:"usuario_login";s:8:"fmarkich";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:11:"contrasenia";s:10:"secretaria";s:7:"borrado";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:50:53.21588');
INSERT INTO historiales VALUES (311, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:50:53.424002');
INSERT INTO historiales VALUES (312, 1, 'http://localhost/cav/admin/usuarios/edit/12', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:51:08.868412');
INSERT INTO historiales VALUES (313, 1, 'http://localhost/cav/admin/usuarios/edit/12', 'a:2:{s:7:"Usuario";a:8:{s:15:"nombre_completo";s:0:"";s:8:"password";s:10:"secretaria";s:13:"usuario_login";s:8:"fmarkich";s:7:"borrado";s:0:"";s:11:"id_anterior";s:0:"";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:51:15.175442');
INSERT INTO historiales VALUES (314, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:51:15.352344');
INSERT INTO historiales VALUES (315, 1, 'http://localhost/cav/admin/usuarios/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:53:26.783873');
INSERT INTO historiales VALUES (316, 1, 'http://localhost/cav/admin/usuarios/add', 'a:2:{s:7:"Usuario";a:7:{s:15:"nombre_completo";s:13:"Nicolás Brum";s:13:"usuario_login";s:5:"nbrum";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:11:"contrasenia";s:10:"secretaria";s:7:"borrado";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:57:29.601711');
INSERT INTO historiales VALUES (317, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:57:29.833827');
INSERT INTO historiales VALUES (318, 1, 'http://localhost/cav/admin/usuarios/edit/13', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:57:34.545257');
INSERT INTO historiales VALUES (319, 1, 'http://localhost/cav/admin/usuarios/edit/13', 'a:2:{s:7:"Usuario";a:8:{s:15:"nombre_completo";s:0:"";s:8:"password";s:10:"secretaria";s:13:"usuario_login";s:5:"nbrum";s:7:"borrado";s:0:"";s:11:"id_anterior";s:0:"";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:57:48.648');
INSERT INTO historiales VALUES (320, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 10:57:48.870528');
INSERT INTO historiales VALUES (321, 1, 'http://localhost/cav/admin/usuarios/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:03:59.076845');
INSERT INTO historiales VALUES (322, 1, 'http://localhost/cav/admin/usuarios/add', 'a:2:{s:7:"Usuario";a:7:{s:15:"nombre_completo";s:20:"Graciela Teguidengui";s:13:"usuario_login";s:12:"gteguidengui";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:11:"contrasenia";s:10:"secretaria";s:7:"borrado";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:04:27.772634');
INSERT INTO historiales VALUES (323, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:04:27.989299');
INSERT INTO historiales VALUES (324, 1, 'http://localhost/cav/admin/usuarios/edit/14', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:04:32.803507');
INSERT INTO historiales VALUES (325, 1, 'http://localhost/cav/admin/usuarios/edit/14', 'a:2:{s:7:"Usuario";a:8:{s:15:"nombre_completo";s:0:"";s:8:"password";s:10:"secretaria";s:13:"usuario_login";s:12:"gteguidengui";s:7:"borrado";s:0:"";s:11:"id_anterior";s:0:"";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:04:36.288692');
INSERT INTO historiales VALUES (326, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:04:36.450198');
INSERT INTO historiales VALUES (327, 1, 'http://localhost/cav/admin/usuarios/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:05:09.257705');
INSERT INTO historiales VALUES (328, 1, 'http://localhost/cav/admin/usuarios/add', 'a:2:{s:7:"Usuario";a:7:{s:15:"nombre_completo";s:13:"Mario Méndez";s:13:"usuario_login";s:7:"mmendez";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:11:"contrasenia";s:10:"secretaria";s:7:"borrado";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:05:30.258164');
INSERT INTO historiales VALUES (329, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:05:30.480658');
INSERT INTO historiales VALUES (330, 1, 'http://localhost/cav/admin/usuarios/edit/15', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:05:34.323989');
INSERT INTO historiales VALUES (331, 1, 'http://localhost/cav/admin/usuarios/edit/15', 'a:2:{s:7:"Usuario";a:8:{s:15:"nombre_completo";s:0:"";s:8:"password";s:10:"secretaria";s:13:"usuario_login";s:7:"mmendez";s:7:"borrado";s:0:"";s:11:"id_anterior";s:0:"";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:05:41.921343');
INSERT INTO historiales VALUES (332, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:05:42.141016');
INSERT INTO historiales VALUES (333, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:06:05.148823');
INSERT INTO historiales VALUES (334, 1, 'http://localhost/cav/admin/usuarios/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:06:08.479076');
INSERT INTO historiales VALUES (335, 1, 'http://localhost/cav/admin/usuarios/add', 'a:2:{s:7:"Usuario";a:7:{s:15:"nombre_completo";s:13:"Ariel Buiatti";s:13:"usuario_login";s:8:"abuiatti";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:11:"contrasenia";s:10:"secretaria";s:7:"borrado";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:06:30.326986');
INSERT INTO historiales VALUES (336, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:06:30.537473');
INSERT INTO historiales VALUES (337, 1, 'http://localhost/cav/admin/usuarios/edit/16', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:18:19.064111');
INSERT INTO historiales VALUES (338, 1, 'http://localhost/cav/admin/usuarios/edit/16', 'a:2:{s:7:"Usuario";a:8:{s:15:"nombre_completo";s:0:"";s:8:"password";s:10:"secretaria";s:13:"usuario_login";s:8:"abuiatti";s:7:"borrado";s:0:"";s:11:"id_anterior";s:0:"";s:8:"apellido";s:0:"";s:6:"nombre";s:0:"";s:5:"email";s:0:"";}s:5:"Grupo";a:1:{s:5:"Grupo";a:1:{i:0;s:1:"2";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:18:24.287671');
INSERT INTO historiales VALUES (339, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:18:24.437886');
INSERT INTO historiales VALUES (340, 1, 'http://localhost/cav/admin/usuarios', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:26:28.769471');
INSERT INTO historiales VALUES (341, 1, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:26:30.848953');
INSERT INTO historiales VALUES (342, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:26:30.985132');
INSERT INTO historiales VALUES (343, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:26:47.908018');
INSERT INTO historiales VALUES (344, 10, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:26:48.07153');
INSERT INTO historiales VALUES (345, 10, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:27:56.42558');
INSERT INTO historiales VALUES (346, 10, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:30:22.135799');
INSERT INTO historiales VALUES (347, 10, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:30:31.195543');
INSERT INTO historiales VALUES (348, 10, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:30:51.717027');
INSERT INTO historiales VALUES (349, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:30:51.931825');
INSERT INTO historiales VALUES (350, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:31:00.630817');
INSERT INTO historiales VALUES (351, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:31:00.758192');
INSERT INTO historiales VALUES (352, 2, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:32:28.968204');
INSERT INTO historiales VALUES (354, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:32:31.842521');
INSERT INTO historiales VALUES (355, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:32:41.942237');
INSERT INTO historiales VALUES (356, 8, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:32:42.09021');
INSERT INTO historiales VALUES (357, 8, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:34:58.823391');
INSERT INTO historiales VALUES (358, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:34:59.064666');
INSERT INTO historiales VALUES (359, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:35:02.247945');
INSERT INTO historiales VALUES (360, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:35:02.357316');
INSERT INTO historiales VALUES (361, 1, 'http://localhost/cav/admin/grupos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:35:12.327551');
INSERT INTO historiales VALUES (362, 1, 'http://localhost/cav/admin/grupos/edit/2', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:35:15.188147');
INSERT INTO historiales VALUES (363, 1, 'http://localhost/cav/css/tagsinput/jquery.tagit.css', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:35:15.498806');
INSERT INTO historiales VALUES (364, 1, 'http://localhost/cav/admin/grupos/edit/2', 'a:3:{s:5:"Grupo";a:2:{s:2:"id";s:1:"2";s:11:"descripcion";s:9:"seguridad";}s:3:"Url";a:1:{s:3:"Url";a:45:{i:0;s:2:"20";i:1;s:2:"21";i:2;s:2:"22";i:3;s:2:"23";i:4;s:2:"24";i:5;s:2:"25";i:6;s:2:"26";i:7;s:2:"27";i:8;s:2:"28";i:9;s:2:"29";i:10;s:2:"30";i:11;s:2:"31";i:12;s:2:"32";i:13;s:2:"33";i:14;s:2:"34";i:15;s:2:"35";i:16;s:2:"42";i:17;s:2:"43";i:18;s:2:"44";i:19;s:2:"45";i:20;s:2:"47";i:21;s:2:"49";i:22;s:2:"50";i:23;s:2:"52";i:24;s:2:"59";i:25;s:2:"60";i:26;s:2:"61";i:27;s:2:"62";i:28;s:2:"63";i:29;s:2:"64";i:30;s:2:"65";i:31;s:2:"66";i:32;s:2:"67";i:33;s:2:"68";i:34;s:2:"69";i:35;s:2:"70";i:36;s:2:"71";i:37;s:2:"72";i:38;s:2:"73";i:39;s:2:"74";i:40;s:2:"75";i:41;s:2:"76";i:42;s:2:"77";i:43;s:2:"78";i:44;s:2:"79";}}s:7:"Usuario";a:1:{s:7:"Usuario";a:11:{i:0;s:1:"6";i:1;s:1:"7";i:2;s:1:"8";i:3;s:1:"9";i:4;s:2:"10";i:5;s:2:"11";i:6;s:2:"12";i:7;s:2:"13";i:8;s:2:"14";i:9;s:2:"15";i:10;s:2:"16";}}}', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:37:48.127752');
INSERT INTO historiales VALUES (365, 1, 'http://localhost/cav/admin/grupos', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:37:48.410069');
INSERT INTO historiales VALUES (366, 1, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:40:33.394048');
INSERT INTO historiales VALUES (367, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:40:33.608972');
INSERT INTO historiales VALUES (368, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:42:06.086913');
INSERT INTO historiales VALUES (369, 1, 'http://localhost/cav/admin/movimientos/add', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:42:06.240059');
INSERT INTO historiales VALUES (370, 1, 'http://localhost/cav/admin/usuarios/logout', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:42:13.897574');
INSERT INTO historiales VALUES (371, NULL, 'http://localhost/cav/admin/usuarios/login', NULL, 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:40.0) Gecko/20100101 Firefox/40.0', '127.0.0.1', '2015-09-16 11:42:14.03477');


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

CREATE TABLE dias_vehiculos
(
  id serial NOT NULL,
  vehiculo_id integer,
  dia integer,
  CONSTRAINT dias_vehiculos_pkey PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE dias_vehiculos
  OWNER TO postgres;
