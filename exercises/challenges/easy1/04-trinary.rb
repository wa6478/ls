class Trinary
  BASE = 3

  def initialize(tri_num)
    @tri_num = tri_num =~ /[^0-2]/ ? '0' : tri_num
  end

  def to_decimal
    @tri_num.chars.reduce(0) { |sum, n| sum * BASE + n.to_i }
  end
end
