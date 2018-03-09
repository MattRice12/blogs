#Principle

Software entities (classes, modules, functions, etc.) should be open for
extension, but closed for modification

# What

Once you write code, you never touch it again.

Achieve it with abstraction

# Points of Argument

When arguing against a practice, don't say that it is wrong because it violates
the principle. Explain why violating the principle is bad.

Here, modifying the closed class is bad because it opens the working class and
its dependencies up for bugs and errors.

#Reasons for OCP:

1. Several processes may depend on a central node. Manipulating this node to
   accommodate for a new process may disrupt the other processes. So we don't
   want to touch the node. Once we create and test a class, we know that it is
   working. Once we mess with it, we don't know it's working anymore. If we had
   never messed with it after creating and testing it, we know that it would
   still be working.
