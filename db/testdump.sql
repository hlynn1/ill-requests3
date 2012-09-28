--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;


CREATE TABLE activities (
    id integer NOT NULL,
    request_id integer,
    status_id integer,
    note text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

--CREATE SEQUENCE activities_id_seq
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;

--ALTER SEQUENCE activities_id_seq OWNED BY activities.id;

--SELECT pg_catalog.setval('activities_id_seq', 180, true);


CREATE TABLE customers (
    id integer NOT NULL,
    userid character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    email character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

--CREATE SEQUENCE customers_id_seq
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;

--ALTER SEQUENCE customers_id_seq OWNED BY customers.id;

--SELECT pg_catalog.setval('customers_id_seq', 94, true);


CREATE TABLE locations (
    id integer NOT NULL,
    code character varying(255),
    name character varying(255),
    address character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

--CREATE SEQUENCE locations_id_seq
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;

--ALTER SEQUENCE locations_id_seq OWNED BY locations.id;

--SELECT pg_catalog.setval('locations_id_seq', 1, false);


CREATE TABLE requests (
    id integer NOT NULL,
    customer_id integer,
    oclcnum integer,
    title character varying(255),
    author character varying(255),
    pub character varying(255),
    locationplaced character varying(255),
    location_id integer,
    duedate date,
    bclitem bigint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    dateplaced date,
    current_status integer
);

--CREATE SEQUENCE requests_id_seq
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;

--ALTER SEQUENCE requests_id_seq OWNED BY requests.id;

--SELECT pg_catalog.setval('requests_id_seq', 85, true);


CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


CREATE TABLE statuses (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);

--CREATE SEQUENCE statuses_id_seq
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;

--ALTER SEQUENCE statuses_id_seq OWNED BY statuses.id;

--SELECT pg_catalog.setval('statuses_id_seq', 1, false);


CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    password_digest character varying(255),
    remember_token character varying(255),
    locationcode character varying(255),
    admin boolean DEFAULT false
);

--CREATE SEQUENCE users_id_seq
--    START WITH 1
--    INCREMENT BY 1
--    NO MINVALUE
--    NO MAXVALUE
--    CACHE 1;

--ALTER SEQUENCE users_id_seq OWNED BY users.id;

--SELECT pg_catalog.setval('users_id_seq', 11, true);


--ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);
--ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);
--ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);
--ALTER TABLE ONLY requests ALTER COLUMN id SET DEFAULT nextval('requests_id_seq'::regclass);
--ALTER TABLE ONLY statuses ALTER COLUMN id SET DEFAULT nextval('statuses_id_seq'::regclass);
--ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);



