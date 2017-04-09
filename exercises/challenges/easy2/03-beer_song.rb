# edge cases (1 bottle, 0 bottles)
# be able to call multiple verses
class BeerSong
  def verse(*verse_numbers)
    @verse_numbers = verse_numbers
    output = []
    @verse_numbers.each do |number|
      if number > 2
        output << "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
                  "Take one down and pass it around, #{number - 1} bottles of beer on the wall.\n"
      elsif number == 2
        output << "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
                  "Take one down and pass it around, #{number - 1} bottle of beer on the wall.\n"
      elsif number == 1
        output << "#{number} bottle of beer on the wall, #{number} bottle of beer.\n" \
                  "Take it down and pass it around, no more bottles of beer on the wall.\n"
      elsif number == 0
        output << "No more bottles of beer on the wall, no more bottles of beer.\n" \
                  "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      end
    end
    output.join("\n")
  end

  def verses(from, to)
    verse(*(to..from).to_a.reverse)
  end

  def lyrics
    verses(99, 0)
  end
end

BeerSong.new.verses(99, 95)