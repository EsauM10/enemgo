SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE addresses (
    id bigint NOT NULL,
    state character varying,
    city character varying,
    cep character varying,
    district character varying,
    street character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: alternatives; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE alternatives (
    id bigint NOT NULL,
    statement text,
    question_id bigint,
    veracity boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: alternatives_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE alternatives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: alternatives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE alternatives_id_seq OWNED BY alternatives.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE comments (
    id bigint NOT NULL,
    text text,
    commentable_type character varying,
    commentable_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE contacts (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    theme character varying,
    message text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: exam_questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE exam_questions (
    id bigint NOT NULL,
    exam_id bigint,
    question_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: exam_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE exam_questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exam_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE exam_questions_id_seq OWNED BY exam_questions.id;


--
-- Name: exams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE exams (
    id bigint NOT NULL,
    year integer,
    kind integer,
    status integer,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    title character varying
);


--
-- Name: exams_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE exams_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE exams_id_seq OWNED BY exams.id;


--
-- Name: friendly_id_slugs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE friendly_id_slugs (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    sluggable_id integer NOT NULL,
    sluggable_type character varying(50),
    scope character varying,
    created_at timestamp without time zone
);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE friendly_id_slugs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE friendly_id_slugs_id_seq OWNED BY friendly_id_slugs.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE images (
    id bigint NOT NULL,
    source character varying,
    imageable_type character varying,
    imageable_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


--
-- Name: options_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE options_plans (
    id bigint NOT NULL,
    plan_id bigint,
    text character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: options_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE options_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: options_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE options_plans_id_seq OWNED BY options_plans.id;


--
-- Name: plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE plans (
    id bigint NOT NULL,
    price double precision,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stripe_id character varying,
    slug character varying
);


--
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE plans_id_seq OWNED BY plans.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE profiles (
    id bigint NOT NULL,
    first_name character varying,
    last_name character varying,
    phone character varying,
    birthday date,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    avatar character varying,
    sex character varying
);


--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE profiles_id_seq OWNED BY profiles.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE questions (
    id bigint NOT NULL,
    statement text,
    status integer,
    source character varying,
    user_id bigint,
    area integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    official boolean DEFAULT false
);


--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE questions_id_seq OWNED BY questions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: simulation_answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE simulation_answers (
    id bigint NOT NULL,
    simulation_id bigint,
    user_id bigint,
    question_id bigint,
    alternative_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: simulation_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE simulation_answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: simulation_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE simulation_answers_id_seq OWNED BY simulation_answers.id;


--
-- Name: simulations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE simulations (
    id bigint NOT NULL,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    user_id bigint,
    score double precision,
    exam_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status integer DEFAULT 0
);


--
-- Name: simulations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE simulations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: simulations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE simulations_id_seq OWNED BY simulations.id;


--
-- Name: solutions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE solutions (
    id bigint NOT NULL,
    statement text,
    question_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: solutions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE solutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: solutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE solutions_id_seq OWNED BY solutions.id;


--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE subscriptions (
    id bigint NOT NULL,
    user_id bigint,
    plan_id bigint,
    stripe_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status character varying,
    subscribed_at timestamp without time zone,
    subscription_expires_at timestamp without time zone
);


--
-- Name: subscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE subscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE subscriptions_id_seq OWNED BY subscriptions.id;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tickets (
    id bigint NOT NULL,
    message text,
    motive character varying,
    user_id bigint,
    ticketable_type character varying,
    ticketable_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tickets_id_seq OWNED BY tickets.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    kind integer DEFAULT 0,
    provider character varying,
    uid character varying,
    stripe_id character varying,
    banned boolean DEFAULT false
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE versions (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id integer NOT NULL,
    event character varying NOT NULL,
    whodunnit character varying,
    object text,
    created_at timestamp without time zone,
    object_changes text
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE versions_id_seq OWNED BY versions.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternatives ALTER COLUMN id SET DEFAULT nextval('alternatives_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY exam_questions ALTER COLUMN id SET DEFAULT nextval('exam_questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY exams ALTER COLUMN id SET DEFAULT nextval('exams_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY friendly_id_slugs ALTER COLUMN id SET DEFAULT nextval('friendly_id_slugs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY options_plans ALTER COLUMN id SET DEFAULT nextval('options_plans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY plans ALTER COLUMN id SET DEFAULT nextval('plans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY profiles ALTER COLUMN id SET DEFAULT nextval('profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY simulation_answers ALTER COLUMN id SET DEFAULT nextval('simulation_answers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY simulations ALTER COLUMN id SET DEFAULT nextval('simulations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY solutions ALTER COLUMN id SET DEFAULT nextval('solutions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscriptions ALTER COLUMN id SET DEFAULT nextval('subscriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tickets ALTER COLUMN id SET DEFAULT nextval('tickets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY versions ALTER COLUMN id SET DEFAULT nextval('versions_id_seq'::regclass);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: alternatives_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternatives
    ADD CONSTRAINT alternatives_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: exam_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exam_questions
    ADD CONSTRAINT exam_questions_pkey PRIMARY KEY (id);


--
-- Name: exams_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exams
    ADD CONSTRAINT exams_pkey PRIMARY KEY (id);


--
-- Name: friendly_id_slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY friendly_id_slugs
    ADD CONSTRAINT friendly_id_slugs_pkey PRIMARY KEY (id);


--
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: options_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY options_plans
    ADD CONSTRAINT options_plans_pkey PRIMARY KEY (id);


--
-- Name: plans_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- Name: profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: simulation_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY simulation_answers
    ADD CONSTRAINT simulation_answers_pkey PRIMARY KEY (id);


--
-- Name: simulations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY simulations
    ADD CONSTRAINT simulations_pkey PRIMARY KEY (id);


--
-- Name: solutions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY solutions
    ADD CONSTRAINT solutions_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT subscriptions_pkey PRIMARY KEY (id);


--
-- Name: tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: index_addresses_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_addresses_on_user_id ON addresses USING btree (user_id);


--
-- Name: index_alternatives_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_alternatives_on_question_id ON alternatives USING btree (question_id);


--
-- Name: index_comments_on_commentable_type_and_commentable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_comments_on_commentable_type_and_commentable_id ON comments USING btree (commentable_type, commentable_id);


--
-- Name: index_exam_questions_on_exam_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_exam_questions_on_exam_id ON exam_questions USING btree (exam_id);


--
-- Name: index_exam_questions_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_exam_questions_on_question_id ON exam_questions USING btree (question_id);


--
-- Name: index_exams_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_exams_on_user_id ON exams USING btree (user_id);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type ON friendly_id_slugs USING btree (slug, sluggable_type);


--
-- Name: index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope ON friendly_id_slugs USING btree (slug, sluggable_type, scope);


--
-- Name: index_friendly_id_slugs_on_sluggable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_id ON friendly_id_slugs USING btree (sluggable_id);


--
-- Name: index_friendly_id_slugs_on_sluggable_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_friendly_id_slugs_on_sluggable_type ON friendly_id_slugs USING btree (sluggable_type);


--
-- Name: index_images_on_imageable_type_and_imageable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_images_on_imageable_type_and_imageable_id ON images USING btree (imageable_type, imageable_id);


--
-- Name: index_options_plans_on_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_options_plans_on_plan_id ON options_plans USING btree (plan_id);


--
-- Name: index_profiles_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_profiles_on_user_id ON profiles USING btree (user_id);


--
-- Name: index_questions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_questions_on_user_id ON questions USING btree (user_id);


--
-- Name: index_simulation_answers_on_alternative_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_simulation_answers_on_alternative_id ON simulation_answers USING btree (alternative_id);


--
-- Name: index_simulation_answers_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_simulation_answers_on_question_id ON simulation_answers USING btree (question_id);


--
-- Name: index_simulation_answers_on_simulation_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_simulation_answers_on_simulation_id ON simulation_answers USING btree (simulation_id);


--
-- Name: index_simulation_answers_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_simulation_answers_on_user_id ON simulation_answers USING btree (user_id);


--
-- Name: index_simulations_on_exam_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_simulations_on_exam_id ON simulations USING btree (exam_id);


--
-- Name: index_simulations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_simulations_on_user_id ON simulations USING btree (user_id);


--
-- Name: index_solutions_on_question_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_solutions_on_question_id ON solutions USING btree (question_id);


--
-- Name: index_subscriptions_on_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_plan_id ON subscriptions USING btree (plan_id);


--
-- Name: index_subscriptions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_subscriptions_on_user_id ON subscriptions USING btree (user_id);


--
-- Name: index_tickets_on_ticketable_type_and_ticketable_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tickets_on_ticketable_type_and_ticketable_id ON tickets USING btree (ticketable_type, ticketable_id);


--
-- Name: index_tickets_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_tickets_on_user_id ON tickets USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_versions_on_item_type_and_item_id ON versions USING btree (item_type, item_id);


--
-- Name: fk_rails_047ab75908; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT fk_rails_047ab75908 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_04c8757c7c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY simulation_answers
    ADD CONSTRAINT fk_rails_04c8757c7c FOREIGN KEY (question_id) REFERENCES questions(id);


--
-- Name: fk_rails_1ef6db8efd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exams
    ADD CONSTRAINT fk_rails_1ef6db8efd FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_208d38032d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY simulation_answers
    ADD CONSTRAINT fk_rails_208d38032d FOREIGN KEY (simulation_id) REFERENCES simulations(id);


--
-- Name: fk_rails_2335129f4c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternatives
    ADD CONSTRAINT fk_rails_2335129f4c FOREIGN KEY (question_id) REFERENCES questions(id);


--
-- Name: fk_rails_2a913b0c0a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY simulations
    ADD CONSTRAINT fk_rails_2a913b0c0a FOREIGN KEY (exam_id) REFERENCES exams(id);


--
-- Name: fk_rails_312cfca202; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY simulations
    ADD CONSTRAINT fk_rails_312cfca202 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_48c9e0c5a2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT fk_rails_48c9e0c5a2 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_4922dbc486; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY simulation_answers
    ADD CONSTRAINT fk_rails_4922dbc486 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_538a036fb9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tickets
    ADD CONSTRAINT fk_rails_538a036fb9 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_63d3df128b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT fk_rails_63d3df128b FOREIGN KEY (plan_id) REFERENCES plans(id);


--
-- Name: fk_rails_819be3c7b2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exam_questions
    ADD CONSTRAINT fk_rails_819be3c7b2 FOREIGN KEY (question_id) REFERENCES questions(id);


--
-- Name: fk_rails_8590522ca6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY options_plans
    ADD CONSTRAINT fk_rails_8590522ca6 FOREIGN KEY (plan_id) REFERENCES plans(id);


--
-- Name: fk_rails_8a459e539f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY solutions
    ADD CONSTRAINT fk_rails_8a459e539f FOREIGN KEY (question_id) REFERENCES questions(id);


--
-- Name: fk_rails_933bdff476; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY subscriptions
    ADD CONSTRAINT fk_rails_933bdff476 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_b45b8182ff; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY exam_questions
    ADD CONSTRAINT fk_rails_b45b8182ff FOREIGN KEY (exam_id) REFERENCES exams(id);


--
-- Name: fk_rails_d8c4626ea0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY simulation_answers
    ADD CONSTRAINT fk_rails_d8c4626ea0 FOREIGN KEY (alternative_id) REFERENCES alternatives(id);


--
-- Name: fk_rails_e424190865; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY profiles
    ADD CONSTRAINT fk_rails_e424190865 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20171205205531'),
('20171208004100'),
('20171208005343'),
('20171208005406'),
('20171208005447'),
('20171208005509'),
('20171208005727'),
('20171208005757'),
('20171208005819'),
('20171208005848'),
('20171208005921'),
('20171208010008'),
('20171208010037'),
('20171208010105'),
('20171208010126'),
('20171220032619'),
('20180105014330'),
('20180105025854'),
('20180105142240'),
('20180106052208'),
('20180117104821'),
('20180118132132'),
('20180123043455'),
('20180123151308'),
('20180130221410'),
('20180130235041'),
('20180202135014'),
('20180203010205'),
('20180203133054'),
('20180203141254'),
('20180203142526'),
('20180204213030'),
('20180204221758'),
('20180205115727'),
('20180205155301'),
('20180205160438');


