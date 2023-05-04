--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-03 17:01:56

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 16400)
-- Name: autobuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autobuses (
    id_autobuses integer NOT NULL,
    "añoFabricacion" integer NOT NULL,
    precio numeric(10,4) NOT NULL
);


ALTER TABLE public.autobuses OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16399)
-- Name: autobuses_id_autobuses_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.autobuses_id_autobuses_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.autobuses_id_autobuses_seq OWNER TO postgres;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 214
-- Name: autobuses_id_autobuses_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.autobuses_id_autobuses_seq OWNED BY public.autobuses.id_autobuses;


--
-- TOC entry 217 (class 1259 OID 16407)
-- Name: conductores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conductores (
    id_conductor integer NOT NULL,
    nombre character varying(60) NOT NULL,
    edad integer
);


ALTER TABLE public.conductores OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16406)
-- Name: conductores_id_conductor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conductores_id_conductor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conductores_id_conductor_seq OWNER TO postgres;

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 216
-- Name: conductores_id_conductor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conductores_id_conductor_seq OWNED BY public.conductores.id_conductor;


--
-- TOC entry 219 (class 1259 OID 16414)
-- Name: lugares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lugares (
    id_lugar integer NOT NULL,
    nombre character varying(60) NOT NULL
);


ALTER TABLE public.lugares OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16413)
-- Name: lugares_id_lugar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lugares_id_lugar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lugares_id_lugar_seq OWNER TO postgres;

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 218
-- Name: lugares_id_lugar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lugares_id_lugar_seq OWNED BY public.lugares.id_lugar;


--
-- TOC entry 221 (class 1259 OID 16421)
-- Name: rutas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rutas (
    id_ruta integer NOT NULL,
    id_autobus integer NOT NULL,
    id_conductor integer NOT NULL,
    id_lugar integer NOT NULL,
    f_ruta date NOT NULL
);


ALTER TABLE public.rutas OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16420)
-- Name: rutas_id_ruta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rutas_id_ruta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rutas_id_ruta_seq OWNER TO postgres;

--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 220
-- Name: rutas_id_ruta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rutas_id_ruta_seq OWNED BY public.rutas.id_ruta;


--
-- TOC entry 3188 (class 2604 OID 16403)
-- Name: autobuses id_autobuses; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autobuses ALTER COLUMN id_autobuses SET DEFAULT nextval('public.autobuses_id_autobuses_seq'::regclass);


--
-- TOC entry 3189 (class 2604 OID 16410)
-- Name: conductores id_conductor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conductores ALTER COLUMN id_conductor SET DEFAULT nextval('public.conductores_id_conductor_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 16417)
-- Name: lugares id_lugar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugares ALTER COLUMN id_lugar SET DEFAULT nextval('public.lugares_id_lugar_seq'::regclass);


--
-- TOC entry 3191 (class 2604 OID 16424)
-- Name: rutas id_ruta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rutas ALTER COLUMN id_ruta SET DEFAULT nextval('public.rutas_id_ruta_seq'::regclass);


--
-- TOC entry 3346 (class 0 OID 16400)
-- Dependencies: 215
-- Data for Name: autobuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.autobuses (id_autobuses, "añoFabricacion", precio) VALUES (1, 1994, 200000.9900);
INSERT INTO public.autobuses (id_autobuses, "añoFabricacion", precio) VALUES (2, 2003, 199000.9900);


--
-- TOC entry 3348 (class 0 OID 16407)
-- Dependencies: 217
-- Data for Name: conductores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.conductores (id_conductor, nombre, edad) VALUES (1, 'Jorge Jimenez', 23);


--
-- TOC entry 3350 (class 0 OID 16414)
-- Dependencies: 219
-- Data for Name: lugares; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lugares (id_lugar, nombre) VALUES (1, 'Madrid');


--
-- TOC entry 3352 (class 0 OID 16421)
-- Dependencies: 221
-- Data for Name: rutas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rutas (id_ruta, id_autobus, id_conductor, id_lugar, f_ruta) VALUES (1, 1, 1, 1, '2023-07-28');


--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 214
-- Name: autobuses_id_autobuses_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.autobuses_id_autobuses_seq', 2, true);


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 216
-- Name: conductores_id_conductor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conductores_id_conductor_seq', 1, true);


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 218
-- Name: lugares_id_lugar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lugares_id_lugar_seq', 1, true);


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 220
-- Name: rutas_id_ruta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rutas_id_ruta_seq', 1, true);


--
-- TOC entry 3193 (class 2606 OID 16405)
-- Name: autobuses autobuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autobuses
    ADD CONSTRAINT autobuses_pkey PRIMARY KEY (id_autobuses);


--
-- TOC entry 3195 (class 2606 OID 16412)
-- Name: conductores conductores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conductores
    ADD CONSTRAINT conductores_pkey PRIMARY KEY (id_conductor);


--
-- TOC entry 3197 (class 2606 OID 16419)
-- Name: lugares lugares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lugares
    ADD CONSTRAINT lugares_pkey PRIMARY KEY (id_lugar);


--
-- TOC entry 3199 (class 2606 OID 16426)
-- Name: rutas rutas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rutas
    ADD CONSTRAINT rutas_pkey PRIMARY KEY (id_ruta);


--
-- TOC entry 3200 (class 2606 OID 16427)
-- Name: rutas fk_rutas_autobuses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rutas
    ADD CONSTRAINT fk_rutas_autobuses FOREIGN KEY (id_autobus) REFERENCES public.autobuses(id_autobuses) NOT VALID;


--
-- TOC entry 3201 (class 2606 OID 16432)
-- Name: rutas fk_rutas_conductores; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rutas
    ADD CONSTRAINT fk_rutas_conductores FOREIGN KEY (id_conductor) REFERENCES public.conductores(id_conductor) NOT VALID;


--
-- TOC entry 3202 (class 2606 OID 16437)
-- Name: rutas fk_rutas_lugares; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rutas
    ADD CONSTRAINT fk_rutas_lugares FOREIGN KEY (id_lugar) REFERENCES public.lugares(id_lugar) NOT VALID;


-- Completed on 2023-05-03 17:01:56

--
-- PostgreSQL database dump complete
--

