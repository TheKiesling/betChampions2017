--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

-- Started on 2023-03-06 01:02:41

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 246839)
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id character varying(30) NOT NULL,
    name character varying(30)
);


ALTER TABLE public.country OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 247023)
-- Name: foul; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.foul (
    foul_id character varying(30) NOT NULL,
    match_api_id character varying(30),
    player_responsable_id character varying(30),
    player_victim_id character varying(30),
    team_responsable_id character varying(30)
);


ALTER TABLE public.foul OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 246844)
-- Name: league; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.league (
    id character varying(30) NOT NULL,
    country_id character varying(30),
    name character varying(70)
);


ALTER TABLE public.league OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 246884)
-- Name: match; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.match (
    id character varying(30),
    country_id character varying(30),
    league_id character varying(30),
    season character varying(30),
    stage character varying(30),
    date timestamp without time zone,
    match_api_id character varying(30) NOT NULL,
    home_team_api_id character varying(30),
    away_team_api_id character varying(30),
    home_team_goal integer,
    away_team_goal integer,
    home_player_x1 integer,
    home_player_x2 integer,
    home_player_x3 integer,
    home_player_x4 integer,
    home_player_x5 integer,
    home_player_x6 integer,
    home_player_x7 integer,
    home_player_x8 integer,
    home_player_x9 integer,
    home_player_x10 integer,
    home_player_x11 integer,
    away_player_x1 integer,
    away_player_x2 integer,
    away_player_x3 integer,
    away_player_x4 integer,
    away_player_x5 integer,
    away_player_x6 integer,
    away_player_x7 integer,
    away_player_x8 integer,
    away_player_x9 integer,
    away_player_x10 integer,
    away_player_x11 integer,
    home_player_y1 integer,
    home_player_y2 integer,
    home_player_y3 integer,
    home_player_y4 integer,
    home_player_y5 integer,
    home_player_y6 integer,
    home_player_y7 integer,
    home_player_y8 integer,
    home_player_y9 integer,
    home_player_y10 integer,
    home_player_y11 integer,
    away_player_y1 integer,
    away_player_y2 integer,
    away_player_y3 integer,
    away_player_y4 integer,
    away_player_y5 integer,
    away_player_y6 integer,
    away_player_y7 integer,
    away_player_y8 integer,
    away_player_y9 integer,
    away_player_y10 integer,
    away_player_y11 integer,
    home_player_1 character varying(30),
    home_player_2 character varying(30),
    home_player_3 character varying(30),
    home_player_4 character varying(30),
    home_player_5 character varying(30),
    home_player_6 character varying(30),
    home_player_7 character varying(30),
    home_player_8 character varying(30),
    home_player_9 character varying(30),
    home_player_10 character varying(30),
    home_player_11 character varying(30),
    away_player_1 character varying(30),
    away_player_2 character varying(30),
    away_player_3 character varying(30),
    away_player_4 character varying(30),
    away_player_5 character varying(30),
    away_player_6 character varying(30),
    away_player_7 character varying(30),
    away_player_8 character varying(30),
    away_player_9 character varying(30),
    away_player_10 character varying(30),
    away_player_11 character varying(30),
    goal text,
    shoton text,
    shotoff text,
    foul_commit text,
    card text,
    cross_text text,
    corner text,
    possession text,
    b365h double precision,
    b365d double precision,
    b365a double precision,
    bwh double precision,
    bwd double precision,
    bwa double precision,
    iwh double precision,
    iwd double precision,
    iwa double precision,
    lbh double precision,
    lbd double precision,
    lba double precision,
    psh double precision,
    psd double precision,
    psa double precision,
    whh double precision,
    whd double precision,
    wha double precision,
    sjh double precision,
    sjd double precision,
    sja double precision,
    vch double precision,
    vcd double precision,
    vca double precision,
    gbh double precision,
    gbd double precision,
    gba double precision,
    bsh double precision,
    bsd double precision,
    bsa double precision
);


ALTER TABLE public.match OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 246854)
-- Name: player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player (
    id character varying(30),
    player_api_id character varying(30) NOT NULL,
    player_name character varying(100),
    player_fifa_api_id character varying(30),
    birthday timestamp without time zone,
    height double precision,
    weight integer
);


