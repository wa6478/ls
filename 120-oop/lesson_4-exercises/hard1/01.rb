# Question 1

# Alyssa has been assigned a task of modifying a class that was initially created to keep track of secret information. The new requirement calls for adding logging, when clients of the class attempt to access the secret data. Here is the class in its current form:

# class SecretFile
#   attr_reader :data

#   def initialize(secret_data)
#     @data = secret_data
#   end
# end

# She needs to modify it so that any access to data must result in a log entry being generated. That is, any call to the class which will result in data being returned must first call a logging class. The logging class has been supplied to Alyssa and looks like the following:

# class SecurityLogger
#   def create_log_entry
#     # ... implementation omitted ...
#   end
# end

# Hint: Assume that you can modify the initialize method in SecretFile to have an instance of SecurityLogger be passed in as an additional argument. It may be helpful to review the lecture on collaborator objects for this exercise.

class SecretFile 
  attr_reader :log
  
  def initialize(secret_data)
    @data = secret_data
    @log = SecurityLogger.new
  end
  
  def get_data(username)
    @log.create_log_entry(username)
    @data
  end
end

class SecurityLogger
  attr_reader :entries
  
  def initialize
    @entries = [['Created', Time.now.to_s]]
  end
  
  def create_log_entry(username)
    @entries << [username, Time.now.to_s]
  end
end

secret = SecretFile.new('Joe Schmoe likes ice cream')
puts secret.get_data('joes10')
puts secret.get_data('joes10')
puts secret.get_data('cindy20')
puts secret.log.entries
puts secret.log.inspect
puts secret.inspect


# remove attr_reader since I want our own getter method that works with the SecurityLogger object
# think I want to initialize a new object with the data as instance variable log
# the object will be a Security Logger object
# then every time I call my new custom getter method (which can have parameters such as username), we can create a log entry