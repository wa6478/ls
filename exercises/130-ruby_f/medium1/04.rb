# raven, finch, *birds_of_prey = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p birds_of_prey # => ['hawk','eagle']
# Based on the information given above, write a method that takes an array as an argument. In that method, yield the contents of the array to a block. In the block, write your block variables in such a way that the first two items are discarded, and the last two items are treated as birds of prey.

def assigner(array)
  yield(array)
end

assigner(%w[raven finch hawk eagle]) do |_,_,*birds_of_prey|
  puts "The #{birds_of_prey} are birds of prey"
end