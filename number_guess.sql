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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game_statistics; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_statistics (
    user_id integer,
    game_id integer NOT NULL,
    guesses integer
);


ALTER TABLE public.game_statistics OWNER TO freecodecamp;

--
-- Name: game_statistics_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_statistics_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_statistics_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_statistics_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_statistics_game_id_seq OWNED BY public.game_statistics.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: game_statistics game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_statistics ALTER COLUMN game_id SET DEFAULT nextval('public.game_statistics_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: game_statistics; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game_statistics VALUES (31, 73, 10);
INSERT INTO public.game_statistics VALUES (32, 74, 423);
INSERT INTO public.game_statistics VALUES (33, 75, 77);
INSERT INTO public.game_statistics VALUES (33, 76, 352);
INSERT INTO public.game_statistics VALUES (32, 77, 368);
INSERT INTO public.game_statistics VALUES (32, 78, 844);
INSERT INTO public.game_statistics VALUES (32, 79, 519);
INSERT INTO public.game_statistics VALUES (34, 80, 359);
INSERT INTO public.game_statistics VALUES (34, 81, 24);
INSERT INTO public.game_statistics VALUES (35, 82, 951);
INSERT INTO public.game_statistics VALUES (35, 83, 67);
INSERT INTO public.game_statistics VALUES (34, 84, 734);
INSERT INTO public.game_statistics VALUES (34, 85, 150);
INSERT INTO public.game_statistics VALUES (34, 86, 281);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (31, 'Lee');
INSERT INTO public.users VALUES (32, 'user_1683832590030');
INSERT INTO public.users VALUES (33, 'user_1683832590029');
INSERT INTO public.users VALUES (34, 'user_1683832630111');
INSERT INTO public.users VALUES (35, 'user_1683832630110');


--
-- Name: game_statistics_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_statistics_game_id_seq', 86, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 35, true);


--
-- Name: game_statistics game_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_statistics
    ADD CONSTRAINT game_statistics_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: game_statistics game_statistics_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_statistics
    ADD CONSTRAINT game_statistics_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