ALTER TABLE public.player OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 246859)
-- Name: player_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player_attributes (
    id character varying(30) NOT NULL,
    player_fifa_api_id character varying(30),
    player_api_id character varying(30),
    date timestamp without time zone,
    overall_rating integer,
    potential integer,
    preferred_foot character varying(30),
    attacking_work_rate character varying(30),
    defensive_work_rate character varying(30),
    crossing integer,
    finishing integer,
    heading_accuracy integer,
    short_passing integer,
    volleys integer,
    dribbling integer,
    curve integer,
    free_kick_accuracy integer,
    long_passing integer,
    ball_control integer,
    acceleration integer,
    sprint_speed integer,
    agility integer,
    reactions integer,
    balance integer,
    shot_power integer,
    jumping integer,
    stamina integer,
    strength integer,
    long_shots integer,
    aggression integer,
    interceptions integer,
    positioning integer,
    vision integer,
    penalties integer,
    marking integer,
    standing_tackle integer,
    sliding_tackle integer,
    gk_diving integer,
    gk_handling integer,
    gk_kicking integer,
    gk_positioning integer,
    gk_reflexes integer
);


ALTER TABLE public.player_attributes OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 246869)
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team (
    id character varying(30),
    team_api_id character varying(30) NOT NULL,
    team_fifa_api_id character varying(30),
    team_long_name character varying(30),
    team_short_name character varying(30)
);


ALTER TABLE public.team OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 246874)
-- Name: team_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team_attributes (
    id character varying(30) NOT NULL,
    team_fifa_api_id character varying(30),
    team_api_id character varying(30),
    date timestamp without time zone,
    buildupplayspeed integer,
    buildupplayspeedclass character varying(30),
    buildupplaydribbling integer,
    buildupplaydribblingclass character varying(30),
    buildupplaypassing integer,
    buildupplaypassingclass character varying(30),
    buildupplaypositioningclass character varying(30),
    chancecreationpassing integer,
    chancecreationpassingclass character varying(30),
    chancecreationcrossing integer,
    chancecreationcrossingclass character varying(30),
    chancecreationshooting integer,
    chancecreationshootingclass character varying(30),
    chancecreationpositioningclass character varying(30),
    defencepressure integer,
    defencepressureclass character varying(30),
    defenceaggression integer,
    defenceaggressionclass character varying(30),
    defenceteamwidth integer,
    defenceteamwidthclass character varying(30),
    defencedefenderlineclass character varying(30)
);


ALTER TABLE public.team_attributes OWNER TO postgres;

--
-- TOC entry 3391 (class 0 OID 246839)
-- Dependencies: 214
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name) FROM stdin;
\.


--
-- TOC entry 3398 (class 0 OID 247023)
-- Dependencies: 221
-- Data for Name: foul; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.foul (foul_id, match_api_id, player_responsable_id, player_victim_id, team_responsable_id) FROM stdin;
\.


--
-- TOC entry 3392 (class 0 OID 246844)
-- Dependencies: 215
-- Data for Name: league; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.league (id, country_id, name) FROM stdin;
\.


--
-- TOC entry 3397 (class 0 OID 246884)
-- Dependencies: 220
-- Data for Name: match; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.match (id, country_id, league_id, season, stage, date, match_api_id, home_team_api_id, away_team_api_id, home_team_goal, away_team_goal, home_player_x1, home_player_x2, home_player_x3, home_player_x4, home_player_x5, home_player_x6, home_player_x7, home_player_x8, home_player_x9, home_player_x10, home_player_x11, away_player_x1, away_player_x2, away_player_x3, away_player_x4, away_player_x5, away_player_x6, away_player_x7, away_player_x8, away_player_x9, away_player_x10, away_player_x11, home_player_y1, home_player_y2, home_player_y3, home_player_y4, home_player_y5, home_player_y6, home_player_y7, home_player_y8, home_player_y9, home_player_y10, home_player_y11, away_player_y1, away_player_y2, away_player_y3, away_player_y4, away_player_y5, away_player_y6, away_player_y7, away_player_y8, away_player_y9, away_player_y10, away_player_y11, home_player_1, home_player_2, home_player_3, home_player_4, home_player_5, home_player_6, home_player_7, home_player_8, home_player_9, home_player_10, home_player_11, away_player_1, away_player_2, away_player_3, away_player_4, away_player_5, away_player_6, away_player_7, away_player_8, away_player_9, away_player_10, away_player_11, goal, shoton, shotoff, foul_commit, card, cross_text, corner, possession, b365h, b365d, b365a, bwh, bwd, bwa, iwh, iwd, iwa, lbh, lbd, lba, psh, psd, psa, whh, whd, wha, sjh, sjd, sja, vch, vcd, vca, gbh, gbd, gba, bsh, bsd, bsa) FROM stdin;
\.


--
-- TOC entry 3393 (class 0 OID 246854)
-- Dependencies: 216
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player (id, player_api_id, player_name, player_fifa_api_id, birthday, height, weight) FROM stdin;
\.


