# Ruby Access Control: Three Formats

Private methods are methods that are intended to be used only within the class
for which they are defined. They are not visible or accessible from outside the
class, and calling them from outside the class will result in a NoMethodError.
However, other methods within the class can call private methods. They can be
thought of as class helper methods.

Private (also public and protected) methods can be written in the following
formats:

```rb
  # Block Format
  class Example
    def method_public
    end

    private
    def method_a
    end

    def method_b
    end
  end
```

```rb
  # Prepending Format
  class Example
    def method_public
    end

    private def method_a
    end

    private def method_b
    end
  end
```

```rb
  # List Format
  class Example
    def method_public
    end

    def method_a
    end

    def method_b
    end

    private :method_a, :method_b
  end
```

# Block Format

Using Block Format, the word `private` serves as a good visual cue, dividing the
class into two parts: The top part holds public methods; the bottom part holds
private methods. This convention is quickly recognized by the larger Ruby
community and serves little ambiguity.

```rb
  class User
    def name
      "#{first_name} #{last_name}"
    end

    private
    def first_name
      "John"
    end

    def last_name
      "Smith"
    end
  end

  user = User.new
  user.name
  #=> John Smith
  user.first_name
  #=> `<main>': private method `first_name' called for #<User:0x007f8b988b29c0> (NoMethodError)
```

# Prepending Format

This way gives an immediate signal that a method is private. This allows the
developer to write private methods anywhere within the class and so spends less
time worrying about organization. The downside is that worrying less about
organization may result in much more cluttered code.

```rb
  class User
    def name
      "#{first_name} #{last_name}"
    end

    private def first_name
      "John"
    end

    private def last_name
      "Smith"
    end
  end
```

# List Format

Another and less used way to write private methods is to initially write all
methods as if they were public, then at the bottom use the `private` keyword and
list the methods which should be private. You can do this with `public` and
`protected` keyword too.

```rb
  class User
    def name
      "#{first_name} #{last_name}"
    end

    def first_name
      "John"
    end

    def last_name
      "Smith"
    end

    private :first_name, :last_name
  end
```

The benefit of this syntax is that the you can quickly see all the methods
listed that are public, protected, and private. The downside of this syntax is
that it is less organized and creates much more ambiguity at first look,
especially in larger classes. All methods are clumped together, often in no
specific order, and then only on 3 or so lines is the developer made aware of
which methods are public, private, or protected. Anytime the developer needs to
know what level of access the method has, they must scroll back to those 3 lines
to verify.

That being said, this syntax should be used in certain situations--namely, with
inheritance. Subclasses inherit methods and the level of access each method has.

The problem occurs when we want to change the access level of an inherited
method. Using the block or prepending option requires us to redefine the method
itself with the different access level. These approaches are not DRY and require
the developer to make identical changes in multiple places which opens up the
possibility for mistakes. The cleaner and safer approach is to use the List
Format:

```rb
  class Bot < User
    def operation_name
      name + ", Serial: " + serial_number
    end

    def serial_number
      rand(10000...99999).to_s
    end

    private :name, :serial_number
  end

  bot = Bot.new
  puts bot.operation_name
  #=> John Smith, Serial: 39820
```