COPY activities (id, request_id, status_id, note, created_at, updated_at) FROM stdin;
9	46	2	\N	2012-08-02 02:27:04	2012-08-05 02:27:04
14	11	3	\N	2012-07-31 02:27:05	2012-08-05 02:27:05
15	8	4	\N	2012-07-31 02:27:05	2012-08-05 02:27:05
16	7	4	\N	2012-07-31 02:27:05	2012-08-05 02:27:05
17	9	3	\N	2012-07-30 02:27:05	2012-08-05 02:27:05
18	8	3	\N	2012-07-30 02:27:05	2012-08-05 02:27:05
19	7	3	\N	2012-07-25 02:27:05	2012-08-05 02:27:05
20	6	3	\N	2012-07-23 02:27:05	2012-08-05 02:27:05
21	5	3	\N	2012-07-23 02:27:05	2012-08-05 02:27:05
22	4	3	\N	2012-07-23 02:27:05	2012-08-05 02:27:05
23	4	2	\N	2012-07-16 02:27:06	2012-08-05 02:27:06
24	5	2	\N	2012-07-16 02:27:06	2012-08-05 02:27:06
25	6	2	\N	2012-07-16 02:27:06	2012-08-05 02:27:06
26	7	2	\N	2012-07-17 02:27:06	2012-08-05 02:27:06
27	8	2	\N	2012-07-18 02:27:06	2012-08-05 02:27:06
30	18	2	\N	2012-07-31 02:27:06	2012-08-05 02:27:06
34	17	2	\N	2012-07-27 02:27:07	2012-08-05 02:27:07
37	13	2	\N	2012-07-25 02:27:07	2012-08-05 02:27:07
38	15	2	\N	2012-07-25 02:27:07	2012-08-05 02:27:07
39	14	2	\N	2012-07-25 02:27:07	2012-08-05 02:27:07
40	16	2	\N	2012-07-25 02:27:07	2012-08-05 02:27:07
42	12	2	\N	2012-07-24 02:27:08	2012-08-05 02:27:08
45	9	2	\N	2012-07-23 02:27:09	2012-08-05 02:27:09
46	10	2	\N	2012-07-23 02:27:09	2012-08-05 02:27:09
47	11	2	\N	2012-07-23 02:27:09	2012-08-05 02:27:09
81	10	3	\N	2012-08-03 19:42:33	2012-08-07 19:42:33
82	13	3	\N	2012-08-03 19:45:03	2012-08-07 19:45:03
83	14	3	\N	2012-08-03 19:46:21	2012-08-07 19:46:21
84	15	3	\N	2012-08-03 19:48:47	2012-08-07 19:48:47
85	51	2	\N	2012-08-01 22:11:43	2012-08-07 22:11:43
86	52	2	\N	2012-08-01 22:13:06	2012-08-07 22:13:06
92	57	2	\N	2012-08-07 19:55:21	2012-08-08 19:55:21
93	16	3	\N	2012-08-06 13:17:57	2012-08-09 13:17:57
94	16	4	\N	2012-08-08 13:19:11	2012-08-09 13:19:11
95	17	3	\N	2012-08-03 13:31:48	2012-08-09 13:31:48
96	17	4	\N	2012-08-08 13:32:13	2012-08-09 13:32:13
100	13	4	\N	2012-08-15 16:54:49	2012-08-15 16:54:49
101	18	3	\N	2012-08-15 16:55:21	2012-08-15 16:55:21
102	11	3	\N	2012-08-15 18:15:47	2012-08-15 18:15:47
103	6	4	\N	2012-08-15 18:18:42	2012-08-15 18:18:42
104	5	4	\N	2012-08-15 18:19:02	2012-08-15 18:19:02
105	9	4	\N	2012-08-13 18:19:21	2012-08-15 18:19:21
106	14	4	\N	2012-08-11 18:23:19	2012-08-15 18:23:19
107	15	4	\N	2012-08-13 18:23:41	2012-08-15 18:23:41
108	58	2	\N	2012-08-16 19:32:58	2012-08-16 19:32:58
109	59	2	\N	2012-08-16 19:35:54	2012-08-16 19:35:54
110	57	4	\N	2012-08-17 18:49:13	2012-08-17 18:49:13
140	7	5	\N	2012-08-06 21:17:26	2012-08-20 21:17:26
141	8	5	\N	2012-08-14 21:18:24	2012-08-20 21:18:24
142	9	5	\N	2012-08-20 21:19:51	2012-08-20 21:19:51
143	76	3	\N	2012-08-20 21:22:36	2012-08-20 21:22:36
147	4	4	\N	2012-08-22 15:42:05	2012-08-22 15:42:05
148	58	3	\N	2012-08-22 19:52:40	2012-08-22 19:52:40
149	11	4	\N	2012-08-27 18:09:26	2012-08-27 18:09:26
150	59	3	\N	2012-08-27 18:13:00	2012-08-27 18:13:00
151	58	4	\N	2012-08-27 18:13:45	2012-08-27 18:13:45
152	59	3	\N	2012-08-27 18:25:42	2012-08-27 18:25:42
153	59	4	\N	2012-08-30 20:28:51	2012-08-30 20:28:51
154	78	3	\N	2012-08-30 20:34:32	2012-08-30 20:34:32
155	79	3	\N	2012-08-31 19:32:11	2012-08-31 19:32:11
157	46	4	\N	2012-09-05 18:09:21	2012-09-05 18:09:21
\.


