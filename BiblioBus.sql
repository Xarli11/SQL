-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public."Temas"
(
    id_tema serial,
    nombre character varying NOT NULL,
    PRIMARY KEY (id_tema)
);

CREATE TABLE IF NOT EXISTS public."Libros"
(
    "ISBN" character(20),
    titulo character varying NOT NULL,
    autor character varying NOT NULL,
    n_ejemplares integer NOT NULL,
    id_tema integer NOT NULL,
    PRIMARY KEY ("ISBN")
);

CREATE TABLE IF NOT EXISTS public."Socios"
(
    id_socio serial,
    nombre character varying NOT NULL,
    edad integer NOT NULL,
    PRIMARY KEY (id_socio)
);

CREATE TABLE IF NOT EXISTS public.reservas
(
    id_reserva serial,
    f_prestamo date NOT NULL,
    f_devolucion date NOT NULL,
    id_socio integer NOT NULL,
    "ISBN" character(20) NOT NULL,
    PRIMARY KEY (id_reserva)
);

ALTER TABLE IF EXISTS public."Libros"
    ADD CONSTRAINT fk_libros_temas FOREIGN KEY (id_tema)
    REFERENCES public."Temas" (id_tema) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.reservas
    ADD CONSTRAINT fk_reservas_libro FOREIGN KEY ("ISBN")
    REFERENCES public."Libros" ("ISBN") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.reservas
    ADD CONSTRAINT fk_reservas_socios FOREIGN KEY (id_socio)
    REFERENCES public."Socios" (id_socio) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;