# Sections:
	1. The issue I created
	2. Why it happened
	3. How I temporarily fixed it ()
	4. The long term solution (re-write CSS, use classes instead of elements)
	5. Forward thinking when creating html/css to prevent this problem.

# Essay
  @Intro:
    This blog post details the CSS issues I encountered while building several pages for a company website. In this blog, I discuss the issue itself, how I created the issue, how I fixed the issue, and my suggestion on how to avoid the issue in the future. Briefly stated, the issue built up gradually through making small changes to general CSS classes and fixing them through more specific classes. In other words, the scope of the solution was usually narrower than the scope of the problem.

    For example, by changing the general class `.container.flex`, I created 10 unwanted design changes but only noticed and fixed 9. Rather than undoing the changes to the CSS that caused the problem, I created new CSS to fixed the problems that arose. I consciously decided to proceed this way because these problems didn't seem like problems at the time. Instead, they seemed like extensions of the idiosyncratic differences between pages.

  1. The issue I created

    (A) The Setup
      My first story while working with Lunar Collective was to add individual service pages to the LC website, detailing the services we provide and the entities we have served in the past. The story involved creating a template for the service pages to keep a common structural theme between service pages.

      In addition to keeping each service page consistent, I wanted to maintain some structural consistency within the entire site itself. Fortunately, the codebase I jumped into already CSS dedicated to defining the site's overall grid and structure. As a result, I could build the new service pages by using the site's grid system to create new pages with structural consistency.

      For example, `containers` were defined as being some multiple of *x* units tall with certain flex attributes built in. Similarly, `columns` were defined as being *y* units wide, with sub-classes of `.flex` that you could add in your HTML or not.

      Consistent design provides the user with visual cues when navigating the page. From a coder's perspective, consistent design may be desirable because it means the coder can create re-usable CSS/SCSS.

    (B) The Mistake

      **Modifying Grid Classes**
      1) `.container`
      2) `.container.services`
      3) `.container.services.ruby`
      4) Since both the services pages and rest of the site are using this feature, rather than having an additional class on every instance of it's parent, just apply the properties in `services` to `.container` and drop `.services`.
      5) `container.ruby`
        ***Fallacy***: Maybe every page needs modification, but maybe not every container on every page needs modification.

      As I began creating the service pages, I recognized structural changes I needed to make to the service pages. In one situation, I needed to add `margin-top: 40px;` and a few other spacing tweaks to a container block but I also wanted to limit it to only what I was changing. So, I added class to my container block and made the changes in that new class, `.container.services`, while leaving the core `.container` class untouched. Now for any `.container` in my HTML where I want a 40px margin-top, I just append `.services`.

      This worked great, and I keep adding classes to add more specific details. And this was the logical pattern I took: start with a general, re-usable blocks like `.container`, and add increasingly specific, less-reusable classes to get the final stylized product.

      **Principle: General to Specific**
      I start with a general block, `.container`. Not all containers use flex, but assume this one does, so I call it `.container.flex`. Since this is one of the many services pages, I want to give it my services attributes--> `.container.flex.services`. Since this particular service page is for Ruby, I have special styles for the block--> `.container.flex.services.ruby`. From general to specific.

      After creating several service pages, my CSS was getting lengthy and I decided to refactor. One thing I noticed was that every container needed `margin-top: 40px;`--not just those on the service pages. Rather than creating semi-specific classes to append to each `.container`, I just modified `.container` itself and dropped `.services`.

      This itself isn't so egregious. However, the way I did it was irresponsible. Rather than modifying `.container` in `grid.scss`, I modified `.container` in the `.services.scss`. This was partly due to not completely understanding the codebase. It was also partly due to the fact that I already had `.container.services` defined in `.services.scss` and just deleted the `.services` class to implement the change. Finally, it was partly due to the fact that I was refactoring 8 CSS files (1 for each service page) into 1 file and making sure they stayed stylistically consistent and unbroken (while not giving appropriate consideration to the other pages on the site).

      I wrongly assumed only the service pages would be affected by my changes. As a result, this caused the changes to the main site to go unnoticed. Ideally, this would be caught in code-review. However, just by looking at the code it's much harder to identify design problems. And the links I posted on the pull request to visually review the sight only focused on the service pages.

      **Generically named classes**:
      1) `.container` in body needs an extra 5em margin on top.
      2) Add `.container.body` to add 5em margin-top (as well as other features).
      3)
        ***Fallacy***: I may accidentally define the `.body` class later, without realizing it's already been defined.


      **Adding Bandages to Broken Code**:
      The above problems get compounded when you realize the error much later down the road, but don't know the source of the error. If the problem appears immediately you can make a causal connection and reverse the change you made. However, if it occurs even a few minutes later you may have already made enough changes to not know the source.

      The quick solution is to create a new class or modify an existing class to fix the error. Typically, it's safer to add/modify more specific classes rather than general classes to limit potential collateral damage to the rest of the site. However, the shortcoming of this approach is that now we are adding bandages to code that may have more serious underlying problems. And unless the underlying problem is fixed, the problem may keep resurfacing, requiring bandage upon bandage to fix it. Moreover, if the underlying problem is on a very general level block like a `.container`, each container will require some amount of treatment.

      The best solution is, of course, to find the source of the problem. This gets increasingly harder the longer the problem goes unnoticed. Assume the problem is on a `.container` block. When you unknowingly created the problem, at least some of the containers should be working right; otherwise, you'd notice the broken code. However, because some containers work while others do not, one logical conclusion is that some more specific class is causing the problem. The other logical course is that some more specific class was already fixing the problem for the working containers. Unless you realize both possibilities, it's easy to go down the wrong path, not find the underlying issue, and add a quick bandage to fix the immediate problem.

      While this fixes the problem, it is only a temporary fix. It will furthermore make the problem more difficult to identify and fix down the line.

	4. The long term solution (re-write CSS, use classes instead of elements)

    The longer-term solution in the current website is to go back and make sure I'm setting general level blocks once and in one place (in the `grid.scss`). As I move to more specific level modifiers, I can make modifications less cautiously, since they will be affecting smaller and smaller subsets of the overall site.

    SOLID principles apply handily (http://blog.millermedeiros.com/solid-css/).

    Disobeying the Open/Close Principle was my downfall. Had I used specific classes to modify my base-classes rather than editing them directly, I would not have created the widespread problem.

    The Dependency Inversion Principle (DIP) also plays a role. By adding bandages to broken general-level classes, the functionality of the general classes depends on more specific classes to work. According to DIP, the opposite should be true: "Abstractions should not depend upon details. Details should depend upon abstractions."

    BEM is also helpful in thinking through the general-to-specific hierarchy (https://css-tricks.com/bem-101/)




    ______
    ______
    ______
    ______
    I am writing a story to revise the SCSS (again) to make sure that when I use some fundamental structural class like `.container.flex`, it doesn't cause broken HTML that requires an additional class to fix it.

    It seems like an obvious thing to avoid in the beginning. Why wasn't I aware that `.container.flex` no longer worked? And I think this is because I switched between creating new classes and amending existing classes too casually. I should have stuck with one approach over the other.

    But by sticking with one approach over the other, I still think it is easy to fall into this trap. This is especially true if you aren't checking every page for collateral damage. By the time I circled around to check whether all the pages were still working, I forgot which small CSS change cause some other page to break. Not aware of the larger problem I would run into by adding a new bandage when these problems came up, I never took the time to solve the core problem and I ended up in a bad spot down the line.

    Knowing what I know now, I should have backtracked and found the change I made for one page that caused another page to break. This, unfortunately, can be a hard process--something akin to the proverbial needle in a haystack.

    By condensing my CSS into 1 file in the first place, I was trying to limit the amount of places I'm defining and re-defining classes. I do think that was the right move, since now I have 1 place to look rather than many places to look when searching for the error. However, that 1 place to look is a pretty dense place covered with mixins and reusable code that might stabilize one page while causing issue with others with a slight different layout.

    And complexity is part of the problem. When performing more complex tasks, our brain is working twice as hard balancing complicated code as well as considering what collateral problems may they arise. The result is that more problems will pass by without notice.

    As a side note, this is true of code review--the more complex the code, the easier for something to pass unnoticed. This is not to say that code shouldn't be complex. However, I think it does suggest that the more complex we make our code, the greater effort we should take to make it understandable.

    With CSS it is easy to get into the habit of

	5. Forward thinking when creating html/css to prevent this problem.

    In the future, the main prescriptive measure to take is to be aware that adding small patches do not always solve the issue.

    Second, I should respect the css hierarchy better. This way, I won't so casually change properties on fundamental structural classes.

    Third, I should favor detailed class names over non-detailed class names over element selectors.
      The purpose of this is that my changes should usually be specific changes rather than changes that affect the site as a whole. Using elements as css selectors make very broad changes, likely affecting much more than I intend.


    Most of this boils down to better respecting the separation of concerns between general and specific selectors, respectively re-usable and independent.

    General to Specific CSS classes:
      1) Completely re-usable CSS classes --> `.flex` => `display: flex; justify-content: flex-end;`
      2) Moderately re-usable classes --> `.image-container` => `display: flex; justify-content: flex-end; other: stuff;`
      3) Non re-usable classes --> `.ruby-prior-client-logos` => `display: flex; justify-content: flex-end; other: stuff;`

    Overall, (1) should be used for setting up your basic page structure that you can re-use frequently and amend minimally, (2) should be used to make less-general classes that you can re-use sometimes and amend sometimes, and (3) should be used to make non-reusable classes that you may amend at will.

    Fourth, I need to go back and make no new CSS affects the grid itself. All grid changes need to occur in the grid file (separation of concerns).



    .
