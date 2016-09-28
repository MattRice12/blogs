How to Database-ic Girl 2: The SQL
-The following is a tutorial using PostgreSQL 9.5.3
-Code with me: http://rextester.com/GRSOX25287 — it doesn’t work with every query, so if you find a better one, please email me at mrice@mattricedev.com
Getting That Second Date
It’s the day after your first date with the Froyo girl — and you still call her Froyo girl because you were soooo interested in the conversation, you forgot to ask her for her name. But don’t worry, you’ve done this dance before. Her name is bound to come up sometime. You just have to play it cool until then.
You know you’re good at playing it cool because you refrained from texting her within the first 24 hours. Good work, she’s probably crazy about you now. But still, you can’t wait too long otherwise she might go too crazy, and she deserves better than that. So you pick up your phone to text her.

Table: numbers
You remember from last night how to find an item on a table. You’re looking for the number associated with her name:
SELECT number
FROM numbers
WHERE name = 'Froyo Girl';
Or if you don’t completely remember the name you saved in your phone, you can search for the number by matching only part of the name:
SELECT number
FROM numbers
WHERE name LIKE 'Froyo%';
I will cover LIKE better in a later lesson. But in short, it is an operator used with the WHERE clause to search for a specific pattern in a column.
The % sign is a placeholder for unknown characters. If I just searched ‘Froyo’, the query would only return phone numbers for names that EXACTLY match ‘Froyo’. By adding %, the query returns numbers for names starting with Froyo and then continue (or not) with anything after that — e.g., ‘Froyo Queen’. If I put % before ‘Froyo’, then the search would return phone numbers for any name ending in ‘Froyo’ — e.g., ‘Mrs. Froyo’.
Pick your favorite, but either way both = and LIKE queries return the number 555–555–9210 — just the number you’re looking for!
You send her the following text: “Hey this is Matt from Froyo Heaven! What’s shakin’?” You set the phone down and feel really cool and casual. People are probably too nervous when they write their first texts and say something weird. But not you. You pick your phone back up and re-read your text.

Table: texts
Yep, really cool and casual.
A few minutes roll by while you’re thinking about this. Strange that she hasn’t texted back.
You think, Ah! maybe it’s just hidden in the clutter of all my texts. Let me search just for conversations between us. So you query the database:
SELECT numbers.name, texts.text, texts.delivery
FROM texts
JOIN numbers
ON texts.numbers_id = numbers.id
WHERE numbers_id = 5;
Unfortunately, this only returns:

Inner Join: JOIN texts ON numbers
You think, Maybe she’s unsure how to respond. Shakin’… hah. You’re cool, don’t worry. It’s not a weird message. She probably is shaking. Why would she be shaking though? Shaking with excitement, probably. Maybe… that’s kind of strange though. Maybe she doesn’t know what “shakin’” means. Why would you say “shakin’?” Just say something norma — .
Your phone buzzes and she responds “Heyy! just at the gym 💪 whats up”.
The same query as above now returns:

Inner Join: JOIN texts ON numbers
Oh thank God she responded. You type back right away, seeing if she’s free to do something tomorrow. After you press “send” you realize you responded too quickly. So, this time you put your phone down and walk away so that when she texts you don’t see it right away and seem like you’ve got so much going on you must be fun. Yeah.
You check your phone 5 minutes later, and she still hasn’t responded. You watch some TV. The show finishes and still nothing. Rinse and repeat. You keep checking. Maybe you didn’t hear it buzz. Nope. She’s probably creeped out by you and already on a date with another guy. Time to lay down on the floor and criticize yourself. Finally 3 hours later she responds “yeah!” Awesome! That’s basically how you get a second date.
Won’t you take me to… Aggregate Function-town!
The next day rolls around and you pick her up at her house. She asks where you’re taking her. Oops! You didn’t think that far ahead. She kinda realizes that and says “Oh! Do you like cupcakes? Let’s go to Sparkles!” You’ve never heard of the place because you don’t like cupcakes, but say, “Yeah! I love cupcakes!” because she’s hot and honestly you didn’t have anything else planned.
You two walk into the shop. It’s a charming little shop. The top half of the store is painted pink and the bottom half is painted brown—you realize that the room itself is a cupcake and you’re inside of it. Delightful.
You walk up to the cashier who greets you with way too much excitement. “Welcome to Sparkles! Where everything we make sparkles for yo — Oh my Goodddd! Hi Becky!!!”
Your date responds, “Giiiiiiiirl!!!!” The cashier and your date then engage in a lot of quick back and forth high pitched chatter, while you stand there with your hands in your pockets. At least you finally know your date’s name — Becky. Anyways, they really go on for a while. Trust me, this is fine. This happens. Just be patient. She’ll introduce you soon. Maybe. If not, that’s fine. Honestly she’ll probably forget to introduce you. But that’s okay too.
“I can’t believe we ran into each other! So rando! Sooooo anyways let me get ummm…”
Oh we’re ordering already, you think. You look at the menu:
SELECT *
FROM sparkles;

