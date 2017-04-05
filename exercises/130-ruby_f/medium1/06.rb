puts "--Group 1--"
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# notes:
# Can create a proc with `proc` or `Proc.new`
# my_proc appears to be an object of the Proc class
# seems to operate like a saved block that is invoked via the `call` method
# the argument passed into the `call` method is passed as the local variable into the proc
# the proc also didn't really care whether or not it received an argument

puts "--Group 2--"
my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
# my_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }
# puts my_third_lambda
# puts my_third_lambda.class
# my_third_lambda.call('parrot')
# my_third_lambda.call

# new lambda object can be created with a call to `lambda` or `->`
# Looks like a lambda ia actually a type of proc object
# invoked with `lambda` instead of `proc` but otherwise set up is the same
# or via this syntax that's new to me " -> (argument) { block w/o param } "
# called with an argument that it expects, seems to perform just like a proc
# called without an argument that it expects, it raises an error about number of arguments (enforces the number of arguments, i.e. strict arity)
# Lambda is not its own class

puts "--Group 3--"
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# when a method yields to a block, without passing its parameter, the block will not complain and execute without the parameter
# like a proc in that way
# when the method yields to a block that wasn't given, it raises an error

puts "--Group 4--"
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}." # will print, but since only one string argument was passed, this won't print seal
end
block_method_2('turtle') { puts "This is a #{animal}."} # raises an error because the method argument wasn't passed to the block via |param|

# Comparison
# lambdas are types of proc objects
# therefore, lambdas and procs are objects
# implicit blocks are not objects, just a grouping of code, a type of closure
# lambdas have strict arity, whereas procs have lenient arity
# i.e. lambdas enforce the number of arguments passed to them, whereas procs do not (they will just pass nil without an argument)
# blocks behave like procs


