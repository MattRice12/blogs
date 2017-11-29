# send vs **send** vs public_send

## send

## **send**

## public_send

`public_send` will only call public methods.

```rb
  class User
    def name
      puts "John"
    end

    private

    def name
      puts "Sam"
    end
  end

  user = User.new
  user.send(:name)

```
