
class MinilangRuntimeError < RuntimeError; end
class BadTokenError < MinilangRuntimeError; end
class StackEmptyError < MinilangRuntimeError; end

class Minilang
  ACTIONS = %w[PUSH POP PRINT ADD SUB MULT DIV MOD]

  def initialize(program)
    @stack = []
    @register = 0
    @program = program
  end

  def eval
    @program.split.each { |token| eval_token(token) }
  rescue MinilangRuntimeError => error 
    # rescues from errors of the specified class and subclasses
    # if not provided, by default StandardError and its subclasses are rescued
    # `=> error` creates a local variable for the error (that we can then call `message` on)
    puts error.message
  end

  private

  def eval_token(token)
    if ACTIONS.include?(token)
      send(token.downcase)
    elsif token =~ /\A[+-]?\d+\z/
      @register = token.to_i
    else
      raise BadTokenError, "Invalid token #{token}"
    end
  end

  def pop
    raise StackEmptyError, "Stack is empty!" if @stack.empty?
    @register = @stack.pop
  end

  def push
    @stack.push(@register)
  end

  def print
    puts @register
  end

  def add
    @register += pop
  end

  def sub
    @register -= pop
  end

  def mult
    @register *= pop
  end

  def div
    @register /= pop
  end

  def mod
    @register %= pop
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