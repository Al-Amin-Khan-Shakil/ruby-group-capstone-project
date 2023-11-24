CREATE DATABASE catalog;

CREATE TABLE item (
    id  INT GENERATED ALWAYS AS IDENTITY,
    genre_id INT,
    author_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    PRIMARY KEY(id),
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (author_id) REFERENCES authors (id),
    FOREIGN KEY (label_id) REFERENCES labels (id),
    FOREIGN KEY (source_id) REFERENCES source (id),
);

CREATE TABLE books (
    publisher VARCHAR(100),
    cover_state VARCHAR(100),
);

CREATE TABLE genre (
    id  INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE labels (
    id  INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE game (
    last_played_at DATE,
    multiplayer BOOLEAN,
);

CREATE TABLE movie (
    silet BOOLEAN
);

CREATE TABLE music_album (
    on_spotify BOOLEAN
);

CREATE TABLE authors (
    id  INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    PRIMARY KEY(id)
    FOREIGN KEY(id) REFERENCES item(id)
);

CREATE TABLE source (
    id  INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    PRIMARY KEY(id)
    FOREIGN KEY(id) REFERENCES item(id)
);