## Phone Numbers
sprinkles=# SELECT * FROM numbers;
 id |      name       |    number
----+-----------------+--------------
  1 | Math Class Girl | 555-555-4439
  2 | Starbucks Girl  | 555-555-2433
  3 | Redhead Girl    | 555-555-1111
  4 | Steve           | 555-555-0138
  5 | Froyo Girl      | 555-555-9210
(5 rows)

CREATE TABLE numbers (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50),
  number VARCHAR(12)
  );

INSERT INTO numbers (id, name, number) VALUES
  (1, 'Math Class Girl', '555-555-4439'),
  (2, 'Starbucks Girl', '555-555-2433'),
  (3, 'Redhead Girl', '555-555-1111'),
  (4, 'Steve', '555-555-0138'),
  (5, 'Froyo Girl', '555-555-9210');


__________________________________________________________________
__________________________________________________________________


## Texts
sprinkles=# SELECT * FROM texts;
 id |                        text                         | delivery | numbers_id
----+-----------------------------------------------------+----------+------------
  1 | sup dawg                                            | incoming |          4
  2 | not much just playin                                | outgoing |          4
  3 | thats whatsup. Holla if ya get bored. im so lonely  | incoming |          4
  4 | uhhh ok                                             | outgoing |          4
  5 | hey whatsup? ;)                                     | outgoing |          1
  6 | hey qt ;) ;)                                        | outgoing |          3
  7 | iv got a bf                                         | incoming |          3
  8 | :(                                                  | outgoing |          3
  9 | Hey this is Matt from Froyo Heaven! What's shakin'? | outgoing |          5
 10 | Heyy! just at the gym 💪  whats up                   | incoming |          5
(10 rows)

CREATE TABLE texts (
  id INTEGER PRIMARY KEY,
  text VARCHAR(255),
  delivery VARCHAR(8),
  numbers_id INTEGER
  );

INSERT INTO texts (id, text, delivery, numbers_id) VALUES
  (1, 'sup dawg',                                            'incoming', 4),
  (2, 'not much just playin',                                'outgoing', 4),
  (3, 'thats whatsup. Holla if ya get bored. im so lonely',  'incoming', 4),
  (4, 'uhhh ok',                                             'outgoing', 4),
  (5, 'hey whatsup? ;)',                                     'outgoing', 1),
  (6, 'hey qt ;) ;)',                                        'outgoing', 3),
  (7, 'iv got a bf',                                         'incoming', 3),
  (8, ':(',                                                  'outgoing', 3),
  (9, 'Hey this is Matt from Froyo Heaven! What''s shakin''?', 'outgoing', 5),
  (10, 'Heyy! just at the gym 💪  whats up',                 'incoming', 5);


__________________________________________________________________
__________________________________________________________________


## Cupcakes
id, item, category, price

sprinkles=# SELECT * FROM sparkles ORDER BY id;
 id |                 item                  | category  | price
----+---------------------------------------+-----------+-------
  1 | Banana Cupcake                        | Cupcakes  |  4.25
  2 | Dark Chocolate Cupcake                | Cupcakes  |   4.5
  3 | Pumpkin Cupcake                       | Cupcakes  |  4.25
  4 | Red Velvet Cupcake                    | Cupcakes  |   4.5
  5 | Vanilla Milk Chocolate Deluxe Cupcake | Cupcakes  |  5.25
  6 | Butter Pecan                          | Ice Cream |  3.75
  7 | Coffee Fudge Almond                   | Ice Cream |  3.75
  8 | Dark Chocolate                        | Ice Cream |  3.75
  9 | Triple Chocolate                      | Ice Cream |  4.75
 10 | Vanilla Bean                          | Ice Cream |  3.75
 11 | Sparkles Sundae                       | Ice Cream |  6.75
 12 | Double Scoop Sundae                   | Ice Cream |  7.75
 13 | Triple Scoop Sundae                   | Ice Cream |  9.75
 14 | Sparkles Shake                        | Ice Cream |   8.5
 15 | Chocolate Chip Cookie                 | Cookies   |     3
 16 | Sparkles Sig Peanut Butter Cookie     | Cookies   |   4.5
 17 | Fudge Brownie                         | Cookies   |     3
(17 rows)


CREATE TABLE sparkles (
  id INTEGER PRIMARY KEY,
  item VARCHAR(50),
  category VARCHAR(20),
  price REAL
  );

INSERT INTO sparkles (id, item, category, price) VALUES
  (1,  'Banana Cupcake',                        'Cupcakes',  4.25),
  (2,  'Dark Chocolate Cupcake',                'Cupcakes',  4.50),
  (3,  'Pumpkin Cupcake',                       'Cupcakes',  4.25),
  (4,  'Red Velvet Cupcake',                    'Cupcakes',  4.50),
  (5,  'Vanilla Milk Chocolate Deluxe Cupcake', 'Cupcakes',  5.25),
  (6,  'Butter Pecan',                          'Ice Cream', 3.75),
  (7,  'Coffee Fudge Almond',                   'Ice Cream', 3.75),
  (8,  'Dark Chocolate',                        'Ice Cream', 3.75),
  (9,  'Triple Chocolate',                      'Ice Cream', 4.75),
  (10, 'Vanilla Bean',                          'Ice Cream', 3.75),
  (11, 'Sparkles Sundae',                       'Ice Cream', 6.75),
  (12, 'Double Scoop Sundae',                   'Ice Cream', 7.75),
  (13, 'Triple Scoop Sundae',                   'Ice Cream', 9.75),
  (14, 'Sparkles Shake',                        'Ice Cream', 8.50),
  (15, 'Chocolate Chip Cookie',                 'Cookies',   3.00),
  (16, 'Sparkles Sig Peanut Butter Cookie',     'Cookies',   4.50),
  (17, 'Fudge Brownie',                         'Cookies',   3.00);


__________________________________________________________________
__________________________________________________________________





# Selfies
sprinkles=# SELECT * FROM selfies;
 id |           name           |             type              | likes
----+--------------------------+-------------------------------+-------
  1 | Friday Niiiiight         | Duckface                      |    57
  2 | Omg sooo turnnnt         | Duckface                      |    62
  3 | VodCran is my gurrrrl    | Duckface                      |    37
  4 | Girls best friend Bella! | Duckface                      |    37
  5 | Lovin me                 | Duckface                      |    68
  6 | Saturday Niiiiiight      | Duckface                      |    43
  7 | Bella and Me woof!       | Snapchat Filter: Dog          |    72
  8 | 2cute4u                  | Snapchat Filter: Dog          |    69
  9 | puppy eyez <3 <3 ~       | Snapchat Filter: Dog          |    81
 10 | h8rs gonna h8            | Snapchat Filter: Flower Crown |    51
 11 | grrrrrrlll!              | Snapchat Filter: Flower Crown |    49
 12 | Afroditeee               | Snapchat Filter: Flower Crown |    57
 13 | make luv not war         | Peace Sign                    |    33
 14 | piece is love            | Peace Sign                    |    21
 15 | girrrrrrl                | Mirror Selfie                 |    89
 16 | Basic Selfie             | Mirror Selfie                 |   101
 17 | Lovin meeee              | Mirror Selfie                 |    72
 18 | Friday Niiiiiiight       | Mirror Selfie                 |    92
 19 | Giiirrrrrrrrlsss Reppin  | Sorority Poses                |    43
 20 | Sisters 4 liffffe        | Sorority Poses                |    52
 21 | Lov yaaal                | Sorority Poses                |    43
 22 | Getting me on!           | Gym Selfies                   |    83
 23 | Too much ice cream!      | Gym Selfies                   |    95
 24 | Your body is a temple!   | Gym Selfies                   |    93
(24 rows)

































CREATE TABLE numbers (
  id INTEGER PRIMARY KEY,
  name VARCHAR(50),
  number VARCHAR(12)
  );

INSERT INTO numbers (id, name, number) VALUES
  (1, 'Math Class Girl', '555-555-4439'),
  (2, 'Starbucks Girl', '555-555-2433'),
  (3, 'Redhead Girl', '555-555-1111'),
  (4, 'Steve', '555-555-0138'),
  (5, 'Froyo Girl', '555-555-9210');

CREATE TABLE texts (
  id INTEGER PRIMARY KEY,
  text VARCHAR(255),
  delivery VARCHAR(8),
  numbers_id INTEGER
  );

INSERT INTO texts (id, text, delivery, numbers_id) VALUES
  (1, 'sup dawg',                                            'incoming', 4),
  (2, 'not much just playin',                                'outgoing', 4),
  (3, 'thats whatsup. Holla if ya get bored. im so lonely',  'incoming', 4),
  (4, 'uhhh ok',                                             'outgoing', 4),
  (5, 'hey whatsup? ;)',                                     'outgoing', 1),
  (6, 'hey qt ;) ;)',                                        'outgoing', 3),
  (7, 'iv got a bf',                                         'incoming', 3),
  (8, ':(',                                                  'outgoing', 3),
  (9, 'Hey this is Matt from Froyo Heaven! What''s shakin''?', 'outgoing', 5),
  (10, 'Heyy! just at the gym 💪  whats up',                 'incoming', 5);

CREATE TABLE sparkles (
  id INTEGER PRIMARY KEY,
  item VARCHAR(50),
  category VARCHAR(20),
  price REAL
  );

INSERT INTO sparkles (id, item, category, price) VALUES
  (1,  'Banana Cupcake',                        'Cupcakes',  4.25),
  (2,  'Dark Chocolate Cupcake',                'Cupcakes',  4.50),
  (3,  'Pumpkin Cupcake',                       'Cupcakes',  4.25),
  (4,  'Red Velvet Cupcake',                    'Cupcakes',  4.50),
  (5,  'Vanilla Milk Chocolate Deluxe Cupcake', 'Cupcakes',  5.25),
  (6,  'Butter Pecan',                          'Ice Cream', 3.75),
  (7,  'Coffee Fudge Almond',                   'Ice Cream', 3.75),
  (8,  'Dark Chocolate',                        'Ice Cream', 3.75),
  (9,  'Triple Chocolate',                      'Ice Cream', 4.75),
  (10, 'Vanilla Bean',                          'Ice Cream', 3.75),
  (11, 'Sparkles Sundae',                       'Ice Cream', 6.75),
  (12, 'Double Scoop Sundae',                   'Ice Cream', 7.75),
  (13, 'Triple Scoop Sundae',                   'Ice Cream', 9.75),
  (14, 'Sparkles Shake',                        'Ice Cream', 8.50),
  (15, 'Chocolate Chip Cookie',                 'Cookies',   3.00),
  (16, 'Sparkles Sig Peanut Butter Cookie',     'Cookies',   4.50),
  (17, 'Fudge Brownie',                         'Cookies',   3.00);
