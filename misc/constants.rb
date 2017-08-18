module Penguinable
  def self.constantinople
    p ALWAYS
  end
end

# ALWAYS = 'Main'
module Sealable
  ALWAYS = 'Sealable'
  class LeopardSeal
    include Penguinable
    ALWAYS = 'Leopard'

    def self.constant
      p ALWAYS
    end
  end
end

Sealable::LeopardSeal.constant
Penguinable.constantinople