COPY customers (id, userid, firstname, lastname, email, created_at, updated_at) FROM stdin;
44	29878002980601	'Alan'	'Vonloh'	\N	2012-08-05 01:54:26	2012-08-05 01:54:26
45	29878002981047	'Annie'	'Maloney'	\N	2012-08-05 01:54:26	2012-08-05 01:54:26
46	29878003356439	'Brady'	'Phillips'	\N	2012-08-05 01:54:26	2012-08-05 01:54:26
47	29878001666052	'John'	'Hoerig'	\N	2012-08-05 01:54:27	2012-08-05 01:54:27
48	29878003180391	'John'	'Laskowski'	\N	2012-08-05 01:54:27	2012-08-05 01:54:27
49	29878003550544	'Karen'	'Coppersmith'	\N	2012-08-05 01:54:27	2012-08-05 01:54:27
50	0000384100	'Melody'	'Urban'	\N	2012-08-05 01:54:27	2012-08-05 01:54:27
51	29878002418834	'Robert'	'Schiller'	\N	2012-08-05 01:54:27	2012-08-05 01:54:27
52	29878003535149	'Warren'	'Budzis'	\N	2012-08-05 01:54:27	2012-08-05 01:54:27
53	29878002648240	'Garrett'	'Lowery'	\N	2012-08-05 01:54:27	2012-08-05 01:54:27
54	29878001523501	'Nancy'	'Bowman'	\N	2012-08-05 01:54:28	2012-08-05 01:54:28
55	29878002695936	'Jean'	'Stachura'	\N	2012-08-05 01:54:28	2012-08-05 01:54:28
56	29878003285950	'Ruth'	'Steiner'	\N	2012-08-05 01:54:28	2012-08-05 01:54:28
57	29878003054273	'Merry'	'Suring'	\N	2012-08-05 01:54:28	2012-08-05 01:54:28
58	29878001701941	'Dustin'	'Rottier'	\N	2012-08-05 01:54:28	2012-08-05 01:54:28
59	29878003286537	'Loretta'	'Sagataw'	\N	2012-08-05 01:54:29	2012-08-05 01:54:29
60	0000383330	'Audrey'	'Naliborski'	\N	2012-08-05 01:54:29	2012-08-05 01:54:29
61	29878003424609	'Mark'	'Kozicki'	\N	2012-08-05 01:54:29	2012-08-05 01:54:29
62	29878002216691	'Valerie'	'Clausen'	\N	2012-08-05 01:54:29	2012-08-05 01:54:29
63	29878001648068	'Annette'	'VanLannen'	\N	2012-08-05 01:54:29	2012-08-05 01:54:29
64	29878001593835	'Connie'	'Shorter'	\N	2012-08-05 01:54:30	2012-08-05 01:54:30
65	29878002219372	'Wendy'	'Wojcik'	\N	2012-08-05 01:54:30	2012-08-05 01:54:30
66	29878001989231	'Debra'	'Buckarz'	\N	2012-08-05 01:54:30	2012-08-05 01:54:30
67	29878003053481	'Ken'	'Clark'	\N	2012-08-05 01:54:30	2012-08-05 01:54:30
68	29878000860565	'Jeanette'	'Levora'	\N	2012-08-05 01:54:30	2012-08-05 01:54:30
69	29878003385966	'Cynthia'	'Yenter'	\N	2012-08-05 01:54:31	2012-08-05 01:54:31
70	29878002216238	'Debbie'	'Rodgers'	\N	2012-08-05 01:54:31	2012-08-05 01:54:31
71	29878002877419	'Erica'	'Wilcox'	\N	2012-08-05 01:54:31	2012-08-05 01:54:31
72	29878003387954	'Cassandra'	'Steichen'	\N	2012-08-05 01:54:31	2012-08-05 01:54:31
73	0000383673	'Laurie'	'Wood'	\N	2012-08-05 01:54:31	2012-08-05 01:54:31
74	29878003208440	'Erin'	'Neils'	\N	2012-08-05 01:54:32	2012-08-05 01:54:32
75	29878003425028	'Michele'	'Richmond'	\N	2012-08-05 01:54:32	2012-08-05 01:54:32
76	29878002082697	'Leann'	'Nooyen'	\N	2012-08-05 01:54:32	2012-08-05 01:54:32
77	29878002877062	'Brian'	'Richmond'	\N	2012-08-05 01:54:32	2012-08-05 01:54:32
78	29878003425564	'Jonathan'	'Frisch'	\N	2012-08-05 01:54:33	2012-08-05 01:54:33
79	29878003284300	'Jaime'	'Reed'	\N	2012-08-05 01:54:33	2012-08-05 01:54:33
80	0000394320	'Jean'	'Skovera'	\N	2012-08-05 01:54:33	2012-08-05 01:54:33
81	29878003059025	'Makayla'	'Kozicki'	\N	2012-08-05 01:54:33	2012-08-05 01:54:33
82	0000420941	'Mary'	'Nowak'	\N	2012-08-05 01:54:33	2012-08-05 01:54:33
83	29878001647326	'Vita'	'Maltinski'	\N	2012-08-05 01:54:33	2012-08-05 01:54:33
84	29878002633614	'Herman'	'Kafura'	\N	2012-08-05 01:54:34	2012-08-05 01:54:34
85	29878003180045	'Pamela'	'Schauer'	\N	2012-08-07 22:10:06	2012-08-07 22:10:06
86	0000377707	'Virginia'	'Betts'	\N	2012-08-08 01:25:47	2012-08-08 01:25:47
87	29878002691935	'Liam'	'Albers'	\N	2012-08-15 16:43:29	2012-08-15 16:43:29
89	29878001082615	'Ginny'	'Zablocki'	\N	2012-08-17 20:19:15	2012-08-17 20:19:15
90	29878002825038	'Jessica'	'Portier'	\N	2012-08-17 20:37:23	2012-08-17 20:37:23
91	29878003431638	'Chad'	'Hintz'	\N	2012-08-17 21:23:22	2012-08-17 21:23:22
92	 29878002691935	'Liam'	'Albers'	\N	2012-08-20 21:23:01	2012-08-20 21:23:01
93	29878003328560	'Lynn'	'Hoffman'	'lynn_m_hoffman@yahoo.com'	2012-09-16 14:13:22.839592	2012-09-16 14:13:22.839592
94	29878001234567	'John'	'Smith'	\N	2012-09-25 11:32:56.689494	2012-09-25 11:32:56.689494
\.


