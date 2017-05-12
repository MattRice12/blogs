## A SOLID Solution I

## Introduction

This blog post details the CSS issues I encountered while building several pages for a company website. It is split into three separate posts.

Part I discusses the mistakes I created and how not fixing them created larger problems that were much harder to identify and fix down the road. Part II and III discuss the use of SOLID principles as a way to organize and write code so that these mistakes are prevented. Part II discusses two SOLID principles related to structuring CSS files and classes. Part III discusses three SOLID principles related to creating new classes to extend on what is already built.

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


## Sources and Further Reading:
  1. *Creating your own Grid System*, [http://j4n.co/blog/Creating-your-own-css-grid-system](http://j4n.co/blog/Creating-your-own-css-grid-system)
