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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30),
    mass_kg integer,
    closest_star_dist_km integer,
    distance_from_us_lightyears numeric(12,5),
    description text,
    interesting boolean NOT NULL,
    bigger_then_us boolean NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying,
    size_lightyears integer,
    distance_from_us_lightyears integer,
    solar_masses numeric(12,5),
    description text,
    interesting boolean NOT NULL,
    bigger_then_us boolean NOT NULL
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
    name character varying(30),
    mass_kg integer,
    closest_planet_dist_km integer,
    distance_from_us_lightyears numeric(12,5),
    description text,
    interesting boolean NOT NULL,
    bigger_then_us boolean NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(30),
    earth_masses integer,
    closest_star_dist_km integer,
    distance_from_us_lightyears numeric(12,5),
    description text,
    interesting boolean NOT NULL,
    bigger_then_us boolean NOT NULL,
    star_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying,
    solar_masses integer,
    solar_luminosity integer,
    distance_from_us_lightyears numeric(12,5),
    description text,
    interesting boolean NOT NULL,
    bigger_then_us boolean NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, '99942 Apophis', 37000, 1000000, 1.00000, 'Almost hit us in 2029', false, false, 1);
INSERT INTO public.asteroid VALUES (2, 'Vesto', 2380000, 353400, 1.00000, 'very big asteroid', true, true, 1);
INSERT INTO public.asteroid VALUES (3, 'Ceres', 117000000, 413900, 1.00000, 'the biggest asteroid  ', true, true, 1);
INSERT INTO public.asteroid VALUES (4, 'Pallas', 218000000, 414500, 1.00000, ' fun asteroid with playgrounds on it ', true, true, 1);
INSERT INTO public.asteroid VALUES (5, 'Kessel', 12346382, 1500000, 1.00000, 'a prison planet, that is home to the galaxys largest glitterstim spice mining operation', false, false, 6);
INSERT INTO public.asteroid VALUES (6, 'Oumuamua', 1000, 33000000, 1.00000, 'A cigar shaped alien spacecraft which was observed return from a trip to the sun at artificial speeds', true, false, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkyway', 100, 0, 1000.00000, 'awesome galaxy where we live', true, false);
INSERT INTO public.galaxy VALUES (2, 'Hoags Object', 120, 100000, 8000000.00000, 'unusual ring galaxy in the Serpens caput', false, true);
INSERT INTO public.galaxy VALUES (3, 'Lyman-alpha emitter ', 287, 1000000, 198.00000, ' the galaxy is observed as it was about 800 million years after the Big Bang, during the epoch of reionisation. With a light travel time of 12.9 billion years, it is one of the oldest, most distant galaxies known', true, true);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 25, 50, 100.00000, 'the second- or third-closest galaxy to the Milky Way', false, false);
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 47, 765, 900.00000, ' great spiral galaxy in the constellation Andromeda, the nearest large galaxy', false, true);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', 44, 500, 48.00000, 'lenticular ring galaxy about 500 million light-years away in the constellation Sculptor.', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 63900000, 238900, 1.00000, ' the fifth largest satellite in the Solar System and the largest and most massive relative to its parent planet, with a diameter about one-quarter that of Earth (comparable to the width of Australia)', false, false, 1);
INSERT INTO public.moon VALUES (2, 'Titan', 257000000, 1200000, 1.00000, ' the only moon known to have a dense atmosphere, and is the only known object in space other than Earth on which clear evidence of stable bodies of surface liquid has been found', true, false, 3);
INSERT INTO public.moon VALUES (3, 'Keppela', 3000000, 300000, 800.00000, 'A beautiful dust world filled many interesting creatures', true, false, 2);
INSERT INTO public.moon VALUES (4, 'Death Star', 1200000, 10000, 1.00000, ' Not a moon, its a space station', false, false, 5);
INSERT INTO public.moon VALUES (5, 'Jetfire', 15000, 1000, 10000.00000, 'A rocketship transformer fighting evil one punch at a time', true, false, 6);
INSERT INTO public.moon VALUES (6, 'Chenini', 3687826, 4000000, 863.00000, 'has a large, elliptical orbit which takes it as far as four million miles away from Tatooine at apogee, causing it to be overlooked on many planetary surveys.', false, false, 5);
INSERT INTO public.moon VALUES (7, ' qony ', 639000, 4343434, 1.00000, ' the best moon for flapping  ', false, false, 1);
INSERT INTO public.moon VALUES (8, ' wono ', 738440, 62748378, 1.00000, ' the best moon for run ', false, false, 1);
INSERT INTO public.moon VALUES (9, ' ronu ', 8758927, 346723942, 1.00000, ' the best moon for swim ', false, false, 1);
INSERT INTO public.moon VALUES (10, ' toni ', 4990233, 3562764, 1.00000, ' the best moon for dance ', false, false, 5);
INSERT INTO public.moon VALUES (11, ' yona ', 64432000, 9856777, 1.00000, ' the best moon for fight ', false, false, 1);
INSERT INTO public.moon VALUES (12, ' pony ', 6391300, 2746666, 1.00000, ' the best moon for laugh ', false, false, 3);
INSERT INTO public.moon VALUES (13, ' loner ', 6330000, 8463387, 1.00000, ' the best moon for raising a family ', false, false, 1);
INSERT INTO public.moon VALUES (14, ' konar ', 89403000, 1232345, 1.00000, ' the best moon for drugs ', false, false, 1);
INSERT INTO public.moon VALUES (15, ' jonur ', 892344, 900863, 1.00000, ' the best moon for hunt ', false, false, 2);
INSERT INTO public.moon VALUES (16, ' honir ', 4256829, 655627, 1.00000, ' the best moon digging ', false, false, 1);
INSERT INTO public.moon VALUES (17, ' gonor ', 2330204, 109876, 1.00000, ' the best moon for love ', false, false, 1);
INSERT INTO public.moon VALUES (18, ' fonyr ', 47889300, 638293, 1.00000, ' the best  moon for jump ', false, false, 1);
INSERT INTO public.moon VALUES (19, ' doniq ', 7697898, 2900, 1.00000, ' the best moon for sing ', false, false, 1);
INSERT INTO public.moon VALUES (20, ' sonuq ', 2389020, 63782, 1.00000, ' the best moon for fart ', false, false, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 9000000, 0.00000, 'Our cozy life supporting planet', true, false, 1);
INSERT INTO public.planet VALUES (2, 'Kepler 186f', 2, 8000000, 580.00000, 'the first planet with a radius similar to Earths to be discovered in the habitable zone of another star', true, false, 5);
INSERT INTO public.planet VALUES (3, 'Saturn', 96, 912, 0.00001, ' a gas bag of planet ', false, true, 1);
INSERT INTO public.planet VALUES (4, 'Krypton', 10, 15000000, 265.00000, 'A glassy green planet of superhumans', false, false, 3);
INSERT INTO public.planet VALUES (5, 'Tatooine', 5, 5000000, 863.00000, 'A desert planet with two suns which played a major role in Star wars plot', false, true, 6);
INSERT INTO public.planet VALUES (6, 'Galvatron', 1, 0, 1.00000, 'A transformer who eat planets ', false, false, 6);
INSERT INTO public.planet VALUES (7, 'Eartho', 1, 9000000, 0.00000, 'Our cozy pregnancy supporting planet', true, false, 1);
INSERT INTO public.planet VALUES (8, 'Earthi', 1, 9000000, 0.00000, 'Our cozy drug supporting planet', true, false, 1);
INSERT INTO public.planet VALUES (9, 'Earthu ', 1, 9000000, 0.00000, 'Our cozy sports car supporting planet', true, false, 1);
INSERT INTO public.planet VALUES (10, 'Earthe ', 1, 9000000, 0.00000, 'Our cozy gun supporting planet', true, false, 1);
INSERT INTO public.planet VALUES (11, 'Eartha ', 1, 9000000, 0.00000, 'Our cozy religion supporting planet', true, false, 1);
INSERT INTO public.planet VALUES (12, 'Earthy ', 1, 9000000, 0.00000, 'Our cozy eugenics supporting planet', true, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 0.00060, 'The star of our solar system', false, false, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 120, 10000, 724.00000, 'one of the largest stars visible to the naked eye', false, false, 1);
INSERT INTO public.star VALUES (3, 'R136a1', 196, 4700000, 265.00000, 'One of the most massive and luminous stars known', true, true, 4);
INSERT INTO public.star VALUES (4, 'AE And', 15, 1000000, 85.00000, 'A luminous blue variable star', true, true, 5);
INSERT INTO public.star VALUES (5, 'Kepler 186f', 0, 0, 582.00000, 'The star is slightly cooler than the sun, with roughly half its metallicity. It is known to have five planets ', true, false, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 21, 12000, 863.00000, 'the brightest and most massive component and the eponym of a star system of at least four stars that appear as a single blue-white point of light to the naked eye ', false, true, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

