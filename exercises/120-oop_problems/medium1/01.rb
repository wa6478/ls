# Privacy

# Consider the following class:

class Machine

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def show_me
    puts "Switch is #{switch}"
  end

  private

  attr_writer :switch
  attr_reader :switch


  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

device = Machine.new
device.start
p device
device.show_me

# Modify this class so both flip_switch and the setter method switch= are private methods.