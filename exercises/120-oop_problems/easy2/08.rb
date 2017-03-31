# Fix The Program - Expander

# What is wrong with the following code? What fix(es) would you make?

class Expander
  def initialize(string)
    @string = string
  end

  # def to_s
    # self.expand(3) # think something to do with `self` here, seems superfluous to call
                   # in that sense, an unecessary `self` (problem 1)
                   # also `expand` is a private instance method, so by using self here, Ruby views this as if you were calling the private instance with an explicit receiver (e.g. `self`)
                   # which will raise an exception (problem 2)
  # end

  def to_s
    expand(3)  # fixed code merely drops the self
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander