--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    CONSTRAINT admins_password_check CHECK ((length((password)::text) > 8))
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admins_id_seq OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: couriers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.couriers (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    phone character varying(15),
    CONSTRAINT courier_password_check CHECK ((length((password)::text) > 8))
);


ALTER TABLE public.couriers OWNER TO postgres;

--
-- Name: courier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.courier_id_seq OWNER TO postgres;

--
-- Name: courier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courier_id_seq OWNED BY public.couriers.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    pickup_location character varying(255) NOT NULL,
    drop_off_location character varying(255) NOT NULL,
    package_details text,
    delivery_time timestamp without time zone NOT NULL,
    user_id integer,
    status character varying(50) DEFAULT 'pending'::character varying,
    courier_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(30),
    email character varying(30),
    phone character varying(15) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: couriers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.couriers ALTER COLUMN id SET DEFAULT nextval('public.courier_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, name, email, password) FROM stdin;
1	eslam	eslam@admin.com	$2b$10$dgG/vvVIVlL2CmGVo2.GaO3V.JtHdPRZ3TP2Wr9GFZmyAO3g.l9Wm
2	ahmed	ahmed@admin.com	$2b$10$X4wQtl6LWs1tDAN8EmlwEOwVYdXhrUcg4CaOKv3ceOuFcbHXjVAF2
3	ana	ana@admin.com	$2b$10$3dfFCo/qhDndVam.SfCRCuS3drEYhCu9neekTTnUmNCrq8sOO1nR6
\.


--
-- Data for Name: couriers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.couriers (id, name, email, password, phone) FROM stdin;
1	eslam	eslam@courier.com	$2b$10$/erKVtEuK9C0NHGbzL8lAu20rxj0nJyopJPtSAKCvVcBVZ6D6X2uG	01064875515
2	lolo	lolo@courier.com	$2b$10$ksD5rNyqMGvOGpnJIcNdB.nuZahnNz7eb8MdlueOlZYF09qbPj52y	01064875515
3	ahmed	ahmed@courier.com	$2b$10$3SQWnIX6TLRNM5E3dLuLkO0rEXQdWFHcArTnwoVl2im9atRardQ0e	01064875515
4	courier	ooo@courier.com	$2b$10$CaQ.o3E4GKMlPIPHmXPp/.hpjoeI9/vQmRWi6uYDlxE3IbfDaEW6O	0064875515
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, pickup_location, drop_off_location, package_details, delivery_time, user_id, status, courier_id) FROM stdin;
40	ccc	cccc	ccc	2024-11-27 02:37:00	41	pending	\N
41	iiii	iiii	iiii	2024-11-27 02:37:00	43	pending	\N
42	fhdjk	hfdsuka	kjhfad	2024-11-27 02:37:00	43	pending	\N
43	wje	oiuds	wnmrbe	2024-11-27 02:37:00	43	pending	\N
45	mam	mama	mama	2024-11-27 03:36:00	41	pending	\N
46	meme	meme	meme	2024-11-27 09:11:00	41	pending	\N
39	sss	sssss	sss	2024-11-27 02:36:00	41	Picked Up	\N
38	lll	lll	lll	2024-11-27 02:35:00	41	Picked Up	2
47	cairo	elslam	kjhds	2024-11-27 09:19:00	47	Picked Up	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, phone, password) FROM stdin;
41	ESLAM YASSER	eslamyasser535@gmail.com	01064875515	$2b$10$vHgWmGwPmAzgp1mn511nEuEOWyEkGHCJ96/gNI5PC97a5X0cw6e76
42	moaz sayed	moazsayed@gmail.com	01064875515	$2b$10$96b2JdQGMjNk/yYOKoku5enpeAOgU3sHHkWQCdUGUes4W.xP09h9K
43	lolo	lolo@gmail.com	01064875515	$2b$10$KLWsE3zVI.FsFp1yJZ3PjuWD7Ypsu8WqnLQliTiB7l0IMcYD.dWX6
44	eslam	eslam@courier.com	01064875515	$2b$10$5.hsD0qNCswpbn6m5WsNjOqQnQv53423p6Q6kp7Vzd9t8TnANahQ2
46	eyad	eyad@gmail.com	0064875515	$2b$10$CP6.oxoTn3zPkSeb4IK2a.FPfQaFCW7Ucb.8xhQ9hcJ9kV9.ZR5dK
47	basma	basma@gmail.com	0101554545	$2b$10$GB3Ua3p9/t8Ani9JbFLnFOehN6sF0j/Nei7eNrSxieEI3R74ZnoPW
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_seq', 3, true);


--
-- Name: courier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courier_id_seq', 4, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 47, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 47, true);


--
-- Name: admins admins_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key UNIQUE (email);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: couriers courier_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.couriers
    ADD CONSTRAINT courier_email_key UNIQUE (email);


--
-- Name: couriers courier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.couriers
    ADD CONSTRAINT courier_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: users unique_email; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: orders fk_courier; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_courier FOREIGN KEY (courier_id) REFERENCES public.couriers(id) ON DELETE SET NULL;


--
-- Name: orders fk_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

-- GRANT ALL ON TABLE public.users TO me;


--
-- PostgreSQL database dump complete
--

