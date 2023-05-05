--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric,
    description text,
    radius integer,
    how_long_to_live timestamp without time zone
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric,
    description text,
    radius integer,
    how_long_to_live timestamp without time zone
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric,
    description text,
    radius integer,
    how_long_to_live timestamp without time zone
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_near_star boolean,
    is_near_planet boolean
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric,
    description text,
    radius integer,
    how_long_to_live timestamp without time zone
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 500.000, 'Our galaxy', 300, '12023-05-03 09:18:49.483014');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 781.000, 'A beautifull galaxy', 500, '22023-05-03 09:24:49.94904');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 229.450, 'A small galaxy', 127, '17023-05-03 09:26:45.716869');
INSERT INTO public.galaxy VALUES (4, 'Circinus', 475.173, 'A barred spiral galaxy', 256, '47590-05-04 08:54:30.731816');
INSERT INTO public.galaxy VALUES (5, 'Cigar', 12000000, 'A starbust  galaxy', 991, '100748-05-04 08:59:05.604235');
INSERT INTO public.galaxy VALUES (6, 'Butterfly', 15000000, 'A pair of interacting galaxy', 1024, '63615-05-04 09:07:05.720546');
INSERT INTO public.galaxy VALUES (7, 'Cosmos Redshift', 9999.999, 'A high red-shift Lyman-alpha galaxy', 2178, '81957-05-04 09:13:50.684206');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Phoborus', 3.5, 'A biggest satellite of Kepler-186f', 1, '11979-05-05 03:11:57.417376');
INSERT INTO public.moon VALUES (2, 1, 'Ackslider', 3.5, 'A medium satellite of Kepler-186f', 1, '10199-05-05 03:12:52.625263');
INSERT INTO public.moon VALUES (3, 2, 'Puylink-112', 3.5, 'A biggest satellite of Kepler-438b', 1, '7714-05-05 03:14:51.179365');
INSERT INTO public.moon VALUES (4, 2, 'Narsink-KLF', 3.5, 'A smallest satellite of Kepler-438b', 1, '8023-05-05 03:15:37.889228');
INSERT INTO public.moon VALUES (5, 3, 'Mimic-995', 3.5, 'A medium satellite of Kepler-442b', 1, '8223-05-05 03:16:41.319873');
INSERT INTO public.moon VALUES (6, 3, 'Mimic-338', 3.5, 'A smallest satellite of Kepler-442b', 1, '8273-05-05 03:17:08.591756');
INSERT INTO public.moon VALUES (7, 4, 'Baker-769', 6.35, 'A smallest satellite of Kepler-452b', 1, '10023-05-05 03:22:10.813243');
INSERT INTO public.moon VALUES (8, 4, 'Baker-462', 6.35, 'A medium satellite of Kepler-452b', 1, '10546-05-05 03:22:43.160248');
INSERT INTO public.moon VALUES (9, 5, 'Chokerus-010', 6.35, 'A biggets satellite of Kepler-62f', 1, '6848-05-05 03:28:58.868101');
INSERT INTO public.moon VALUES (10, 5, 'Chokerus-777', 6.35, 'A medium satellite of Kepler-62f', 1, '7023-05-05 03:29:22.613313');
INSERT INTO public.moon VALUES (11, 7, 'Godfrey-553', 6.35, 'A smallest satellite of Kepler-62e', 1, '4022-05-05 03:32:13.424612');
INSERT INTO public.moon VALUES (13, 7, 'Godfrey-034', 6.35, 'A biggest satellite of Kepler-62e', 1, '5010-05-05 03:32:43.792186');
INSERT INTO public.moon VALUES (14, 8, 'Bones-333', 12.28, 'A biggest satellite of Proxima Centuri b', 1, '8023-05-05 03:34:40.936572');
INSERT INTO public.moon VALUES (15, 8, 'Bones-211', 12.28, 'A medium satellite of Proxima Centuri b', 1, '8113-05-05 03:35:04.708451');
INSERT INTO public.moon VALUES (16, 9, 'Eyes-768', 12.28, 'A medium satellite of Kepler-296f', 1, '13344-05-05 03:37:26.777654');
INSERT INTO public.moon VALUES (17, 9, 'Eyes-391', 12.28, 'A smallest satellite of Kepler-296f', 1, '12614-05-05 03:38:13.521855');
INSERT INTO public.moon VALUES (18, 10, 'Admiral-601', 12.28, 'A medium satellite of Kepler-296e', 1, '9844-05-05 03:39:23.009822');
INSERT INTO public.moon VALUES (19, 10, 'Admiral-620', 12.28, 'A biggest satellite of Kepler-296e', 1, '9618-05-05 03:39:52.809365');
INSERT INTO public.moon VALUES (20, 11, 'Cesar-888', 30, 'A biggest satellite of Kepler-1649c', 1, '6924-05-05 03:41:39.015413');
INSERT INTO public.moon VALUES (21, 11, 'Cesar-662', 30, 'A medium satellite of Kepler-1649c', 1, '7124-05-05 03:42:06.710685');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Kepler-186f', 3.5, 'A large planet 186f', 1, '12023-05-04 15:20:56.699281');
INSERT INTO public.planet VALUES (2, 1, 'Kepler-438b', 3.5, 'A large planet 438b', 2, '14123-05-04 15:21:18.895274');
INSERT INTO public.planet VALUES (3, 1, 'Kepler-442b', 3.5, 'A large planet 442b', 2, '13521-05-04 15:21:29.311275');
INSERT INTO public.planet VALUES (4, 2, 'Kepler-452b', 6.35, 'A large planet 452b', 3, '15693-05-04 15:21:51.423275');
INSERT INTO public.planet VALUES (5, 2, 'Kepler-62f', 6.35, 'A large planet 62f', 1, '11724-05-04 15:22:13.873673');
INSERT INTO public.planet VALUES (7, 2, 'Kepler-62e', 6.35, 'A large planet 62e', 3, '17361-05-04 15:22:51.887267');
INSERT INTO public.planet VALUES (8, 3, 'Proxima Centuri B', 12.28, 'A large planet Proxima Centuri b', 3, '20979-05-04 15:24:43.065752');
INSERT INTO public.planet VALUES (9, 3, 'Kepler-296f', 12.28, 'A large planet 296f', 1, '15014-05-04 15:25:18.092531');
INSERT INTO public.planet VALUES (10, 3, 'Kepler-296e', 12.28, 'A large planet 296e', 2, '9146-05-04 15:25:28.303978');
INSERT INTO public.planet VALUES (11, 4, 'Kepler-1649c', 30, 'A large planet 1649c', 3, '10911-05-04 15:25:39.841548');
INSERT INTO public.planet VALUES (12, 4, 'Kepler-283c', 30, 'A large planet 283c', 1, '15917-05-04 15:28:41.911271');
INSERT INTO public.planet VALUES (13, 4, 'Kepler-296d', 30, 'A large planet 296d', 1, '19112-05-04 15:29:28.907505');


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'GOES-16', false, true);
INSERT INTO public.satellite VALUES (2, 'Lansat 8', false, false);
INSERT INTO public.satellite VALUES (3, 'Sentinel-2', true, true);
INSERT INTO public.satellite VALUES (4, 'Hill-7', true, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 4, 'Betelgeuse', 30, 'A red supergiant star', 1, '51823-05-04 09:46:23.988674');
INSERT INTO public.star VALUES (5, 5, 'Antares', 50, 'Fifteen bightest star in the sky', 1, '17696-05-04 09:52:42.652695');
INSERT INTO public.star VALUES (6, 6, 'Rigel', 50, 'Blue giant star', 3, '47712-05-04 10:01:11.148952');
INSERT INTO public.star VALUES (7, 7, 'Canopus', 100, 'Second brightest star in the sky', 2, '26960-05-04 10:02:27.905171');
INSERT INTO public.star VALUES (1, 1, 'Sirius', 3.5, 'Brightest star in the sky', 7, '9023-05-04 09:38:01.565192');
INSERT INTO public.star VALUES (2, 2, 'Vega', 6.35, 'One of the brightest star in the sky', 1, '10923-05-04 09:41:10.325057');
INSERT INTO public.star VALUES (3, 3, 'Polaris', 12.28, 'Also called North Star', 1, '13523-05-04 09:42:25.152171');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 45, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_moon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

