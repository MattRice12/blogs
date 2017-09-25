# for-loops

    ```.for-loop
      for(i = 0; i < 5; i++) {
        print i
      }
    ```

    ```.recursion
      def print_number(n) when n >= 5 do
        IO.puts n
      end

      def print_number(n) do
        IO.puts n
        print_number(n + 1)
      end
    ```

    ____________________________________________________________
    With Arrays

    ```.for-loop
      for(i = 0; i < array.length; i++) {
        print array[i]
      }
    ```

    ```.recursion
      def print_head([]) do
        return
      end

      def print_head([ head | tail ]) do
        IO.puts head
        print_head(tail)
      end
    ```
# map
  ```.Ruby
    [1, 2, 3].map { |n| n * 2 }
    #=> [2, 4, 6]
  ```

  ```.Elixir
    defmodule Math do
      def double_each([]) do
        []
      end

      def double_each([head | tail]) do
        [head * 2 | double_each(tail)]
      end
    end

    Math.double_each([1, 2, 3])
    #=> [2, 4, 6]
  ```

  ```.Alternative
    Enum.map([1, 2, 3], fn(x) -> x * 2 end)
  ```

# reduce

  ```.ruby
    [1, 2, 3].reduce { |sum, n| sum + n }
    #=> 6
  ```

  ```.Elixir
    defmodule Math do
      def sum_list([], accumulator) do
        accumulator
      end

      def sum_list([head | tail], accumulator) do
        sum_list(tail, head + accumulator)
      end
    end

    IO.puts Math.sum_list([1, 2, 3], 0)
    #=> 6
  ```

  ```.Alternative
    Enum.reduce([1, 2, 3], 0, fn(x, acc) -> x + acc end)
  ```
