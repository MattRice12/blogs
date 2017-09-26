
# Creating Noise
  Noise is created through a variety of reason.

  - Distracted by something more complicated
    From time to time, I run into the problem of writing a bland name in favor of trying to get a more complicated concept down before forgetting it. Thinking up meaningful names can distract from working through complicated concepts. I don't think this is a bad practice, but make sure to go back and write more meaningful names after getting the concept down. Doing so might actually help think through the concept better.

  - Writer's Block
    Sometimes we just cannot think of an appropriate name for a concept that is meaningfully distinct from other instances of the concept.

    Consider that if you run into this problem, your function may be doing too much. Trying splitting the function into simpler, smaller functions. Or try to figure out an abstraction that reduces the amount of details the function is juggling.

    Still, there may be some situations where coming up with a meaningful name is difficult. If the only two distinguishing factors between naming a variables is that one comes first and another second, then I think prepending `first` and `second` to the variable name is sufficient. In my experience, this is a pretty rare situation and there are still workarounds given the context (such as pushing the values into an array and calling it something like `usersArray`).

  - Laziness
    Laziness results in us creating names that don't convey intent, such as `user` instead of something more specific.

    Laziness also results in us creating noise such as number names `user1`, `user2`, `user3`

# Being too Concise
  We have the belief that the more concise the code, the more elegant and easier it is to read. While this is true, it is only half of the truth. Elegant code is both concise _AND_ meaningful. Being meaningful is a consideration for each individual piece as well as the context of the whole. The tug-of-war between concise and meaningful code is constant, as meaning often makes code longer, and concision often detracts from meaning. After all, information is verbose.

  ```
    let a = 85;
    const b = "This is an acute angle.";
    const c = "This is not an acute angle.";

    if (a < 90) {
      return b;
    } else {
      return c;
    };
  ```

  ```
    const ACUTE_ANGLE_MESSAGE = "This is an acute angle.";
    const NOT_ACUTE_MESSAGE = "This is not an acute angle.";
    let angle = 85;

    const isAcuteAngle = (angle) => {
      return angle < 90;
    };

    if (isAcuteAngle(angle)) {
      return ACUTE_ANGLE_MESSAGE;
    };
    return NOT_ACUTE_MESSAGE;
  ```

# We defer to very abstract documentation
  Whenever I review Ruby documentation, or JavaScript Lodash documentation, inevitably I see methods such as:

    ```.ruby
      a = [ "a", "b", "c" ]
      a.each {|x| print x, " -- " }
    ```

    and

    ```.JS lodash
      var users = [ { ... }, { ... } ];
      _.find(users, function(o) { return o.age < 40; });
    ```

  Their examples serve their purpose of focusing on how the methods and functions are used, but the imply bad naming practices. This is not their wrong-doing, but developers who are unfamiliar with the language's stylistic and naming conventions should be aware that this type of documentation does not follow the best practices.

# We try to be pro
  Most of us lived through 1999; we all idolized Neo viewing the world through green letters, numbers, and symbols. That's Hollywood. There is nothing realistic about understanding code that way.

  I get the appeal of doing something esoteric. But, code is already esoteric enough. Non-coders will already look at your screen and not understand anything. You're not writing for them. You're writing for other coders. And those other coders need to understand what is going on. If you think other coders should be able to understand what you wrote, then try looking back on code you wrote a month or two ago. Try to verbally explain each step in the process, ideally to another person. If you understand it and they understand it, then it is probably good enough. Still, if you explain that `u` is the current user, then you should probably just rename `u` to be `currentUser`.
