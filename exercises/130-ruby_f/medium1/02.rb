# Text Analyzer - Sandwich Code

# Fill out the rest of the Ruby code below so that output similar to "Sample Output" is sent to the terminal. To get such output, read some text from a file in process and pass that text to the block provided to each call. Note that everything you need to work on is either part of the process method or part of one of the 3 blocks. No other additions or changes are required. The text you use does not have to produce the same numbers as the sample output, but should have the indicated format.

class TextAnalyzer
  def process
    file = File.open('file.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split("\n\n").count} paragraphs" }
analyzer.process { |file| puts "#{file.split("\n").count} lines" }
analyzer.process { |file| puts "#{file.split.count} words" }
# Sample Output:

# 3 paragraphs
# 25 lines
# 306 words