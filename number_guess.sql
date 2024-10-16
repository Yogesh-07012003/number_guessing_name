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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer
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
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1728745613771', 0, NULL);
INSERT INTO public.users VALUES (2, 'user_1728745613770', 0, NULL);
INSERT INTO public.users VALUES (3, 'user_1728745789447', 0, NULL);
INSERT INTO public.users VALUES (4, 'user_1728745789446', 0, NULL);
INSERT INTO public.users VALUES (5, 'user_1728745854963', 0, NULL);
INSERT INTO public.users VALUES (6, 'user_1728745854962', 0, NULL);
INSERT INTO public.users VALUES (8, 'user_1728745920807', 2, 432);
INSERT INTO public.users VALUES (7, 'user_1728745920808', 5, 90);
INSERT INTO public.users VALUES (31, 'user_1728746368246', 2, 323);
INSERT INTO public.users VALUES (10, 'user_1728745954309', 2, 150);
INSERT INTO public.users VALUES (30, 'user_1728746368247', 5, 292);
INSERT INTO public.users VALUES (9, 'user_1728745954310', 5, 42);
INSERT INTO public.users VALUES (12, 'user_1728746030524', 2, 603);
INSERT INTO public.users VALUES (33, 'user_1728746425835', 2, 383);
INSERT INTO public.users VALUES (11, 'user_1728746030525', 5, 90);
INSERT INTO public.users VALUES (32, 'user_1728746425836', 5, 70);
INSERT INTO public.users VALUES (14, 'user_1728746109507', 2, 110);
INSERT INTO public.users VALUES (13, 'user_1728746109508', 5, 188);
INSERT INTO public.users VALUES (16, 'user_1728746117532', 2, 42);
INSERT INTO public.users VALUES (35, 'user_1728746443878', 2, 172);
INSERT INTO public.users VALUES (15, 'user_1728746117533', 5, 54);
INSERT INTO public.users VALUES (34, 'user_1728746443879', 5, 3);
INSERT INTO public.users VALUES (18, 'user_1728746160873', 2, 520);
INSERT INTO public.users VALUES (17, 'user_1728746160874', 5, 537);
INSERT INTO public.users VALUES (37, 'user_1728746551243', 2, 279);
INSERT INTO public.users VALUES (27, 'user_1728746213965', 2, 103);
INSERT INTO public.users VALUES (26, 'user_1728746213966', 5, 5);
INSERT INTO public.users VALUES (36, 'user_1728746551244', 5, 185);
INSERT INTO public.users VALUES (29, 'user_1728746290673', 2, 463);
INSERT INTO public.users VALUES (28, 'user_1728746290674', 5, 47);
INSERT INTO public.users VALUES (39, 'user_1728746599360', 2, 529);
INSERT INTO public.users VALUES (38, 'user_1728746599361', 5, 262);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 39, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

