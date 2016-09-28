How to Database-ic Girl
-The following is a tutorial using PostgreSQL 9.5.3
-Code with me: http://rextester.com/XMZT52812— it doesn’t work with every query, so if you find a better one, please email me at mrice@mattricedev.com
So you finally meet the girl of your dreams. She’s you’re soulmate, and you know that because her shoulder accidentally grazed your arm when she went to grab her low-fat froyo. You want to make conversation but realize you’ve never talked to a girl before. You come to the obvious conclusion that talking to girls is like talking to a database. You walk up to her but your nerves set in and you suddenly realize you forgot everything about databases. We’ve all had this nightmare. I pieced together this introduction SQL so you can look over it and keep your composure in the heat of the moment. Maybe you’ll even get her number by the end of the day. And at the very least, if you still can’t talk to girls, at least you’ll be able to talk to databases.
Database Management Systems (DBMS) — much like, but distinct from BDSM — is basically just a system that the user interacts with to collect and analyze data. SQL is one of those systems. It uses tables with rows and columns to organize data, which is accessible to the user to read and play around with.
We like collecting data, and in the advent of the internet we collect a staggering amount of it — far too much to physically write down or parse through in its raw form. Enter the DBMS to bring balance and make the process of using and analyzing data easier.
Databases are composed of tables — kind of like the table on which you and your date will share a nice candle lit dinner. But instead of holding pasta, these tables hold organized sets of data along an x and y axis under the headers columns and rows, respectively.
Columns, in line with their name, hold sets of data vertically — meaning they hold data by a certain category, be that by name, title, id, age, or any other category you can think of. Rows, by contrast, hold unique sets of data horizontally. Unlike columns and similar to your new girlfriend, rows have personality and are unique. Each row contains an instance of each category in the table. So if my table has “id, name, age, IQ” as columns, then each row has a unique set containing an id, name, age, and IQ. While rows have personality and are unique, they are often trivial by themselves and ignored without some type of microscope (if you ever need to explain rows to your girlfriend, just leave this part out).
The microscope we need is essentially some system to pinpoint and extract the row, set of rows, pieces of information within a row, or some permutation of that. Our microscope in SQL involves a set of predicates and antecedents. When she says “I love,” she begins her sentence with a predicate. Though these words make your heart flutter, they by themselves are an incomplete thought and need some direction. “Froyo,” then, would be her antecedent.
I LOVE froyo;
The antecedent gives direction and specifies exactly what she loves. Yet as your heart crumbles, find some happiness in knowing that this is how sentences in SQL are made.
SELECT
In navigating SQL, the first predicate is the SELECT method. This lets us find practically anything we want in a table or set of tables according to the constraints we set. The antecedent for SELECT — or the indicator that follows SELECT — is what identifies the data we want. The asterisk (*) selects everything.
SELECT * ...;
Or we can specify by column — e.g., SELECT name, age, etc. — and we will have only those columns returned to us.
SELECT name ...;
Yet we need one more predicate and antecedent to get our first set of data. Compare this to when she says “I LOVE froyo.” That’s amazing, right? Well, maybe you feel like it is insightful information, but really its trivial. A lot of people love froyo. We like broad statements, but it’s really a little too broad to be a great of a conversation starter.
FROM
The second predicate is FROM. FROM allows us to specify the table or set of tables from which we want to grab our data. The antecedent that follows is simply the name of the table (or at a more advanced level, an interaction between tables). Using SELECT and FROM together specifies the column(s) we want returned to us in a particular table.
SELECT *
FROM table;
This returns everything from the users table (assuming we have such table).
So, you turn back to your date and repeat to her “You love froyo?” and she corrects herself saying “Well no…,”
I LOVE froyo
FROM froyo_heaven;
Okay, NOW we are getting somewhere. You have a funny memory related to Froyo Heaven and begin your story about some strawberry and chocolate froyo you once had.
Let’s see what this looks like by using an actual table:
SELECT *
FROM froyo_heaven;

And if we only want flavors returned rather than the whole table:
SELECT flavor
FROM froyo_heaven;

Finally, if we can specify multiple columns to get a more particularized table:
SELECT flavor, price
FROM froyo_heaven;

WHERE
A third predicate — WHERE — can be used to extract a particular row of data rather than having the entire set returned. The antecedent associated with WHERE identifies the row.
She’s blushing a little bit because while she started off the conversation, she wasn’t specific enough. She corrects herself again by saying, “No, I mean I LOVE froyo FROM froyo_heaven WHERE flavor = ‘Chocolate’.” “Hmm, that’s oddly specific,” you think. However, she’s pretty and seems into you — and not because you keep buying her more froyo. You try to picture this in your head:
SELECT flavor
FROM froyo_heaven
WHERE flavor = 'Chocolate';

She’s looking at you for your opinion. You say, “You know, I always eat Chocolate Ice Cream, but I’ve never had Chocolate Froyo. I usually go for the more fruity flavored froyos — like the last 3 items on the menu”:
SELECT id, flavor
FROM froyo_heaven
WHERE id >= 6;

