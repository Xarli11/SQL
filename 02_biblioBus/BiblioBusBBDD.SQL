--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-05-03 17:01:30

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
-- TOC entry 216 (class 1259 OID 16452)
-- Name: Libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Libros" (
    "ISBN" character(20) NOT NULL,
    titulo character varyingNOT NULL,
    autor character varyingNOT NULL,
    n_ejemplares integer NOT NULL,
    id_tema integer NOT NULL
);


ALTER TABLE public."Libros" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16460)
-- Name: Socios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Socios" (
    id_socio integer NOT NULL,
    nombre character varyingNOT NULL,
    edad integer NOT NULL
);


ALTER TABLE public."Socios" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16459)
-- Name: Socios_id_socio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Socios_id_socio_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Socios_id_socio_seq" OWNER TO postgres;

--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 217
-- Name: Socios_id_socio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Socios_id_socio_seq" OWNED BY public."Socios".id_socio;


--
-- TOC entry 215 (class 1259 OID 16444)
-- Name: Temas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Temas" (
    id_tema integer NOT NULL,
    nombre character varyingNOT NULL
);


ALTER TABLE public."Temas" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16443)
-- Name: Temas_id_tema_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Temas_id_tema_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Temas_id_tema_seq" OWNER TO postgres;

--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 214
-- Name: Temas_id_tema_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Temas_id_tema_seq" OWNED BY public."Temas".id_tema;


--
-- TOC entry 220 (class 1259 OID 16469)
-- Name: reservas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservas (
    id_reserva integer NOT NULL,
    f_prestamo date NOT NULL,
    f_devolucion date NOT NULL,
    id_socio integer NOT NULL,
    "ISBN" character(20) NOT NULL
);


ALTER TABLE public.reservas OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16468)
-- Name: reservas_id_reserva_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservas_id_reserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservas_id_reserva_seq OWNER TO postgres;

--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 219
-- Name: reservas_id_reserva_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservas_id_reserva_seq OWNED BY public.reservas.id_reserva;


--
-- TOC entry 3188 (class 2604 OID 16463)
-- Name: Socios id_socio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Socios" ALTER COLUMN id_socio SET DEFAULT nextval('public."Socios_id_socio_seq"'::regclass);


--
-- TOC entry 3187 (class 2604 OID 16447)
-- Name: Temas id_tema; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Temas" ALTER COLUMN id_tema SET DEFAULT nextval('public."Temas_id_tema_seq"'::regclass);


--
-- TOC entry 3189 (class 2604 OID 16472)
-- Name: reservas id_reserva; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas ALTER COLUMN id_reserva SET DEFAULT nextval('public.reservas_id_reserva_seq'::regclass);


--
-- TOC entry 3345 (class 0 OID 16452)
-- Dependencies: 216
-- Data for Name: Libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Libros" ("ISBN", titulo, autor, n_ejemplares, id_tema) VALUES ('87690987584213857456', 'Evolución del ser humano', 'Raul Jimenez', 10, 1);


--
-- TOC entry 3347 (class 0 OID 16460)
-- Dependencies: 218
-- Data for Name: Socios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Socios" (id_socio, nombre, edad) VALUES (1, 'Carlos', 21);


--
-- TOC entry 3344 (class 0 OID 16444)
-- Dependencies: 215
-- Data for Name: Temas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."Temas" (id_tema, nombre) VALUES (1, 'Ciencia');
INSERT INTO public."Temas" (id_tema, nombre) VALUES (2, 'Literatura');


--
-- TOC entry 3349 (class 0 OID 16469)
-- Dependencies: 220
-- Data for Name: reservas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reservas (id_reserva, f_prestamo, f_devolucion, id_socio, "ISBN") VALUES (2, '2023-07-28', '2023-10-15', 1, '87690987584213857456');


--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 217
-- Name: Socios_id_socio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Socios_id_socio_seq"', 1, true);


--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 214
-- Name: Temas_id_tema_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Temas_id_tema_seq"', 2, true);


--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 219
-- Name: reservas_id_reserva_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservas_id_reserva_seq', 2, true);


--
-- TOC entry 3193 (class 2606 OID 16458)
-- Name: Libros Libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Libros"
    ADD CONSTRAINT "Libros_pkey" PRIMARY KEY ("ISBN");


--
-- TOC entry 3195 (class 2606 OID 16467)
-- Name: Socios Socios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Socios"
    ADD CONSTRAINT "Socios_pkey" PRIMARY KEY (id_socio);


--
-- TOC entry 3191 (class 2606 OID 16451)
-- Name: Temas Temas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Temas"
    ADD CONSTRAINT "Temas_pkey" PRIMARY KEY (id_tema);


--
-- TOC entry 3197 (class 2606 OID 16474)
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (id_reserva);


--
-- TOC entry 3198 (class 2606 OID 16475)
-- Name: Libros fk_libros_temas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Libros"
    ADD CONSTRAINT fk_libros_temas FOREIGN KEY (id_tema) REFERENCES public."Temas"(id_tema) NOT VALID;


--
-- TOC entry 3199 (class 2606 OID 16480)
-- Name: reservas fk_reservas_libro; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT fk_reservas_libro FOREIGN KEY ("ISBN") REFERENCES public."Libros"("ISBN") NOT VALID;


--
-- TOC entry 3200 (class 2606 OID 16485)
-- Name: reservas fk_reservas_socios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT fk_reservas_socios FOREIGN KEY (id_socio) REFERENCES public."Socios"(id_socio) NOT VALID;


-- Completed on 2023-05-03 17:01:30

--
-- PostgreSQL database dump complete
--

