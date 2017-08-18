# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.


class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(todo)
    raise TypeError, "can only add todo objects" unless todo.instance_of?(Todo) 
    todos << todo
  end
  alias_method :add, :<<

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def item_at(idx)
    todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(idx)
    todos.delete(item_at(idx))
  end

  def to_s
    text = "---- #{title} ----\n"
    text << todos.map(&:to_s).join("\n")
    text
  end

  def to_a
    todos
  end

  def each
    counter = 0

    while counter < size
      yield(item_at(counter))
      counter += 1
    end

    self
  end

  def select
    result = TodoList.new(title)
    
    todos.each do |todo|
      result << todo if yield(todo)
    end

    result
  end

  def find_by_title(title)
    each do |todo|
      return todo if todo.title.include?(title)
    end
    nil
  end

  def all_done
    select do |todo|
      todo.done?
    end
  end

  def done?
    todos.all? { |todo| todo.done? }
  end

  def all_not_done
    select do |todo|
      todo.done? == false
    end
  end

  def mark_done(title)
    find_by_title(title).done!
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end

  private
  
  attr_reader :todos

end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

list.add(todo3)                 # adds todo3 to end of list, returns list
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list

list.mark_done_at(1)

puts list.select { |todo| todo.done? }

list.mark_all_done
puts list
list.mark_all_undone
puts list
list.mark_done('milk')
puts list
puts list.all_done
puts list.all_not_done


# ---- Adding to the list -----

# # add
# # puts list.add(1)                     # raises TypeError with message "Can only add Todo objects"
# puts list
# # <<
# # same behavior as add

# # ---- Interrogating the list -----

# # size
# puts list.size                       # returns 3

# # first
# puts list.first                      # returns todo1, which is the first item in the list

# # last
# puts list.last                       # returns todo3, which is the last item in the list

# puts list
# # ---- Retrieving an item in the list ----

# # item_at
# # puts list.item_at                    # raises ArgumentError
# puts list.item_at(1)                 # returns 2nd item in list (zero based index)
# # puts list.item_at(100)               # raises IndexError

# # ---- Marking items in the list -----

# # mark_done_at
# # puts list.mark_done_at               # raises ArgumentError
# puts list.mark_done_at(1)            # marks the 2nd item as done
# # puts list.mark_done_at(100)          # raises IndexError
# puts list
# # mark_undone_at
# # puts list.mark_undone_at             # raises ArgumentError
# puts list.mark_undone_at(1)          # marks the 2nd item as not done,
# # puts list.mark_undone_at(100)        # raises IndexError
# puts list 
# # ---- Deleting from the the list -----

# # shift
# list.shift                      # removes and returns the first item in list

# puts list
# # pop
# list.pop                        # removes and returns the last item in list

# puts list
# remove_at
# puts list.remove_at                  # raises ArgumentError
# puts list.remove_at(1)               # removes and returns the 2nd item
# puts list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
# list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym