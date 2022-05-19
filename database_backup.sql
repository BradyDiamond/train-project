--
-- PostgreSQL database dump
--

-- Dumped from database version 12.10
-- Dumped by pg_dump version 12.10

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
-- Name: cities; Type: TABLE; Schema: public; Owner: brady
--

CREATE TABLE public.cities (
    name character varying,
    id integer NOT NULL
);


ALTER TABLE public.cities OWNER TO brady;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: brady
--

CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO brady;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brady
--

ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;


--
-- Name: stops; Type: TABLE; Schema: public; Owner: brady
--

CREATE TABLE public.stops (
    "time" timestamp without time zone,
    train_id integer NOT NULL,
    city_id character varying,
    id integer NOT NULL
);


ALTER TABLE public.stops OWNER TO brady;

--
-- Name: stops_id_seq; Type: SEQUENCE; Schema: public; Owner: brady
--

CREATE SEQUENCE public.stops_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stops_id_seq OWNER TO brady;

--
-- Name: stops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brady
--

ALTER SEQUENCE public.stops_id_seq OWNED BY public.stops.id;


--
-- Name: stops_train_id_seq; Type: SEQUENCE; Schema: public; Owner: brady
--

CREATE SEQUENCE public.stops_train_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stops_train_id_seq OWNER TO brady;

--
-- Name: stops_train_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brady
--

ALTER SEQUENCE public.stops_train_id_seq OWNED BY public.stops.train_id;


--
-- Name: trains; Type: TABLE; Schema: public; Owner: brady
--

CREATE TABLE public.trains (
    name character varying,
    id integer NOT NULL,
    tickets character varying
);


ALTER TABLE public.trains OWNER TO brady;

--
-- Name: trains_id_seq; Type: SEQUENCE; Schema: public; Owner: brady
--

CREATE SEQUENCE public.trains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trains_id_seq OWNER TO brady;

--
-- Name: trains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: brady
--

ALTER SEQUENCE public.trains_id_seq OWNED BY public.trains.id;


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: brady
--

ALTER TABLE ONLY public.cities ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);


--
-- Name: stops train_id; Type: DEFAULT; Schema: public; Owner: brady
--

ALTER TABLE ONLY public.stops ALTER COLUMN train_id SET DEFAULT nextval('public.stops_train_id_seq'::regclass);


--
-- Name: stops id; Type: DEFAULT; Schema: public; Owner: brady
--

ALTER TABLE ONLY public.stops ALTER COLUMN id SET DEFAULT nextval('public.stops_id_seq'::regclass);


--
-- Name: trains id; Type: DEFAULT; Schema: public; Owner: brady
--

ALTER TABLE ONLY public.trains ALTER COLUMN id SET DEFAULT nextval('public.trains_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: brady
--

COPY public.cities (name, id) FROM stdin;
\.


--
-- Data for Name: stops; Type: TABLE DATA; Schema: public; Owner: brady
--

COPY public.stops ("time", train_id, city_id, id) FROM stdin;
\.


--
-- Data for Name: trains; Type: TABLE DATA; Schema: public; Owner: brady
--

COPY public.trains (name, id, tickets) FROM stdin;
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brady
--

SELECT pg_catalog.setval('public.cities_id_seq', 145, true);


--
-- Name: stops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brady
--

SELECT pg_catalog.setval('public.stops_id_seq', 1, false);


--
-- Name: stops_train_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brady
--

SELECT pg_catalog.setval('public.stops_train_id_seq', 1, false);


--
-- Name: trains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: brady
--

SELECT pg_catalog.setval('public.trains_id_seq', 1, false);


--
-- PostgreSQL database dump complete
--

