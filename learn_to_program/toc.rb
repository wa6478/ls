
# line_width = 50
# chapterone = "Chapter 1: How to eat cake"
# chaptertwo = "Chapter 2: How to eat pie"
# chapterthree = "Chapter 3: How to eat cereal"
# puts "Table of contents".center(line_width)
# puts chapterone.ljust(line_width / 4) + "Page 10".rjust(line_width - chapterone.length)
# puts chaptertwo.ljust(line_width / 4) + "Page 11".rjust(line_width - chaptertwo.length)
# puts chapterthree.ljust(line_width / 4) + "Page 12".rjust(line_width - chapterthree.length)


tableofcontents = []
chapter = 1
title = ""
page = 1
line_width = 50

puts "Welcome to the Table of Contents creator"

puts "What would you like the line width to be? (recommend 50)"
line_width = gets.chomp.to_i

while true
  chapterset = [chapter, title, page]
  
  puts "Please provide the title for Chapter #{chapter}:"
  title = gets.chomp
  chapterset[1] = title
  
  puts "Please provide a page number (last chapter's page number was #{page}):"
  page = gets.chomp
  chapterset[2] = page
  
  tableofcontents.push(chapterset)
  
  puts "Do you want to add another chapter? (enter 'n' to finish)"
  break if gets.chomp.downcase == "n"
  
  chapter += 1
end

puts "Table of Contents".center(line_width)
tableofcontents.each do |current_chapter|
  header = "Chapter #{current_chapter[0]} - #{current_chapter[1]}"
  pager = "Page #{current_chapter[2]}"
  puts header.ljust(line_width / 2) + pager.ljust(line_width / 4).rjust(line_width / 2)
  
  #have to think of the ljust and rjust in terms of the string of white space they create. In order for the page numbers, of varying character lengths, to all line up on the "P", I have to normalize their white space to be all the same (in this case line_width / 4). And once I call rjust on those strings, I effectively am adding additional white space on uniformly long strings (line_width / 4), which means they will line up on the first letter. Otherwise (the problem I had before), is that they line up on the last character.
end