COPY locations (id, code, name, address, created_at, updated_at) FROM stdin;
1	'CEN'	'Brown County Central Library'	'515 Pine St., Green Bay, WI 54301'	2012-08-04 17:44:58	2012-08-04 17:44:58
2	'ASH'	'Ashwaubenon Branch Library'	'1060 Orlando Dr., Green Bay, WI 54304'	2012-08-04 17:45:24	2012-08-04 17:45:24
3	'DK'	'Denmark Branch Library'	'450 N. Wall St., Denmark, WI 54208'	2012-08-04 17:45:43	2012-08-04 17:45:43
4	'EA'	'East Branch Library'	'2255 Main St., Green Bay, WI 54302'	2012-08-04 17:46:00	2012-08-04 17:46:00
5	'KR'	'Kress Family Branch Library'	'333 N. Broadway, De Pere, WI 54115'	2012-08-04 17:46:17	2012-08-04 17:46:17
6	'PUL'	'Pulaski Branch Library'	'222 W. Pulaski St., Pulaski, WI 54162'	2012-08-04 17:46:35	2012-08-04 17:46:35
7	'SW'	'Southwest Branch Library'	'974 Ninth St., Green Bay, WI 54304'	2012-08-04 17:46:55	2012-08-04 17:46:55
8	'WH'	'Weyers-Hilliard Branch Library'	'2680 Riverview Dr., Green Bay, WI 54313'	2012-08-04 17:47:14	2012-08-04 17:47:14
9	'WRI'	'Wrightstown Branch Library'	'615 Main St., Wrightstown, WI 54180'	2012-08-04 17:47:34	2012-08-04 17:47:34
10	'BKM'	'Brown County Library Bookmobile'	'515 Pine St., Green Bay, WI 54301'	2012-08-04 17:48:07	2012-08-04 17:48:07
\.


