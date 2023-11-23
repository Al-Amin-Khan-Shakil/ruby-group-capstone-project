CREATE TABLE movie(
    id INTEGER PRIMARY KEY,
    last_played_at DATE, 
    item_id INTEGER
    FOREIGN KEY(item_id) REFERENCES items(id)
); 