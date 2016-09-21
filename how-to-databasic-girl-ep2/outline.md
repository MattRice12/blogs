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