COPY requests (id, customer_id, oclcnum, title, author, pub, locationplaced, location_id, duedate, bclitem, created_at, updated_at, dateplaced, current_status) FROM stdin;
5	52	50119169	'American III [sound recording] : solitary man'	'Cash, Johnny.'	'New York, N.Y. : American :, Distributed by Universal Music & Video Distribution, 2000'	'DK'	3	2012-08-13	39878013800266	2012-08-05 02:23:29	2012-08-08 16:30:11	2012-07-16	4
6	52	71299733	'The lost crowes [sound recording]'	'Robinson, Chris.; Robinson, Rich.; Black Crowes (Musical group)'	'New York, NY : American Recordings, 2006'	'DK'	3	2012-08-13	39878013800325	2012-08-05 02:23:29	2012-08-08 16:30:29	2012-07-16	4
7	50	13620512	'1001 buttons : and other related items'	'Button Creations (Firm)'	'[Chalfont, Pa.] : [Chalfont, Pa.] : 1983'	'DK'	3	2012-08-15	39878013800341	2012-08-05 02:23:29	2012-08-08 16:30:45	2012-07-17	5
8	50	41677267	'Goofies, set and non-set; book 1-2.'	'Packard, E.'	'Tacoma, Wash., Tacoma, Wash., 1951 1953'	'DK'	3	2012-09-12	39878013800366	2012-08-05 02:23:30	2012-08-08 16:31:03	2012-07-18	5
9	52	471827478	'Night of the living dead : behind the scenes of the most terrifying zombie movie ever'	'Kane, Joe.'	'New York : New York : 2010'	'DK'	3	2012-08-27	39878013800234	2012-08-05 02:23:30	2012-08-08 16:31:18	2012-07-23	5
10	52	724658605	'Glenn Hughes : the autobiography : from Deep Purple to Black Country Communion'	'Hughes, Glenn.; McIver, Joel'	'London ;, [Milwaukee, Wis.] : London ;, [Milwaukee, Wis.] : 2011'	'DK'	3	2012-08-22	39878013800283	2012-08-05 02:23:30	2012-08-08 16:31:35	2012-07-23	3
11	52	290535379	'To live is to die : the life and death of Metallica''s Cliff Burton'	'McIver, Joel.; Hammett, Kirk.'	'London : Jawbone Press, 2009'	'DK'	3	2012-08-29	39878013800317	2012-08-05 02:23:30	2012-08-08 16:31:52	2012-07-23	4
12	51	41837417	'How to solve problems and prevent trouble'	'Wetherill, Richard W.'	'Royersford, PA : Humanetics Fellowship, 1991'	'DK'	3	\N	\N	2012-08-05 02:23:30	2012-08-08 16:32:09	2012-07-24	2
13	46	62764663	'All in the family. The complete fifth season'	'O''Connor, Carroll.'	'Culver City, Calif. : Sony Pictures Home Entertainment, 2006'	'DK'	3	2012-08-13	39878013800259	2012-08-05 02:23:30	2012-08-08 16:32:25	2012-07-25	4
14	46	443525116	'Extract'	'Rotenberg, Michael.'	'Burbank, Calif. : Miramax Films : 2009'	'DK'	3	2012-08-13	39878013800291	2012-08-05 02:23:30	2012-08-08 16:32:40	2012-07-25	4
15	46	767532782	'Woody Allen a documentary'	'Weide, Robert B.'	'[United States] : B Plus Productions : 2012'	'DK'	3	2012-08-13	39878013800390	2012-08-05 02:23:30	2012-08-08 16:32:57	2012-07-25	4
16	46	15688210	'Tango in the night'	'Fleetwood Mac (Musical group)'	'Burbank, Calif. : Warner Bros. Records, 1987'	'DK'	3	\N	39878013800176	2012-08-05 02:23:30	2012-08-09 13:18:42	2012-07-25	4
17	47	56481723	'Star Wars. Episode V, The empire strikes back'	'Kurtz, Gary.'	'[United States] : 20th Century Fox, 2004'	'DK'	3	2012-08-20	39878013800275	2012-08-05 02:23:31	2012-08-15 16:45:34	2012-07-27	4
18	44	460185548	'My enemy, my friend : a story of reconciliation from the Vietnam War'	'Cherry, Dan. Erickson, Fran.'	'Bowling Green, KY : Aviation Heritage Park, 2008'	'DK'	3	2012-08-29	39878013800358	2012-08-05 02:23:31	2012-08-15 16:52:46	2012-07-31	3
4	48	740628647	'Blackhorse riders : a desperate last stand, an extraordinary rescue mission, and the Vietnam battle America forgot'	'Keith, Philip A.'	'New York : New York : 2012'	'DK'	3	2012-08-24	39878013800374	2012-08-05 02:23:29	2012-08-08 16:16:19	2012-07-16	4
46	82	17674533	'Telling memories among southern women : domestic workers and their employers in the segregated South'	'Tucker, Susan.'	'Baton Rouge : Louisiana State University Press, 1988'	'DK'	3	2012-09-04	39878013800192	2012-08-05 02:23:35	2012-08-15 16:47:13	2012-08-02	4
51	85	\N	'A rite of passage : memoirs and letters home from WWII'	'McGuire, Cloyd.'		'DK'	3	\N	\N	2012-08-07 22:11:16	2012-08-08 16:45:02	2012-08-01	2
52	85	\N	'To fly and flight : memoirs of a triple ace'	'Anderson, Clarence E.'		'DK'	3	\N	\N	2012-08-07 22:12:43	2012-08-08 16:45:19	2012-08-01	2
57	46	760322590	'The Rock the epic journet of Dwayne "The Rock" Johnson'	'Johnson, Dwayne.'	'[United States] : World Wrestling Entertainment : 2012'	'DK'	3	2012-08-31	39878013800184	2012-08-08 19:55:05	2012-08-15 16:50:51	2012-08-07	4
58	46	79834401	'All in the Family. The Complete Sixth Season [videorecording]'	'Lear, Norman.; Derman, Lou.'		'DK'	3	2012-08-22	39878013800168	2012-08-16 19:32:38	2012-08-22 19:52:32	2012-08-16	4
59	46	53715861	'Child''s Play 3 [videorecording]'	'Mancini, Don.; Bender, Jack.;'	\N	'DK'	3	2012-09-07	39878013800218	2012-08-16 19:33:54	2012-08-27 18:25:55	2012-08-16	4
76	87	37675736	'The Viking News'	'Wright, Rachel'	\N	'DK'	3	2012-09-12	39878013800200	2012-08-20 21:21:39	2012-08-20 21:22:50	2012-08-08	4
78	52	34894504	'The Beatles'	'Davies, Hunter.'	\N	'DK'	3	2012-09-25	39878013800242	2012-08-30 20:34:21	2012-08-30 20:34:47	2012-08-26	3
79	52	679936930	'The resurrection of Johnny Cash'	'Thomson, Graeme'	\N	'DK'	3	2012-04-10	39878013800382	2012-08-31 19:32:03	2012-08-31 19:32:03	\N	3
\.