Table: sparkles
Your first thoughts are: Wow this place is really expensive. No big deal; it’s a date, so you should splurge a little bit. Plus it’ll make your date feel special seeing that you don’t mind spending a little more just to see her happy. Everyone likes being treated special.
She says “Let me get a number 1, 4, 5, 10, and 17!”
The cashier says “Omg you have to try our new Sparkles Sig Peanut Butter Cookie!”
“Okay then a 1, 4, 5, 10, 17, and… where is it… whatever number the Sparkles Sig cookie is!”
SELECT item
FROM sparkles
WHERE id IN (1, 4, 5, 10, 17) OR item LIKE 'Sparkles Sig%';

Table: sparkles
That’s a lot of items… but exactly how many items is it? To do this, you can use an Aggregate Function. Aggregate functions are used in database management to group multiple rows together as input on certain criteria to form a single value or measurement. Some aggregate functions are COUNT(), SUM(), MAX(), MIN(), AVG(). The latter four only work with columns containing numbers.
Let’s count the number of items here. But before we do, note that counting by a specific column — e.g., COUNT(item) — only counts rows where the value is not null. To count rows regardless of null values, use COUNT(*) instead. Either will return the same count here:
SELECT COUNT(item)
FROM sparkles
WHERE id IN (1, 4, 5, 10, 17) OR item LIKE 'Sparkles Sig%';

COUNT(item)
Wow! 6 items. That’s a lot. But maybe it isn’t that bad. It’s cupcakes after all. You look back at the menu to see the prices of each particular item:
SELECT item, price
FROM sparkles
WHERE id IN (1, 4, 5, 10, 17) OR item LIKE 'Sparkles Sig%';

Table: sparkles
Hmm… That does look a little pricy. But to get a real estimate you need to add the prices together. To do so, you need to SUM() the price.
SELECT SUM(price)
FROM sparkles
WHERE id IN (1, 4, 5, 10, 17) OR item LIKE 'Sparkles Sig%';

SUM(price)
25.25 huh… 25.25 what? You scratch your head and say OH WAIT! I can show the sum in dollars by doing:
SELECT '$' || SUM(price) as sum
FROM sparkles
WHERE id IN (1, 4, 5, 10, 17) OR item LIKE 'Sparkles Sig%';

