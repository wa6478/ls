# Atbash Cipher Coding Challenge

# Create an implementation of the atbash cipher, an ancient encryption system created in the Middle East.

# It's a substitution cipher that substitutes the first letter for the last, the second letter for second to last, etc. Example:

# First 13 letters: A|B|C|D|E|F|G|H|I|J|K|L|M
# Last 13 letters:  Z|Y|X|W|V|U|T|S|R|Q|P|O|N

# requirements
# createa class with a class method that encode a string
# input: is a string that can include numbers and symbols
# output: is a string that is all lower case, in chunks of five letters, gets rid of symbols but retains numbers as is

# because of our output not caring about case, we can convert the input string into lowercase, strip all non \w chars out (\W)
# then begin our conversion

# data structure:
# can either have a simple hash with lookups
# or can try to do some fancy math with ords
# ords seems counterintuitive since the amount of adjustment necessary would change depending on the chars position in the alphabet and also makes the code a bit less readable

# algo:
# need to fill a string with letters, and every time it reaches length of five, push into an array
# join them all on ' '

class Atbash
  CIPHER = (('a'..'z').to_a.zip(('a'..'z').to_a.reverse)).to_h

  def self.encode(sentence)
    normalized_sentence = alphanum_downcase(sentence)
    atbash(normalized_sentence)
  end

  def self.alphanum_downcase(sentence)
    sentence.downcase.gsub(/[^a-z0-9]/, '')
  end

  def self.atbash(normalized_sentence)
    substring = ''
    encoded_output = []

    normalized_sentence.each_char do |char|
      if substring.size >= 5
        encoded_output << substring
        substring = ''
      end

      substring << (char =~ /\d/ ? char: CIPHER[char])
    end

    encoded_output << substring # to catch any partial substring
    encoded_output.join(' ')
  end
end