## Introduction

This blog post details the CSS issues I encountered while building several pages for a company website. In this blog, I discuss the issue itself, my three main mistakes that lead to the issue, and using SOLID principles when writing CSS to avoid these issues.

## The Project

My first story while working with Lunar Collective was to add individual service pages to the LC website, detailing the services we provide and the entities we have served in the past. The story involved creating a template for the service pages to keep a common structural theme between service pages.


In addition to keeping each service page consistent, I wanted to maintain some structural consistency within the entire site itself. Fortunately, the codebase I jumped into had a custom CSS grid defined. As a result, I could build the new service pages by using the existing grid system to create new pages and maintain site-wide structural consistency. Consistent design provides the user with visual cues when navigating the page. From a coder's perspective, consistent design may be desirable because it means the coder can create re-usable CSS/SCSS.


```css
// grid.scss

.container {
  display: flex;
  flex-wrap: wrap;

  .column {
    &.flex {
      flex: 1 0 auto;
      flex-basis: 40%;
    }

		&.half {
			width: 49%;
		}

		&.third {
			width: 32%;
		}
	}
}
```

(For creating your own CSS grid, check out: http://j4n.co/blog/Creating-your-own-css-grid-system)

## The Mistakes

**Mistake #1: Modifying Abstract Classes (OCP)**

As I began creating the service pages, I recognized structural changes I needed to make to the service pages. In one situation, I needed to add a margin-top and some flex properties to a container block but I also wanted to limit it to only the area on the page that I was changing (as opposed to every container block on the site). To do so, I created a new class `.services` containing the margin and flex properties and appended it to `.container`, creating `.container.services`.

```css
// grid.scss

.container {
		display: flex;
		flex-wrap: wrap;
}
```

```css
// services.scss

.container.services {
	margin-top: 40px;
	justify-content: center;
	align-items: center;
}
```

So far so good (as will be explained later, this is a safe and proper way to extend core grid structure). I continued building the site with this in mind--create new, more specific classes to build upon the old, more general classes.

The mistake occurred when I decided to take a step back and refactor my CSS. I grew increasingly anxious as I soon had some blocks with 5 or more classes, each having a particularly important structural, organizational, or presentational responsibility. I studied the code some and realized that almost all `.container` blocks needed the margin-top and flex properties in `.services`. So I decided to modify the core grid system, reduce `.container.services` down to `.container`, and add extensions to the fewer `.container` blocks that needed different properties.

```css
	// grid.scss

	.container {
		display: flex;
		flex-wrap: wrap;
		margin-top: 40px;
		justify-content: center;
		align-items: center;
	}
```

This doesn't seem like a bad idea outright. However, more `.container` blocks than I accounted for were affected. It also created some unpredictable behavior with other structural classes which relied on the original `.container` block that I did not account for.

**Mistake #2: Modifying Abstract Classes in the Wrong File (SRP)**

What's worse, rather than modifying `.container` in `grid.scss`, I modified `.container` in the `.services.scss`. So rather than the `grid.scss` as displayed immediately above, it looked more like this:

```css
// grid.scss

.container {
	display: flex;
	flex-wrap: wrap;
}
```

```css
// services.scss

.container {
	margin-top: 40px;
	justify-content: center;
	align-items: center;
}
```

Now the problem I created was split and hidden in two different locations. This mistake was partly due to not completely understanding the codebase and the importance of having a separate grid file. It was also partly due to the fact that I already had `.container.services` defined in `.services.scss` and thought that by just deleting the `.services` class, I'd avoid tangling code up by moving stuff around. If the code was here before I deleted the class, it probably should stay here after I deleted the class. This was a bad decision.

Furthermore, because the CSS was in `services.scss`, I made the embarrassing assumption that only the service pages would be affected by my changes. As a result, this caused the changes to the main site to go unnoticed. Ideally, this would be caught in code-review. However, just by looking at the code it's much harder to identify design problems. And the links I posted on the pull request to visually review the sight only focused on the service pages.

**Mistake #3: Modifying Abstract Classes in Wrong Files and then Patching the Now Broken Abstractions (DIP)**

The above problem got compounded the longer it took me to notice the problem. In general, the longer a problem goes unnoticed, the harder it is to identify the source of the problem. If you notice it immediately, you can make a causal connection and reverse the change you made. However, if it occurs even a few minutes later you may have already made enough changes to not know the source. Moreover, the longer the problem goes unnoticed, the more likely it is to not understand that a misaligned block is evidence of a larger problem.

Because I didn't know the problem existed for a while, I continuously bandaged it up whenever it appeared. This is bad because by adding bandages, I was only treating the problem rather than fixing it. And unless the underlying problem is fixed, the problem may keep resurfacing (which it did), requiring more bandages to treat it (which it did). Moreover, if the underlying problem is on a very general level block like a `.container`, each container will require some amount of treatment. In the end, we have unnecessarily bloated code, making it harder to find the source of the problem, and making it harder to fix the problem once we finally do identify it.

## A SOLID Solution

The best solution is, of course, to find the source of the problem and fix it. However, unless you develop some sort of system when writing CSS, you're not going to be able to identify when there is a problem. And even if you do identify the problem quickly, you'll be spending unnecessary time fixing problems that could have been prevented.

I looked through a few CSS methodologies to keep things organized. One is the Block, Element, Modifier (BEM) methodology (see https://css-tricks.com/bem-101/), which I think could be very useful when writing and organizing large CSS projects.

However, I wanted to find a more fundamental system that applies regardless of the preferred CSS methodology. What I found was the classic: SOLID principles. I covered these principles when learning Ruby, JavaScript, Golang, and so on. But I was curious to see how SOLID applied to CSS.

**SOLID principles**

For this, I relied heavily on the following sources:
- Solid CSS, http://blog.millermedeiros.com/solid-css/
- SOLID Object Oriented Principles And CSS: Part 1 & 2, http://vanseodesign.com/web-design/solid-oo-principles-1/
- The single responsibility principle applied to CSS, https://csswizardry.com/2012/04/the-single-responsibility-principle-applied-to-css/
- The open/closed principle applied to CSS, https://csswizardry.com/2012/06/the-open-closed-principle-applied-to-css/

**Open/Close Principle**

The Open/Close Principle is the idea is that base abstractions should be open for extension but closed for modification. Modifying base abstractions is generally a bad idea and should be done very rarely if at all. In my case, the base abstractions were my grid classes.

Following this principle, I should not have changed my grid system directly. Had I stuck with my initial approach of adding additional, specific classes extending the functionality of the grid, I would not have run into the problem. Yes, my HTML would have had more classes, but it would have at least been straightforward and readable (unlike most of CSS).

The problem with modifying the grid is that it affects virtually everything, since everything is built upon the grid. And if you are modifying the grid midway through creating a site, you are not immediately aware of every place that the modification affects. Contrarily, by using specific classes to add new behavior, the only blocks that are affected are the ones to which you consciously and deliberately append the class.

**Interface Segregation Principle**

This also involved Mistake #1. Interface Segregation Principle (ISP) means many client specific interfaces are better than one general purpose interface. In other words, no element should be forced to implement an interface it doesn’t use.

By adding the properties in `.services` to `.container`, I made `.container` into a much more general purpose block. As a result, many applications of `.container` didn't need the baggage that now came with `.container`, and I had to create more specific classes to remove that baggage.

**Single Responsibility Principle**

The Single Responsibility Principle (SRP) is helpful when defining your site structure in CSS and also later when deciding whether or not to combine classes or keep them separate. SRP in CSS means we should separate structure from presentation.

I violated SRP in two ways. First, and perhaps worst is at the application-level, where I modified my grid system outside of the grid file. By having `.container` defined in two separate files, I couldn't quickly determine what the container block did or that it was problematic. Instead, any changes to `.container` should have occurred only in the `.container` class inside `grid.scss`.

Second, I violated SRP at the code-level. In my services file, I frequently mixed structural and presentational CSS within single classes. This bloated my CSS by making classes larger than they need to be and inhibited their re-usability. Because code wasn't re-usable, I was more frequently repeating myself which made my code not DRY.

**Liskov Substitution Principle**

This last point implicates the Liskov Substitution Principle. According to this principle, objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program. A way to interpret this in CSS is that classes that extend a base class shouldn’t have a different behavior than the base class they extend. In other words, if `.image-block` is intended to extend `.container`, it should only affect structural properties and should not include presentational properties such as border, background color, etc. However, because I was mixing structural and presentational CSS within a single class, I was violating LSP as well as SRP mentioned above.

**Dependency Inversion Principle**

Finally, The Dependency Inversion Principle (DIP) also plays an important role. This principle states that "Abstractions should not depend upon details. Details should depend upon abstractions." Contrarily, by adding bandages to treat a broken grid-system (my abstractions), the functionality of abstractions depended on more specific, detail-like classes.

## Conclusion

Keeping these principles in mind when writing CSS helps keep the code predictable and untangled. Additionally, but not mixing abstractions with details, classes become more re-usable, thus keeping your CSS files DRY. The benefit of of shorter and more predictable code is that problems are much easier to diagnose and fix completely rather than treat temporarily. Moreover, if everyone on the team implements SOLID principles when writing CSS, code review becomes much easier.

## Sources and Further Reading:

1. *SOLID CSS*, http://blog.millermedeiros.com/solid-css/
2. *SOLID Object Oriented Principles And CSS: Part 1*, http://vanseodesign.com/web-design/solid-oo-principles-1/
3. *SOLID Object Oriented Principles And CSS: Part 2*, http://vanseodesign.com/web-design/solid-oo-principles-2/
4. *The single responsibility principle applied to CSS*, https://csswizardry.com/2012/04/the-single-responsibility-principle-applied-to-css/
5. *The open/closed principle applied to CSS*, https://csswizardry.com/2012/06/the-open-closed-principle-applied-to-css/
6. *Creating your own Grid System*, http://j4n.co/blog/Creating-your-own-css-grid-system
7. *BEM 101*, https://css-tricks.com/bem-101/
