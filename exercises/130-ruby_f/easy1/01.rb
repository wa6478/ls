# Enumerable Class Creation

# Assume we have a Tree class that implements a binary tree.

class Tree
  include Enumerable
  def each; end
  def <=>; end #  If Enumerable#max, #min, or #sort is used, the objects in the collection must also implement a meaningful <=> operator, as these methods rely on an ordering between members of the collection.
  ...
end
# A binary tree is just one of many forms of collections, such as Arrays, Hashes, Stacks, Sets, and more. All of these collection classes include the Enumerable module, which means they have access to an each method, as well as many other iterative methods such as map, reduce, select, and more.

# For this exercise, modify the Tree class to support the methods of Enumerable. You do not have to actually implement any methods -- just show the methods that you must provide.