--
-- PostgreSQL database dump
--

\restrict 95fATclbv1yTADg08ac11yw02UBehH70vcgLZOX0YpNA3YhPCR7isjVvcUthYXn

-- Dumped from database version 16.15 (Debian 16.15-1.pgdg13+2)
-- Dumped by pg_dump version 16.15 (Debian 16.15-1.pgdg13+2)

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

ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_user_id_c564eba6_fk_core_user_id;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.core_user_user_permissions DROP CONSTRAINT IF EXISTS core_user_user_permissions_user_id_085123d3_fk_core_user_id;
ALTER TABLE IF EXISTS ONLY public.core_user_user_permissions DROP CONSTRAINT IF EXISTS core_user_user_permi_permission_id_35ccf601_fk_auth_perm;
ALTER TABLE IF EXISTS ONLY public.core_user_groups DROP CONSTRAINT IF EXISTS core_user_groups_user_id_70b4d9b8_fk_core_user_id;
ALTER TABLE IF EXISTS ONLY public.core_user_groups DROP CONSTRAINT IF EXISTS core_user_groups_group_id_fe8c697f_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.core_reservation DROP CONSTRAINT IF EXISTS core_reservation_reviewer_id_7c52c415_fk_core_user_id;
ALTER TABLE IF EXISTS ONLY public.core_reservation DROP CONSTRAINT IF EXISTS core_reservation_laboratory_id_12da0c15_fk_core_laboratory_id;
ALTER TABLE IF EXISTS ONLY public.core_reservation DROP CONSTRAINT IF EXISTS core_reservation_applicant_id_40b50257_fk_core_user_id;
ALTER TABLE IF EXISTS ONLY public.core_recognitionrecord DROP CONSTRAINT IF EXISTS core_recognitionrecord_user_id_78350449_fk_core_user_id;
ALTER TABLE IF EXISTS ONLY public.core_operationlog DROP CONSTRAINT IF EXISTS core_operationlog_user_id_5e87797b_fk_core_user_id;
ALTER TABLE IF EXISTS ONLY public.core_faceprofile DROP CONSTRAINT IF EXISTS core_faceprofile_user_id_a5a7327b_fk_core_user_id;
ALTER TABLE IF EXISTS ONLY public.core_equipmentuse DROP CONSTRAINT IF EXISTS core_equipmentuse_user_id_24690a81_fk_core_user_id;
ALTER TABLE IF EXISTS ONLY public.core_equipmentuse DROP CONSTRAINT IF EXISTS core_equipmentuse_equipment_id_affb19ca_fk_core_equipment_id;
ALTER TABLE IF EXISTS ONLY public.core_equipment DROP CONSTRAINT IF EXISTS core_equipment_laboratory_id_6aa5a10e_fk_core_laboratory_id;
ALTER TABLE IF EXISTS ONLY public.core_coursemember DROP CONSTRAINT IF EXISTS core_coursemember_student_id_49316e42_fk_core_user_id;
ALTER TABLE IF EXISTS ONLY public.core_coursemember DROP CONSTRAINT IF EXISTS core_coursemember_activity_id_daf93f27_fk_core_cour;
ALTER TABLE IF EXISTS ONLY public.core_courseactivity DROP CONSTRAINT IF EXISTS core_courseactivity_teacher_id_e0cfc02a_fk_core_user_id;
ALTER TABLE IF EXISTS ONLY public.core_checkintask DROP CONSTRAINT IF EXISTS core_checkintask_activity_id_6651e5df_fk_core_courseactivity_id;
ALTER TABLE IF EXISTS ONLY public.core_attendancerecord DROP CONSTRAINT IF EXISTS core_attendancerecord_task_id_16890374_fk_core_checkintask_id;
ALTER TABLE IF EXISTS ONLY public.core_attendancerecord DROP CONSTRAINT IF EXISTS core_attendancerecord_student_id_601f7971_fk_core_user_id;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
DROP INDEX IF EXISTS public.django_session_session_key_c0390e0f_like;
DROP INDEX IF EXISTS public.django_session_expire_date_a5c62663;
DROP INDEX IF EXISTS public.django_admin_log_user_id_c564eba6;
DROP INDEX IF EXISTS public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX IF EXISTS public.core_user_username_36e4f7f7_like;
DROP INDEX IF EXISTS public.core_user_user_permissions_user_id_085123d3;
DROP INDEX IF EXISTS public.core_user_user_permissions_permission_id_35ccf601;
DROP INDEX IF EXISTS public.core_user_student_id_dd0d948b_like;
DROP INDEX IF EXISTS public.core_user_groups_user_id_70b4d9b8;
DROP INDEX IF EXISTS public.core_user_groups_group_id_fe8c697f;
DROP INDEX IF EXISTS public.core_user_employee_id_aa241a94_like;
DROP INDEX IF EXISTS public.core_reservation_reviewer_id_7c52c415;
DROP INDEX IF EXISTS public.core_reservation_laboratory_id_12da0c15;
DROP INDEX IF EXISTS public.core_reservation_applicant_id_40b50257;
DROP INDEX IF EXISTS public.core_recognitionrecord_user_id_78350449;
DROP INDEX IF EXISTS public.core_operationlog_user_id_5e87797b;
DROP INDEX IF EXISTS public.core_laboratory_code_e67a2851_like;
DROP INDEX IF EXISTS public.core_equipmentuse_user_id_24690a81;
DROP INDEX IF EXISTS public.core_equipmentuse_equipment_id_affb19ca;
DROP INDEX IF EXISTS public.core_equipment_laboratory_id_6aa5a10e;
DROP INDEX IF EXISTS public.core_equipment_code_8b02c34e_like;
DROP INDEX IF EXISTS public.core_coursemember_student_id_49316e42;
DROP INDEX IF EXISTS public.core_coursemember_activity_id_daf93f27;
DROP INDEX IF EXISTS public.core_courseactivity_teacher_id_e0cfc02a;
DROP INDEX IF EXISTS public.core_checkintask_activity_id_6651e5df;
DROP INDEX IF EXISTS public.core_attendancerecord_task_id_16890374;
DROP INDEX IF EXISTS public.core_attendancerecord_student_id_601f7971;
DROP INDEX IF EXISTS public.auth_permission_content_type_id_2f476e4b;
DROP INDEX IF EXISTS public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX IF EXISTS public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX IF EXISTS public.auth_group_name_a6ea08ec_like;
ALTER TABLE IF EXISTS ONLY public.django_session DROP CONSTRAINT IF EXISTS django_session_pkey;
ALTER TABLE IF EXISTS ONLY public.django_migrations DROP CONSTRAINT IF EXISTS django_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_pkey;
ALTER TABLE IF EXISTS ONLY public.core_user DROP CONSTRAINT IF EXISTS core_user_username_key;
ALTER TABLE IF EXISTS ONLY public.core_user_user_permissions DROP CONSTRAINT IF EXISTS core_user_user_permissions_user_id_permission_id_73ea0daa_uniq;
ALTER TABLE IF EXISTS ONLY public.core_user_user_permissions DROP CONSTRAINT IF EXISTS core_user_user_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.core_user DROP CONSTRAINT IF EXISTS core_user_student_id_key;
ALTER TABLE IF EXISTS ONLY public.core_user DROP CONSTRAINT IF EXISTS core_user_pkey;
ALTER TABLE IF EXISTS ONLY public.core_user_groups DROP CONSTRAINT IF EXISTS core_user_groups_user_id_group_id_c82fcad1_uniq;
ALTER TABLE IF EXISTS ONLY public.core_user_groups DROP CONSTRAINT IF EXISTS core_user_groups_pkey;
ALTER TABLE IF EXISTS ONLY public.core_user DROP CONSTRAINT IF EXISTS core_user_employee_id_key;
ALTER TABLE IF EXISTS ONLY public.core_reservation DROP CONSTRAINT IF EXISTS core_reservation_pkey;
ALTER TABLE IF EXISTS ONLY public.core_recognitionrecord DROP CONSTRAINT IF EXISTS core_recognitionrecord_pkey;
ALTER TABLE IF EXISTS ONLY public.core_operationlog DROP CONSTRAINT IF EXISTS core_operationlog_pkey;
ALTER TABLE IF EXISTS ONLY public.core_laboratory DROP CONSTRAINT IF EXISTS core_laboratory_pkey;
ALTER TABLE IF EXISTS ONLY public.core_laboratory DROP CONSTRAINT IF EXISTS core_laboratory_code_key;
ALTER TABLE IF EXISTS ONLY public.core_faceprofile DROP CONSTRAINT IF EXISTS core_faceprofile_user_id_key;
ALTER TABLE IF EXISTS ONLY public.core_faceprofile DROP CONSTRAINT IF EXISTS core_faceprofile_pkey;
ALTER TABLE IF EXISTS ONLY public.core_equipmentuse DROP CONSTRAINT IF EXISTS core_equipmentuse_pkey;
ALTER TABLE IF EXISTS ONLY public.core_equipment DROP CONSTRAINT IF EXISTS core_equipment_pkey;
ALTER TABLE IF EXISTS ONLY public.core_equipment DROP CONSTRAINT IF EXISTS core_equipment_code_key;
ALTER TABLE IF EXISTS ONLY public.core_coursemember DROP CONSTRAINT IF EXISTS core_coursemember_pkey;
ALTER TABLE IF EXISTS ONLY public.core_coursemember DROP CONSTRAINT IF EXISTS core_coursemember_activity_id_student_id_26824072_uniq;
ALTER TABLE IF EXISTS ONLY public.core_courseactivity DROP CONSTRAINT IF EXISTS core_courseactivity_pkey;
ALTER TABLE IF EXISTS ONLY public.core_checkintask DROP CONSTRAINT IF EXISTS core_checkintask_pkey;
ALTER TABLE IF EXISTS ONLY public.core_attendancerecord DROP CONSTRAINT IF EXISTS core_attendancerecord_task_id_student_id_5d832040_uniq;
ALTER TABLE IF EXISTS ONLY public.core_attendancerecord DROP CONSTRAINT IF EXISTS core_attendancerecord_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_name_key;
DROP TABLE IF EXISTS public.django_session;
DROP TABLE IF EXISTS public.django_migrations;
DROP TABLE IF EXISTS public.django_content_type;
DROP TABLE IF EXISTS public.django_admin_log;
DROP TABLE IF EXISTS public.core_user_user_permissions;
DROP TABLE IF EXISTS public.core_user_groups;
DROP TABLE IF EXISTS public.core_user;
DROP TABLE IF EXISTS public.core_reservation;
DROP TABLE IF EXISTS public.core_recognitionrecord;
DROP TABLE IF EXISTS public.core_operationlog;
DROP TABLE IF EXISTS public.core_laboratory;
DROP TABLE IF EXISTS public.core_faceprofile;
DROP TABLE IF EXISTS public.core_equipmentuse;
DROP TABLE IF EXISTS public.core_equipment;
DROP TABLE IF EXISTS public.core_coursemember;
DROP TABLE IF EXISTS public.core_courseactivity;
DROP TABLE IF EXISTS public.core_checkintask;
DROP TABLE IF EXISTS public.core_attendancerecord;
DROP TABLE IF EXISTS public.auth_permission;
DROP TABLE IF EXISTS public.auth_group_permissions;
DROP TABLE IF EXISTS public.auth_group;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO labface_user;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO labface_user;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO labface_user;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_attendancerecord; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.core_attendancerecord (
    id bigint NOT NULL,
    checkin_time timestamp with time zone NOT NULL,
    verify_result boolean NOT NULL,
    verify_score double precision,
    attendance_status character varying(20) NOT NULL,
    student_id bigint NOT NULL,
    task_id bigint NOT NULL
);


