# Banner Class

# Behold this incomplete class for constructing boxed banners.

class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :message

  def horizontal_rule
    '+' + '-' * (message.length + 2) + '+'
  end

  def empty_line
    '|' + ' ' * (message.length + 2) + '|'
  end

  def message_line
    "| #{message} |"
  end
end
# Complete this class so that the test cases shown below work as intended. You are free to add any methods or instance variables you need. However, do not make the implementation details public.

# You may assume that the input will always fit in your terminal window.

# Test Cases

banner = Banner.new('To boldly go where no one has gone before.')
puts banner
# +--------------------------------------------+
# |                                            |
# | To boldly go where no one has gone before. |
# |                                            |
# +--------------------------------------------+
banner = Banner.new('')
puts banner
# +--+
# |  |
# |  |
# |  |
# +--+

# further exploration for specified width:

class Banner
  MAX_WIDTH = 80

  def initialize(message, width)
    @message = message
    @width = width > 80 ? 80 : width
  end

  def to_s
    return 'Width is too small, must be larger than message' if width < message.size + 2
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  attr_reader :message, :width

  def horizontal_rule
    ('+' + '-' * (width - 2) + '+').center(width)
  end

  def empty_line
    ('|' + ' ' * (width - 2) + '|').center(width)
  end

  def message_line
    white_space = (width - message.size - 2) / 2

    if message.size.odd? || width.odd?
     left_space = white_space + 1
    else 
     left_space = white_space
    end
    left_space = white_space if message.size.odd? && width.odd?

    ('|' + ' ' * left_space + "#{message}" + ' ' * white_space + '|')
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 82)
puts banner