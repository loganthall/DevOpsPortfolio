--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2023-02-27 02:48:57 UTC

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
-- TOC entry 209 (class 1259 OID 33776)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 33808)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id smallint NOT NULL,
    item_name character varying,
    lifespan smallint,
    general_name character varying NOT NULL,
    consumable_peripheral boolean,
    cost numeric,
    assigned_user smallint
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 33807)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO postgres;

--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 214
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- TOC entry 210 (class 1259 OID 33781)
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    name character varying(128) NOT NULL
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 33786)
-- Name: user_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_accounts (
    username character varying(64) NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public.user_accounts OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 33794)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id smallint NOT NULL,
    name character varying(32) NOT NULL,
    department character varying(64) NOT NULL,
    username character varying(64) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 33793)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 212
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 217 (class 1259 OID 33824)
-- Name: users_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_locations (
    id smallint NOT NULL,
    users_id smallint NOT NULL,
    locations_name character varying NOT NULL
);


ALTER TABLE public.users_locations OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 33823)
-- Name: users_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_locations_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_locations_id_seq OWNER TO postgres;

--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_locations_id_seq OWNED BY public.users_locations.id;


--
-- TOC entry 3189 (class 2604 OID 33811)
-- Name: items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- TOC entry 3188 (class 2604 OID 33797)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 33827)
-- Name: users_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_locations ALTER COLUMN id SET DEFAULT nextval('public.users_locations_id_seq'::regclass);


--
-- TOC entry 3350 (class 0 OID 33776)
-- Dependencies: 209
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
a19c06e53091
\.


--
-- TOC entry 3356 (class 0 OID 33808)
-- Dependencies: 215
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, item_name, lifespan, general_name, consumable_peripheral, cost, assigned_user) FROM stdin;
101	7676528309135	0	Non.	f	588	29
102		0	Labore et.	t	946	10
103	9128969965930	55	Nisi omnis.	t	512	35
104	1199795250857	50	Eius.	f	349	11
105	6575339943228	0	Maiores.	f	923	23
106	4838466721643	0	Illo.	f	138	41
107	4172227653300	0	Fuga.	t	452	22
108	5343773559616	0	Consequatur.	f	961	33
109	0514806457239	47	Minima fugit.	t	446	15
110	5246179660453	0	Qui consequuntur.	f	506	6
111	2577557714639	0	Ipsa.	f	115	7
112	9707200348987	9	Quis placeat.	t	507	5
113	3171204073538	0	Porro.	f	975	48
114	8189197470888	0	Eligendi.	f	179	40
115	8459787999199	24	In.	t	608	6
116	6508642707706	21	Omnis.	f	463	14
117	8081920519256	51	Temporibus sed.	t	639	44
118	4879292025529	0	Fugit maiores.	f	376	44
119	0211938389819	7	Enim nihil.	t	21	49
120	6849945552984	44	Eum quia.	t	163	10
121	8944213423152	40	Ea reiciendis.	f	78	25
122	5117414806304	10	Praesentium.	f	880	46
123	2948223673671	0	Reprehenderit.	t	542	31
124	8226021770117	39	Rem autem.	f	167	41
125	0720268220957	58	Pariatur debitis.	t	792	6
126	6738668378493	44	Dolores.	t	376	8
127	0385497640770	49	Ut.	f	319	12
128	8465461541899	35	Sunt.	t	988	19
129	6195979053561	51	Commodi.	t	164	40
130	0517915993780	43	Sint.	f	311	47
131	1340215861287	39	Non nam.	f	359	35
132	5285693950077	0	Ut error.	f	379	40
133	0951037773385	39	Quas.	f	8	22
134	6387505890126	0	Consequatur dolorem.	f	467	6
135	1010379572519	35	Ipsa.	t	781	34
136	7424740693651	0	Minus.	f	672	11
137	9469848468969	0	Enim velit.	f	84	37
138	6400550045232	23	Qui odio.	t	860	29
139	5974577918738	0	Autem voluptatem.	f	378	11
140	7325186771296	0	Facilis.	t	20	29
141	7238914159443	36	Sint.	f	86	28
142	7672375567100	0	Quisquam.	t	736	29
143	7547714102390	55	Architecto.	t	347	46
144	9367108943297	0	Eligendi incidunt.	f	236	25
145	8107101056782	0	Ut.	f	863	5
\.


--
-- TOC entry 3351 (class 0 OID 33781)
-- Dependencies: 210
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (name) FROM stdin;
East Precioustown
Kimberg
McKenziechester
Moenmouth
New Mathiasville
South Lenorafurt
South Rubenville
Treverside
\.


