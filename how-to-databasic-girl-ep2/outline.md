How to Database-ic Girl 2: Won't You Take Me To Aggregate Funkytown

COUNT()
SUM()
MAX()
MIN()
ROUND()

GROUP BY
HAVING

#Sprinkles Date

#Selfies --> SELECT face, COUNT(face) FROM selfies ---- GROUP BY face;
  duckface
  dog snapchat filter
  flower crown snapchat filter
  peace sign
  mirror selfies
  sorority poses
  gym selfies

id, name, type, likes

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

## Cupcakes
id, item, category, price

#Sprinkles Items --> SELECT item, MAX(price) FROM sprinkles GROUP BY item;
#Sprinkles Categories -->
SELECT category, SUM(price) FROM sprinkles GROUP BY category;

Most expensive item from most expensive category -->
  SELECT item, MAX(SUM(price) FROM sprinkles GROUP BY category)
  FROM sprinkles
  GROUP BY item;


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











#Forever21

#Starbucks

#Pumpkin Spice stuff

#Cat Eyeliner

#Watches Reality TV

#Oversized T-shirt with Shorts

#Being in a Sorority

#Says 'Like' a lot

#Taylor Swift

#Uggs

#Boxed Wine

#Brunch

#Fancy Nail Art

#Spray Tan

#Victoria Secrets

#Pink
