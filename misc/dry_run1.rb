module OneOff
  def self.oneoff
    "oneoff"
  end
end

module Talonable
  def talon_grab
    "grabs dinner with talons"
  end

  def display_feathers
    Bird::FEATHERS
  end
end

class Animal
  attr_accessor :color

  def initialize(color)
    self.color = color
  end

  def speak
    "Mrrr"
  end

  def to_s
    "We are animals!"
  end
end

class Bird < Animal
  FEATHERS = "We have them"
  @@total_birds = 0

  def self.total_birds
    @@total_birds
  end

  def initialize(color, wingspan)
    super(color)
    @wingspan = wingspan
    @@total_birds += 1
  end

  def >(other)
    wingspan > other.wingspan
  end

  protected

  attr_reader :wingspan
end

class Robin < Bird
  def speak
    "chirp chirp"
  end
end

class Eagle < Bird
  include Talonable

  def speak
    "screeee"
  end
end

class Hawk < Bird
  include Talonable

  def talon_grab
    super + " and licks its beak"
  end
end

robin = Robin.new("blue", 1)
p robin
p robin.speak

eagle = Eagle.new("brown and white", 48)
p eagle
p eagle.speak
p eagle.talon_grab

#   Animal
#      |
#    Bird
#    /   \
#  Robin Eagle

hawk = Hawk.new("black", 36)
p hawk
p hawk.speak
p hawk.talon_grab
p hawk.color
hawk.color = "red"
p hawk.color

p Hawk.ancestors
puts hawk
p eagle > hawk
# p hawk > eagle
# p hawk.wingspan
# p robin.talon_grab

p Hawk.total_birds

puts eagle.display_feathers

puts OneOff::oneoff