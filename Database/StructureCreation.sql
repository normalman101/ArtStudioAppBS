CREATE TABLE table_personal_files
(
    id                  INTEGER PRIMARY KEY AUTOINCREMENT,
    name                TEXT    NOT NULL CHECK ( length(name) > 0 ),
    surname             TEXT    NOT NULL CHECK ( length(surname) > 0 ),
    patronymic          TEXT    NOT NULL DEFAULT '',
    gender              INTEGER NOT NULL CHECK ( gender == 0 OR gender == 1 ),
    series              TEXT    NOT NULL CHECK ( length(series) > 0 ),
    number              TEXT    NOT NULL CHECK ( length(number) > 0 ),
    birth_date          TEXT    NOT NULL CHECK ( length(birth_date) > 0 ),
    birth_place         TEXT    NOT NULL CHECK ( length(birth_place) > 0 ),
    residential_address TEXT    NOT NULL CHECK ( length(residential_address) > 0 )
);

CREATE TABLE table_roles
(
    id   INTEGER PRIMARY KEY AUTOINCREMENT,
    role TEXT NOT NULL CHECK ( length(role) > 0 )
);

CREATE TABLE table_project_activities
(
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    name          TEXT NOT NULL CHECK ( length(name) > 0 ),
    deadline_date TEXT NOT NULL CHECK ( length(deadline_date) > 0 )
);

CREATE TABLE table_executors
(
    id                INTEGER PRIMARY KEY AUTOINCREMENT,
    alias             TEXT NOT NULL CHECK ( length(alias) > 0 ),
    registration_date TEXT NOT NULL CHECK ( length(registration_date) > 0 ),
    personal_file_id REFERENCES table_personal_files (id)
);

CREATE TABLE table_project_roles
(
    id               INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id       INTEGER REFERENCES table_project_activities (id),
    executor_role_id INTEGER REFERENCES table_roles (id),
    executor_id      INTEGER REFERENCES table_executors (id)
);