--
-- TOC entry 3352 (class 0 OID 33786)
-- Dependencies: 211
-- Data for Name: user_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_accounts (username, password) FROM stdin;
alexandria.miller	4c5a4cd71a92929af11258548d543bfb76c9e282d1ef859403c4af9b525f7ccd
bechtelar.elena	8b5b92bdbbf4334a5c10e577db56ad8d5d3522f5e18c53dc4b861c122ede2589
bennie57	34f93bb5222d034992f222e48457bfdb95cdb2e778178625180aa18942cd02d6
blick.esta	b035ed187aae6345cf23fb4263d115f378c2fe4b2fba9281787c007e7898ad6c
chickle	3bb682c3fdada15ecb7e98a566baef07cb6266de278e00419e4d43fd91c97797
collins.elijah	0c197d26a6b23448abd3362addf1775e85a93b1ae0bdf06260723eda417817fd
corene.fisher	18af89b635bba85c95a6d415e30174e3059edef9041f38a775762f15c89798dc
delpha.cronin	dd877ba43531d20d54f7b5f7e855859f4d0e866defb771c343900f548e7d7a86
destinee42	851fbe72fe690dfafeb1d0636183a27e8f88305787ab6231de61cd2bbef40ea1
eddie35	7625210063e66a3a3f47a1cbe41741fadd351266da1a67bd6388dbb768d286a4
fausto20	bfe0f311837c0d8f17aead6fbd94c9118408578b2ec0ebf6bc1f1569137a3af6
fherman	e3a65fb372c6f8cd78fce943e959a239fb08fc2f539703e8e3aae6a26e7c115e
franco04	33b520f6f001ec4addf19877c62ef3d7e7c46dc2e5425d4f0b5eae1eb3439302
furman29	de8993e88e8ab4fcfc2e86d79f86fc76f369049fac67cc6e4c449643806ac807
graham.verner	90e825a82c47d0efc6a930c8352f8f3b759e8d3c9c8ea5446fc7e3cde6783736
hflatley	7c4943536ed09a2db8ab0992d41684393d2206676d2faf31738c8ed6074e3154
hilll.leda	dd6a37916c5dd278f7d665ba1d9a99a8a0fe5712cbf65caaa571ebf460222f94
jasen86	b0da457825e161339118eec3b85fca2be3b151f0d5440bbc5f6a4432095a3684
julius35	57f514c9811a22dd9472d9b90a5d995a872e053f3a3ecd1e4a548327f5362731
lconn	27b2c6ed85894abd663af4515fcee07b4ebd9279043a1d6cd850b71396dca19f
lila.ebert	412904e16fb739ff9be6b05a27f7dc147c5a1e6856d05d033af83b45838d07f8
lulu.beahan	3d37675d9a748224391d9ca8a6b642dfa83b3e61db426c5b144075726efcb5e7
margarete.thompson	b6a57a6be31904adc7ca26f50759b99827e1b0dd3d473b3ec60271446ff4d609
marilie.pagac	21121f21fbdf047ef726065f49db588216349fd0255811feee52e135aed82586
mayer.timmy	85f5c50c37af1705bb47a781b9d739fafb2e588b21dc37b7a532dac6466724c5
mmarks	ea0bb5f3affa83d1b8358640d6bdbaf518a1b79d08dd005b290908700b8b6206
nwiegand	516a27e28026a0c8a7adb5fd009e2d2ab5e2a823c2bc5745a3bd1b778bba4a9b
pattie.murphy	62507bb266a1472392f3939d8ff0d8ee8d0eeb0dff5714199f1ebd6827980696
penelope.schaefer	dd49812caa85e481ba8039b55f233cbc4736991488ff3a5cdc97510b0d7b841d
qblick	9802924e9e095f4a44bb09c15ca455317f1fa8cbbb5dad491fd2d5994ecbd556
qbotsford	e3862d5d87a7706c65a11ed06d8bc692a97d83eac1d93549c4ba1a832188fe92
reinhold75	7ffa597add2bb4e13270ccf305f9179e6c9a3365889b5fc92f9fa8eb3f1205ab
savion.heller	3678851018f50a938e04e42ae09688f26e18dba8f69d21cc399553e29e0f2b2f
schaefer.jimmy	b5ad84aa4449407d90838371d01538a4b1f6f1a0cdd2f8e0e7a7c438815a832d
schulist.jena	227fa18a5365e7761819051aec057d9d4b6ac1a72add1ddd7186cb631c1b78fb
stokes.arvid	66078a6d0b3340872844484ad6bf3a41246289767362fb699a842acec5529e52
thiel.sydnee	addbf697a247ebcdea02a7cf7c64d6b438012a18e683975484e831f5b546d9f0
tlittle	0f47ee68ac3ada1d26472d7dda11ea15c7b00ca87eddc7d33eec9f5f9f025033
trent61	25e136d0bfc3896dc370a6299d10cb32025d45bea7510304e1f159853f2c2bb2
tromp.vincent	452954d679bb187d424d8cdf733fe806b5a6d3086dc044f9c2dbee1f31adfea6
troy.schaefer	e07d52578987522fd8edc0bfaf7c8b49558dd69cd27bf74e76557f6b36876105
tyrell.collins	e61b0fa433ee154adc97cb1469f072ae6fd50d3c1d91e9dfb9fcc16d040c6596
umurphy	88960df5022e1d9b3b44cc5db0e60fdd024f35687d84940b3fd3c09bc5632d46
upacocha	ecead1ad1b22034a32dc7099e9ebccbee1b638fa6f683110d260eef6ab400c44
walton32	7f9f65325e08cb36d8c582b1f3160179516d41f6b214d13361f566a52d95840b
wkautzer	a0e62a63971dde6b069bdc43e68deee34a089a61d61d1dc46e88f33d4804f5c7
wlittel	55dc9c28c29a4981aaed00212148cc2543279eb30b73c8e2d6066350d084801d
zachary.macejkovic	6ccb89deb4a86ee5a4a8480030cab102af091638a3386ba9a7aa73aa22e71221
zion18	60915b08398655db853c7e01db32f80e2a149265c0f7699eea994535fd7a5434
zvolkman	62b11cc2d0e3a845fecca3b509ffa870277543f4e5c85dc2271bc2a1140de319
user_test_1	6ccb89deb4a86ee5a4a8480030cab102af091638a3386ba9a7aa73aa22e71221
user_test_2	60915b08398655db853c7e01db32f80e2a149265c0f7699eea994535fd7a5434
user_test_3	62b11cc2d0e3a845fecca3b509ffa870277543f4e5c85dc2271bc2a1140de319
\.


