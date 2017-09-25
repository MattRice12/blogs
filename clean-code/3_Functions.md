# Functions Should
  1. Be Small

  2. Do One Thing
    - Functions should not have multiple sections

  3. One level of abstraction per function
    - High level of abstraction --> `getHtml()`
    - Intermediate level --> `pagePathName = PathParser.render(pagePath)`
    - Low level --> `.append("\n")`

  4. Function Arguments (arity)
    - Ideal number is 0
    - Next is 1, then 2.
    - You should rarely use 3.
    - 4+ requires justification, then shouldn't be used anyways.

    - Flag arguments --> ugly; avoid them. They immediately complicate things and cause the method to do more than one thing-one thing if the argument is true, and another if false. Instead, split the function into two functions.

    - Dyadic Functions -->
      - Natural Ordering of Arguments (in order of preference):
        - Natural Ordering: `findArea(x, y)`
        - Conventional Ordering: `assertEquals(expected, actual)`
        - Non-natural Ordering; `writeField(output, name)`

    - Argument Objects --> When a function needs more than 2-3 arguments, it's likely that some arguments ought to be wrapped into an object `{key: value}`.

    - Argument Lists --> Use when multiple arguments are treated identically

  5. Have No Side Effects
    - Functions that have side effects do more than 1 thing.
    - Side effects are usually not obvious or expected by the function name.
    - Everything should be pure so it's easy to test and reason about (functional).

  6. Command Query Separation
    - Functions should either do something or answer something, but not both.
      - Does something: `set(attribute, value)`
      - Answers something: `if (isAdmin(current_user))`
    - Doing both at the same time makes it hard to infer meaning of the use case.
      - Verb: `set(attribute, value)`
      - Adjective: `isSet(attribute, value)`
      - Confusion: `if (set(attribute, value))`