COPY schema_migrations (version) FROM stdin;
20120804014128
20120804171652
20120804171837
20120804172555
20120804173036
20120804190000
20120805193000
20120807202000
20120808124251
20120813004633
20120813012852
20120813013435
20120814161744
20120815163023
20120819193540
20120915175710
\.


COPY statuses (id, name, description, created_at, updated_at) FROM stdin;
1	'pending'	'Awaiting review by selector'	2012-08-04 17:48:48	2012-08-04 17:48:48
2	'submitted'	'Submitted to NFLS'	2012-08-04 17:49:08	2012-08-04 17:49:08
3	'received'	'Received by BCL'	2012-08-04 17:49:27	2012-08-04 17:50:02
4	'returned'	'Returned to NFLS'	2012-08-04 17:49:43	2012-08-04 17:49:43
5	'closed'	'Completed and closed'	2012-08-04 17:50:21	2012-08-04 17:50:21
6	'cancelled'	'Cancelled by customer or NFLS'	2012-08-04 17:50:43	2012-08-04 17:50:43
7	'ordered'	'Item ordered for BCL'	2012-08-04 17:51:00	2012-08-04 17:51:00
\.


COPY users (id, name, email, created_at, updated_at, password_digest, remember_token, locationcode, admin) FROM stdin;
2	'Brown County Central Library'	'bc_library_fiction@co.brown.wi.us'	2012-09-14 16:55:18.219309	2012-09-14 16:55:18.219309	'$2a$10$piqInbhFBD6jdDc73i86uulNhaGHeVHOw3ccGVkOK0bYouub3CihC'	'2gFSTjv24_08_4EVuNzykQ'	'CEN'	FALSE
3	'Ashwaubenon Branch Library'	'BC_Library_Ashwaubenon@co.brown.wi.us'	2012-09-14 16:55:36.829784	2012-09-14 16:55:36.829784	'$2a$10$fH58XmLAxfA1Zwnn.opqQ.DnLeCN1a59vtgoaoB/IYEjxSVhBmA2i'	'8j-XDvClylTv_l6y3911ag'	'ASH'	FALSE
4	'Denmark Branch Library'	'BC_Library_Denmark@co.brown.wi.us'	2012-09-14 16:55:57.760241	2012-09-14 16:55:57.760241	'$2a$10$xlNSP/5FAAB4u09YdtxRFeILxRvPg7QEhOBam8R1fUwL7wo7wV.ha'	'ritruGUN7W7MsEWDKb4Krg'	'DK'	FALSE
5	'East Branch Library'	'BC_Library_East@co.brown.wi.us'	2012-09-14 16:56:27.752624	2012-09-14 16:56:27.752624	'$2a$10$N1dFAPDcjEH/S2BOQNQXaeae/8eE3VeidrHC.PNnHkokgc5JmYkU6'	'y-yRs1X15y3BxKhocP-7iA'	'EA'	FALSE
6	'Kress Family Library'	'BC_Library_Depere@co.brown.wi.us'	2012-09-14 16:56:59.600574	2012-09-14 16:56:59.600574	'$2a$10$eqFaX44r0XEJdiGFgJpueeoo11Jk8Z4fp7RE3zxE0DqEwzQOiKSTC'	'y4nXBKTpF5By0mtWG7Vt8g'	'KR'	FALSE
7	'Pulaski Branch Library'	'BC_Library_Pulaski@co.brown.wi.us'	2012-09-14 16:57:23.135868	2012-09-14 16:57:23.135868	'$2a$10$bwsDbklhnDwKRX69yfLsGuolVvIK0S3o3tjpP681zm3/koH3hH6/m'	'iIi1HoQ4l7fUXwjo7jCZQw'	'PUL'	FALSE
8	'Southwest Branch Library'	'BC_Library_Southwest@co.brown.wi.us'	2012-09-14 16:57:37.062283	2012-09-14 16:57:37.062283	'$2a$10$P1g7ZsIrP2GCwfrArEro1eR6NfemUFSlm5L9lCeHBg4rJNzH4Ltri'	'H7FVQkQJI8-lDGmVLwuhTQ'	'SW'	FALSE
9	'Weyers-Hilliard Branch Library'	'BC_Library_Howard@co.brown.wi.us'	2012-09-14 16:57:49.388356	2012-09-14 16:57:49.388356	'$2a$10$5bdA0LQbvL8ExY5sNWJ4Z.FyaMJy4zErXAgqeru.iMeh.PFpQX05y'	'0CMtpa48vUsGHBTER4lEkA'	'WH'	FALSE
10	'Wrightstown Branch Library'	'BC_Library_Wrightstown@co.brown.wi.us'	2012-09-14 16:58:03.208882	2012-09-14 16:58:03.208882	'$2a$10$WXURwtHZWiJPxZ4D26YcHe1od4Gm1gdCcWjpvy0TIABoTcGmzs6Iy'	'cInONPm5ZZse__3rlfsEVg'	'WRI'	FALSE
11	'Brown County Library Bookmobile'	'BC_Library@co.brown.wi.us'	2012-09-14 16:58:30.117067	2012-09-14 16:58:30.117067	'$2a$10$zDTkSTRKGS7a5iaWGBIBxOolM.hIFaqWLeqYEy86Zxdk6lsiML382'	'FkFyROIS98v0bUoUrfRtIg'	'BKM'	FALSE
1	'Lynn Hoffman'	'hoffman_lm@co.brown.wi.us'	2012-09-14 15:47:58.914517	2012-09-14 15:47:58.914517	'$2a$10$4gzbWpDNXgZRoTwzZrSFf.svpGD6d3l.kONBUVgZa4xjo04tyYCBm'	'vURSRNuAwb6Dna5C5BszCw'	'LYNN'	TRUE
\.


ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);

ALTER TABLE ONLY requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);

ALTER TABLE ONLY statuses
    ADD CONSTRAINT statuses_pkey PRIMARY KEY (id);

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


CREATE INDEX index_activities_on_request_id_and_created_at ON activities USING btree (request_id, created_at);

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);

CREATE INDEX index_users_on_remember_token ON users USING btree (remember_token);

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);



