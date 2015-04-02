--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- Name: activities; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE activities (
    id integer NOT NULL,
    name character varying,
    feedback_id integer
);


ALTER TABLE activities OWNER TO "Guest";

--
-- Name: activities_adventures; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE activities_adventures (
    id integer NOT NULL,
    activity_id integer,
    adventure_id integer,
    required boolean
);


ALTER TABLE activities_adventures OWNER TO "Guest";

--
-- Name: activities_adventures_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE activities_adventures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activities_adventures_id_seq OWNER TO "Guest";

--
-- Name: activities_adventures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE activities_adventures_id_seq OWNED BY activities_adventures.id;


--
-- Name: activities_countries; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE activities_countries (
    id integer NOT NULL,
    activity_id integer,
    country_id integer
);


ALTER TABLE activities_countries OWNER TO "Guest";

--
-- Name: activities_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE activities_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activities_countries_id_seq OWNER TO "Guest";

--
-- Name: activities_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE activities_countries_id_seq OWNED BY activities_countries.id;


--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE activities_id_seq OWNER TO "Guest";

--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: adventures; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE adventures (
    id integer NOT NULL,
    name character varying,
    description character varying,
    feedback_id integer,
    cost integer
);


ALTER TABLE adventures OWNER TO "Guest";

--
-- Name: adventures_countries; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE adventures_countries (
    id integer NOT NULL,
    adventure_id integer,
    country_id integer
);


ALTER TABLE adventures_countries OWNER TO "Guest";

--
-- Name: adventures_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE adventures_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adventures_countries_id_seq OWNER TO "Guest";

--
-- Name: adventures_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE adventures_countries_id_seq OWNED BY adventures_countries.id;


--
-- Name: adventures_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE adventures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adventures_id_seq OWNER TO "Guest";

--
-- Name: adventures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE adventures_id_seq OWNED BY adventures.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE countries (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE countries OWNER TO "Guest";

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_id_seq OWNER TO "Guest";

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE customers (
    id integer NOT NULL,
    name character varying,
    password character varying
);


ALTER TABLE customers OWNER TO "Guest";

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE customers_id_seq OWNER TO "Guest";

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE customers_id_seq OWNED BY customers.id;


--
-- Name: feedback; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE feedback (
    id integer NOT NULL,
    text character varying,
    user_id integer,
    activity_feedback boolean,
    adventure_feedback boolean
);


ALTER TABLE feedback OWNER TO "Guest";

--
-- Name: feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE feedback_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE feedback_id_seq OWNER TO "Guest";

--
-- Name: feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE feedback_id_seq OWNED BY feedback.id;


--
-- Name: levels; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE levels (
    id integer NOT NULL,
    adventure_id integer,
    activity_lvl integer,
    activity_id integer,
    activity_name character varying
);


ALTER TABLE levels OWNER TO "Guest";

--
-- Name: levels_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE levels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE levels_id_seq OWNER TO "Guest";

--
-- Name: levels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE levels_id_seq OWNED BY levels.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    latitude numeric,
    longitude numeric,
    cost integer,
    activity_id integer,
    adventure_id integer
);


ALTER TABLE locations OWNER TO "Guest";

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE locations_id_seq OWNER TO "Guest";

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: preferences; Type: TABLE; Schema: public; Owner: Guest; Tablespace: 
--

CREATE TABLE preferences (
    id integer NOT NULL,
    customer_id integer,
    activity_pref integer,
    activity_id integer,
    activity_name character varying
);


ALTER TABLE preferences OWNER TO "Guest";

--
-- Name: preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE preferences_id_seq OWNER TO "Guest";

