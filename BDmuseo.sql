--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-11-05 19:47:44

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
-- TOC entry 223 (class 1259 OID 155769)
-- Name: coleccion_obras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.coleccion_obras (
    coleccion_id bigint NOT NULL,
    obra_id bigint NOT NULL
);


ALTER TABLE public.coleccion_obras OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 106504)
-- Name: tmartistas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tmartistas (
    idartista bigint NOT NULL,
    nombres character varying(255) NOT NULL,
    apellidos character varying(255) NOT NULL,
    telefono character varying(255),
    email character varying(255),
    edad integer,
    foto_perfil_url character varying(255),
    fk_cods bigint DEFAULT 1,
    descripcionart character varying(255) NOT NULL
);


ALTER TABLE public.tmartistas OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 106503)
-- Name: tmartistas_idartista_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tmartistas ALTER COLUMN idartista ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tmartistas_idartista_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 106533)
-- Name: tmcoleccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tmcoleccion (
    idcoleccion bigint NOT NULL,
    nombrecol character varying(255) NOT NULL,
    descripcioncol character varying(500),
    fk_idartista bigint,
    fk_idobra integer,
    fk_cods bigint DEFAULT 1
);


ALTER TABLE public.tmcoleccion OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 106532)
-- Name: tmcoleccion_idcoleccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tmcoleccion ALTER COLUMN idcoleccion ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tmcoleccion_idcoleccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 220 (class 1259 OID 106515)
-- Name: tmobra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tmobra (
    idobra bigint NOT NULL,
    tituloobra character varying(255) NOT NULL,
    fotoobra character varying(255),
    tecnica character varying(255),
    descripcionobra character varying(255),
    fechapubli character varying(255),
    fk_idartista bigint,
    fk_cods bigint DEFAULT 1,
    foto_obra_url character varying(255),
    status integer NOT NULL
);


ALTER TABLE public.tmobra OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 106514)
-- Name: tmobra_idobra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tmobra ALTER COLUMN idobra ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tmobra_idobra_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 106498)
-- Name: tmstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tmstatus (
    cods bigint NOT NULL,
    create_time character varying(255),
    des_status character varying(100)
);


ALTER TABLE public.tmstatus OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 106497)
-- Name: tmstatus_cods_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tmstatus ALTER COLUMN cods ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.tmstatus_cods_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 4877 (class 0 OID 155769)
-- Dependencies: 223
-- Data for Name: coleccion_obras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.coleccion_obras (coleccion_id, obra_id) FROM stdin;
\.


--
-- TOC entry 4872 (class 0 OID 106504)
-- Dependencies: 218
-- Data for Name: tmartistas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tmartistas (idartista, nombres, apellidos, telefono, email, edad, foto_perfil_url, fk_cods, descripcionart) FROM stdin;
31	Miguel	Fernandez	111222333	miguel.fernandez@example.com	42	https://example.com/foto3.jpg	1	Escultor y ceramista con interés en culturas antiguas.
32	Lucia	Martinez	444555666	lucia.martinez@example.com	31	https://example.com/foto4.jpg	1	Pintora abstracta con técnicas mixtas.
33	Juan	Perez	777888999	juan.perez@example.com	29	https://example.com/foto5.jpg	1	Ilustrador digital especializado en retratos.
34	Maria	Suarez	1010101010	maria.suarez@example.com	45	https://example.com/foto6.jpg	1	Fotógrafa de paisajes y naturaleza.
35	Pedro	Ramirez	2020202020	pedro.ramirez@example.com	38	https://example.com/foto7.jpg	1	Escultor con enfoque en materiales reciclados.
36	Elena	Gonzalez	3030303030	elena.gonzalez@example.com	33	https://example.com/foto8.jpg	1	Artista multimedia que trabaja con instalaciones interactivas.
37	Luis	Torres	4040404040	luis.torres@example.com	40	https://example.com/foto9.jpg	1	Pintor clásico con influencia renacentista.
38	Sofia	Navarro	5050505050	sofia.navarro@example.com	27	https://example.com/foto10.jpg	1	Diseñadora gráfica y artista visual.
29	Carlos	Gomez	123456789	carlos.gomez@example.com	35	https://www.laopinion.co/sites/default/files/2024-07/Esperanza-G%C3%B3mez.jpg	1	Pintor contemporáneo especializado en arte abstracto.
30	Ana	Lopez	987654321	ana.lopez@example.com	28	https://w7.pngwing.com/pngs/113/130/png-transparent-johnny-sins-johnny-sins-brazzers-telegram-sticker-messaging-apps-others-face-photography-human.png	1	Artista plástica enfocada en arte urbano.
\.


