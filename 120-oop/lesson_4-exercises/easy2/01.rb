# Question 1

# You are given the following code:

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end
# What is the result of calling

oracle = Oracle.new 
puts oracle.predict_the_future

# A: It will return a string as defined in predict_the_future
# although normally we initialize state, in this case we haven't but I don't perceive that actually causing an issue
# the object will have access to the instance methods above
# however, it won't print anything since we are only returning a string

# Question 2

# We have an Oracle class and a RoadTrip class that inherits from the Oracle class.

class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end
# What is the result of the following:

trip = RoadTrip.new
trip.predict_the_future

# A: same as Question 1, except it will sample from the instance method 'choices' from the object's class rather than the superclass if they have the same name, since it's earlier in the method lookup path