--
-- Name: preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE preferences_id_seq OWNED BY preferences.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY activities_adventures ALTER COLUMN id SET DEFAULT nextval('activities_adventures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY activities_countries ALTER COLUMN id SET DEFAULT nextval('activities_countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY adventures ALTER COLUMN id SET DEFAULT nextval('adventures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY adventures_countries ALTER COLUMN id SET DEFAULT nextval('adventures_countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY customers ALTER COLUMN id SET DEFAULT nextval('customers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY feedback ALTER COLUMN id SET DEFAULT nextval('feedback_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY levels ALTER COLUMN id SET DEFAULT nextval('levels_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY preferences ALTER COLUMN id SET DEFAULT nextval('preferences_id_seq'::regclass);


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY activities (id, name, feedback_id) FROM stdin;
1755	Culture	\N
1756	Swim	\N
1757	Run	\N
1758	Sightsee	\N
1759	Sail	\N
1760	Kayak	\N
1761	Hike	\N
1762	Camp	\N
1763	Ski	\N
1764	Bike	\N
1765	Eat	\N
\.


--
-- Data for Name: activities_adventures; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY activities_adventures (id, activity_id, adventure_id, required) FROM stdin;
1	330	115	\N
2	332	116	\N
3	333	116	\N
4	335	117	\N
5	339	119	\N
7	351	125	\N
8	353	126	\N
9	354	126	\N
10	356	127	\N
11	360	129	\N
13	372	135	\N
14	374	136	\N
15	375	136	\N
16	377	137	\N
17	381	139	\N
19	393	145	\N
20	395	146	\N
21	396	146	\N
22	398	147	\N
23	402	149	\N
25	414	155	\N
26	416	156	\N
27	417	156	\N
28	419	157	\N
29	423	159	\N
31	435	165	\N
32	437	166	\N
33	438	166	\N
34	440	167	\N
35	444	169	\N
37	456	175	\N
38	458	176	\N
39	459	176	\N
40	461	177	\N
41	462	177	\N
42	465	179	\N
44	477	185	\N
45	479	186	\N
46	480	186	\N
47	482	187	\N
48	483	187	\N
49	486	189	\N
51	498	195	\N
52	500	196	\N
53	501	196	\N
54	503	197	\N
55	504	197	\N
56	507	199	\N
58	519	205	\N
59	521	207	\N
60	521	206	\N
61	523	208	\N
62	524	208	\N
63	527	210	\N
65	539	216	\N
66	541	218	\N
67	541	217	\N
68	543	219	\N
69	544	219	\N
70	547	221	\N
72	559	227	\N
73	561	229	\N
74	561	228	\N
75	563	230	\N
76	564	230	\N
77	567	232	\N
79	579	238	\N
80	581	240	\N
81	581	239	\N
82	583	241	\N
83	584	241	\N
84	587	243	\N
86	599	249	\N
87	601	251	\N
88	601	250	\N
89	603	252	\N
90	604	252	\N
91	607	254	\N
93	609	265	\N
94	610	266	\N
95	611	266	\N
97	613	269	\N
98	624	271	\N
99	626	273	\N
100	626	272	\N
101	628	274	\N
102	629	274	\N
103	632	276	\N
105	634	287	\N
106	635	288	\N
107	636	288	\N
109	638	291	\N
110	660	293	\N
111	662	295	\N
112	662	294	\N
113	664	296	\N
114	665	296	\N
115	668	298	\N
117	670	309	\N
118	671	310	\N
119	672	310	\N
121	674	313	\N
122	685	315	\N
123	687	317	\N
124	687	316	\N
125	689	318	\N
126	690	318	\N
127	693	320	\N
129	695	331	\N
130	696	332	\N
131	697	332	\N
133	699	335	\N
134	710	337	\N
135	712	339	\N
136	712	338	\N
137	714	340	\N
138	715	340	\N
139	718	342	\N
141	720	353	\N
142	721	354	\N
143	722	354	\N
145	724	357	\N
146	735	359	\N
147	737	361	\N
148	737	360	\N
149	739	362	\N
150	740	362	\N
151	743	364	\N
153	745	375	\N
154	746	376	\N
155	747	376	\N
157	749	379	\N
158	760	381	\N
159	762	383	\N
160	762	382	\N
161	764	384	\N
162	765	384	\N
163	768	386	\N
165	770	397	\N
166	771	398	\N
167	772	398	\N
169	774	401	\N
170	785	403	\N
171	787	405	\N
172	787	404	\N
173	789	406	\N
174	790	406	\N
175	793	408	\N
177	795	419	\N
178	796	420	\N
179	797	420	\N
181	799	423	\N
182	804	426	\N
183	805	426	\N
184	806	426	\N
185	817	427	\N
186	819	429	\N
187	819	428	\N
188	821	430	\N
189	822	430	\N
190	825	432	\N
192	827	443	\N
193	828	444	\N
194	829	444	\N
196	831	447	\N
197	842	449	\N
198	844	451	\N
199	844	450	\N
200	846	452	\N
201	847	452	\N
202	850	454	\N
204	852	465	\N
205	853	466	\N
206	854	466	\N
208	856	469	\N
209	867	471	\N
210	869	473	\N
211	869	472	\N
212	871	474	\N
213	872	474	\N
214	875	476	\N
216	877	487	\N
217	878	488	\N
218	879	488	\N
220	881	491	\N
221	892	493	\N
222	894	495	\N
223	894	494	\N
224	896	496	\N
225	897	496	\N
226	900	498	\N
228	902	509	\N
229	903	510	\N
230	904	510	\N
232	906	513	\N
233	917	515	\N
234	919	517	\N
235	919	516	\N
236	921	518	\N
237	922	518	\N
238	925	520	\N
240	927	531	\N
241	928	532	\N
242	929	532	\N
244	931	535	\N
245	942	538	\N
246	944	540	\N
247	944	539	\N
248	946	541	\N
249	947	541	\N
250	950	543	\N
252	952	554	\N
253	953	555	\N
254	954	555	\N
256	956	558	\N
257	967	561	\N
258	969	563	\N
259	969	562	\N
260	971	564	\N
261	972	564	\N
262	975	566	\N
264	977	577	\N
265	978	578	\N
266	979	578	\N
268	981	581	\N
269	992	584	\N
270	994	586	\N
271	994	585	\N
272	996	587	\N
273	997	587	\N
274	1000	589	\N
276	1002	600	\N
277	1003	601	\N
278	1004	601	\N
280	1006	604	\N
281	1017	607	\N
282	1019	609	\N
283	1019	608	\N
284	1021	610	\N
285	1022	610	\N
286	1025	612	\N
288	1027	623	\N
289	1028	624	\N
290	1029	624	\N
292	1031	627	\N
293	1042	630	\N
294	1044	632	\N
295	1044	631	\N
296	1046	633	\N
297	1047	633	\N
298	1050	635	\N
300	1052	647	\N
301	1053	648	\N
302	1054	648	\N
304	1056	651	\N
305	1067	654	\N
306	1069	656	\N
307	1069	655	\N
308	1071	657	\N
309	1072	657	\N
310	1075	659	\N
312	1077	671	\N
313	1078	672	\N
314	1079	672	\N
316	1081	675	\N
317	1092	678	\N
318	1094	680	\N
319	1094	679	\N
320	1096	681	\N
321	1097	681	\N
322	1100	683	\N
324	1102	695	\N
325	1103	696	\N
326	1104	696	\N
328	1106	699	\N
329	1117	702	\N
330	1119	704	\N
331	1119	703	\N
332	1121	705	\N
333	1122	705	\N
334	1125	707	\N
336	1127	719	\N
337	1128	720	\N
338	1129	720	\N
340	1131	723	\N
341	1142	726	\N
342	1144	728	\N
343	1144	727	\N
344	1146	729	\N
345	1147	729	\N
346	1150	731	\N
348	1152	743	\N
349	1153	744	\N
350	1154	744	\N
352	1156	747	\N
353	1167	750	\N
354	1169	752	\N
355	1169	751	\N
356	1171	753	\N
357	1172	753	\N
358	1175	755	\N
360	1177	767	\N
361	1178	768	\N
362	1179	768	\N
364	1181	771	\N
365	1192	774	\N
366	1194	776	\N
367	1194	775	\N
368	1196	777	\N
369	1197	777	\N
370	1200	779	\N
372	1202	791	\N
373	1203	792	\N
374	1204	792	\N
376	1206	795	\N
377	1217	798	\N
378	1219	800	\N
379	1219	799	\N
380	1221	801	\N
381	1222	801	\N
382	1225	803	\N
384	1227	815	\N
385	1228	816	\N
386	1229	816	\N
388	1231	819	\N
389	1242	822	\N
390	1244	824	\N
391	1244	823	\N
392	1246	825	\N
393	1247	825	\N
394	1250	827	\N
396	1252	839	\N
397	1253	840	\N
398	1254	840	\N
400	1256	843	\N
401	1267	846	\N
402	1269	848	\N
403	1269	847	\N
404	1271	849	\N
405	1272	849	\N
406	1275	851	\N
408	1277	863	\N
409	1278	864	\N
410	1279	864	\N
412	1281	867	\N
413	1293	870	\N
414	1295	872	\N
415	1295	871	\N
416	1297	873	\N
417	1298	873	\N
418	1301	875	\N
420	1303	887	\N
421	1304	888	\N
422	1305	888	\N
424	1307	891	\N
425	1319	894	\N
426	1321	896	\N
427	1321	895	\N
428	1323	897	\N
429	1324	897	\N
430	1327	899	\N
432	1329	911	\N
433	1330	912	\N
434	1331	912	\N
436	1333	915	\N
437	1345	918	\N
438	1347	920	\N
439	1347	919	\N
440	1349	921	\N
441	1350	921	\N
442	1353	923	\N
444	1355	935	\N
445	1356	936	\N
446	1357	936	\N
448	1359	939	\N
449	1371	942	\N
450	1373	944	\N
451	1373	943	\N
452	1375	945	\N
453	1376	945	\N
454	1379	947	\N
456	1381	959	\N
457	1382	960	\N
458	1383	960	\N
460	1385	963	\N
461	1397	966	\N
462	1399	968	\N
463	1399	967	\N
464	1401	969	\N
465	1402	969	\N
466	1405	971	\N
468	1407	983	\N
469	1408	984	\N
470	1409	984	\N
472	1411	987	\N
473	1423	990	\N
474	1425	992	\N
475	1425	991	\N
476	1427	993	\N
477	1428	993	\N
478	1431	995	\N
480	1433	1007	\N
481	1434	1008	\N
482	1435	1008	\N
484	1437	1011	\N
485	1449	1014	\N
486	1451	1016	\N
487	1451	1015	\N
488	1453	1017	\N
489	1454	1017	\N
490	1457	1019	\N
492	1459	1031	\N
493	1460	1032	\N
494	1461	1032	\N
496	1463	1035	\N
497	1475	1038	\N
498	1477	1040	\N
499	1477	1039	\N
500	1479	1041	\N
501	1480	1041	\N
502	1483	1043	\N
504	1485	1055	\N
505	1486	1056	\N
506	1487	1056	\N
508	1489	1059	\N
511	1491	1062	\N
512	1492	1062	\N
513	1494	1063	\N
514	1493	1063	\N
515	1505	1064	\N
516	1507	1066	\N
517	1507	1065	\N
518	1509	1067	\N
519	1510	1067	\N
520	1513	1069	\N
522	1515	1081	\N
523	1516	1082	\N
524	1517	1082	\N
526	1519	1085	\N
527	1531	1088	\N
528	1533	1090	\N
529	1533	1089	\N
530	1535	1091	\N
531	1536	1091	\N
532	1539	1093	\N
534	1541	1105	\N
535	1542	1106	\N
536	1543	1106	\N
538	1545	1109	\N
539	1557	1112	\N
540	1559	1114	\N
541	1559	1113	\N
542	1561	1115	\N
543	1562	1115	\N
544	1565	1117	\N
546	1567	1129	\N
547	1568	1130	\N
548	1569	1130	\N
550	1571	1133	\N
551	1583	1136	\N
552	1585	1138	\N
553	1585	1137	\N
554	1587	1139	\N
555	1588	1139	\N
556	1591	1141	\N
558	1593	1153	\N
559	1594	1154	\N
560	1595	1154	\N
562	1597	1157	\N
563	1609	1160	\N
564	1611	1162	\N
565	1611	1161	\N
566	1613	1163	\N
567	1614	1163	\N
568	1617	1165	\N
570	1619	1177	\N
571	1620	1178	\N
572	1621	1178	\N
574	1623	1181	\N
575	1635	1184	\N
576	1637	1186	\N
577	1637	1185	\N
578	1639	1187	\N
579	1640	1187	\N
580	1643	1189	\N
582	1645	1201	\N
583	1646	1202	\N
584	1647	1202	\N
586	1649	1205	\N
587	1661	1208	\N
588	1663	1210	\N
589	1663	1209	\N
590	1665	1211	\N
591	1666	1211	\N
592	1669	1213	\N
594	1671	1225	\N
595	1672	1226	\N
596	1673	1226	\N
598	1675	1229	\N
599	1687	1232	\N
600	1689	1234	\N
601	1689	1233	\N
602	1691	1235	\N
603	1692	1235	\N
604	1695	1237	\N
606	1697	1249	\N
607	1698	1250	\N
608	1699	1250	\N
610	1701	1253	\N
611	1713	1256	\N
612	1715	1258	\N
613	1715	1257	\N
614	1717	1259	\N
615	1718	1259	\N
616	1721	1261	\N
618	1723	1273	\N
619	1724	1274	\N
620	1725	1274	\N
622	1727	1277	\N
623	1739	1280	\N
624	1741	1282	\N
625	1741	1281	\N
626	1743	1283	\N
627	1744	1283	\N
628	1747	1285	\N
630	1749	1297	\N
631	1750	1298	\N
632	1751	1298	\N
634	1753	1301	\N
635	1761	1305	\N
636	1758	1305	\N
637	1755	1305	\N
638	1759	1306	\N
639	1764	1306	\N
640	1760	1306	\N
641	1758	1306	\N
642	1765	1307	\N
643	1761	1307	\N
644	1762	1307	\N
645	1758	1307	\N
646	1758	1308	\N
647	1761	1308	\N
648	1763	1308	\N
649	1755	1309	\N
650	1757	1309	\N
651	1755	1310	\N
652	1756	1310	\N
653	1759	1310	\N
654	1758	1310	\N
655	1765	1310	\N
\.


--
-- Name: activities_adventures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('activities_adventures_id_seq', 655, true);


--
-- Data for Name: activities_countries; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY activities_countries (id, activity_id, country_id) FROM stdin;
1	310	41
2	313	43
3	313	42
4	316	44
5	319	46
7	331	47
8	334	49
9	334	48
10	337	50
11	340	52
13	352	53
14	355	55
15	355	54
16	358	56
17	361	58
19	373	59
20	376	61
21	376	60
22	379	62
23	382	64
25	394	65
26	397	67
27	397	66
28	400	68
29	403	70
31	415	71
32	418	73
33	418	72
34	421	74
35	424	76
37	436	77
38	439	79
39	439	78
40	442	80
41	443	80
42	445	82
44	457	83
45	460	85
46	460	84
47	463	86
48	464	86
49	466	88
51	478	89
52	481	91
53	481	90
54	484	92
55	485	92
56	487	94
58	499	95
59	502	97
60	502	96
61	505	98
62	506	98
63	508	100
65	520	101
66	522	103
67	522	102
68	525	104
69	526	104
70	528	106
72	540	107
73	542	109
74	542	108
75	545	110
76	546	110
77	548	112
79	560	113
80	562	115
81	562	114
82	565	116
83	566	116
84	568	118
86	580	119
87	582	121
88	582	120
89	585	122
90	586	122
91	588	124
93	600	125
94	602	127
95	602	126
96	605	128
97	606	128
98	608	130
100	625	136
101	627	138
102	627	137
103	630	139
104	631	139
105	633	141
107	661	155
108	663	157
109	663	156
110	666	158
111	667	158
112	669	160
114	686	166
115	688	168
116	688	167
117	691	169
118	692	169
119	694	171
121	711	177
122	713	179
123	713	178
124	716	180
125	717	180
126	719	182
128	736	188
129	738	190
130	738	189
131	741	191
132	742	191
133	744	193
135	761	199
136	763	201
137	763	200
138	766	202
139	767	202
140	769	204
142	786	210
143	788	212
144	788	211
145	791	213
146	792	213
147	794	215
149	818	224
150	820	226
151	820	225
152	823	227
153	824	227
154	826	229
156	843	245
157	845	247
158	845	246
159	848	248
160	849	248
161	851	250
163	868	266
164	870	268
165	870	267
166	873	269
167	874	269
168	876	271
170	893	287
171	895	289
172	895	288
173	898	290
174	899	290
175	901	292
177	918	308
178	920	310
179	920	309
180	923	311
181	924	311
182	926	313
184	943	329
185	945	331
186	945	330
187	948	332
188	949	332
189	951	334
191	968	350
192	970	352
193	970	351
194	973	353
195	974	353
196	976	355
198	993	371
199	995	373
200	995	372
201	998	374
202	999	374
203	1001	376
205	1018	392
206	1020	394
207	1020	393
208	1023	395
209	1024	395
210	1026	397
212	1043	413
213	1045	415
214	1045	414
215	1048	416
216	1049	416
217	1051	418
219	1068	434
220	1070	436
221	1070	435
222	1073	437
223	1074	437
224	1076	439
226	1093	455
227	1095	457
228	1095	456
229	1098	458
230	1099	458
231	1101	460
233	1118	476
234	1120	478
235	1120	477
236	1123	479
237	1124	479
238	1126	481
240	1143	497
241	1145	499
242	1145	498
243	1148	500
244	1149	500
245	1151	502
247	1168	518
248	1170	520
249	1170	519
250	1173	521
251	1174	521
252	1176	523
254	1193	539
255	1195	541
256	1195	540
257	1198	542
258	1199	542
259	1201	544
261	1218	560
262	1220	562
263	1220	561
264	1223	563
265	1224	563
266	1226	565
268	1243	571
269	1245	573
270	1245	572
271	1248	574
272	1249	574
273	1251	576
275	1268	592
276	1270	594
277	1270	593
278	1273	595
279	1274	595
280	1276	597
282	1294	613
283	1296	615
284	1296	614
285	1299	616
286	1300	616
287	1302	618
289	1320	634
290	1322	636
291	1322	635
292	1325	637
293	1326	637
294	1328	639
296	1346	655
297	1348	657
298	1348	656
299	1351	658
300	1352	658
301	1354	660
303	1372	676
304	1374	678
305	1374	677
306	1377	679
307	1378	679
308	1380	681
310	1398	697
311	1400	699
312	1400	698
313	1403	700
314	1404	700
315	1406	702
317	1424	718
318	1426	720
319	1426	719
320	1429	721
321	1430	721
322	1432	723
324	1450	739
325	1452	741
326	1452	740
327	1455	742
328	1456	742
329	1458	744
331	1476	760
332	1478	762
333	1478	761
334	1481	763
335	1482	763
336	1484	765
338	1506	781
339	1508	783
340	1508	782
341	1511	784
342	1512	784
343	1514	786
345	1532	802
346	1534	804
347	1534	803
348	1537	805
349	1538	805
350	1540	807
352	1558	823
353	1560	825
354	1560	824
355	1563	826
356	1564	826
357	1566	828
359	1584	844
360	1586	846
361	1586	845
362	1589	847
363	1590	847
364	1592	849
366	1610	865
367	1612	867
368	1612	866
369	1615	868
370	1616	868
371	1618	870
373	1636	886
374	1638	888
375	1638	887
376	1641	889
377	1642	889
378	1644	891
380	1662	907
381	1664	909
382	1664	908
383	1667	910
384	1668	910
385	1670	912
387	1688	928
388	1690	930
389	1690	929
390	1693	931
391	1694	931
392	1696	933
394	1714	949
395	1716	951
396	1716	950
397	1719	952
398	1720	952
399	1722	954
401	1740	970
402	1742	972
403	1742	971
404	1745	973
405	1746	973
406	1748	975
\.


--
-- Name: activities_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('activities_countries_id_seq', 407, true);


--
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('activities_id_seq', 1765, true);


--
-- Data for Name: adventures; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY adventures (id, name, description, feedback_id, cost) FROM stdin;
1306	SanJuan Islands Kayak Tour	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.	1	400
1307	Denali Climb and Camp	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.	1	4500
1308	Swiss French Alps Ski Trip	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.	1	5430
1309	Western Australia 200mi Road Race	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.	1	1
1310	Same old Thailand Trip	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.	1	2040
1305	Camino de Santiago	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.	1	3100
\.


--
-- Data for Name: adventures_countries; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY adventures_countries (id, adventure_id, country_id) FROM stdin;
1	267	131
2	268	132
3	268	133
5	270	135
6	289	142
7	290	143
8	290	144
10	292	146
11	311	161
12	312	162
13	312	163
15	314	165
16	333	172
17	334	173
18	334	174
20	336	176
21	355	183
22	356	184
23	356	185
25	358	187
26	377	194
27	378	195
28	378	196
30	380	198
31	399	205
32	400	206
33	400	207
35	402	209
36	421	216
37	422	217
38	422	218
40	424	220
41	445	230
42	446	231
43	446	232
45	448	234
46	467	251
47	468	252
48	468	253
50	470	255
51	489	272
52	490	273
53	490	274
55	492	276
56	511	293
57	512	294
58	512	295
60	514	297
61	533	314
62	534	315
63	534	316
65	536	318
66	556	335
67	557	336
68	557	337
70	559	339
71	579	356
72	580	357
73	580	358
75	582	360
76	602	377
77	603	378
78	603	379
80	605	381
81	625	398
82	626	399
83	626	400
85	628	402
86	649	419
87	650	420
88	650	421
90	652	423
91	673	440
92	674	441
93	674	442
95	676	444
96	697	461
97	698	462
98	698	463
100	700	465
101	721	482
102	722	483
103	722	484
105	724	486
106	745	503
107	746	504
108	746	505
110	748	507
111	769	524
112	770	525
113	770	526
115	772	528
116	793	545
117	794	546
118	794	547
120	796	549
121	817	566
122	818	567
123	818	568
125	820	570
126	841	577
127	842	578
128	842	579
130	844	581
131	865	598
132	866	599
133	866	600
135	868	602
136	889	619
137	890	620
138	890	621
140	892	623
141	913	640
142	914	641
143	914	642
145	916	644
146	937	661
147	938	662
148	938	663
150	940	665
151	961	682
152	962	683
153	962	684
155	964	686
156	985	703
157	986	704
158	986	705
160	988	707
161	1009	724
162	1010	725
163	1010	726
165	1012	728
166	1033	745
167	1034	746
168	1034	747
170	1036	749
171	1057	766
172	1058	767
173	1058	768
175	1060	770
176	1083	787
177	1084	788
178	1084	789
180	1086	791
181	1107	808
182	1108	809
183	1108	810
185	1110	812
186	1131	829
187	1132	830
188	1132	831
190	1134	833
191	1155	850
192	1156	851
193	1156	852
195	1158	854
196	1179	871
197	1180	872
198	1180	873
200	1182	875
201	1203	892
202	1204	893
203	1204	894
205	1206	896
206	1227	913
207	1228	914
208	1228	915
210	1230	917
211	1251	934
212	1252	935
213	1252	936
215	1254	938
216	1275	955
217	1276	956
218	1276	957
220	1278	959
221	1299	976
222	1300	977
223	1300	978
225	1302	980
\.


--
-- Name: adventures_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('adventures_countries_id_seq', 225, true);


--
-- Name: adventures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('adventures_id_seq', 1310, true);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY countries (id, name) FROM stdin;
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('countries_id_seq', 990, true);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY customers (id, name, password) FROM stdin;
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('customers_id_seq', 296, true);


--
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY feedback (id, text, user_id, activity_feedback, adventure_feedback) FROM stdin;
\.


--
-- Name: feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('feedback_id_seq', 1, false);


--
-- Data for Name: levels; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY levels (id, adventure_id, activity_lvl, activity_id, activity_name) FROM stdin;
1	1305	8	1761	Hike
2	1305	6	1758	Sightsee
3	1305	7	1755	Culture
4	1306	3	1759	Sail
5	1306	3	1764	Bike
6	1306	8	1760	Kayak
7	1306	6	1758	Sightsee
8	1307	2	1765	Eat
9	1307	9	1761	Hike
10	1307	8	1762	Camp
11	1307	6	1758	Sightsee
12	1308	7	1758	Sightsee
13	1308	2	1761	Hike
14	1308	8	1763	Ski
15	1309	5	1755	Culture
16	1309	10	1757	Run
17	1310	7	1755	Culture
18	1310	4	1756	Swim
19	1310	5	1759	Sail
20	1310	5	1758	Sightsee
21	1310	5	1765	Eat
\.


--
-- Name: levels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('levels_id_seq', 21, true);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY locations (id, latitude, longitude, cost, activity_id, adventure_id) FROM stdin;
381	43.1650	-1.2356	\N	1761	1305
382	43.0092	-1.3200	\N	1758	1305
383	42.8167	-1.6500	\N	1755	1305
384	42.4330	-2.9500	\N	1761	1305
385	42.2878	-4.1389	\N	1761	1305
386	42.5167	-5.7667	\N	1758	1305
387	42.5500	-6.5833	\N	1755	1305
388	-7.6158	42.8072	\N	1755	1305
389	42.8778	-8.5444	\N	1755	1305
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('locations_id_seq', 389, true);


--
-- Data for Name: preferences; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY preferences (id, customer_id, activity_pref, activity_id, activity_name) FROM stdin;
\.


--
-- Name: preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('preferences_id_seq', 1, false);


--
-- Name: activities_adventures_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY activities_adventures
    ADD CONSTRAINT activities_adventures_pkey PRIMARY KEY (id);


--
-- Name: activities_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY activities_countries
    ADD CONSTRAINT activities_countries_pkey PRIMARY KEY (id);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: adventures_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY adventures_countries
    ADD CONSTRAINT adventures_countries_pkey PRIMARY KEY (id);


--
-- Name: adventures_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY adventures
    ADD CONSTRAINT adventures_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: customers_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);


--
-- Name: levels_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY levels
    ADD CONSTRAINT levels_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest; Tablespace: 
--

ALTER TABLE ONLY preferences
    ADD CONSTRAINT preferences_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: epicodus
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM epicodus;
GRANT ALL ON SCHEMA public TO epicodus;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

