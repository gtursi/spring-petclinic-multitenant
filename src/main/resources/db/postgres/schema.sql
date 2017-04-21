CREATE TABLE vets (
  id serial not null,
  first_name character varying(30),
  last_name  character varying(30),
  PRIMARY KEY (id)
);
CREATE INDEX vets_last_name ON vets (last_name);

CREATE TABLE specialties (
  id   serial not null,
  name character varying(80),
  PRIMARY KEY (id)
);
CREATE INDEX specialties_name ON specialties (name);

CREATE TABLE vet_specialties (
  vet_id       INTEGER NOT NULL,
  specialty_id INTEGER NOT NULL
);
ALTER TABLE vet_specialties ADD CONSTRAINT fk_vet_specialties_vets FOREIGN KEY (vet_id) REFERENCES vets (id);
ALTER TABLE vet_specialties ADD CONSTRAINT fk_vet_specialties_specialties FOREIGN KEY (specialty_id) REFERENCES specialties (id);

CREATE TABLE types (
  id   serial not null,
  name character varying(80),
  PRIMARY KEY (id)
);
CREATE INDEX types_name ON types (name);

CREATE TABLE owners (
  id         serial not null,
  first_name character varying(30),
  last_name  character varying(30),
  address    character varying(255),
  city       character varying(80),
  telephone  character varying(20),
  PRIMARY KEY (id)
);
CREATE INDEX owners_last_name ON owners (last_name);

CREATE TABLE pets (
  id         serial not null,
  name       character varying(30),
  birth_date timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
  type_id    INTEGER NOT NULL,
  owner_id   INTEGER NOT NULL,
  PRIMARY KEY (id)
);
ALTER TABLE pets ADD CONSTRAINT fk_pets_owners FOREIGN KEY (owner_id) REFERENCES owners (id);
ALTER TABLE pets ADD CONSTRAINT fk_pets_types FOREIGN KEY (type_id) REFERENCES types (id);
CREATE INDEX pets_name ON pets (name);

CREATE TABLE visits (
  id          serial not null,
  pet_id      INTEGER NOT NULL,
  visit_date  timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
  description character varying(255),
  PRIMARY KEY (id)
);
ALTER TABLE visits ADD CONSTRAINT fk_visits_pets FOREIGN KEY (pet_id) REFERENCES pets (id);
CREATE INDEX visits_pet_id ON visits (pet_id);

CREATE  TABLE company (
  id serial NOT NULL ,
  name character varying(45) NOT NULL ,
  CONSTRAINT uni_company_name UNIQUE(name),
  PRIMARY KEY (id));

CREATE  TABLE users (
  userid serial NOT NULL ,
  company_id integer,
  username character varying(45) NOT NULL ,
  email character varying(255) NOT NULL ,
  password character varying(60) NOT NULL ,
  enabled boolean NOT NULL DEFAULT true ,
  CONSTRAINT uni_user_username UNIQUE(username),
  CONSTRAINT uni_user_email UNIQUE(email),
  CONSTRAINT fk_user_company FOREIGN KEY (company_id) REFERENCES company (id),
  PRIMARY KEY (userid));
  
CREATE TABLE user_roles (
  user_role_id serial NOT NULL,
  userid integer NOT NULL,
  role character varying(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  CONSTRAINT uni_username_role UNIQUE(role,userid),
  CONSTRAINT fk_userid FOREIGN KEY (userid) REFERENCES users (userid));

CREATE INDEX fk_userid_idx ON user_roles USING btree (userid);

CREATE TABLE ORDERS (
  id serial not null,
  date  timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
  PRIMARY KEY (id)
);