--
-- TOC entry 4876 (class 0 OID 106533)
-- Dependencies: 222
-- Data for Name: tmcoleccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tmcoleccion (idcoleccion, nombrecol, descripcioncol, fk_idartista, fk_idobra, fk_cods) FROM stdin;
\.


--
-- TOC entry 4874 (class 0 OID 106515)
-- Dependencies: 220
-- Data for Name: tmobra; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tmobra (idobra, tituloobra, fotoobra, tecnica, descripcionobra, fechapubli, fk_idartista, fk_cods, foto_obra_url, status) FROM stdin;
\.


--
-- TOC entry 4870 (class 0 OID 106498)
-- Dependencies: 216
-- Data for Name: tmstatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tmstatus (cods, create_time, des_status) FROM stdin;
1	2024-10-16	N/A
\.


--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 217
-- Name: tmartistas_idartista_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tmartistas_idartista_seq', 40, true);


--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 221
-- Name: tmcoleccion_idcoleccion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tmcoleccion_idcoleccion_seq', 1, false);


--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 219
-- Name: tmobra_idobra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tmobra_idobra_seq', 1, true);


--
-- TOC entry 4886 (class 0 OID 0)
-- Dependencies: 215
-- Name: tmstatus_cods_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tmstatus_cods_seq', 1, true);


--
-- TOC entry 4713 (class 2606 OID 122882)
-- Name: tmartistas tmartistas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmartistas
    ADD CONSTRAINT tmartistas_pkey PRIMARY KEY (idartista);


--
-- TOC entry 4717 (class 2606 OID 155669)
-- Name: tmcoleccion tmcoleccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmcoleccion
    ADD CONSTRAINT tmcoleccion_pkey PRIMARY KEY (idcoleccion);


--
-- TOC entry 4715 (class 2606 OID 122906)
-- Name: tmobra tmobra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmobra
    ADD CONSTRAINT tmobra_pkey PRIMARY KEY (idobra);


--
-- TOC entry 4711 (class 2606 OID 155706)
-- Name: tmstatus tmstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmstatus
    ADD CONSTRAINT tmstatus_pkey PRIMARY KEY (cods);


--
-- TOC entry 4724 (class 2606 OID 155772)
-- Name: coleccion_obras fk98j3c3tu04sbhukmo5u96q515; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coleccion_obras
    ADD CONSTRAINT fk98j3c3tu04sbhukmo5u96q515 FOREIGN KEY (obra_id) REFERENCES public.tmobra(idobra);


--
-- TOC entry 4721 (class 2606 OID 155717)
-- Name: tmcoleccion fk_cods_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmcoleccion
    ADD CONSTRAINT fk_cods_status FOREIGN KEY (fk_cods) REFERENCES public.tmstatus(cods) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4718 (class 2606 OID 155740)
-- Name: tmartistas fk_cods_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmartistas
    ADD CONSTRAINT fk_cods_status FOREIGN KEY (fk_cods) REFERENCES public.tmstatus(cods) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4719 (class 2606 OID 155751)
-- Name: tmobra fk_cods_status; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmobra
    ADD CONSTRAINT fk_cods_status FOREIGN KEY (fk_cods) REFERENCES public.tmstatus(cods) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4720 (class 2606 OID 122930)
-- Name: tmobra fk_idartista_artista; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmobra
    ADD CONSTRAINT fk_idartista_artista FOREIGN KEY (fk_idartista) REFERENCES public.tmartistas(idartista) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4722 (class 2606 OID 155682)
-- Name: tmcoleccion fk_idartista_artista; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmcoleccion
    ADD CONSTRAINT fk_idartista_artista FOREIGN KEY (fk_idartista) REFERENCES public.tmartistas(idartista) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4723 (class 2606 OID 122907)
-- Name: tmcoleccion fk_idobra_obra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmcoleccion
    ADD CONSTRAINT fk_idobra_obra FOREIGN KEY (fk_idobra) REFERENCES public.tmobra(idobra) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 4725 (class 2606 OID 155777)
-- Name: coleccion_obras fkdgm81k0hci2pbjoobbihcy5ke; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.coleccion_obras
    ADD CONSTRAINT fkdgm81k0hci2pbjoobbihcy5ke FOREIGN KEY (coleccion_id) REFERENCES public.tmcoleccion(idcoleccion);


-- Completed on 2024-11-05 19:47:44

--
-- PostgreSQL database dump complete
--

