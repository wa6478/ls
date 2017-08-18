require 'minitest/autorun'

require_relative 'car'

describe 'Car#wheels' do # describe block is what houses expectation style test
  it 'has 4 wheels' do # expectation style ("spec-style") tests are written with `it` method
    car = Car.new
    car.wheels.must_equal 4
  end
end