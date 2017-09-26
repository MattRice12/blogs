### The Three I's of Creating Meaningful Names: Informative, Identifiable, and Internal/External Convention ###

Naming variables, functions, and classes will not make your program run faster. It is strictly for other developers and your future self to understand the code you wrote and be able to understand and contribute to quicker. Ideally, we should be able to read code like we read a book. This involves choosing meaningful names that are pronounceable and follow a consistent grammatical pattern. I call this the three I's: Informative, Identifiable, and Internally/Externally Consistent

# Informative
  The most important part of writing anything is to conveying information. Code is not impressionistic; it has a specific meaning that we want to make as clear as possible.

  1. Informative Names Reveal Intent
    Variable, function, and class names should reveal the reason for why they exist, what they do, and how they are used. Otherwise, future developers will spend more time trying to figure out the purpose than it would take to write an informative name.

    Single letter names such as `a` convey no information as to the author's intent or it's purpose in the code. With a few exceptions (see below), single letter names are inappropriate even in the narrowest scope.

    Names such as `user` give a better indication of what the variable references, but it's utility is still minimal.

    In both situations, maybe we can understand intent by the surrounding context. But context is a two way street. Context is created by a collection of well defined pieces. The more vague the pieces, the more vague the context.

    `clientRecord`, `selectedEmployee` give more insight on their purpose. The names don't give complete insight into what's going on, but they give sufficient enough detail to contribute positively to and be understood within the entire context. Additionally they are specific enough to distinguish from other variables with similar names, such as `patientRecord`, or `selectedManager` (whereas using `record` and `user`, respectively, are too broad to allow for much variety).

    As for what they do and how they are used:
      `getAccounts()` tells us that we are retrieving all accounts.
      `filterAccountsByDateRange()` tells us that we are taking a set of accounts and returning a subset of those accounts filtered by some selected date range.
      `isAdmin(user)` tells us that the return value is either `True` of `False`. As a result, when we see this function, we know it is asking whether the argument user is an admin or not.

  2. Informative Names Avoid Disinformation
    Just as names should reveal intent and contribute to context, they should not also muddy the intent or context.

    Do not varying from a word's common or entrenched meaning. For example, don't use `address` to refer to a user's e-mail address.

    Do not use names that confuse data-types. E.g., `let bestDoctorArray = "Matt Smith"`. Any variable with `array` in the name should be an array.

    Do not break capitalization convention. Capitalization says a lot about meaning. Subject to your language's or codebase's convention: Variables are usually camelCase or snake_case with the first letter lowercase, constants are CAPITALIZED, and classes are CamelCase with the first letter of each word capitalized. Deviating from this will leave future developers confused as to (1) the purpose of the object, (2) why this was written a certain way while others were written differently, and (3) which way they should write the name.

  3. Informative Names Avoid Noise
    Like disinformation, noise impacts overall meaning; however, unlike disinformation, it does so less directly. Instead, noise is the presence of extra, meaningless information that distinguishes names for the compiler rather than for the developer. In extreme cases, to much noise in your code base is like trying to have a conversation in a club--you might understand a few words out of an entire sentence, but you won't be able to grasp the overall meaning.

    The most common ways noise is created is by making small spelling changes to a name (e.g., `user`, `uzer`, `userr`) and adding numbers to letters or variables to show that they are similar but still different (e.g., `a1`, `a2`, `a3`). While these names are distinguishable enough for the compiler, their differences do not convey anything useful to the developer.

    Take the title of this article, for example. If I named it `The 3 I's of Creating Meaningful Names: i1, i2, and i3`, I've conveyed nothing meaningful that hasn't already been said; furthermore, I've conveyed no useful distinction between them (Credits to Matthew Giardina for thinking up this beautiful title that I so nearly used).

    Noise also occurs in the form of redundancy when none is needed. For example:
      `const Car = {carMake: ..., carColor: ...};`
    Should be:
      `const Car = {make: ..., color: ...};`

    Additionally, affixing `Info` or `Data` to the end of names adds no additional information that their base word doesn't have. `userInfo` and `user` conveys the same meaning; similarly with `productData` and `product`.

