

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.posts DISABLE TRIGGER ALL;

INSERT INTO public.posts (id, title, body, published_at, created_at) VALUES ('ae839791-9008-46dd-baaa-e48bb14e2a9a', 'Look ma no hands', 'For real', '2021-05-17 12:13:11.527159+01', '2021-05-17 12:13:11.527159+01');
INSERT INTO public.posts (id, title, body, published_at, created_at) VALUES ('377effcb-804b-40d0-97ba-820638b0d970', 'z-index by examples', 'This is really **cool**', '2021-05-17 12:11:42.453042+01', '2021-05-17 12:12:09.956056+01');


ALTER TABLE public.posts ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;



ALTER TABLE public.comments ENABLE TRIGGER ALL;


