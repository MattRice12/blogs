## Side Effects
  - Functions that have side effects do more than 1 thing.
  - Side effects are usually not obvious or expected by the function name.
  - Side effects are hard to test, complicated to maintain, and are how most bugs are created
  - Everything should be pure so it's easy to test and reason about (functional).
  - The main point is to avoid common pitfalls like sharing state between objects without any structure, using mutable data types that can be written to by anything, and not centralizing where your side effects occur.


## Goal
  - Goal is to minimize/localize side-effects

## State
  - State makes components difficult to test
  - State makes components difficult to reason about
  - State makes it too easy to put business logic in the component
  - State makes it difficult to share information to other parts of the app


## Sources
  - https://medium.freecodecamp.org/how-to-make-your-react-app-fully-functional-fully-reactive-and-able-to-handle-all-those-crazy-e5da8e7dac10

  - https://camjackson.net/post/9-things-every-reactjs-beginner-should-know

  - https://www.peterdebelak.com/blog/writing-clean-react-code/

  - https://engineering.musefind.com/our-best-practices-for-writing-react-components-dec3eb5c3fc8
