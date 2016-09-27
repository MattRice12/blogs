CREATE TABLE froyo_heaven (
  id INTEGER PRIMARY KEY,
  flavor VARCHAR(50),
  price REAL
  );

INSERT INTO froyo_heaven (id, flavor, price) VALUES
  (1, 'Vanilla',                   3.50),
  (2, 'Chocolate',                 3.50),
  (3, 'Strawberry',                3.50),
  (4, 'Blueberry',                 3.50),
  (5, 'Rocky Road',                3.50),
  (6, 'Kiwi Fruit Tart',           3.50),
  (7, 'Razzle Dazzle Pomegranate', 3.50),
  (8, 'Banana Islander',           3.50);


CREATE TABLE friends (
  id INTEGER PRIMARY KEY,
  froyo_heaven_id INTEGER REFERENCES froyo_heaven(id),
  first_name VARCHAR(50),
  last_name VARCHAR(50)
  );

INSERT INTO friends (id, froyo_heaven_id, first_name, last_name) VALUES
  (1, 1, 'Becky',     'Basique'),
  (2, 7, 'Abigail',   'Jones'),
  (3, 8, 'Jan',       'Smith'),
  (4, 2, 'Tiffany',   'Flanders'),
  (5, 4, 'Catherine', 'Flanders'),
  (6, 5, 'Sharon',    'Williams'),
  (7, 3, 'Debra',     'Jackson');
