# What is Recursion?
	When first learning to code, it doesn't take long to hear the word "recursion" thrown around. And maybe you had the chance to see recursion in action. But if you were anything like me it didn't make much sense. This was partly because my first language was an imperative language (Ruby) which is not set up to deal with recursion very efficiently. Rather, as a Ruby developer, I learned iteration, and that was fine enough.

	But as I became interested in functional programming languages, iteration was no longer an option. Instead, recursion was the only* option to perform those processes that iteration used to achieve. 


# Recursion vs Iteration
	1. Recursion vs. Iteration
		- Which is faster?
			- Recursion generally slower, but can be as fast as iteration
			- Recursion can be faster in languages that rely on stateless idempotent methods?
			- Tail recursion on a decent compiler should have the same performance as loops.
		- Why recursion if it's at best equal?
			- Purley functional languages cannot us loops?

	2. Recursion patterns
		- Tail recursion
		- Head recursion

____________________________________________________________


# Recursion :
  - Internally for every recursion (i.e.) for every return value a new stack is created.
  - So, a lot of memory is wasted if we have many recursion calls !! But it is more efficient because recursion have a unique property called backtrack (i.e.) as for every return value a new Stack is created that means all the values can be reviewed back and can rectify if their is any flaw in function of the application!!

# Loops:
  - In loops, we have may have defined set of iterations based on given conditions. So for example for i = 0 after the condition has been satisfied it executes the set of instructions in the loop when it finishes execution then the instance created for i = 0 is no more exits in memory.
  - So memory wise Loops are efficient!! But, as loops instances are cleared after every iterations there is no scope for backtracking !! So loops are not efficient only this case !!
  - Recursion is recommend for the application which have abundant storage ( because many number of stacks can be created) and if we need backtrack of data!!
  - Loops are recommended to use for those applications which have enough storage ( as instances are cleared off after every iteration) and if there is no need of backtracking !!


____________________________________________________________
# Why recursion
	Due to immutability, loops in Elixir (and any functional programming language) are written differently from imperative languages. An imperative language would write a loop like this:
		```.C
			for(i = 0; i < lengthOf(array); i++) {
				array[i] = array[i] * 2;
			}
		```
	In this example, we are mutating both the array and the variable `i`. Since mutation is not possible in Elixir and other functional languages, we rely on recursion.

	Recursion occurs when a function calls itself repeatedly. Recursion mimics the above for-loop example when we give the function a condition to terminate when that condition is met. No data is mutated in the process. For example:
		```.Elixir
			def print_number(n) when n <= 1 do
				IO.puts n
			end

			def print_number(n) do
				IO.puts n
				print_number(n - 1)
			end

			print_number(3)
			# 3
			# 2
			# 1
		```

# Tail recursion
	Pattern Matching:
		Assigning variables based on patterns
		Exs:
			```.
			{a, b} = {1, 2}
				# a #=> 1
				# b #=> 2
			{a, 2} = {1, 2}
				# a #=> 1
			{a, 2} = {1, 3}
				# ** (MatchError) no match of right hand side value: {1, 3}
			```

		List Exs:
			```.
			list = [1, 2, 3]
			[head | tail] = list
				# head #=> 1
				# tail #=> [2, 3]

			[head | tail] = tail
				# head #=> 2
				# tail #=> [3]

			[head | tail] = tail
				# head #=> 3
				# tail #=> []
			```

	Notice how in this last example, `tail` returns an empty list. When creating tail-recursive functions, we use this result as our terminator.

		```.
			defmodule MyList do
				def recurse([]), do: IO.puts "End"

				def recurse([head | tail]) do
					IO.puts "Keep going: #{head}"
					recurse(tail)
				end
			end

			MyList.recurse([1, 2, 3])
		```

	In Elixir when you can have multiple definitions of the same method, it will choose the appropriate one to call based on which pattern matches correctly. If the tail contains elements it will pattern match against the second definition. But if the list is empty the call to the recurse/1 function will pattern match to the first definition which will print the final message and end the recursion.


	You probably won’t write these types of functions because they’re already available to you via the Enum module. But it’s still worth understanding what’s going on in case you do.
____________________________________________________________

## Sources:
	- https://www.quora.com/Is-recursion-faster-than-loops
	- https://stackoverflow.com/questions/3021/what-is-recursion-and-when-should-i-use-it
	- https://en.wikipedia.org/wiki/Recursion_%28computer_science%29
  - https://elixir-lang.org/getting-started/recursion.html
	- https://www.leighhalliday.com/recursion-in-elixir
	- Tail Call Optimisation http://culttt.com/2016/06/06/understanding-recursion-tail-call-optimisation-elixir/
	- https://medium.com/@dlite/your-first-elixir-recursive-function-c2309d091bc6
