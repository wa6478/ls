# secret handshake

# write a program that will take a decimal number and convert it to the appropriate sequence of events for a secret handshake
# 1 = wink
# 10 = double blink
# 100 = close your eyes
# 1000 = jump
# 10000 = reverse the order of the operations in the secret handshake

# handshake = SecretHandshake.new 9
# handshake.commands # => ["wink","jump"]

# handshake = SecretHandshake.new "11001"
# handshake.commands # => ["jump","wink"]


# input
  # takes binary string or integer
  # validation: invalid binary strings to be 0

# some things I seem to need:
  # binary to integer conversion
  # binary validation
  # way to iterate through a number and fill an array with secret handshake operations

# how to convert between different bases?

# didn't really need decimal to binary which is built out below, so important to have a clear idea of what conversions you actually need before tackling a problem like this (was still interesting to figure out, but that's beside the point)

module Binaryable
  def bin_to_dec(binary_string)
    binary_string.chars.reduce(0) { |sum, n| sum * 2 + n.to_i }
  end

  def dec_to_bin(number)
    twos = power_of_twos_up_to(number)
    binary_conversion(twos, number)
  end

  def power_of_twos_up_to(number)
    power_of_twos = []
    power = 0
    two_to_the_power = 1
    until two_to_the_power > number
      power_of_twos.unshift(two_to_the_power)
      power += 1
      two_to_the_power = 2**power
    end
    power_of_twos
  end

  def binary_conversion(twos, number) # number.to_s(2) (Integer#to_s) would accomplish the same thing
    binary_string = ''
    twos.each do |power|
      binary, number = number.divmod(power)
      binary_string << binary.to_s
    end
    binary_string
  end
end

class SecretHandshake
  include Binaryable

  SECRETS = {
    1 => 'wink',
    2 => 'double blink',
    4 => 'close your eyes',
    8 => 'jump',
    16 => 'reverse'
  }

  def initialize(shake)
    @shake = analyze(shake)
  end

  def commands
    handshake = []
    shake_remaining = @shake
    signal = 0

    SECRETS.keys.reverse.each do |key|
      signal, shake_remaining = shake_remaining.divmod(key)
      handshake.unshift(SECRETS[key]) if signal > 0
    end

    handshake.include?('reverse') ? handshake[0..-2].reverse : handshake
  end

  private

  def analyze(shake)
    if valid_number?(shake)
      shake
    elsif valid_binary?(shake)
      bin_to_dec(shake)
    else
      0
    end
  end

  def valid_number?(number)
    number.to_s.to_i == number && number > 0
  end

  def valid_binary?(binary_string)
    binary_string =~ /[01]/
  end
end