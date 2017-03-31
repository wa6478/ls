# Fix the Program - Flight Data

# Consider the following class definition:

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# There is nothing technically incorrect about this class, but the definition may lead to problems in the future. How can this class be fixed to be resistant to future problems?

class Flight
  attr_reader :database_handle # change from accessor to reader, so we can only read this instance variable

  def initialize(flight_number)
    @database_handle = Database.init # since we're assigning the database a specific database, assumption is that this isn't something we want to be able to change
    @flight_number = flight_number
  end
end