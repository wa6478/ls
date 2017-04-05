# Letter                           Value
# A, E, I, O, U, L, N, R, S, T       1
# D, G                               2
# B, C, M, P                         3
# F, H, V, W, Y                      4
# K                                  5
# J, X                               8
# Q, Z                               10

# data structure
# hash seems to be natural good fit for this "dictionary like" set of values
# should the key be an array of values? I think so.

class Scrabble
  VALUES = {
    %w[A E I O U L N R S T] => 1,
    %w[D G] => 2,
    %w[B C M P] => 3,
    %w[F H V W Y] => 4,
    %w[K] => 5,
    %w[J X] => 8,
    %w[Q Z] => 10
  }

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil?
    word = @word.upcase.gsub(/[^A-Z]/, '')
    word.chars.reduce(0) do |sum, char|
      VALUES.each do |k, v|
        sum += v if k.include?(char)
      end
      sum
    end
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end