--
-- TOC entry 3394 (class 0 OID 246859)
-- Dependencies: 217
-- Data for Name: player_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player_attributes (id, player_fifa_api_id, player_api_id, date, overall_rating, potential, preferred_foot, attacking_work_rate, defensive_work_rate, crossing, finishing, heading_accuracy, short_passing, volleys, dribbling, curve, free_kick_accuracy, long_passing, ball_control, acceleration, sprint_speed, agility, reactions, balance, shot_power, jumping, stamina, strength, long_shots, aggression, interceptions, positioning, vision, penalties, marking, standing_tackle, sliding_tackle, gk_diving, gk_handling, gk_kicking, gk_positioning, gk_reflexes) FROM stdin;
\.


--
-- TOC entry 3395 (class 0 OID 246869)
-- Dependencies: 218
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team (id, team_api_id, team_fifa_api_id, team_long_name, team_short_name) FROM stdin;
\.


--
-- TOC entry 3396 (class 0 OID 246874)
-- Dependencies: 219
-- Data for Name: team_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team_attributes (id, team_fifa_api_id, team_api_id, date, buildupplayspeed, buildupplayspeedclass, buildupplaydribbling, buildupplaydribblingclass, buildupplaypassing, buildupplaypassingclass, buildupplaypositioningclass, chancecreationpassing, chancecreationpassingclass, chancecreationcrossing, chancecreationcrossingclass, chancecreationshooting, chancecreationshootingclass, chancecreationpositioningclass, defencepressure, defencepressureclass, defenceaggression, defenceaggressionclass, defenceteamwidth, defenceteamwidthclass, defencedefenderlineclass) FROM stdin;
\.


--
-- TOC entry 3201 (class 2606 OID 246843)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- TOC entry 3217 (class 2606 OID 247027)
-- Name: foul foul_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foul
    ADD CONSTRAINT foul_pkey PRIMARY KEY (foul_id);


--
-- TOC entry 3203 (class 2606 OID 246848)
-- Name: league league_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.league
    ADD CONSTRAINT league_pkey PRIMARY KEY (id);


--
-- TOC entry 3213 (class 2606 OID 246892)
-- Name: match match_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_id_key UNIQUE (id);


--
-- TOC entry 3215 (class 2606 OID 246890)
-- Name: match match_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_pkey PRIMARY KEY (match_api_id);


--
-- TOC entry 3207 (class 2606 OID 246863)
-- Name: player_attributes player_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_attributes
    ADD CONSTRAINT player_attributes_pkey PRIMARY KEY (id);


--
-- TOC entry 3205 (class 2606 OID 246858)
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (player_api_id);


--
-- TOC entry 3211 (class 2606 OID 246878)
-- Name: team_attributes team_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_attributes
    ADD CONSTRAINT team_attributes_pkey PRIMARY KEY (id);


--
-- TOC entry 3209 (class 2606 OID 246873)
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (team_api_id);


--
-- TOC entry 3247 (class 2606 OID 247028)
-- Name: foul foul_match_api_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foul
    ADD CONSTRAINT foul_match_api_id_fkey FOREIGN KEY (match_api_id) REFERENCES public.match(match_api_id);


--
-- TOC entry 3248 (class 2606 OID 247033)
-- Name: foul foul_team_responsable_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.foul
    ADD CONSTRAINT foul_team_responsable_id_fkey FOREIGN KEY (team_responsable_id) REFERENCES public.team(team_api_id);


--
-- TOC entry 3218 (class 2606 OID 246849)
-- Name: league league_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.league
    ADD CONSTRAINT league_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- TOC entry 3221 (class 2606 OID 247013)
-- Name: match match_away_player_10_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_away_player_10_fkey FOREIGN KEY (away_player_10) REFERENCES public.player(player_api_id);


--
-- TOC entry 3222 (class 2606 OID 247018)
-- Name: match match_away_player_11_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_away_player_11_fkey FOREIGN KEY (away_player_11) REFERENCES public.player(player_api_id);


--
-- TOC entry 3223 (class 2606 OID 246968)
-- Name: match match_away_player_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_away_player_1_fkey FOREIGN KEY (away_player_1) REFERENCES public.player(player_api_id);


--
-- TOC entry 3224 (class 2606 OID 246973)
-- Name: match match_away_player_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_away_player_2_fkey FOREIGN KEY (away_player_2) REFERENCES public.player(player_api_id);


--
-- TOC entry 3225 (class 2606 OID 246978)
-- Name: match match_away_player_3_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_away_player_3_fkey FOREIGN KEY (away_player_3) REFERENCES public.player(player_api_id);


--
-- TOC entry 3226 (class 2606 OID 246983)
-- Name: match match_away_player_4_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_away_player_4_fkey FOREIGN KEY (away_player_4) REFERENCES public.player(player_api_id);


