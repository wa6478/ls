assert_kind_of Numeric, value
assert_equal(true, value.class.ancestors.include?(Numeric))
assert_includes(value.class.ancestors, Numeric)