ALTER TABLE public.core_attendancerecord OWNER TO labface_user;

--
-- Name: core_attendancerecord_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.core_attendancerecord ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_attendancerecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_checkintask; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.core_checkintask (
    id bigint NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    late_threshold_minutes integer NOT NULL,
    status character varying(20) NOT NULL,
    activity_id bigint NOT NULL,
    CONSTRAINT core_checkintask_late_threshold_minutes_check CHECK ((late_threshold_minutes >= 0))
);


ALTER TABLE public.core_checkintask OWNER TO labface_user;

--
-- Name: core_checkintask_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.core_checkintask ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_checkintask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_courseactivity; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.core_courseactivity (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    description text,
    teacher_id bigint NOT NULL
);


ALTER TABLE public.core_courseactivity OWNER TO labface_user;

--
-- Name: core_courseactivity_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.core_courseactivity ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_courseactivity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_coursemember; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.core_coursemember (
    id bigint NOT NULL,
    activity_id bigint NOT NULL,
    student_id bigint NOT NULL
);


ALTER TABLE public.core_coursemember OWNER TO labface_user;

--
-- Name: core_coursemember_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.core_coursemember ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_coursemember_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_equipment; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.core_equipment (
    id bigint NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    status character varying(20) NOT NULL,
    laboratory_id bigint NOT NULL
);