--
-- TOC entry 3227 (class 2606 OID 246988)
-- Name: match match_away_player_5_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_away_player_5_fkey FOREIGN KEY (away_player_5) REFERENCES public.player(player_api_id);


--
-- TOC entry 3228 (class 2606 OID 246993)
-- Name: match match_away_player_6_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_away_player_6_fkey FOREIGN KEY (away_player_6) REFERENCES public.player(player_api_id);


--
-- TOC entry 3229 (class 2606 OID 246998)
-- Name: match match_away_player_7_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_away_player_7_fkey FOREIGN KEY (away_player_7) REFERENCES public.player(player_api_id);


--
-- TOC entry 3230 (class 2606 OID 247003)
-- Name: match match_away_player_8_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_away_player_8_fkey FOREIGN KEY (away_player_8) REFERENCES public.player(player_api_id);


--
-- TOC entry 3231 (class 2606 OID 247008)
-- Name: match match_away_player_9_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_away_player_9_fkey FOREIGN KEY (away_player_9) REFERENCES public.player(player_api_id);


--
-- TOC entry 3232 (class 2606 OID 246908)
-- Name: match match_away_team_api_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_away_team_api_id_fkey FOREIGN KEY (away_team_api_id) REFERENCES public.team(team_api_id);


--
-- TOC entry 3233 (class 2606 OID 246893)
-- Name: match match_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- TOC entry 3234 (class 2606 OID 246958)
-- Name: match match_home_player_10_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_home_player_10_fkey FOREIGN KEY (home_player_10) REFERENCES public.player(player_api_id);


--
-- TOC entry 3235 (class 2606 OID 246963)
-- Name: match match_home_player_11_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_home_player_11_fkey FOREIGN KEY (home_player_11) REFERENCES public.player(player_api_id);


--
-- TOC entry 3236 (class 2606 OID 246913)
-- Name: match match_home_player_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_home_player_1_fkey FOREIGN KEY (home_player_1) REFERENCES public.player(player_api_id);


--
-- TOC entry 3237 (class 2606 OID 246918)
-- Name: match match_home_player_2_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_home_player_2_fkey FOREIGN KEY (home_player_2) REFERENCES public.player(player_api_id);


--
-- TOC entry 3238 (class 2606 OID 246923)
-- Name: match match_home_player_3_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_home_player_3_fkey FOREIGN KEY (home_player_3) REFERENCES public.player(player_api_id);


--
-- TOC entry 3239 (class 2606 OID 246928)
-- Name: match match_home_player_4_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_home_player_4_fkey FOREIGN KEY (home_player_4) REFERENCES public.player(player_api_id);


--
-- TOC entry 3240 (class 2606 OID 246933)
-- Name: match match_home_player_5_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_home_player_5_fkey FOREIGN KEY (home_player_5) REFERENCES public.player(player_api_id);


--
-- TOC entry 3241 (class 2606 OID 246938)
-- Name: match match_home_player_6_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_home_player_6_fkey FOREIGN KEY (home_player_6) REFERENCES public.player(player_api_id);


--
-- TOC entry 3242 (class 2606 OID 246943)
-- Name: match match_home_player_7_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_home_player_7_fkey FOREIGN KEY (home_player_7) REFERENCES public.player(player_api_id);


--
-- TOC entry 3243 (class 2606 OID 246948)
-- Name: match match_home_player_8_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_home_player_8_fkey FOREIGN KEY (home_player_8) REFERENCES public.player(player_api_id);


--
-- TOC entry 3244 (class 2606 OID 246953)
-- Name: match match_home_player_9_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_home_player_9_fkey FOREIGN KEY (home_player_9) REFERENCES public.player(player_api_id);


--
-- TOC entry 3245 (class 2606 OID 246903)
-- Name: match match_home_team_api_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_home_team_api_id_fkey FOREIGN KEY (home_team_api_id) REFERENCES public.team(team_api_id);


--
-- TOC entry 3246 (class 2606 OID 246898)
-- Name: match match_league_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT match_league_id_fkey FOREIGN KEY (league_id) REFERENCES public.league(id);


--
-- TOC entry 3219 (class 2606 OID 246864)
-- Name: player_attributes player_attributes_player_api_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player_attributes
    ADD CONSTRAINT player_attributes_player_api_id_fkey FOREIGN KEY (player_api_id) REFERENCES public.player(player_api_id);


--
-- TOC entry 3220 (class 2606 OID 246879)
-- Name: team_attributes team_attributes_team_api_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team_attributes
    ADD CONSTRAINT team_attributes_team_api_id_fkey FOREIGN KEY (team_api_id) REFERENCES public.team(team_api_id);


-- Completed on 2023-03-06 01:02:41

--
-- PostgreSQL database dump complete
--

