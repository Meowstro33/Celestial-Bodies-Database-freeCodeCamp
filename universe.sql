--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: description; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.description (
    name character varying(20),
    extra_1 character varying(100) NOT NULL,
    extra_2 character varying(100) NOT NULL,
    description_id integer NOT NULL
);


ALTER TABLE public.description OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(20),
    galaxy_types character varying(20),
    galaxy_id integer NOT NULL,
    "real" boolean NOT NULL,
    color text,
    galaxy character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(20),
    moon_id integer NOT NULL,
    planet text NOT NULL,
    diameter_in_km numeric,
    rings boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(20) NOT NULL,
    planet_types character varying(20),
    age_in_millions_of_years integer,
    has_life boolean,
    distance_from_earth integer,
    planet_id integer NOT NULL,
    star character varying(20),
    planet character varying(20)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(20) NOT NULL,
    star_id integer NOT NULL,
    galaxy character varying(20),
    color character varying(20),
    constellation character varying(30),
    star character varying(20)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: description; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.description VALUES ('Milky Way', 'Contains our solar system', 'Estimated 100-400 billion stars', 1);
INSERT INTO public.description VALUES ('Andromeda', 'Closest spiral galaxy to the Milky Way', 'potential future collision with the Milky Way', 2);
INSERT INTO public.description VALUES ('Triangulum', 'Third-largest galaxy in the Local Group', 'active star formation', 3);
INSERT INTO public.description VALUES ('Sombrero', 'Bright central bulge, distinct dark dust lane', 'named for its hat-like appearance', 4);
INSERT INTO public.description VALUES ('Messier', 'Contains a supermassive black hole', 'bright jet of particles emitted from the black hole', 5);
INSERT INTO public.description VALUES ('Whirlpool', 'Well-defined spiral arms', 'interacting with a smaller companion galaxy', 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 'Barred Spiral', 1, true, 'White-Yellow', 'Milky Way');
INSERT INTO public.galaxy VALUES ('Andromeda', 'Spiral', 2, false, 'Blue-White', 'Andromeda');
INSERT INTO public.galaxy VALUES ('Triangulum', 'Spiral', 3, false, 'Blue', 'Triangulum');
INSERT INTO public.galaxy VALUES ('Sombrero', 'Spiral Bulge', 4, false, 'Yellow-White', 'Sombrero');
INSERT INTO public.galaxy VALUES ('Messier 87', 'Giant Elliptical', 5, true, 'Yellow', 'Messier 87');
INSERT INTO public.galaxy VALUES ('Whirlpool', 'Spiral', 6, true, 'Blue-White-Pink', 'Whirlpool');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Luna', 1, 'Earth', 3474, false);
INSERT INTO public.moon VALUES ('Io', 2, 'Jupiter', 3643, false);
INSERT INTO public.moon VALUES ('Europa', 3, 'Jupiter', 3121, false);
INSERT INTO public.moon VALUES ('Ganymede', 4, 'Jupiter', 5268, false);
INSERT INTO public.moon VALUES ('Callisto', 5, 'Jupiter', 4821, false);
INSERT INTO public.moon VALUES ('Titan', 6, 'Saturn', 5151, false);
INSERT INTO public.moon VALUES ('Rhea', 7, 'Saturn', 1527, true);
INSERT INTO public.moon VALUES ('Enceladus', 8, 'Saturn', 504, false);
INSERT INTO public.moon VALUES ('Lapetus', 9, 'Saturn', 1471, false);
INSERT INTO public.moon VALUES ('Phobos', 10, 'Mars', 22.4, false);
INSERT INTO public.moon VALUES ('Deimos', 11, 'Mars', 12.4, false);
INSERT INTO public.moon VALUES ('Titania', 12, 'Uranus', 1578, false);
INSERT INTO public.moon VALUES ('Oberon', 13, 'Uranus', 1523, false);
INSERT INTO public.moon VALUES ('Miranda', 14, 'Uranus', 471.6, false);
INSERT INTO public.moon VALUES ('Ariel', 15, 'Uranus', 1158, false);
INSERT INTO public.moon VALUES ('Triton', 16, 'Neptune', 2706, false);
INSERT INTO public.moon VALUES ('Nereid', 17, 'Neptune', 340, false);
INSERT INTO public.moon VALUES ('Helios', 18, 'Xenon Prime', 1200, false);
INSERT INTO public.moon VALUES ('Zephyr', 19, 'Aurora', 800, false);
INSERT INTO public.moon VALUES ('Hades', 20, 'Nyx', 900, false);
INSERT INTO public.moon VALUES ('Nyssa', 21, 'Kryos', 1000, false);
INSERT INTO public.moon VALUES ('Celeste', 22, 'Aetheris', 1500, false);
INSERT INTO public.moon VALUES ('Vulcan', 23, 'Volcanis', 800, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Earth', 'Terrestrial', 4500, true, NULL, 1, 'Sirius', 'Earth');
INSERT INTO public.planet VALUES ('Xenon Prime', 'Fictional', 5000, false, NULL, 9, 'Sirius', 'Xenon Prime');
INSERT INTO public.planet VALUES ('Zypher', 'Fictional', 5000, true, NULL, 12, 'Altair', 'Zypher');
INSERT INTO public.planet VALUES ('Aurora', 'Fictional', 6000, true, NULL, 10, 'Vega', 'Aurora');
INSERT INTO public.planet VALUES ('Aquaris', 'Fictional', 6000, true, NULL, 16, 'Vega', 'Aquaris');
INSERT INTO public.planet VALUES ('Nyx', 'Fictional', 4500, false, NULL, 11, 'Altair', 'Nyx');
INSERT INTO public.planet VALUES ('Kryos', 'Fictional', 3000, true, NULL, 13, 'Altair', 'Kryos');
INSERT INTO public.planet VALUES ('Aetheris', 'Fictional', 4800, true, NULL, 14, 'Deneb', 'Aetheris');
INSERT INTO public.planet VALUES ('Volcanis', 'Fictional', 4000, false, NULL, 15, 'Vega', 'Volcanis');
INSERT INTO public.planet VALUES ('Celestia', 'Fictional', 7000, true, NULL, 17, 'Deneb', 'Celestia');
INSERT INTO public.planet VALUES ('Mars', 'Terrestrial', 4500, false, 225, 2, 'Vega', 'Mars');
INSERT INTO public.planet VALUES ('Mercury', 'Terrestrial', 4500, false, 77, 3, 'Sirius', 'Mercury');
INSERT INTO public.planet VALUES ('Venus', 'Terrestrial', 4500, false, 41, 4, 'Sirius', 'Venus');
INSERT INTO public.planet VALUES ('Jupiter', 'Gas Giant', 4500, false, 628, 5, 'Altair', 'Jupiter');
INSERT INTO public.planet VALUES ('Saturn', 'Gas Giant', 4500, false, 1200, 6, 'Sirius', 'Saturn');
INSERT INTO public.planet VALUES ('Uranus', 'Ice Giant', 4500, false, 2700, 7, 'Altair', 'Uranus');
INSERT INTO public.planet VALUES ('Neptune', 'Ice Giant', 4500, false, 4300, 8, 'Altair', 'Neptune');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sirius', 1, 'Milky Way', 'White', 'Canis Major', 'Sirius');
INSERT INTO public.star VALUES ('Betelgeuse', 2, 'Milky Way', 'Red', 'Orion', 'Betelgeuse');
INSERT INTO public.star VALUES ('Rigel', 3, 'Milky Way', 'Blue-White', 'Orion', 'Rigel');
INSERT INTO public.star VALUES ('Vega', 4, 'Milky Way', 'Blue-White', 'Lyra', 'Vega');
INSERT INTO public.star VALUES ('Polaris', 5, 'Milky Way', 'Yellow-White', 'Ursa Minor', 'Polaris');
INSERT INTO public.star VALUES ('Aldebaran', 6, 'Milky Way', 'Orange', 'Taurus', 'Aldebaran');
INSERT INTO public.star VALUES ('Antares', 7, 'Milky Way', 'Red', 'Scorpius', 'Antares');
INSERT INTO public.star VALUES ('Procyon', 8, 'Milky Way', 'White-Yellow', 'Canis Minor', 'Procyon');
INSERT INTO public.star VALUES ('Altair', 9, 'Milky Way', 'White', 'Aquila', 'Altair');
INSERT INTO public.star VALUES ('Deneb', 10, 'Milky Way', 'White-Blue', 'Cygnus', 'Deneb');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 23, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 34, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 10, true);


--
-- Name: description description_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_id PRIMARY KEY (description_id);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id PRIMARY KEY (moon_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id PRIMARY KEY (planet_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id PRIMARY KEY (star_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: description unique_description; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.description
    ADD CONSTRAINT unique_description UNIQUE (description_id);


--
-- Name: galaxy unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy UNIQUE (galaxy);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_id UNIQUE (moon_id);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (planet);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (star);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: moon fk_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon FOREIGN KEY (planet) REFERENCES public.planet(planet);


--
-- Name: planet fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet FOREIGN KEY (star) REFERENCES public.star(star);


--
-- Name: star fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star FOREIGN KEY (galaxy) REFERENCES public.galaxy(galaxy);


--
-- PostgreSQL database dump complete
--

