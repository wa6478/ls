# Write a method that returns true if its argument looks like a URL, false if it does not.

def url?(string)
  !!string.match(/^https?:\/\/\S*$/)
end

puts url?('http://launchschool.com')   # -> true
puts url?('https://example.com')       # -> true
puts url?('https://example.com hello') # -> false
puts url?('   https://example.com')    # -> false

# Write a method that returns all of the fields in a haphazardly formatted string. The fields are separated by a variety of spaces, tabs, and commas, with possibly multiple occurrences of these characters.

def fields(string)
  string.split(/[\t, ]+/) #split on all one or more instances of tabs, commas, or spaces
end

p fields("Pete,201,Student")
# -> ['Pete', '201', 'Student']

p fields("Pete \t 201    ,  TA")
# -> ['Pete', '201', 'TA']

p fields("Pete \t 201")
# -> ['Pete', '201']

# Write a method that changes the first arithmetic operator (+, -, *, /) in a string to a '?' and returns the resulting string. The original string should not be modified.

def mystery_math(string)
  string.sub(/[\+\-\*\/]/, '?')
end

def mystery_math(string)
  string.gsub(/[\+\-\*\/]/, '?')
end

p mystery_math('4 + 3 - 5 = 2')
# -> '4 ? 3 - 5 = 2'

p mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# -> '(4 ? 3 + 2) / 7 - 1 = 1'


# Write a method that changes the first occurrence of the word apple, blueberry, or cherry in a string to danish.

def danish(string)
  string.sub(/\b(apple|blueberry|cherry)\b/, 'danish')
end

p danish('An apple a day keeps the doctor away')
  # -> 'An danish a day keeps the doctor away'

p danish('My favorite is blueberry pie')
# -> 'My favorite is danish pie'

p danish('The cherry of my eye')
# -> 'The danish of my eye'

p danish('apple. cherry. blueberry.')
# -> 'danish. cherry. blueberry.'

p danish('I love pineapple')
# -> 'I love pineapple'

# Challenge: write a method that changes dates in the format 2016-06-17 to the format 17.06.2016. You must use a regular expression and should only use methods described in this section.

def format_date(string)
  string.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)/, '\3.\2.\1')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2016/06/17') # -> '2016/06/17' (no change)

# Challenge: write a method that changes dates in the format 2016-06-17 or 2016/06/17 to the format 17.06.2016. You must use a regular expression and should only use methods described in this section.

def format_date(string)
  string.sub(/\A(\d\d\d\d)(\-|\/)(\d\d)(\-|\/)(\d\d)/, '\5.\3.\1')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2017/05/03') # -> '03.05.2017'
p format_date('2015/01-31') # -> '2015/01-31' (no change)
