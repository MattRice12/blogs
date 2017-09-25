

# Informative
  If the purpose of creating meaningful names is so that other developers and our future selves can work in codebase, then making sure our names are informative is the most important part.

  1. Informative Names Reveal Intent
    Variable, function, and class names should reveal the reason for why they exist, what they do, and how they are used.

    In the most extreme example, using variable names such as `a` is uninformative and unhelpful. Future developers will spend more time understanding what `a` means than it would take to write an informative name.

    Names such as `user` give a better indication of what the variable references, but it's utility is still minimal. Maybe we can understand it by it's surrounding context. But context is a two way street. Context is created by a collection of well defined pieces. The more vague the pieces, the more vague the context.

    `clientRecord`, `selectedEmployee` give more insight on their purpose. In addition, this purpose contributes to and is revealed more by the surrounding context.

    As for what they do and how they are used:
      `getAccounts()` tells us that we are retrieving all accounts.
      `setUserName()` tells us that we are setting the user name.
      `isAdmin(user)` tells us that the return value is either `True` of `False`. As a result, when we see this function, we know it is asking whether the argument user is an admin or not.

    If a name requires too much context or a comment to be understand, it's not a good name.

  2. Informative Names Avoid Disinformation
    Just as names should reveal purpose and give context, they should not also muddy the purpose or context.

    Varying from a word's common or entrenched meaning is problematic. For example, using `address` when you are referencing a user's e-mail address will cause confusion. Or by assigning values to variables or properties that are typically of a different datatype, you end up using a name's inherent meaning against the developer (e.g., setting the `admin` or `registered` properties as anything other than boolean, `name` as anything other than a string, `price` as anything other than an integer or float).

    Similarly, if a variable is assigned a value of a certain datatype, don't include a different datatype in the name, (e.g., `let bestDoctorArray = "Matt Smith"`).

    Avoid names that look too similar. The subtle differences may be too hard to distinguish at a quick glance. For example, `getAccountsForAllCurrentEmployees()` and `getAccountsForAllFormerEmployees()`.

    Capitalization also says a lot about meaning. Subject to your language's or codebase's convention: Variables are usually camelCase or snake_case with the first letter lowercase, constants are CAPITALIZED, and classes are CamelCase with the first letter of each word capitalized. Deviating from this will leave future developers confused as to (1) the purpose of the object, (2) why this was written a certain way while others were written differently, and (3) which way they should write the name.

  3. Informative Names Avoid Noise
    Unlike disinformation, noise does not mislead or subtract from that name's meaning. Rather, it's bad smell comes from unnecessarily bloating the codebase. At worst, it obfuscates meaning of the surrounding code. This often occurs from being unable to think up a unique and meaningful name, or from laziness.

    For example, `user`, `uzer`, `userr` all are distinguishable enough for the compiler, but their difference is not apparent to the developer.


    Don't add noise to names to distinguish them from others:
        - `function(a1, a2, a3)`
            - `The 3 I's of Creating Meaningful Names: i1, i2, i3`
        - `car = {carMake: ..., carColor: ...}` --> `car = {make: ..., color: ...}`

    Noise words (ProductInfo, ProductData) are redundant and also meaningless.


    Here is horrible case:
      `getInfo()`
      While this name tells us we are getting something, it doesn't tell us anything about what we are getting. Info could be a specific class named Info (which is a bad name for a class), or it could be referring to something completely different, and `Info` is being used abstractly.

# Identifiable


# Internal/External Consistency

  1. Internal


  2. External



# The Scope Qualifier
  Following the above three principles consistently will yield code that is easier to read and write. However, it is worth mentioning when you can bend these rules. And that centers around the level of scope. In general, the broader the scope, the more strictly the rules should be followed; the narrower the scope, the looser. Not every rule has an exception, but I'll mention some of the more common ones.

  - Single letter variables: These are only okay when their use is part of the language's larger convention. For example, JavaScript uses `e` as shorthand for an event. Many languages use `i` to signify a counter in a `for` loop. These can be used in narrow scope.
