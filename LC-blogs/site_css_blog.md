## Introduction

This blog post details the CSS issues I encountered while building several pages for a company website. In this blog, I discuss the issue itself, my three main mistakes that lead to the issue, and using SOLID principles when writing CSS to avoid these issues.

## The Project

My first story while working with Lunar Collective was to add individual service pages to the LC website strictly using HTML and CSS. The story involved creating a template for the service pages to keep a consistent structural theme between service pages.

In addition to keeping each service page consistent, I wanted to maintain some structural consistency within the entire site itself. Fortunately, the codebase I jumped into had a custom CSS grid defined. Therefore, I could build the new service pages by using the existing grid system to create new pages and maintain site-wide structural consistency.

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

[Guide to creating your own CSS grid](http://j4n.co/blog/Creating-your-own-css-grid-system)

## The Mistakes

**Mistake #1: Modifying Abstract Classes**

After I began, I noticed structural changes I needed to make to the service pages. I needed to add a margin-top and some flex properties to a container block but I also wanted to limit it to only the area on the page that I was changing (as opposed to every container block on the site). To do so, I created a new class `.services` containing the margin and flex properties and appended it to `.container`, creating `.container.services`.

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

The mistake occurred when I decided to take a step back and refactor my CSS. I grew increasingly anxious as I soon had some HTML elements with 5 or more classes, each class having a particularly important structural, organizational, or presentational responsibility. I realized that almost all `.container` blocks needed the margin-top and flex properties in `.services`. So I decided to modify the core grid system, reduce `.container.services` down to `.container`, and add extensions to the fewer `.container` blocks that needed different properties.

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

This doesn't seem like a bad idea outright. However, more `.container` blocks than I accounted for were affected. This change also created some unpredictable behavior with other structural classes which relied on the original `.container` block. Specifically, every page's header and footer were wrapped in a `.container`, leaving a nice 40px white gap immediately above them. This should be a quick and easy fix. *Should be*.

**Mistake #2: Modifying Abstract Classes in the Wrong File**

Rather than modifying `.container` in `grid.scss`, I modified `.container` in the `.services.scss`. So rather than the `grid.scss` as displayed immediately above, it looked more like this:

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

Now the problem I created was split and hidden in two different locations. This mistake was partly due to not completely understanding the codebase and the importance of having a separate grid file. It was also partly due to the fact that I already had `.container.services` defined in `services.scss` and thought that by just deleting the `.services` class, I'd avoid tangling code up by moving stuff around. If the code was here before I deleted the class, it probably should stay here after I deleted the class. This was a bad decision.

Furthermore, because the CSS was in `services.scss`, I made the embarrassing assumption that only the service pages would be affected by my changes. As a result, this caused the changes to the main site to go unnoticed. Ideally, this would be caught in code-review. However, just by looking at the code it's much harder to identify design problems. And the links I posted on the pull request to visually review the sight only focused on the service pages.

**Mistake #3: Modifying Abstract Classes in Wrong Files and then Patching the Now Broken Abstractions**

The problem got compounded the longer it took me to notice the problem. In general, the sooner you notice a problem, the more likely you can make a causal connection between the change and the problem and reverse it. However, if the problem occurs even a few minutes later you may have already made enough changes to not know its source.

Because the problem mostly manifested on pages I wasn't actively monitoring, it took me a while to notice something larger was wrong. And because I didn't notice something was larger wrong for a while, I added small bandages wherever it appeared. This was bad because by adding bandages, the problem was only getting treated rather than getting fixed. And unless the underlying problem is fixed, it may keep resurfacing (which it did), requiring more bandages to treat it (which it did).

Moreover, if the underlying problem is on a very general level block like a `.container`, each container will require some amount of treatment. In the end, the code is unnecessarily bloated, making it harder to find the source of the problem, and making it harder to fix the problem once it is finally identified.

## A SOLID Solution

The best solution is, of course, to find the source of the problem and fix it. However, unless you develop some sort of system when writing CSS, you're not going to be able to identify when there is a problem. And even if you do identify the problem quickly, you'll be spending unnecessary time fixing problems that could have been prevented.

I looked through a few CSS methodologies to keep things organized. One is the Block, Element, Modifier (BEM) methodology (see https://css-tricks.com/bem-101/), which I think could be very useful when writing and organizing large CSS projects.

However, I wanted to find a more fundamental system that applies regardless of the preferred CSS methodology. What I found was the classic: SOLID principles. I covered these principles when learning Object Oriented languages. But I was curious to see how SOLID applied to CSS.

**SOLID principles**

For this, I relied heavily on the following sources:

- [Solid CSS](http://blog.millermedeiros.com/solid-css/)
- [SOLID Object Oriented Principles And CSS: Part 1 & 2](http://vanseodesign.com/web-design/solid-oo-principles-1/)
- [The single responsibility principle applied to CSS](https://csswizardry.com/2012/04/the-single-responsibility-principle-applied-to-css/)
- [The open/closed principle applied to CSS](https://csswizardry.com/2012/06/the-open-closed-principle-applied-to-css/)

**Single Responsibility Principle**

The Single Responsibility Principle (SRP) is helpful when defining your site structure in CSS and also later when deciding whether or not to combine classes or keep them separate. SRP in CSS means we should separate structure from presentation.

I violated SRP in two ways. First, and perhaps worst is at the application-level, where I modified my grid system outside of the grid file. By having `.container` defined in two separate files, I couldn't quickly determine what the container block did or that it was problematic. Any changes to `.container` should have occurred only in the `.container` class inside `grid.scss`.

Second, I violated SRP at the code-level. In my services file, I frequently mixed structural and presentational CSS within single classes. This bloated my CSS by making classes larger than they need to be and inhibited their re-usability. Because code wasn't re-usable, I was more frequently repeating myself which made my code not DRY.

Practically speaking, however, I don't think this principle is useful to do in every situation. While doing so makes CSS structure more predictable, it adds unnecessary organization that is just a little too much.

```css
// Before applying SRP
.container {
  &.services-header {
    height: 5em;
    padding: 0 20px;
    border-bottom: 10px solid #222;
  }
}

// After applying SRP
.container {
  &.services-header {
    &.block {
      height: 5em;
      padding: 0 20px;
    }
    &.style {
      border-bottom: 10px solid #222;
    }
  }
}
```
See larger examples here:

- [Pre-SRP](https://codepen.io/mattricedev/pen/jmYrOQ)
- [Post-SRP with block/style distinction](https://codepen.io/mattricedev/pen/LyeZPZ)
- [Post-SRP with extend](https://codepen.io/mattricedev/pen/rmpLOB)

Adding this structure adds 4 extra lines. It's not so bad, but when you're doing it for every element, it gets unnecessarily bloated. Additionally, none of these blocks or styles are very re-usable.

Instead, I think SRP is used more to keep in mind that whenever you create structural classes, such as `.flex-center`, don't mix in presentational properties. This is a bit more of an intuitive way to write CSS and allows the `.flex-center` class to be more re-usable. For example:

```css
.container {
  &.header {
    height 5em;
    padding: 0 20px;
    border-bottom: 10px solid #222;
  }
  &.flex-center {
    display: flex;
    justify-content: center;
  }
}
```

While `.header` is probably not too re-usable, by making `.flex-center` completely structural, I can use it on any `.container` block where I find it necessary to add these flex properties.

**Liskov Substitution Principle**

Similar to SRP, the Liskov Substitution Principle (LSP) also points to keeping structural and presentational classes distinct. However, LSP is more-so focused consistency between similar child classes. According to this principle, objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program. In other words, classes that extend a base class in a similar way should be interchangeable. Let's look at an example:

```css
// good
.flex {
  display: flex;
  &.center {
    justify-content: center;
  }
  &.space-between {
    justify-content: flex-end;
  }
}

// bad
.flex {
  display: flex;
  &.center {
    justify-content: center;
  }
  &.space-between {
    justify-content: flex-end;
    padding: 20px;
    border-bottom: 5px solid teal;
  }
}
```

In the 'good' example above, both `.center` and `.space-between` can be used interchangeably without one causing results that the other does not have. In the 'bad' example, `.space-between` adds extra stuff that is not inferred in the name or in the behavior of it's sibling.

**Open/Close Principle**

The Open/Close Principle (OCP) is the idea that base abstractions should be open for extension but closed for modification. Modifying base abstractions is generally a bad idea and should be done very rarely if at all. Doing so is likely to cause conflicts in the details that depend on them.

In my case, the base abstractions were my grid classes. Thus, I violated OCP by modifying the grid directly when combining `.container` with `.services`. Rather, I should have stuck with my initial approach of extending the grid by adding additional, specific classes. Conflicts arose by modifying the grid because everything in the site was built on top of the grid. Moreover, specific instances the grid reflected changes in different, unpredictable ways, depending on what other classes extended the grid in that instance. Many of the conflicts that arose were not immediately obvious and took longer and more work to rectify. I ended up adding more classes than I reduced to temporarily fix the problem, making the HTML and CSS unnecessarily bloated.

Rather than modifying the grid directly, create additional, specific classes that you can use wherever the change is needed:

```css
.container {
  display: flex;
  justify-content: center;
}

.container {
  &.services {
    justify-content: space-between;
  }
}
```

**Interface Segregation Principle**

Interface Segregation Principle (ISP) means many client specific interfaces are better than one general purpose interface. In other words, no element should be forced to implement an interface it doesn’t use.

By combining `.services` with `.container`, I made `.container` into a much more general purpose block. As a result, many applications of `.container` didn't need the baggage that now came with `.container`, and I had to create additional, specific classes to remove that baggage.

My opinion on this is that doing so to a small extent is not egregious. The following example is okay even though I may later add a specific class to a container that sets `justify-content: space-between;`. It becomes a problem when excessively adding properties, especially non-structure properties to the abstraction. You may notice it is a problem further down the road when you end up creating a class for almost every container that changes the properties you set in your abstraction. However, by the time you notice the problem, it may be too late and very dangerous to fix. Therefore, I think setting up a minimal grid is okay, even if you have to append an additional class to overwrite some properties later.

```css
// okay
.container {
  display: flex;
  flex-wrap: nowrap;
  justify-content: center;
  align-items: center;
  width: 100vw;
}

// bad
.container {
  display: flex;
  flex-wrap: nowrap;
  justify-content: center;
  align-items: center;
  width: 100vw;
  font-size: .95em;
  padding-top: 40px;
  margin-top: 40px;
}
```

**Dependency Inversion Principle**

Finally, The Dependency Inversion Principle (DIP) also plays an important role. This principle states that abstractions should not depend upon details; details should depend upon abstractions. Contrarily, by adding bandages to treat a broken grid-system (my abstractions), the functionality of my grid depended on more specific, detail-like classes.

In the above 'bad' example, assume I created this with the page body in mind. However, I also want to use `.container` to create my header and footer. Because I have `margin-top: 40px;` my header and footer is going to have a white gap on the top--which in my case is undesirable. Because I'm trying to play it safe and not modify the grid, I'm going to create a specific class to remove this margin. And I'll add it to any container that doesn't need the margin.

Now, because I didn't follow the Interface Segregation Principle, I have to create specific classes to fix my abstraction, thus breaking the Dependency Inversion Principle. I should instead create a minimalist, general class and create specific classes to add what I need, where I need it.

```css
.container {
  display: flex;
  flex-wrap: nowrap;
  justify-content: center;
  align-items: center;
  width: 100vw;

  &.header-block {
    font-size: 1.5em;
    padding-top: 5em;
    background: #222;
    border-bottom: 10px solid #000;
    color: white;
  }

  &.body-block {
    font-size: .95em;
    margin-top: 40px;
    padding-top: 5em;
  }

  &.footer-block {
    padding-top: 5em;
    background: #222;
    border-top: 10px solid #000;
    color: white;
  }
}
```

## Conclusion

Keeping these principles in mind when writing CSS helps keep the code predictable and untangled. Additionally, by not mixing abstractions with details, classes become more re-usable, thus keeping your CSS files DRY. The benefit of of shorter and more predictable code is that problems are much easier to diagnose and fix completely rather than treat temporarily. Moreover, if everyone on the team implements SOLID principles when writing CSS, code review becomes much easier.

Below I provided a simplified example to highlight the concepts covered. To see something functional with HTML, [check out this codepen](https://codepen.io/mattricedev/pen/eWyvPe).

```css
// grid.scss

.container {
  display: flex;
  flex-wrap: wrap;
  align-items: flex-start;
  width: 100vw;

  &.center {
    justify-content: center;
  }

  &.space-between {
    justify-content: space-between;
  }
}

// services.scss

.container {
  &.backdrop {
    background-color: #373737;
    color: #00D8FF;
  }

  &.header {
    height: 5em;
    padding: 0 20px;
    &.services {
      border-bottom: 10px solid #222;
    }
  }

	&.body {
    &.services {
      width: 640px;
      padding: 0 5vw;
      .column h2 {
        color: #00D8FF;
      }
    }
  }

  &.footer {
    &.services {
      border-top: 10px solid #222;
    }
  }
}
```

## Sources and Further Reading:

1. *SOLID CSS*, [http://blog.millermedeiros.com/solid-css/](http://blog.millermedeiros.com/solid-css/)
2. *SOLID Object Oriented Principles And CSS: Part 1*, [http://vanseodesign.com/web-design/solid-oo-principles-1/](http://vanseodesign.com/web-design/solid-oo-principles-1/)
3. *SOLID Object Oriented Principles And CSS: Part 2*, [http://vanseodesign.com/web-design/solid-oo-principles-2/](http://vanseodesign.com/web-design/solid-oo-principles-2/)
4. *The single responsibility principle applied to CSS*, [https://csswizardry.com/2012/04/the-single-responsibility-principle-applied-to-css/](https://csswizardry.com/2012/04/the-single-responsibility-principle-applied-to-css/)
5. *The open/closed principle applied to CSS*, [https://csswizardry.com/2012/06/the-open-closed-principle-applied-to-css/](https://csswizardry.com/2012/06/the-open-closed-principle-applied-to-css/)
6. *Creating your own Grid System*, [http://j4n.co/blog/Creating-your-own-css-grid-system](http://j4n.co/blog/Creating-your-own-css-grid-system)
7. *BEM 101*, [https://css-tricks.com/bem-101/](https://css-tricks.com/bem-101/)