ALTER TABLE public.core_equipment OWNER TO labface_user;

--
-- Name: core_equipment_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.core_equipment ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_equipment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_equipmentuse; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.core_equipmentuse (
    id bigint NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone,
    status character varying(20) NOT NULL,
    equipment_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.core_equipmentuse OWNER TO labface_user;

--
-- Name: core_equipmentuse_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.core_equipmentuse ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_equipmentuse_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_faceprofile; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.core_faceprofile (
    id bigint NOT NULL,
    face_token text NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    status character varying(20) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.core_faceprofile OWNER TO labface_user;

--
-- Name: core_faceprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.core_faceprofile ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_faceprofile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_laboratory; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.core_laboratory (
    id bigint NOT NULL,
    code character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    location character varying(200) NOT NULL,
    capacity integer NOT NULL,
    description text,
    status character varying(20) NOT NULL,
    CONSTRAINT core_laboratory_capacity_check CHECK ((capacity >= 0))
);


ALTER TABLE public.core_laboratory OWNER TO labface_user;

--
-- Name: core_laboratory_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.core_laboratory ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_laboratory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_operationlog; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.core_operationlog (
    id bigint NOT NULL,
    module character varying(50) NOT NULL,
    action character varying(100) NOT NULL,
    obj_repr character varying(255),
    result character varying(20) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id bigint
);


ALTER TABLE public.core_operationlog OWNER TO labface_user;

--
-- Name: core_operationlog_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.core_operationlog ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_operationlog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_recognitionrecord; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.core_recognitionrecord (
    id bigint NOT NULL,
    recognition_type character varying(20) NOT NULL,
    success boolean NOT NULL,
    similarity double precision,
    duration_ms integer,
    error_code character varying(100),
    created_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL,
    CONSTRAINT core_recognitionrecord_duration_ms_check CHECK ((duration_ms >= 0))
);


ALTER TABLE public.core_recognitionrecord OWNER TO labface_user;

--
-- Name: core_recognitionrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.core_recognitionrecord ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_recognitionrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_reservation; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.core_reservation (
    id bigint NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    purpose character varying(255) NOT NULL,
    status character varying(20) NOT NULL,
    review_comment text,
    reviewed_at timestamp with time zone,
    applicant_id bigint NOT NULL,
    laboratory_id bigint NOT NULL,
    reviewer_id bigint
);


ALTER TABLE public.core_reservation OWNER TO labface_user;

--
-- Name: core_reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.core_reservation ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_user; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.core_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    role character varying(20) NOT NULL,
    student_id character varying(32),
    employee_id character varying(32),
    is_active boolean NOT NULL
);


ALTER TABLE public.core_user OWNER TO labface_user;

--
-- Name: core_user_groups; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.core_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.core_user_groups OWNER TO labface_user;

--
-- Name: core_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.core_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_user_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.core_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: core_user_user_permissions; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.core_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.core_user_user_permissions OWNER TO labface_user;

--
-- Name: core_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.core_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.core_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO labface_user;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO labface_user;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO labface_user;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: labface_user
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: labface_user
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO labface_user;

--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add 用户	6	add_user
22	Can change 用户	6	change_user
23	Can delete 用户	6	delete_user
24	Can view 用户	6	view_user
25	Can add 实验室	7	add_laboratory
26	Can change 实验室	7	change_laboratory
27	Can delete 实验室	7	delete_laboratory
28	Can view 实验室	7	view_laboratory
29	Can add 课程/实验活动	8	add_courseactivity
30	Can change 课程/实验活动	8	change_courseactivity
31	Can delete 课程/实验活动	8	delete_courseactivity
32	Can view 课程/实验活动	8	view_courseactivity
33	Can add 活动学生名单	9	add_coursemember
34	Can change 活动学生名单	9	change_coursemember
35	Can delete 活动学生名单	9	delete_coursemember
36	Can view 活动学生名单	9	view_coursemember
37	Can add 预约申请	10	add_reservation
38	Can change 预约申请	10	change_reservation
39	Can delete 预约申请	10	delete_reservation
40	Can view 预约申请	10	view_reservation
41	Can add 签到任务	11	add_checkintask
42	Can change 签到任务	11	change_checkintask
43	Can delete 签到任务	11	delete_checkintask
44	Can view 签到任务	11	view_checkintask
45	Can add 签到记录	12	add_attendancerecord
46	Can change 签到记录	12	change_attendancerecord
47	Can delete 签到记录	12	delete_attendancerecord
48	Can view 签到记录	12	view_attendancerecord
49	Can add 人脸档案	13	add_faceprofile
50	Can change 人脸档案	13	change_faceprofile
51	Can delete 人脸档案	13	delete_faceprofile
52	Can view 人脸档案	13	view_faceprofile
53	Can add 设备	14	add_equipment
54	Can change 设备	14	change_equipment
55	Can delete 设备	14	delete_equipment
56	Can view 设备	14	view_equipment
57	Can add 设备使用记录	15	add_equipmentuse
58	Can change 设备使用记录	15	change_equipmentuse
59	Can delete 设备使用记录	15	delete_equipmentuse
60	Can view 设备使用记录	15	view_equipmentuse
61	Can add 识别调用记录	16	add_recognitionrecord
62	Can change 识别调用记录	16	change_recognitionrecord
63	Can delete 识别调用记录	16	delete_recognitionrecord
64	Can view 识别调用记录	16	view_recognitionrecord
65	Can add 操作日志	17	add_operationlog
66	Can change 操作日志	17	change_operationlog
67	Can delete 操作日志	17	delete_operationlog
68	Can view 操作日志	17	view_operationlog
\.


--
-- Data for Name: core_attendancerecord; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.core_attendancerecord (id, checkin_time, verify_result, verify_score, attendance_status, student_id, task_id) FROM stdin;
1	2026-10-23 05:53:21.748688+00	t	1	late	2	1
\.


--
-- Data for Name: core_checkintask; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.core_checkintask (id, start_time, end_time, late_threshold_minutes, status, activity_id) FROM stdin;
1	2026-10-23 05:02:12.406006+00	2026-10-23 09:02:12.406006+00	10	active	1
\.


--
-- Data for Name: core_courseactivity; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.core_courseactivity (id, name, start_time, end_time, description, teacher_id) FROM stdin;
1	Python 101	2026-10-23 14:00:00+00	2026-10-23 16:00:00+00		4
\.


--
-- Data for Name: core_coursemember; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.core_coursemember (id, activity_id, student_id) FROM stdin;
1	1	2
2	1	5
\.


--
-- Data for Name: core_equipment; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.core_equipment (id, code, name, status, laboratory_id) FROM stdin;
\.


--
-- Data for Name: core_equipmentuse; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.core_equipmentuse (id, start_time, end_time, status, equipment_id, user_id) FROM stdin;
\.


--
-- Data for Name: core_faceprofile; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.core_faceprofile (id, face_token, updated_at, status, user_id) FROM stdin;
1	[-0.12086312472820282, 0.02030317485332489, 0.01890961453318596, -0.08835811913013458, -0.20972397923469543, 0.02910628542304039, -0.06078115850687027, -0.05236676335334778, 0.18064983189105988, -0.16716508567333221, 0.2542418837547302, -0.07560111582279205, -0.2262251377105713, 0.025798024609684944, -0.0743434727191925, 0.21359950304031372, -0.139333575963974, -0.11949609220027924, 0.019235052168369293, 0.017728302627801895, 0.005029946565628052, 0.07765834778547287, -0.0108314398676157, 0.0983671098947525, -0.14477916061878204, -0.379099577665329, -0.0975581482052803, -0.12726211547851562, -0.04054912179708481, -0.06932384520769119, 0.0030282149091362953, 0.1460137814283371, -0.14817696809768677, -0.056668203324079514, 0.053776707500219345, 0.16446462273597717, -0.051975492388010025, -0.11521012336015701, 0.22431014478206635, 0.06834162771701813, -0.2677370607852936, -0.045447397977113724, 0.0588906928896904, 0.30808576941490173, 0.0192277692258358, -0.0294171292334795, 0.06331922113895416, -0.05289250239729881, 0.0694839358329773, -0.26542603969573975, 0.07322023808956146, 0.08414578437805176, 0.09678430110216141, 0.03270342946052551, 0.04851091653108597, -0.13596290349960327, 0.09405973553657532, 0.1445978879928589, -0.2343006283044815, 0.02143237739801407, 0.12394950538873672, -0.04685129225254059, 0.06568053364753723, -0.08084007352590561, 0.2853633165359497, 0.11656945943832397, -0.08388825505971909, -0.09537841379642487, 0.16873808205127716, -0.10884278267621994, -0.06772430986166, 0.09149688482284546, -0.12680882215499878, -0.23469053208827972, -0.2668217718601227, 0.06113101541996002, 0.44214245676994324, 0.18656042218208313, -0.0928788110613823, 0.0472620464861393, -0.001976603642106056, -0.08999518305063248, 0.0661059021949768, 0.14406637847423553, 0.02878602407872677, 0.017801959067583084, -0.028479475528001785, 0.051451317965984344, 0.2456781417131424, -0.024210724979639053, -0.010729177854955196, 0.2004764974117279, 0.00943386647850275, -0.013249920681118965, 0.05816185474395752, 0.014602909795939922, -0.06278207153081894, 0.01081007532775402, -0.08983536064624786, 0.06930526345968246, -0.03862946853041649, -0.0935504361987114, -0.020218661054968834, 0.0915541797876358, -0.22204849123954773, 0.12812377512454987, -0.04316503182053566, -0.13087721168994904, -0.03217397257685661, 0.02577279694378376, -0.11911080032587051, -0.02317504584789276, 0.18660429120063782, -0.2701294422149658, 0.1576535403728485, 0.12574760615825653, 0.06700052320957184, 0.20919011533260345, 0.08965495228767395, 0.06044381111860275, 0.006156274117529392, -0.08712171018123627, -0.20998156070709229, -0.10143842548131943, 0.12482526153326035, -0.07639338076114655, 0.088703453540802, 0.029096921905875206]	2026-10-23 05:38:11.109977+00	active	2
\.


--
-- Data for Name: core_laboratory; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.core_laboratory (id, code, name, location, capacity, description, status) FROM stdin;
1	LAB-101	Компьютерный класс	Корпус А	30	\N	open
2	LAB-202	Лаборатория ИИ	Корпус Б, 5 этаж	20	\N	open
\.


--
-- Data for Name: core_operationlog; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.core_operationlog (id, module, action, obj_repr, result, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: core_recognitionrecord; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.core_recognitionrecord (id, recognition_type, success, similarity, duration_ms, error_code, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: core_reservation; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.core_reservation (id, start_time, end_time, purpose, status, review_comment, reviewed_at, applicant_id, laboratory_id, reviewer_id) FROM stdin;
\.


--
-- Data for Name: core_user; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.core_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, date_joined, role, student_id, employee_id, is_active) FROM stdin;
1	pbkdf2_sha256$1000000$QjkOMtFjvaaMhIQfAk1PMP$E4WXJ06sUnKh2Tvzx2KX15wmiDkrr+k3i4xpcWrfn0Q=	2026-10-22 12:56:34+00	t	admin			admin@gmail.com	t	2026-10-22 12:56:17+00	admin	\N	\N	t
2	pbkdf2_sha256$1000000$f2P2LDZCzuQISQvsT3tRuZ$pjuNV5c3qTZxkOFxTYByDt8m+ErH5zQjmup25wIn+cU=	\N	f	student1				f	2026-10-23 05:37:36.704215+00	student	S001	\N	t
3	pbkdf2_sha256$1000000$yGgckZVXYUTP97ioB1yijj$WhqT5ZHL4Av4vRTWNMmUOZbo38oyv0AV+BXhylWd4SA=	\N	f	Alex				f	2026-10-23 05:42:28+00	teacher	\N	1234567890	t
4	pbkdf2_sha256$1000000$rfQ6T11k5kPnZoqNVaJcw4$f0wJIFRc7ih8wpJYgeRW1NntXpCgpDuh1YWwdQ285Hg=	\N	f	teacher1				f	2026-10-23 07:02:12.420895+00	teacher	\N	\N	t
5	pbkdf2_sha256$1000000$7bvQlLuiXHqobXFif2eCbl$783fyTeqAcLOUL5wY3HxsIGUdbZ5vTtnqedZ68ExBC4=	\N	f	student2				f	2026-10-23 07:02:12.582848+00	student	S002	\N	t
\.


--
-- Data for Name: core_user_groups; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.core_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: core_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.core_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2026-10-22 12:57:31.305258+00	1	admin (系统管理员)	2	[{"changed": {"fields": ["\\u89d2\\u8272"]}}]	6	1
2	2026-10-23 05:42:28.153788+00	3	Alex (学生)	1	[{"added": {}}]	6	1
3	2026-10-23 05:43:18.010841+00	3	Alex (教师)	2	[{"changed": {"fields": ["\\u89d2\\u8272", "\\u5de5\\u53f7"]}}]	6	1
4	2026-10-23 05:44:42.115841+00	1	Python 101	1	[{"added": {}}]	8	1
5	2026-10-23 05:45:17.338103+00	1	Python 101 - 签到任务(10-23 14:00)	1	[{"added": {}}]	11	1
6	2026-10-23 05:48:44.565294+00	1	Python 101 - 签到任务(10-23 13:45)	2	[{"changed": {"fields": ["\\u5f00\\u59cb\\u7b7e\\u5230\\u65f6\\u95f4"]}}]	11	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	core	user
7	core	laboratory
8	core	courseactivity
9	core	coursemember
10	core	reservation
11	core	checkintask
12	core	attendancerecord
13	core	faceprofile
14	core	equipment
15	core	equipmentuse
16	core	recognitionrecord
17	core	operationlog
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2026-10-22 12:56:14.347284+00
2	contenttypes	0002_remove_content_type_name	2026-10-22 12:56:14.354493+00
3	auth	0001_initial	2026-10-22 12:56:14.443072+00
4	auth	0002_alter_permission_name_max_length	2026-10-22 12:56:14.450447+00
5	auth	0003_alter_user_email_max_length	2026-10-22 12:56:14.457399+00
6	auth	0004_alter_user_username_opts	2026-10-22 12:56:14.46329+00
7	auth	0005_alter_user_last_login_null	2026-10-22 12:56:14.469039+00
8	auth	0006_require_contenttypes_0002	2026-10-22 12:56:14.472624+00
9	auth	0007_alter_validators_add_error_messages	2026-10-22 12:56:14.477875+00
10	auth	0008_alter_user_username_max_length	2026-10-22 12:56:14.484204+00
11	auth	0009_alter_user_last_name_max_length	2026-10-22 12:56:14.490047+00
12	auth	0010_alter_group_name_max_length	2026-10-22 12:56:14.496455+00
13	auth	0011_update_proxy_permissions	2026-10-22 12:56:14.50348+00
14	auth	0012_alter_user_first_name_max_length	2026-10-22 12:56:14.509824+00
15	core	0001_initial	2026-10-22 12:56:14.632043+00
16	admin	0001_initial	2026-10-22 12:56:14.671229+00
17	admin	0002_logentry_remove_auto_add	2026-10-22 12:56:14.678841+00
18	admin	0003_logentry_add_action_flag_choices	2026-10-22 12:56:14.685554+00
19	core	0002_laboratory_courseactivity_coursemember	2026-10-22 12:56:14.768168+00
20	sessions	0001_initial	2026-10-22 12:56:14.796976+00
21	core	0003_checkintask_faceprofile_reservation_attendancerecord	2026-10-23 05:02:08.124401+00
22	core	0004_alter_coursemember_activity	2026-10-23 05:52:50.397281+00
23	core	0005_equipment_equipmentuse_operationlog_and_more	2026-10-23 05:55:23.563152+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: labface_user
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
e5mbf2sdncbof7q7geazlh8d1tw3hs7v	.eJxVjDsOwyAQBe9CHSE-a2BTpvcZEMsnOImwZOwqyt0jJBdJ-2bmvZkPx1790fPml8SuTLLL70YhPnMbID1Cu688rm3fFuJD4SftfF5Tft1O9--ghl5HLYWw0qYJS8KpKMxREOoIgBIAShbJkcikFJAp1hCg0i4WE5wOUiv2-QLVmTd0:1xJsLS:BNckokmzoyuMeQmnJsqIYYDjatr4JffvJz9hTAMNQts	2026-11-05 12:56:34.960592+00
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- Name: core_attendancerecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.core_attendancerecord_id_seq', 1, true);


--
-- Name: core_checkintask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.core_checkintask_id_seq', 1, true);


--
-- Name: core_courseactivity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.core_courseactivity_id_seq', 1, true);


--
-- Name: core_coursemember_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.core_coursemember_id_seq', 2, true);


--
-- Name: core_equipment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.core_equipment_id_seq', 1, false);


--
-- Name: core_equipmentuse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.core_equipmentuse_id_seq', 1, false);


--
-- Name: core_faceprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.core_faceprofile_id_seq', 1, true);


--
-- Name: core_laboratory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.core_laboratory_id_seq', 2, true);


--
-- Name: core_operationlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.core_operationlog_id_seq', 1, false);


--
-- Name: core_recognitionrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.core_recognitionrecord_id_seq', 1, false);


--
-- Name: core_reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.core_reservation_id_seq', 1, false);


--
-- Name: core_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.core_user_groups_id_seq', 1, false);


--
-- Name: core_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.core_user_id_seq', 5, true);


--
-- Name: core_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.core_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 6, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: labface_user
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: core_attendancerecord core_attendancerecord_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_attendancerecord
    ADD CONSTRAINT core_attendancerecord_pkey PRIMARY KEY (id);


--
-- Name: core_attendancerecord core_attendancerecord_task_id_student_id_5d832040_uniq; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_attendancerecord
    ADD CONSTRAINT core_attendancerecord_task_id_student_id_5d832040_uniq UNIQUE (task_id, student_id);


--
-- Name: core_checkintask core_checkintask_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_checkintask
    ADD CONSTRAINT core_checkintask_pkey PRIMARY KEY (id);


--
-- Name: core_courseactivity core_courseactivity_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_courseactivity
    ADD CONSTRAINT core_courseactivity_pkey PRIMARY KEY (id);


--
-- Name: core_coursemember core_coursemember_activity_id_student_id_26824072_uniq; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_coursemember
    ADD CONSTRAINT core_coursemember_activity_id_student_id_26824072_uniq UNIQUE (activity_id, student_id);


--
-- Name: core_coursemember core_coursemember_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_coursemember
    ADD CONSTRAINT core_coursemember_pkey PRIMARY KEY (id);


--
-- Name: core_equipment core_equipment_code_key; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_equipment
    ADD CONSTRAINT core_equipment_code_key UNIQUE (code);


--
-- Name: core_equipment core_equipment_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_equipment
    ADD CONSTRAINT core_equipment_pkey PRIMARY KEY (id);


--
-- Name: core_equipmentuse core_equipmentuse_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_equipmentuse
    ADD CONSTRAINT core_equipmentuse_pkey PRIMARY KEY (id);


--
-- Name: core_faceprofile core_faceprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_faceprofile
    ADD CONSTRAINT core_faceprofile_pkey PRIMARY KEY (id);


--
-- Name: core_faceprofile core_faceprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_faceprofile
    ADD CONSTRAINT core_faceprofile_user_id_key UNIQUE (user_id);


--
-- Name: core_laboratory core_laboratory_code_key; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_laboratory
    ADD CONSTRAINT core_laboratory_code_key UNIQUE (code);


--
-- Name: core_laboratory core_laboratory_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_laboratory
    ADD CONSTRAINT core_laboratory_pkey PRIMARY KEY (id);


--
-- Name: core_operationlog core_operationlog_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_operationlog
    ADD CONSTRAINT core_operationlog_pkey PRIMARY KEY (id);


--
-- Name: core_recognitionrecord core_recognitionrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_recognitionrecord
    ADD CONSTRAINT core_recognitionrecord_pkey PRIMARY KEY (id);


--
-- Name: core_reservation core_reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_reservation
    ADD CONSTRAINT core_reservation_pkey PRIMARY KEY (id);


--
-- Name: core_user core_user_employee_id_key; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_employee_id_key UNIQUE (employee_id);


--
-- Name: core_user_groups core_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_user_groups
    ADD CONSTRAINT core_user_groups_pkey PRIMARY KEY (id);


--
-- Name: core_user_groups core_user_groups_user_id_group_id_c82fcad1_uniq; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_user_groups
    ADD CONSTRAINT core_user_groups_user_id_group_id_c82fcad1_uniq UNIQUE (user_id, group_id);


--
-- Name: core_user core_user_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_pkey PRIMARY KEY (id);


--
-- Name: core_user core_user_student_id_key; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_student_id_key UNIQUE (student_id);


--
-- Name: core_user_user_permissions core_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_user_user_permissions
    ADD CONSTRAINT core_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: core_user_user_permissions core_user_user_permissions_user_id_permission_id_73ea0daa_uniq; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_user_user_permissions
    ADD CONSTRAINT core_user_user_permissions_user_id_permission_id_73ea0daa_uniq UNIQUE (user_id, permission_id);


--
-- Name: core_user core_user_username_key; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: core_attendancerecord_student_id_601f7971; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_attendancerecord_student_id_601f7971 ON public.core_attendancerecord USING btree (student_id);


--
-- Name: core_attendancerecord_task_id_16890374; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_attendancerecord_task_id_16890374 ON public.core_attendancerecord USING btree (task_id);


--
-- Name: core_checkintask_activity_id_6651e5df; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_checkintask_activity_id_6651e5df ON public.core_checkintask USING btree (activity_id);


--
-- Name: core_courseactivity_teacher_id_e0cfc02a; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_courseactivity_teacher_id_e0cfc02a ON public.core_courseactivity USING btree (teacher_id);


--
-- Name: core_coursemember_activity_id_daf93f27; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_coursemember_activity_id_daf93f27 ON public.core_coursemember USING btree (activity_id);


--
-- Name: core_coursemember_student_id_49316e42; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_coursemember_student_id_49316e42 ON public.core_coursemember USING btree (student_id);


--
-- Name: core_equipment_code_8b02c34e_like; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_equipment_code_8b02c34e_like ON public.core_equipment USING btree (code varchar_pattern_ops);


--
-- Name: core_equipment_laboratory_id_6aa5a10e; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_equipment_laboratory_id_6aa5a10e ON public.core_equipment USING btree (laboratory_id);


--
-- Name: core_equipmentuse_equipment_id_affb19ca; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_equipmentuse_equipment_id_affb19ca ON public.core_equipmentuse USING btree (equipment_id);


--
-- Name: core_equipmentuse_user_id_24690a81; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_equipmentuse_user_id_24690a81 ON public.core_equipmentuse USING btree (user_id);


--
-- Name: core_laboratory_code_e67a2851_like; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_laboratory_code_e67a2851_like ON public.core_laboratory USING btree (code varchar_pattern_ops);


--
-- Name: core_operationlog_user_id_5e87797b; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_operationlog_user_id_5e87797b ON public.core_operationlog USING btree (user_id);


--
-- Name: core_recognitionrecord_user_id_78350449; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_recognitionrecord_user_id_78350449 ON public.core_recognitionrecord USING btree (user_id);


--
-- Name: core_reservation_applicant_id_40b50257; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_reservation_applicant_id_40b50257 ON public.core_reservation USING btree (applicant_id);


--
-- Name: core_reservation_laboratory_id_12da0c15; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_reservation_laboratory_id_12da0c15 ON public.core_reservation USING btree (laboratory_id);


--
-- Name: core_reservation_reviewer_id_7c52c415; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_reservation_reviewer_id_7c52c415 ON public.core_reservation USING btree (reviewer_id);


--
-- Name: core_user_employee_id_aa241a94_like; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_user_employee_id_aa241a94_like ON public.core_user USING btree (employee_id varchar_pattern_ops);


--
-- Name: core_user_groups_group_id_fe8c697f; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_user_groups_group_id_fe8c697f ON public.core_user_groups USING btree (group_id);


--
-- Name: core_user_groups_user_id_70b4d9b8; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_user_groups_user_id_70b4d9b8 ON public.core_user_groups USING btree (user_id);


--
-- Name: core_user_student_id_dd0d948b_like; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_user_student_id_dd0d948b_like ON public.core_user USING btree (student_id varchar_pattern_ops);


--
-- Name: core_user_user_permissions_permission_id_35ccf601; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_user_user_permissions_permission_id_35ccf601 ON public.core_user_user_permissions USING btree (permission_id);


--
-- Name: core_user_user_permissions_user_id_085123d3; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_user_user_permissions_user_id_085123d3 ON public.core_user_user_permissions USING btree (user_id);


--
-- Name: core_user_username_36e4f7f7_like; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX core_user_username_36e4f7f7_like ON public.core_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: labface_user
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_attendancerecord core_attendancerecord_student_id_601f7971_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_attendancerecord
    ADD CONSTRAINT core_attendancerecord_student_id_601f7971_fk_core_user_id FOREIGN KEY (student_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_attendancerecord core_attendancerecord_task_id_16890374_fk_core_checkintask_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_attendancerecord
    ADD CONSTRAINT core_attendancerecord_task_id_16890374_fk_core_checkintask_id FOREIGN KEY (task_id) REFERENCES public.core_checkintask(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_checkintask core_checkintask_activity_id_6651e5df_fk_core_courseactivity_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_checkintask
    ADD CONSTRAINT core_checkintask_activity_id_6651e5df_fk_core_courseactivity_id FOREIGN KEY (activity_id) REFERENCES public.core_courseactivity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_courseactivity core_courseactivity_teacher_id_e0cfc02a_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_courseactivity
    ADD CONSTRAINT core_courseactivity_teacher_id_e0cfc02a_fk_core_user_id FOREIGN KEY (teacher_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_coursemember core_coursemember_activity_id_daf93f27_fk_core_cour; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_coursemember
    ADD CONSTRAINT core_coursemember_activity_id_daf93f27_fk_core_cour FOREIGN KEY (activity_id) REFERENCES public.core_courseactivity(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_coursemember core_coursemember_student_id_49316e42_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_coursemember
    ADD CONSTRAINT core_coursemember_student_id_49316e42_fk_core_user_id FOREIGN KEY (student_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_equipment core_equipment_laboratory_id_6aa5a10e_fk_core_laboratory_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_equipment
    ADD CONSTRAINT core_equipment_laboratory_id_6aa5a10e_fk_core_laboratory_id FOREIGN KEY (laboratory_id) REFERENCES public.core_laboratory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_equipmentuse core_equipmentuse_equipment_id_affb19ca_fk_core_equipment_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_equipmentuse
    ADD CONSTRAINT core_equipmentuse_equipment_id_affb19ca_fk_core_equipment_id FOREIGN KEY (equipment_id) REFERENCES public.core_equipment(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_equipmentuse core_equipmentuse_user_id_24690a81_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_equipmentuse
    ADD CONSTRAINT core_equipmentuse_user_id_24690a81_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_faceprofile core_faceprofile_user_id_a5a7327b_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_faceprofile
    ADD CONSTRAINT core_faceprofile_user_id_a5a7327b_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_operationlog core_operationlog_user_id_5e87797b_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_operationlog
    ADD CONSTRAINT core_operationlog_user_id_5e87797b_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_recognitionrecord core_recognitionrecord_user_id_78350449_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_recognitionrecord
    ADD CONSTRAINT core_recognitionrecord_user_id_78350449_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_reservation core_reservation_applicant_id_40b50257_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_reservation
    ADD CONSTRAINT core_reservation_applicant_id_40b50257_fk_core_user_id FOREIGN KEY (applicant_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_reservation core_reservation_laboratory_id_12da0c15_fk_core_laboratory_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_reservation
    ADD CONSTRAINT core_reservation_laboratory_id_12da0c15_fk_core_laboratory_id FOREIGN KEY (laboratory_id) REFERENCES public.core_laboratory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_reservation core_reservation_reviewer_id_7c52c415_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_reservation
    ADD CONSTRAINT core_reservation_reviewer_id_7c52c415_fk_core_user_id FOREIGN KEY (reviewer_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_user_groups core_user_groups_group_id_fe8c697f_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_user_groups
    ADD CONSTRAINT core_user_groups_group_id_fe8c697f_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_user_groups core_user_groups_user_id_70b4d9b8_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_user_groups
    ADD CONSTRAINT core_user_groups_user_id_70b4d9b8_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_user_user_permissions core_user_user_permi_permission_id_35ccf601_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_user_user_permissions
    ADD CONSTRAINT core_user_user_permi_permission_id_35ccf601_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: core_user_user_permissions core_user_user_permissions_user_id_085123d3_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.core_user_user_permissions
    ADD CONSTRAINT core_user_user_permissions_user_id_085123d3_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_core_user_id; Type: FK CONSTRAINT; Schema: public; Owner: labface_user
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_core_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\unrestrict 95fATclbv1yTADg08ac11yw02UBehH70vcgLZOX0YpNA3YhPCR7isjVvcUthYXn

