CREATE TYPE task_type AS ENUM ('Messe','Schulebesuch','Sonstiges');
CREATE TYPE status AS ENUM ('offen','erledigt','archiviert');
CREATE TABLE task (
    id serial PRIMARY KEY,
    name varchar(100) NOT NULL,
    datum date,
    task_type task_type,
    status status,
    comment text

);

CREATE TABLE task_person (
    task_id integer REFERENCES task(id),
    person_id integer REFERENCES person(id),
    PRIMARY KEY (task_id, person_id)
);

CREATE TABLE task_item (
    task_id integer REFERENCES task(id),
    item_id integer REFERENCES item(id),
    PRIMARY KEY (task_id, item_id)
);

CREATE TABLE person (
    id serial PRIMARY KEY,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL
)
