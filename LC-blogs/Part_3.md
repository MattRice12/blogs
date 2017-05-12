## A SOLID Solution III

**Lesson 2: Extending Classes Responsibly**

Continuing our discussion, this section covers the three SOLID principles that I believe are focused more on creating new classes rather than a more general discussion of CSS structure. I begin with the Open/Close Principle which states that entities should be open for extension but closed for modification. As will be discussed further, once several areas of your site depend on a CSS class, changes to that class should be indirect through extension rather than direct amendment.

Then I discuss the Interface Segregation Principle which states that client specific interfaces are better than one general purpose interface. This adds to the Open/Close Principle in reassuring that it is 'okay' to add multiple CSS classes to an element rather than reducing all the CSS down into one class. This keeps the base class very general and re-usable. By having general base classes, you will create new classes to write new properties rather than unwrite unnecessary properties.

I close with the Dependency Inversion Principle which states that abstractions should not depend on details; details should depend on abstractions. This reinforces the points of the above principles: By keeping the base classes very general, new classes can add useful properties rather than remove unnecessary properties.

**Open/Close Principle**

The Open/Close Principle (OCP) is the idea that base abstractions should be open for extension but closed for modification. Modifying base abstractions is generally a bad idea and should be done very rarely if at all. Doing so is likely to cause conflicts in the details that depend on them.

In my case, the base abstractions were my grid classes. Thus, I violated OCP by modifying the grid directly when combining `.container` with `.services`. Rather, I should have stuck with my initial approach of extending the grid by adding additional, specific classes. Conflicts arose by modifying the grid because everything in the site was built on top of the grid. Moreover, in specific instances the grid reflected changes in different, unpredictable ways, depending on what other classes extended the grid in that instance. Many of the conflicts that arose were not immediately obvious and took longer and more work to rectify. I ended up adding more classes than I reduced to temporarily fix the problem, making the HTML and CSS unnecessarily bloated.

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
      width: 40em;
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
6. *BEM 101*, [https://css-tricks.com/bem-101/](https://css-tricks.com/bem-101/)
