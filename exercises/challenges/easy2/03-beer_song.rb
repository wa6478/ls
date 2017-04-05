class BeerSong
  def initialize(*verses)
    @verse_number = verses
  end

  def verse
    puts "#{@verse_number} bottles of beer on the wall, #{@verse_number} bottles of beer.\n" \
      "Take one down and pass it around, #{@verse_number - 1} bottles of beer on the wall.\n"
  end
end