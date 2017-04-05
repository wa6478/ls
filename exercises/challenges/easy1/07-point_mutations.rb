class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(second_strand)
    distance = 0
    @strand.chars.each.with_index do |char, index|
      break if index >= second_strand.size
      distance += 1 if char != second_strand[index]
    end
    distance
  end
end