As exemplified, the great thing about SQL is that the code can often be read verbatim and still make sense (with some exceptions like exchanging `all` for `*`. The difficulty, then, comes with syntax especially at more complex levels.
Most SQL users follow a standard style-guide as well, which boils down to essentially putting their predicates in all caps and the antecedents in lower case letters. E.g.:
SELECT flavor, price
FROM froyo_heaven;
In addition, the query is organized in blocks starting with each predicate. E.g.:
SELECT flavor, price
FROM froyo_heaven
WHERE id = 3;
This styling is not necessary but it helps reading the code and understanding what is what — especially in particularly long queries.
ORDER BY, LIMIT, and DESC
Some more predicate-antecedent combinations can be added:
ORDER BY name #=> orders the return values alphabetically by name (or numerically if you order it by an integer like ‘id’).
She brags that she comes here so much she has all the flavors memorized. You laugh and challenge her, “Oh yeah? Can you name them all alphabetically?” She smiles at your challenge and lists them off faster than you can read them:
SELECT *
FROM froyo_heaven
ORDER BY flavor;

LIMIT n #=> where `n` can be any number. This limits the list to the first `n` items.
Your jaw drops at the speed she listed the flavors off. “Wow! I think I can only name the first 3 on the list — because everyone knows the normal flavors.
SELECT id, flavor
FROM froyo_heaven
ORDER BY id
LIMIT 3;
(rextester doesn't like LIMIT; but it works in postgreSQL)

DESC #=> This flips the order of the list presented when used with ORDER BY. It comes right before `LIMIT n`.
Your date laughs, “Whaaat? You can’t name your go-to flavors? You know, the fruity ones!”
You smack your head, “Oh yeah! Duh of course I know those.”
SELECT id, flavor
FROM froyo_heaven
ORDER BY id
DESC LIMIT 3;

JOINS, an introduction
JOIN ON #=> This is a much more complex predicate-antecedent combination. It joins multiple tables together to return a combined set of data. We will go over JOINS more in depth in a later lesson, so I’ll just start with an introduction to JOINS to understand how relational databases work.
It’s about 30 minutes later and your new girlfriend is still talking about froyo. It’s not a bad conversation, but by this point you kinda zone out because she’s talking a little too much and her froyo obsession is starting to get weird.
Nevertheless, you catch that she’s telling you what flavors her friends like from Froyo Heaven. She lists off all of her really close friends:
SELECT *
FROM friends;

She continues by talking about them at Froyo Heaven, but is having a little trouble:
SELECT friends.first_name, friends.last_name, froyo_heaven.flavor
FROM froyo_heaven;
This query selects the columns: “first_name” and “last_name” from table: “friends” and column: “flavor” from table: “froyo_heaven”. Although it selects columns from multiple tables, it only queries the “froyo_heaven” table (i.e., “FROM froyo_heaven).
You look around and raise an eyebrow, expecting to see her friends. So you turn back to her and say, “But your friends aren’t here. Where are they coming from?”
She slaps her head “Oh! I almost forgot to JOIN them into this conversation!”
SELECT friends.first_name, friends.last_name, froyo_heaven.flavor
FROM froyo_heaven
JOIN friends;
Though this is still incomplete, what she’s saying makes a little bit more sense. You can picture all the flavors in Froyo Heaven and all of her friends, and admittedly the story is getting a little more interesting.
However, this query does not yet create the relationship that your date wants to create. If you run this query, it won’t work because you are, essentially, telling it: “Create this relationship between froyo_heaven and friends for me…” but then stop short of telling it the rules for the relationship. The relationship we want is between her friends and their favorite froyo flavors. To do that, we need one more piece.
Reflecting on this, you ask, “So who likes what?” She leans in closer and speaks a little softer — she’s a pro at gossip and though you hate gossip, it sure sounds interesting, “Get this,”
SELECT friends.first_name, friends.last_name, froyo_heaven.flavor
FROM froyo_heaven
JOIN friends
ON friends.froyo_heaven_id = froyo_heaven.id
ORDER BY last_name;
*(ORDER BY is not necessary for this query to work)*

You listen to her list out her friends and which flavors they like and catch her specifically emphasizing the last name and flavor. Your eyes widen, and you exclaim “Sharon likes Rocky Road?”
“Shhh! Yes, I couldn’t believe it but Jan said Tiffany heard that Catherine saw her buying some last Thursday night.”
You feign surprise a little longer because your date seems to enjoy the fact that you’re interested even though you don’t really know Sharon, Jan, Tiffany, Catherine, nor any of her other friends.
Fortunately, it pays off. At the end of the day, she says she had a really good time. She mentions that guys usually don’t like talking to her for too long for some reason, but you stuck around, so you’re “really sweet.” She gives you her number and you say “I had a lot of fun and learned a lot about databases!” She raises an eyebrow, but you play it off as a joke by laughing. She laughs awkwardly. Congrats, you basically have a girlfriend. That’s how dating works, trust me. And all thanks to databases! Good job!