--
-- TOC entry 3354 (class 0 OID 33794)
-- Dependencies: 213
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, department, username) FROM stdin;
1	Prince D'Amore	Becker Inc	alexandria.miller
2	Vita Jacobi	Kiehn, Wehner and Bahringer	bechtelar.elena
3	Miss Dayna Schaden MD	Willms, Auer and Goyette	bennie57
4	Rosina Prohaska I	Spencer-Smith	blick.esta
5	Dr. Pamela Harber	Feil LLC	chickle
6	Nickolas Ziemann	O'Conner PLC	collins.elijah
7	Dr. Cesar Skiles	Stoltenberg-McDermott	corene.fisher
8	Prof. Etha Pouros IV	White-Brekke	delpha.cronin
9	Mr. Geoffrey Von III	Hettinger Inc	destinee42
10	Santino Fay II	Bergnaum PLC	eddie35
11	Cyril Yundt	Yost and Sons	fausto20
12	Prof. Solon Heathcote PhD	Gulgowski and Sons	fherman
13	Ernesto Stanton	Emmerich-Corwin	franco04
14	Reyna Adams	Zulauf LLC	furman29
15	Nora Metz	Schmitt, Dooley and Kunze	graham.verner
16	Prof. Cristobal Koch V	Blanda LLC	hflatley
17	Edyth Reichel	Luettgen-Waelchi	hilll.leda
18	Hailee Okuneva DVM	Gleason, Nolan and Nolan	jasen86
19	Laurel Sawayn I	Morissette, Jacobson and Conn	julius35
20	Miss Brooke Kohler DDS	Murazik, Gerlach and Lowe	lconn
21	Augustine Kuhn	Johnson, Lind and Schinner	lila.ebert
22	Aryanna Gerlach	Rutherford-Mueller	lulu.beahan
23	Dr. Guiseppe Purdy Jr.	Roob, Kuphal and Koelpin	margarete.thompson
24	Verner Nader	Rempel-Lindgren	marilie.pagac
25	Oceane Hane	Gorczany Inc	mayer.timmy
26	Janie O'Kon	Leffler Inc	mmarks
27	Prof. Larry Nikolaus II	Stanton, Labadie and O'Kon	nwiegand
28	Sven Terry	Oberbrunner and Sons	pattie.murphy
29	Edmund Hoeger	Rodriguez, Bauch and Cremin	penelope.schaefer
30	Carmella Friesen	Gorczany Ltd	qblick
31	Carissa Lang	Thiel, Macejkovic and Haley	qbotsford
32	Mr. Dion Heaney IV	Durgan and Sons	reinhold75
33	Prof. Corine Kuvalis III	Hermiston, West and Dare	savion.heller
34	Aiden Stamm	Kihn Ltd	schaefer.jimmy
35	Prof. Christelle Lakin	Huels Inc	schulist.jena
36	Ayla O'Keefe	Frami, Langosh and Gislason	stokes.arvid
37	Stone Waters	Goldner-Ortiz	thiel.sydnee
38	Emilia Runte	Casper-Heathcote	tlittle
39	Prof. Malcolm Romaguera DDS	Hintz and Sons	trent61
40	Jamil Keeling	Carroll-Langworth	tromp.vincent
41	Cicero Klein	Rogahn-Quitzon	troy.schaefer
42	Prof. Ansley Funk V	Hilpert-Sanford	tyrell.collins
43	Melyssa Lueilwitz	Gutkowski Inc	umurphy
44	Dr. Annie Schulist I	Heathcote LLC	upacocha
45	Brayan Welch III	Murphy, Stokes and White	walton32
46	Mrs. Ethyl Kerluke	Brekke-Herman	wkautzer
47	Camren Douglas	Braun PLC	wlittel
48	Andre Keeling	Harber LLC	zachary.macejkovic
49	Sam Bashirian	Hermann Inc	zion18
50	Waldo Schowalter	Barrows, Gorczany and Homenick	zvolkman
\.


