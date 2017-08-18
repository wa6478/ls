# FrozenTreats
# idea is that this is an ice cream shop
# subclasses like waffle cone, sugar cone, and cup, that have different capacities
# Frozen treats could have a class method that could price any subclass
# each subclass could have a class variable that tracks how many of each were sold
# they can also increment a FrozenTreats counter to tally totals
# maybe an Edible module for the waffle and sugar cones
# all can share in the FrozenTreats initialize method

module Dippable
  def dip_in_chocolate
    @dipped = true
  end

  def price
    super
    self.cost += FrozenTreats::PRICES[:dip] if @dipped
  end

  def to_s
    @dipped ? super + " Dipped in chocolate." : super
  end
end

class FrozenTreats
  PRICES = { scoops: 3, premium_cone: 1, dip: 1}
  @@total_treats = 0
  attr_accessor :scoops, :scoop_capacity, :cost

  def self.price(treat)
    treat.price
  end

  def self.total_treats
    @@total_treats
  end

  def initialize(scoop_capacity = 4)
    self.scoops = []
    self.scoop_capacity = scoop_capacity
    @@total_treats += 1
  end

  def add_scoop(flavor)
    @scoops << flavor if scoops.size < scoop_capacity
  end

  def price
    self.cost = 0
    self.cost += scoops.size * PRICES[:scoops]
  end

  def to_s
    "You have #{scoops.join(', ')} scoops, $#{cost}."
  end
end

class WaffleCone < FrozenTreats
  include Dippable

  def initialize(scoop_capacity = 3, premium_cone = true)
    super(scoop_capacity)
    @premium_cone = premium_cone
  end

  def price
    super
    self.cost += PRICES[:premium_cone] if @premium_cone
  end

  def to_s
    super + " In a waffle cone."
  end
end

class SugarCone < FrozenTreats
  include Dippable

  def initialize(max_scoops = 2)
    super(scoop_capacity)
  end

  def to_s
    super + " In a sugar cone."
  end
end

class PaperCup < FrozenTreats
  def to_s
    super + " In a paper cup."
  end
end

cone = WaffleCone.new
puts cone.price
puts cone
cone.dip_in_chocolate
puts cone.price
puts cone
# puts cone
# cone.add_scoop('vanilla')
# puts cone
# cone.add_scoop('chocolate')
# puts cone
# cone.add_scoop('cherry')
# puts cone
# cone.add_scoop('vanilla')
# cone.dip_in_chocolate
# puts cone
# puts FrozenTreats.total_treats
# cone2 = PaperCup.new
# cone.add_scoop('vanilla')
# puts cone2
# puts FrozenTreats.total_treats
# puts FrozenTreats.price(cone2)