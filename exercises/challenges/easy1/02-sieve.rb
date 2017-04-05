
class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    unmarked = (2..@limit).to_a
    marked = []
    primes = []
    loop do
      break if unmarked.empty?
      primes << unmarked.shift
      unmarked.each do |num|
        marked << num if num % primes.last == 0
      end
      marked.each do |num|
        unmarked.delete(num)
      end
    end

    primes
  end
end