# Identifiable
    The second `I` for creating meaningful names is that they should be _Identifiable_. Being identifiable is broadly defined as being able to be both immediately understood and searchable by the developer.

    1. Pronounceable
      A developer can better identify and immediately understand a name that is pronounceable and spelled correctly. Most of us are decent enough at reading--especially those who read blogs--that we can process pronounceable words quicker than words full of noise or even abbreviations. Many people, my self included, pronounce what we read. Therefore reading `getCoAddr(c) { return c.addr };` takes me a bit more time to parse than `getCompanyAddress(company) { return company.address };`.

    2. Distinguishable
      Avoid names that look too similar. Subtle differences may be too hard to distinguish at a quick glance. For example, `getAccountsForAllCurrentEmployees()` and `getAccountsForAllFormerEmployees()`.

      When reading, we often look at the the overall structure rather than the the details of the the word. Consider the the older meme: `Aoccdrnig to a rscheearch at Cmabrigde Uinervtisy, it deosn't mttaer in waht oredr the ltteers in a wrod are, the olny iprmoetnt tihng is taht the frist and lsat ltteer be at the rghit pclae`. While misspellings are frequent and distinguishable here, the the fact that we can still read and understand meaning adds credence to the the point that we overlook details. As further support to my point that we gloss over details, you may have overlooked the the fact that every time I used the word "the" in this section (outside of the the quote), I used it twice.

      In conclusion, make sure differences are sufficiently distinct.

    3. Searchable
      Not only are pronounceable names easier to read, but they add that extra distinction to be more easily searchable. Let's build the above function out a little more:
        ```
          getCoAddr(c) {
            switch (c.state)
              case "TX":
                c.addr;
                break;
              case "CA":
                "Out of State";
                break;
          };
        ```
      If I tried to use any text-editor's find command for argument `c`, I'd immediately have excess results returned to me. This becomes even more problematic as the project grows and I'm searching between files for names. This problem isn't limited to single letter names. It also extends to names that aren't sufficiently meaningful, such as `user`. If the name `user` is used at all, it will most likely be used throughout the project. Searching the project for all instances of `user` will be overwhelming to the point where the search feature won't be useful. Note that the default search for many text-editors will return all instances of `user` even if it is part of a larger word such as `current_user` or `new User` or `aMuseRecording`.


# Internal/External Consistency
  Keeping your code internally and externally consistent adds meaning that future developer will understand. Conversely, being inconsistent adds noise and false clues when a future developer notices the inconsistency. Internal consistency involves the stylistic and naming conventions the developers of your codebase have determined to adopt. By contrast, external consistency involves the stylistic and naming conventions of the language your project is written in.

  1. Internal Consistency
    This type of convention will typically differ between codebases written by different people. The differences may not be very substantial. However, deviating from the consensus will detract from meaning.

    I mentioned one stylistic convention above, and that is with how names are capitalized. If the consensus for constants is that they are written in all caps, then continue doing so for constants. If all file names are snake_case while the files' titular function names are camelCase, stick with that convention. There is usually a meaningful reason for it. Even if there isn't a meaningful reason for it, there is a pattern. And breaking the pattern creates noise and disorganization--especially when files are organized alphabetically.

    Another internal convention is with prefixes to function names such as `getFunction`, `retrieveFunction`, and `fetchFunction`; or suffixes to variable names such as `nameArray`, `nameGroup`, or simply `names`. It doesn't matter which prefix or suffix you choose, just make sure it is used consistently in the code base for functions/variables that are used in the same way. For example, if I have two functions each making similar GET requests but one is name `getAccounts` while the other is called `retrieveRecords`, immediately we think there is some difference between these functions other than the data being requested. If there is no difference, then they should both have the same prefix. If there is a difference, then the names should better telegraph that difference.

  2. External Consistency
    As mentioned above, external consistency involves the conventions of the language that your project is written in. This takes second priority over maintaining internal consistency. However, if the internal convention deviates substantially from the language's overall stylistic and naming convention, this may warrant a discussion on how to revert or better conform to the language's conventions. Not only are the language's conventions more tried and true; any person first coming into your codebase that lacks external consistency will take longer to ramp up to speed. This is not as true if the codebase follows the language's stylistic and naming conventions.

    Since the rules for external consistency are particular to whichever language you are writing in, I can't offer too many helpful examples.

    However, making sure your names are grammatical is a pretty universal standard.
      - Classes should be capital CamelCase nouns or noun-phrases--e.g., `Users` or `UserAccounts`.
      - Variables should be lower camelCase or snake_case nouns or noun-phrases--e.g., `selectedUser` or `selected_user`.
      - Function and Methods should be lower camelCase or snake_case, and begin with a verb and end with a noun or noun-phrase--e.g., `getUsers` or `get_accounts`.

# The Scope Qualifier
  Following the above three principles consistently will yield code that is easier to read and write. However, it is worth mentioning when you can bend these rules. And that centers around the level of scope. In general, the broader the scope, the more strictly the rules should be followed; the narrower the scope, the looser. Most of the rules should be adhered to regardless of scope, but there is a little wiggle room for the length and detail of the names.

  - Single letter variables: These are only okay when their use is part of the language's larger convention. For example, JavaScript uses `e` as shorthand for an event. Many languages use `i` to signify a counter in a `for` loop. These can be used in narrow scope.

  - Vaguely named variables: These are typically acceptable in short functions and narrow scope where the context is completely obvious. However, it made still be worthwhile to write a meaningful name. What is obvious to one person may be puzzling to the next.

  - Searchable names: If the scope of what you are searching is narrow, likely any word won't be too hard to find. However single letter names will still create problems. Additionally, if the same name is used many times throughout the file, you may experience some mild frustration trying to jump to the variable within any one particular section.

# The Abstraction Qualifier
  Given our desire to keep our code DRY, using more generic names in abstractions is permissible. However even in a highly abstract function, there are still much better names than `obj` or `a1, a2, a3`.
