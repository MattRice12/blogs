## A SOLID Solution II

Having identified the issue, we can now fix it. But more-so, we want to be able to identify when these problems will occur and stop them before they become something big and take unnecessary time fixing them. Therefore, this section and the next aims to reflect on my mistakes and outline a system for writing CSS to prevent the mistakes from occurring again.

I looked through a few CSS methodologies to keep things organized. One is the Block, Element, Modifier (BEM) methodology (see https://css-tricks.com/bem-101/), which I think could be very useful when writing and organizing large CSS projects.

However, I wanted to find a more fundamental system that applies regardless of the preferred CSS methodology. What I found was the classic: SOLID principles. I covered these principles when learning Object Oriented languages. But I was curious to see how SOLID applied to CSS.

**Lesson 1: Structuring Code and Classes**

I begin this discussion of SOLID around CSS file organization and code structure. For this, I focus on two principles. First, the Single Responsibility Principle which states that a class should have only a single responsibility. I abstract this a little more to speak both at the file level (organizing CSS files based on their purpose) as well as at the code level (separating css classes around their structural and functional purposes).

Second, I discuss the Liskov Substitution Principle which states objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program. I apply this in CSS as making sure that functionally similar classes are interchangeable. They should not carry extra baggage that could be extended in an additional class.

**Single Responsibility Principle**

As mentioned above, the Single Responsibility Principle (SRP) in CSS means we should separate structure from presentation. SRP is helpful when defining your site structure in CSS and also later when deciding whether or not to combine classes or keep them separate.

First, CSS classes should be organized into files based on which piece of the site they apply to. In my situation, we had a separate CSS file for most individual pages. In the case where several pages were nearly identical, we would put them into one file which included mixins to account for the distinctions between pages. In addition, we had separate CSS files that covered the general site structure as well as the even more fundamental grid system. Having such file separation is valuable in the same way any organization is valuable--it makes everything easy to find and understand.

I made the mistake of modifying my grid system outside of the grid file. By having `.container` defined in two separate files, I couldn't quickly determine everything that the container block did or that it was problematic. Instead, any changes to `.container` should have occurred only in the `.container` class inside `grid.scss`.

Second, at the code level CSS classes should be separated based on whether they include structural or presentational properties. In my services file, I frequently mixed structural and presentational CSS within single classes. This bloated my CSS by making classes larger than they need to be and inhibited their re-usability. Because code wasn't re-usable, I was more frequently repeating myself which made my code not DRY.

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

## To be continued...

Next I continue the discussion of using SOLID principles in CSS by covering how to responsibly extend classes that we have already created. This discussion focuses on the Open/Close Principle, Interface Segregation Principle, and the Dependency Inversion Principle.

## Sources and Further Reading:

1. *SOLID CSS*, [http://blog.millermedeiros.com/solid-css/](http://blog.millermedeiros.com/solid-css/)
2. *SOLID Object Oriented Principles And CSS: Part 1*, [http://vanseodesign.com/web-design/solid-oo-principles-1/](http://vanseodesign.com/web-design/solid-oo-principles-1/)
3. *SOLID Object Oriented Principles And CSS: Part 2*, [http://vanseodesign.com/web-design/solid-oo-principles-2/](http://vanseodesign.com/web-design/solid-oo-principles-2/)
4. *The single responsibility principle applied to CSS*, [https://csswizardry.com/2012/04/the-single-responsibility-principle-applied-to-css/](https://csswizardry.com/2012/04/the-single-responsibility-principle-applied-to-css/)
5. *The open/closed principle applied to CSS*, [https://csswizardry.com/2012/06/the-open-closed-principle-applied-to-css/](https://csswizardry.com/2012/06/the-open-closed-principle-applied-to-css/)
6. *BEM 101*, [https://css-tricks.com/bem-101/](https://css-tricks.com/bem-101/)
