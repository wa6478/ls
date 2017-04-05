# Group 1
# def check_return_with_proc
#   my_proc = proc { return }
#   my_proc.call
#   puts "This will never output to screen."
# end

# check_return_with_proc

# it appears that when the proc returns, it also return out of the calling method
# that is, it will immediately exit the method (return from the method)

# Group 2
# my_proc = proc { return }

# def check_return_with_proc_2(my_proc)
#   my_proc.call
# end

# check_return_with_proc_2(my_proc)

# trying to return from the proc when it's defined out of the method raises a LocalJumpError
# my guess is that when execution jumps to the code where the proc was defined, it is trying to return from wherever it is at
# and a proc can't return out of `<main>` or the top level of the program
# whereas in Group 1, the proc was defined within the method that called the return, so the result was just returning out of the method

# Group 3
# def check_return_with_lambda
#   my_lambda = lambda { return }
#   my_lambda.call
#   puts "This will be output to screen."
# end

# check_return_with_lambda

# looks like when a lambda returns, it returns control to the calling method

# Group 4
# my_lambda = lambda { return }
# def check_return_with_lambda(my_lambda)
#   my_lambda.call
#   puts "This will be output to screen."
# end

# check_return_with_lambda(my_lambda)

# even when the lambda is implemented outside of the calling method, it returns control to the calling method

# Group 5
def block_method_3
  yield
end

block_method_3 { return }

# seems to behave just like a proc that was implemented outside of the calling method, and raises a LocalJumpError
# problem is that we are trying to `return` from code that isn't within a method (so there is no method to `return` from)