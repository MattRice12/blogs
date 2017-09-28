# The Three I's of Meaningful Names: Information, Identity, and Institution

Creating meaningful names for variables, functions, and classes will not make your program run faster. The benefits are strictly for other developers and your future self to better and more quickly understand code you wrote. This facilitates code review and later contributions.

Ideally, our goal is to write code that reads like a book rather than a math or logic puzzle. Part of that involves writing well-crafted names that convey meaning quickly and effectively. Fortunately, there several rules and guidelines to give direction; unfortunately, there are a lot of rules to remember. This write-up is an effort to [chunk](https://en.wikipedia.org/wiki/Chunking_(psychology)) this information into three larger rule categories, thereby making the several smaller rules easier to remember. Thus, meaningful names should be informative, identifiable, and institutional.

One last thing before I being: This blog was influenced and inspired by Robert C. Martin's book, [_Clean Code: A Handbook of Agile Software Craftsmanship_](https://www.amazon.com/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882/ref=sr_1_1?ie=UTF8&qid=1506620548&sr=8-1&keywords=clean+code). It should be required reading for any developer.

## Information
First and foremost, our names should convey _Information_. Code is not impressionistic; it has a specific meaning that we want to make as clear as possible.

If code is to read like a book, then names should be meaningful enough to convey information. The sentence `A man went to the place for something` conveys nothing substantive. `a went to b for c` conveys even less. Contrast this with `The King of France went to the gallows to die.` This conveys meaning, paints a picture in our mind, and is memorable. Names in code should do the same.

###Informative Names Reveal Intent

Variable, function, and class names should reveal the reason for why they exist, what they do, and how they are used. Codebases are puzzling enough; therefore, we should aim to make their individual pieces as apparent as possible.

Single letter names such as `a` convey no information as to the author's intent or it's purpose in the code. These names can refer to virtually anything and offer no insight to its own meaning or the surrounding context. With a few exceptions, single letter names are inappropriate even in the narrowest scope.

Names such as `user` give a better indication of what the variable references, but intent is still blurry in all but a few limited situations.

In both situations, we might infer intent by the surrounding context. But context is a two way street. Context is created by a collection of well defined pieces. The more vague the pieces, the more vague the context.

Names such as `clientRecord` or `topEmployee` give more insight on their purpose. While these names don't give complete insight into what's going on, they give sufficient enough detail to contribute positively to the entire context.

###Informative Names Avoid Disinformation

Just as names should reveal intent and contribute to context, they should not also muddy the intent or context. For example, `The King of France went to the gallows to sort of die.` The phrase `"sort of"` detracts quite a bit from this sentence. It makes us question our initial assumption that he would be hanged and doesn't replace it with anything useful. Similarly, disinformation in code comes in the form of contradicting the normal assumptions we make.

Do not vary from a word's common or entrenched meaning. For example, don't use `address` to refer to a user's e-mail address.

Do not use names that confuse data-types. E.g., `let bestDoctorArray = "Matt Smith"`. Any variable with `array` in the name should be an array.

Do not break capitalization convention (This rule mixes both the _Information_ requirement and the _Institution_ requirement explained below). Capitalization says a lot about meaning. Subject to your language's or codebase's convention: Variables are usually camelCase or snake_case with the first letter lowercase, constants are CAPITALIZED, and classes are CamelCase with the first letter of each word capitalized. Deviating from this will leave future developers confused as to (1) the purpose of the object, (2) why this was written a certain way while others were written differently, and (3) which way they should write the name.

###Informative Names Avoid Noise

Like disinformation, noise impacts overall meaning; however, unlike disinformation, it does so less directly. Instead, noise is the presence of extra, meaningless information that distinguishes names for the compiler rather than for the developer. In extreme cases, too much noise in your code base is like trying to have a conversation in a club--you might understand a few words out of an entire sentence, but you'll struggle to grasp the overall meaning.

The most common ways noise is created is by making small spelling changes to a name (e.g., `user`, `uzer`, `userr`) and adding numbers to letters or variables to show that they are similar but still different (e.g., `a1`, `a2`, `a3`). While these names are distinguishable enough for the compiler, their differences do not convey anything useful to the developer.

Take the title of this article, for example. If I named it `The 3 I's of Meaningful Names: i1, i2, and i3`, I've conveyed nothing meaningful that hasn't already been said; furthermore, I've conveyed no useful distinction between them (Credits to Matthew Giardina for thinking up this beautiful title that I so nearly used).

Noise also occurs in the form of redundancy when none is needed. For example:
      `const Car = {carMake: ..., carColor: ...};`

Should be:
      `const Car = {make: ..., color: ...};`

Additionally, affixing `Info` or `Data` to the end of names adds no additional information that their base word doesn't have. `userInfo` and `user` convey the same meaning; similarly with `productData` and `product`.

## Identity
  The second `I` for creating meaningful names is that they should be _Identifiable_. Being identifiable is broadly defined as being able to be both immediately understood and searchable by the developer.

###Pronounceable

A developer can better identify and immediately understand a name that is pronounceable and spelled correctly. Most of us are decent enough at reading--especially those who read blogs--that we can process pronounceable words quicker than words full of noise or abbreviations. Many people, myself included, pronounce what we read. Therefore reading `getCoAddr(c) { return c.addr };` takes me a bit more time to parse than `getCompanyAddress(company) { return company.address };`.

###Distinguishable

Avoid names that look too similar. Subtle differences are too hard to distinguish at a quick glance. For example, `getAccountsForAllCurrentEmployees()` and `getAccountsForAllFormerEmployees()`. Depending where our eyes fall on the word, we may not see the the distinction, especially when parsing hundreds of lines of code.

When reading, we often look at the the overall structure rather than the the details of the the word. Consider the the older meme: `Aoccdrnig to a rscheearch at Cmabrigde Uinervtisy, it deosn't mttaer in waht oredr the ltteers in a wrod are, the olny iprmoetnt tihng is taht the frist and lsat ltteer be at the rghit pclae`. While misspellings are frequent and distinguishable here, we can still read and understand meaning. This adds credence to the the point that we overlook details. As further support to my point that we gloss over details, you may have overlooked the the fact that every time I used the the word "the" in this section (outside of the the quotes), I used it twice.

In conclusion, make sure differences are sufficiently distinct.

###Searchable

Not only are pronounceable names easier to read, but they add that extra distinction to be more easily searchable. Let's build the above function out a little more:
        ```
          const getCoAddr = (c) => {
            switch (c.state) {
              case "TX":
                console.log(c.addr);
                break;
              case "CA":
                console.log("Out of State");
                break;
            };
          };
        ```
If I tried to use any text-editor's find command for argument `c`, I'd have excess results returned to me. This becomes even more problematic as the project grows and I'm searching between files for names. This problem isn't limited to single letter names. It also extends to names that aren't sufficiently meaningful, such as `user`. If the name `user` is used at all, it will most likely be used throughout the project. Searching the project for all instances of `user` will be overwhelming to the point where the search feature won't be useful. Note that the default search for many text-editors will return all instances of `user` even if it is part of a larger word such as `current_user` or `new User` or `aMuseRecording`.

## Institution
The Institutional category gets a little more spiritual. It is our third "I" and has perception beyond the other two. It points us to look both within and without our project and write names that are in harmony with the conventions set forth.

Setting spirituality aside, meaningful names should be institutional and follow the conventions (1) set internally by the codebase in which you are writing and (2) set externally by the programming language itself. Keeping with these conventions adds meaning that future developer will understand. Deviating from convention adds noise and false clues in the codebase.

###Internal Institution

This type of convention will typically differ between codebases written by different people. The differences may not be very substantial. However, deviating from the consensus will detract from meaning.

I mentioned one stylistic convention above, and that is with how names are capitalized. If the consensus for constants is that they are written in all caps, then continue doing so for constants. If all file names are snake_case while the files' titular function names are camelCase, stick with that convention. There is usually a meaningful reason for it. Even if there isn't a meaningful reason for it, there is a pattern. And breaking the pattern creates noise and disorganization--especially when files are organized alphabetically.

Another internal convention is deciding on which verb to prepend to function names (e.g., `get`, `retrieve`, and `fetch`); or noun to append to variable names (e.g., `nameArray`, `nameGroup`, or simply `names`). It doesn't matter which verb or noun you choose, just make sure it is used consistently in the code base.

Assume I have two functions each making similar GET requests but one is named `getAccounts` while the other is called `retrieveRecords`. Implicitly it seems that there is some difference between these functions other than the data being requested. If there is no difference, then they should both have the same prefix. If there is a difference, then the names should better telegraph that difference.

###External Institution

As mentioned above, external institution involves the conventions of the language in which your project is written. This takes second priority over maintaining internal institution. However, if the internal convention deviates substantially from the language's overall stylistic and naming convention, this may warrant a discussion on how to revert or better conform to the language's conventions.

Not only are the language's conventions more tried and true; any person first coming into a codebase that doesn't follow the external conventions will take longer to ramp up to speed. This is not as true if the codebase follows the language's stylistic and naming conventions.

The best place to learn of a language's convention is to refer to their style guide. However, here are a few universal standards:

- Classes should be capital CamelCase nouns or noun-phrases--e.g., `Users` or `UserAccounts`.

- Variables should be lower camelCase or snake_case nouns or noun-phrases--e.g., `selectedUser` or `selected_user`.

- Function and Methods should be lower camelCase or snake_case, and begin with a verb and end with a noun or noun-phrase--e.g., `getUsers` or `get_accounts`.

## The Scope Qualifier
The above rules _can_ (but arguably _shouldn't_) be bent in a few small circumstances based primarily on the level of scope. I think of it an Inverse Rule of Scope: The broader the scope, the more strictly the rules should be followed; the narrower the scope, the more loosely. Most of the above principles should be adhered to regardless of scope, but there is a little wiggle room for the length and detail of the names. Note: This rule is not another _I_ for creating meaningful names; it is just a qualifier.

###Single letter names:

Because single letter names do not convey the intent of the author, they should be avoided. However, when their use is part of a language's larger convention, then that convention conveys intent. For example, JavaScript uses `e` as shorthand for an event. Many languages use `i` to signify a counter in a `for` loop or the `index` in an iterative operation. This meaning becomes lost the further you move from where the variable is declared. As a result, these should only be used in narrow scope.

###Vaguely named variables:

These are typically acceptable in short functions and narrow scope where the context is completely obvious. However, it made still be worthwhile to write a meaningful name. What is obvious to one person may be puzzling to the next.

###Searchable names:

If the scope of what you are searching is narrow, likely any word won't be too hard to find. However single letter names will still create problems. Additionally, if the same name is used many times throughout the file, you may experience some mild frustration trying to jump to the variable within any one particular section.

## The Abstraction Qualifier
Given our desire to keep our code DRY, using more generic names in abstractions is permissible. However even in a highly abstract function, there are still much better names than `obj` or `a1, a2, a3`.

## Conclusion
Hopefully these categories are broad enough to include most rules for creating meaningful names (even ones I failed to mention), yet specific enough so that the details can be remembered. Do make an effort to creating meaningful names. They help everyone working in the codebase. In turn, it might encourage others to write meaningful names, as well.

## Sources
  - Robert C. Martin, _Clean Code: A Handbook of Agile Software Craftsmanship_
  - _clean-code-javascript_, https://github.com/ryanmcdermott/clean-code-javascript
  - _ruby-style-guide_, https://github.com/bbatsov/ruby-style-guide
