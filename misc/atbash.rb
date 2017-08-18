# Atbash class helps you encode strings with the Atbash cipher!
class Atbash
  CIPHER = ('a'..'z').to_a.zip(('a'..'z').to_a.reverse).to_h

  def self.encode(string)
    atbash_string = atbash(alphanum_downcase(string))
    five_char_chunks(atbash_string)
  end

  def self.alphanum_downcase(sentence)
    sentence.downcase.gsub(/[^a-z0-9]/, '')
  end

  def self.atbash(string)
    atbash_string = ''
    string.each_char do |char|
      atbash_string << (char =~ /\d/ ? char : CIPHER[char])
    end
    atbash_string
  end

  def self.five_char_chunks(string)
    string.scan(/.{1,5}/).join(' ')
  end
end