--
-- TOC entry 3358 (class 0 OID 33824)
-- Dependencies: 217
-- Data for Name: users_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_locations (id, users_id, locations_name) FROM stdin;
1	1	East Precioustown
2	2	Kimberg
3	3	McKenziechester
4	4	Moenmouth
5	5	New Mathiasville
6	6	South Lenorafurt
7	7	South Rubenville
8	8	Treverside
9	9	East Precioustown
10	10	Kimberg
11	11	McKenziechester
12	12	Moenmouth
13	13	New Mathiasville
14	14	South Lenorafurt
15	15	South Rubenville
16	16	Treverside
17	17	East Precioustown
18	18	Kimberg
19	19	McKenziechester
20	20	Moenmouth
21	21	New Mathiasville
22	22	South Lenorafurt
23	23	South Rubenville
24	24	Treverside
25	25	East Precioustown
26	26	Kimberg
27	27	McKenziechester
28	28	Moenmouth
29	29	New Mathiasville
30	30	South Lenorafurt
31	31	South Rubenville
32	32	Treverside
33	33	East Precioustown
34	34	Kimberg
35	35	McKenziechester
36	36	Moenmouth
37	37	New Mathiasville
38	38	South Lenorafurt
39	39	South Rubenville
40	40	Treverside
41	41	East Precioustown
42	42	Kimberg
43	43	McKenziechester
44	44	Moenmouth
45	45	New Mathiasville
46	46	South Lenorafurt
47	47	South Rubenville
48	48	Treverside
49	49	East Precioustown
50	50	Kimberg
\.


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 214
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 1, false);


--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 212
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 216
-- Name: users_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_locations_id_seq', 50, true);


--
-- TOC entry 3192 (class 2606 OID 33780)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 3202 (class 2606 OID 33817)
-- Name: items items_item_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_item_name_key UNIQUE (item_name);


--
-- TOC entry 3204 (class 2606 OID 33815)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 3194 (class 2606 OID 33785)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (name);


--
-- TOC entry 3196 (class 2606 OID 33792)
-- Name: user_accounts user_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_accounts
    ADD CONSTRAINT user_accounts_pkey PRIMARY KEY (username);


--
-- TOC entry 3206 (class 2606 OID 33831)
-- Name: users_locations users_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_locations
    ADD CONSTRAINT users_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 3198 (class 2606 OID 33799)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3200 (class 2606 OID 33801)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 3208 (class 2606 OID 33818)
-- Name: items items_assigned_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_assigned_user_fkey FOREIGN KEY (assigned_user) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- TOC entry 3209 (class 2606 OID 33832)
-- Name: users_locations users_locations_locations_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_locations
    ADD CONSTRAINT users_locations_locations_name_fkey FOREIGN KEY (locations_name) REFERENCES public.locations(name) ON DELETE CASCADE;


--
-- TOC entry 3210 (class 2606 OID 33837)
-- Name: users_locations users_locations_users_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_locations
    ADD CONSTRAINT users_locations_users_id_fkey FOREIGN KEY (users_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 3207 (class 2606 OID 33802)
-- Name: users users_username_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_fkey FOREIGN KEY (username) REFERENCES public.user_accounts(username) ON DELETE CASCADE;


-- Completed on 2023-02-27 02:48:57 UTC

--
-- PostgreSQL database dump complete
--

