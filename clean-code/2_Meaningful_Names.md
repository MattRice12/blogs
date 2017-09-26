## The Three I's of Creating Meaningful Names ##

# Informative:
    Reveals Intent
    No Disinformation
    No Noise

# Identifiable:
    Pronounceable
    Searchable

# Internal/External Convention
  - Internal
    - Pick one word per concept (`get`, `retrieve`, `fetch`)

  - External
    - Class -> Noun/Noun-phrase
    - Method -> verbNoun/Noun-phrase
    - Variable -> Noun/Noun-phrase
    - Name Capitalization
    - `i`, `j`, `n`, `e` variables within scope

# Scope
  - Broad Scope --> Strict Enforcement of Rules
  - Narrow Scope --> Looser Enforcement of Rules



# Meaningful Names
  1. Use Intention-Revealing Names
    - The name of a variable, function, or class should tell you why it exists, what it does, and how it is used.
    - If a name requires a comment, then it does not reveal its intent.

  2. Avoid Disinformation
    - Avoid words whose entrenched meanings vary from our intended meaning.
    - Avoid using data-types in names unless the object is of that data-type.
    - Avoid using names that look too similar. Differences should be obvious.
    <!-- - Spelling concepts similarly is *information*; using inconsistent spelling is *disinformation*. -->
    - Capitalization tells you a lot about your variables, constants, functions, etc.

  3. Make Meaningful Distinctions
    - Don't add noise to names to distinguish them from others:
        - `function(a1, a2, a3)`
            - `The 3 I's of Creating Meaningful Names: i1, i2, i3`
        - `car = {carMake: ..., carColor: ...}` --> `car = {make: ..., color: ...}`
    - Noise is not disinformation, it is non-information. They provide no clue to the author's intention. They serve only to bloat the codebase.
    - Noise words (ProductInfo, ProductData) are redundant and also meaningless.

  4. Pronounceable Names
    - Names are easier to read and understand if they are pronounceable.

  6. Use Searchable Names
    - Single letter variables are very hard to search
    - Searching numbers is also difficult; instead, assign numbers to constants and give constants searchable names.
    - The name `e` is a poor choice for any variable.
    - Single letter names should ONLY be used as local variables inside short methods.
    - Even still, single letter variables obscure purpose and add small, but cumulative delays.
    - Loop counters (`i`, `j`) are okay.
    - The length of a name should correspond to the size of its scope.

  5. Pick One Word per Concept (Consistent Convention)
    - Similar methods should have the same predicate `get`, `retrieve`, `fetch`. Pick one and stick with it; don't mix them.
    - Consistency adds information.


  7. Class Names
    - Classes and Objects should have noun or noun phrase names like `Customer`, `WikiPage`, `AddressParser`, etc.
    - Avoid names that are too general like `Manager`, `Processor`, or `Info`

  8. Method/Function Names
    - Methods should have verb or verb phrase names like `postPayment`, `deletePage`, `save`.
    - Accessors, mutators, and predicates should be named for their value and prefixed with `get`, `set`, and `is`, accordingly.
    - Avoid making negative function names (`isNotAdmin()` --> `isAdmin()`)


## Sources
  - Clean Code, Robert C. Martin
  - https://github.com/ryanmcdermott/clean-code-javascript
