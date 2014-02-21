--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: perms; Type: TABLE; Schema: public; Owner: symfony; Tablespace: 
--

CREATE TABLE perms (
    id integer NOT NULL,
    kod character varying(255) NOT NULL
);


ALTER TABLE public.perms OWNER TO symfony;

--
-- Name: perms_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE perms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perms_id_seq OWNER TO symfony;

--
-- Name: user_permission; Type: TABLE; Schema: public; Owner: symfony; Tablespace: 
--

CREATE TABLE user_permission (
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.user_permission OWNER TO symfony;

--
-- Name: users; Type: TABLE; Schema: public; Owner: symfony; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    imie character varying(255) NOT NULL,
    nazwisko character varying(255) NOT NULL,
    dataurodzenia date NOT NULL,
    email character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO symfony;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO symfony;

--
-- Data for Name: perms; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY perms (id, kod) FROM stdin;
1	test1
2	123456
3	1234
4	read_write_c_drive
\.


--
-- Name: perms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('perms_id_seq', 4, true);


--
-- Data for Name: user_permission; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY user_permission (user_id, permission_id) FROM stdin;
1	3
1	1
1	2
2	1
2	2
2	4
3	2
3	3
3	4
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY users (id, imie, nazwisko, dataurodzenia, email) FROM stdin;
1	michał	koza	1980-03-03	marcin@patataj.pl
2	marek	zegarek	1900-01-01	marekzegarek@wp.pl
3	kazimierz	zawalidroga	1980-01-01	kazimierzz@wp.pl
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: perms_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony; Tablespace: 
--

ALTER TABLE ONLY perms
    ADD CONSTRAINT perms_pkey PRIMARY KEY (id);


--
-- Name: user_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony; Tablespace: 
--

ALTER TABLE ONLY user_permission
    ADD CONSTRAINT user_permission_pkey PRIMARY KEY (user_id, permission_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_472e5446a76ed395; Type: INDEX; Schema: public; Owner: symfony; Tablespace: 
--

CREATE INDEX idx_472e5446a76ed395 ON user_permission USING btree (user_id);


--
-- Name: idx_472e5446fed90cca; Type: INDEX; Schema: public; Owner: symfony; Tablespace: 
--

CREATE INDEX idx_472e5446fed90cca ON user_permission USING btree (permission_id);


--
-- Name: fk_472e5446a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY user_permission
    ADD CONSTRAINT fk_472e5446a76ed395 FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


--
-- Name: fk_472e5446fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY user_permission
    ADD CONSTRAINT fk_472e5446fed90cca FOREIGN KEY (permission_id) REFERENCES perms(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

