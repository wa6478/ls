# Circular Queue

# A circular queue is a collection of objects stored in a buffer that is treated as though it is connected end-to-end in a circle. When an object is added to this circular queue, it is added to the position that immediately follows the most recently added object, while removing an object always removes the object that has been in the queue the longest.

# This works as long as there are empty spots in the buffer. If the buffer becomes full, adding a new object to the queue requires getting rid of an existing object; with a circular queue, the object that has been in the queue the longest is discarded and replaced by the new object.

# Assuming we have a circular queue with room for 3 objects, the circular queue looks and acts like this:

# P1  P2  P3  Comments
# All positions are initially empty
# 1     Add 1 to the queue
# 1 2   Add 2 to the queue
# 2     Remove oldest item from the queue (1)
# 2 3   Add 3 to the queue
# 4 2 3 Add 4 to the queue, queue is now full
# 4   3 Remove oldest item from the queue (2)
# 4 5 3 Add 5 to the queue, queue is full again
# 4 5 6 Add 6 to the queue, replaces oldest element (3)
# 7 5 6 Add 7 to the queue, replaces oldest element (4)
# 7   6 Remove oldest item from the queue (5)
# 7     Remove oldest item from the queue (6)
# Remove oldest item from the queue (7)
# Remove non-existent item from the queue (nil)
# Your task is to write a CircularQueue class that implements a circular queue for arbitrary objects. The class should obtain the buffer size with an argument provided to CircularQueue::new, and should provide the following methods:

# enqueue to add an object to the queue
# dequeue to remove (and return) the oldest object in the queue. It should return nil if the queue is empty.
# You may assume that none of the values stored in the queue are nil (however, nil may be used to designate empty spots in the buffer).

# Examples:

# think it makes sense to use an array to store my values, and access by index and insert should be fairly powerful ways to manipulate those values
# will need to initialize an array of nils (empty spots in buffer) equal to my passed in parameter
# basically is FIFO, with the first item in being the first to be ejected once the queue is full or the queue is instructed to remove the object
# so enqueue will just #unshift the passed argument into the array and simultaneously pop the last element in the array (which will either be a `nil` object if empty or the item that has been in the queue the longest)
# dequeue should iterate through the array in reverse, and eject the first element it encounters that is not `nil`
  # dequeue needs to return the number its ejecting
  # also need to replace the ejected number with nil

class CircularQueue
  def initialize(size)
    @queue = Array.new(size)
  end

  def enqueue(obj)
    @queue.pop
    @queue.unshift(obj)
  end

  def dequeue
    @queue.push(nil)
    oldest_idx = @queue.find_index(nil) - 1
    @queue.delete_at(oldest_idx)
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
# The above code should display true 15 times.