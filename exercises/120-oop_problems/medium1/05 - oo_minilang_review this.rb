# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value
# All operations are integer operations (which is only important with DIV and MOD).

# Programs will be supplied to your language method via a string passed in as an argument. Your program should produce an error if an unexpected item is present in the string, or if a required stack value is not on the stack when it should be (the stack is empty). In all error cases, no further processing should be performed on the program.

# You should initialize the register to 0.

# Examples:

# need Minilang class
# upon initialization create register, stack, and command from argument
# define eval method
# eval should somehow take what the parse helper returns and call the appropriate helper methods
#   (basically orchestrate the calculation)
# parse command string method
# helper methods for the different functions that can be carried out (these can be private)
require 'pry'

class Minilang
  def initialize(commands)
    self.register = 0
    self.stack = []
    @commands = parse(commands)
  end

  def eval
    commands.each do |command|
      case command
      when 'POP' then pop
      when 'PUSH' then push
      when 'PRINT' then print
      when 'ADD' then add
      when 'SUB' then sub
      when 'MULT' then mult
      when 'DIV' then div
      when 'MOD' then mod
      else
        if command.class == Fixnum
          self.register = command
        else 
          return puts "Invalid token #{command}"
        end
      end
    end
  end

  private

  attr_accessor :register, :stack
  attr_reader :commands

  def stack_check
    return puts "Stack is empty!" if stack.empty?
    stack
  end

  def parse(commands)
    commands.split.map { |el| el.to_i.to_s == el ? el.to_i : el }
  end

  def pop
    self.register = stack_check.pop
  end

  def push
    stack.push(register)
  end

  def print
    puts register
  end

  def add
    self.register = register + stack_check.pop
  end

  def sub
    self.register = register - stack_check.pop
  end

  def mult
    self.register = register * stack_check.pop
  end

  def div
    self.register = register / stack_check.pop
  end

  def mod
    self.register = register % stack_check.pop
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)