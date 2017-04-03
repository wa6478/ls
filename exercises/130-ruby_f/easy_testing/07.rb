assert_instance_of(Numeric, value)
assert_instance_of Numeric, value

assert_equal(true, value.instance_of?(Numeric))
assert_equal(true, value.class == Numeric)
assert_equal(Numeric, value.class)