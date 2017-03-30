# Write a method that will take a short line of text, and print it within a box.

# Example:

# print_in_box('To boldly go where no one has gone before.')
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+

# print_in_box('')
# +--+
# |  |
# |  |
# |  |
# +--+

# You may assume that the input will always fit in your terminal window.

# def print_in_box(string)
#   horizontal_line = "+#{'-' * (string.length + 2)}+"
#   empty_line      = "|#{' ' * (string.length + 2)}|"
#   message         = "| #{string} |"

#   puts horizontal_line
#   puts empty_line
#   puts message
#   puts empty_line
#   puts horizontal_line
# end

# further exploration: modified so never wider than 80

# def print_in_box(string)
#   string = string[0..75]
#   horizontal_line = "+#{'-' * (string.length + 2)}+"
#   empty_line      = "|#{' ' * (string.length + 2)}|"
#   message         = "| #{string} |"

#   puts horizontal_line
#   puts empty_line
#   puts message
#   puts empty_line
#   puts horizontal_line
# end

# further exploration: modified so wrap at 80
# approach will be to cut the string into lines, shove into an array, then iterate over array and puts all lines

def print_in_box(string)
  string_max_width = string[0..75].length
  horizontal_line = "+#{'-' * (string_max_width + 2)}+"
  empty_line      = "|#{' ' * (string_max_width + 2)}|"

  lines = []
  until string == '' || string == nil
    lines << string[0..75]
    string = string[76..-1]
  end

  puts horizontal_line
  puts empty_line

  lines.each do |line|
    puts "| #{line} |"
  end

  puts empty_line
  puts horizontal_line
end


print_in_box('')
print_in_box('To boldly go where no one has gone before.')
print_in_box('Lets see if we can go over 80. Lets see if we can go over 80. Lets see if we can go over 80. Lets see if we can go over 80. Lets see if we can go over 80. Lets see if we can go over 80. Lets see if we can go over 80. nononono.')