(This query won't work in the rextester SQL reader due to '||'; but it does work if you run it in postgreSQL in the terminal)

‘$’ || SUM(price) as sum
A lot of stuff is going on here, and if you’re still trying to wrap your head around aggregate functions themselves, you can skip this paragraph. It’s not super important; however, presentation is everything. SUM(price) is still the main part of the equation. I added'$' || before to essentially stick the dollar sign in before the sum. I added as sum after to make sure the column name stayed sum. Because we added $ before SUM(price), the system can’t guess the table name. Instead, it displays ?column? as the column name which is kind of tacky. So we set the table name as sum.
$25.25. Wow! The lobster would have been cheaper. Oh well. Maybe she plans on sharing, so you don’t have to order that much for yourself.
Out of curiosity, you want to see the average cost per item:
SELECT AVG(price)
FROM sparkles
WHERE id IN (1, 4, 5, 10, 17) OR item LIKE 'Sparkles Sig%';

AVG(price)
And you can round it further with:
SELECT ROUND(AVG(price), 2)
FROM sparkles
WHERE id IN (1, 4, 5, 10, 17) OR item LIKE 'Sparkles Sig%';

(rextester will throw an error if you don't give ROUND a second argument--e.g., ROUND(AVG(price), 2))

ROUND(AVG(price))
Normally, if you want to round a to a set number of decimal places, you can just insert into your query:
ROUND(real, integer)
However, if you try replacing `real` with `AVG(price)`, you’ll get an error. This is because postgreSQL does not define double double precision. To fix this, add `::numeric` after AVG(price):
SELECT ROUND(AVG(price)::numeric, 2)
FROM sparkles
WHERE id IN (1, 4, 5, 10, 17) OR item LIKE 'Sparkles Sig%';
(rextester doesn't need the ::numeric -- however, postgreSQL does)

ROUND(AVG(price)::numeric, 2)
Let’s say you want to get fancy with this and know how many items Becky ordered in each category (using COUNT()). To do so, let’s use the GROUP BY function. GROUP BY groups the items you are aggregating into multiple, representative sets. Let’s look at it to see it in action.
SELECT category, COUNT(item)
FROM sparkles
WHERE id IN (1, 4, 5, 10, 17) OR item LIKE 'Sparkles Sig%'
GROUP BY category
ORDER BY COUNT(item) DESC;

COUNT(item) … GROUP BY category
Don’t let GROUP BY and ORDER BY confuse you too much. GROUP BY is used with aggregate functions to count, sum, average, etc by group. ORDER BY just sorts whatever columns would have already shown up. So if I left ORDER BY out of this query, it still would have shown Cupcakes, Ice Cream, and Cookies just in the opposite order.
You can use numbers in place of the column you are calling based on the order where you call the columns after SELECT. This can be rewritten shorter by replacing category with 1 and COUNT(item) with 2. In other words:
SELECT category, COUNT(item)
FROM sparkles
WHERE id IN (1, 4, 5, 10, 17) OR item LIKE 'Sparkles Sig%'
GROUP BY 1
ORDER BY 2 DESC;
(rextester doesn't like this shortcut; but postgreSQL does)
It’s not a big change, but it helps.
We can check the total price by category in the same way:
SELECT category, SUM(price)
FROM sparkles
WHERE id IN (1, 4, 5, 10, 17) OR item LIKE 'Sparkles Sig%'
GROUP BY 1
ORDER BY 2 DESC;

SUM(price) … GROUP BY category
Finally, we can add the qualifier HAVING. This is added after GROUP BY to limit the groups to whatever qualifier you set. Let’s try this by only showing groups that cost you more than $3.50.
SELECT category, SUM(price)
FROM sparkles
WHERE id IN (1, 4, 5, 10, 17) OR item LIKE 'Sparkles Sig%'
GROUP BY 1
HAVING SUM(price) > 4.00
ORDER BY 2 DESC;

GROUP BY category HAVING SUM(price) > 4.00
The output excludes Ice Cream, since the total price in the Ice Cream category was $3.75 → or $0.25 less than the limit we set.
So now you know how to look through the menu a little better… and while you’re doing all these calculations in your head, you start really questioning your choice in date. Oh well, she looks like she’s having a good time, and really that means a whole hell of a lot. You can decide later if she enjoys your company or your wallet’s company. For now, just enjoy yourself. Chances are you won’t spend much more this date, and if she suggests something else very expensive just say, “ahhh it’s getting late” and call it a day.
But that’s looking too far ahead. Both Becky and the cashier are looking at you to order something for yourself. You decide to buy the cheapest item by using MIN(). Alternatively, you could select the most expensive item by using MAX(). They’re still staring at you, so you say, “I’ll take…”
SELECT item
FROM sparkles
WHERE price = (
 SELECT MIN(price)
 FROM sparkles);

Sub-query
This is a little more of an advanced for this particular lesson, but you are essentially making a sub-query. In other words, it’s a query inside of a query. The inner query (sub-query) returns the lowest price in the table; the outer-query (primary-query) returns items at whatever value the sub-query returns. Here, the primary-query returns all items where price equals $3.00. Since 2 items return, and you only want one, you can just append LIMIT 1.
SELECT item
FROM sparkles
WHERE price = (
 SELECT MIN(price)
 FROM sparkles)
LIMIT 1;
(rextester does not like limits)

Subquery… LIMIT 1
Congrats, you just bought a $3.00 chocolate chip cookie.
The cashier hands you the cookie right away and you and your date go sit down. The first few minutes are awkward. You feel a little put out by how much Becky ordered, and even though she looks like she’s having a good time, you can’t help but shake the feeling of being used for your money.
A server brings a tray filled with all six items Becky ordered. You say thanks and look back at your cookie wrapper, now empty except for a few crumbs.
You look up and see Becky smiling at you. “Thanks for asking me to go out today and for agreeing to come here. You must think I’m crazy for ordering all of this… but trust me.”
She grabs the spoon that came with her ice cream, pulls off a piece of the Vanilla Milk Chocolate Deluxe Cupcake and scoops up a bit of Vanilla Bean ice cream with it. She offers it toward you to take the first bite.
You look at her a little curiously before taking the bite. You taste it for a second, letting the different temperatures, flavors, and sweetness mix together. It’s nice and you let a little smile slip out. She smiles in return. “I thought you’d like it!” And for the next twenty or so minutes you forget that you don’t like cupcakes.
The cupcakes, cookies, and ice cream get eaten pretty quick, but the date goes on into the evening. And when you drop her off she tells you that she had a really great time with you again. You tell her you didn’t know what to expect at the cupcake shop, but it turned out really fun. She smiles in return.
SQL can’t really be used to describe what happens next… so I’ll leave it to you to fill in the blank.
But it looks like you will probably get to date three, unless you screw something up. Just don’t screw stuff up and you’ll be fine.
________________________________________________
Moral of the story (since every database story needs a moral): Labels are for tables and columns; not for people. If you write a person off as basic, ditsy, a jock, nerdy, blonde, weird, countless racial slurs, etc. you are reducing the entirety of a person to one word — which is impossible. Moreover, you’re doing yourself an injustice because by looking at a person only by their label, you miss the depth that makes that person interesting.
