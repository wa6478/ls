# Question 2

# Alyssa created the following code to keep track of items for a shopping cart application she's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# Alan looked at the code and spotted a mistake. "This will fail when update_quantity is called", he says.

# Can you spot the mistake and how to address it?

# A: update_quantity is initializing a new local variable `quantity`
# What the code probably meant to do is call the setter method `quantity` which also doesn't exist (since there is only attr_reader)
# so the problem is two-folder
# need a setter method invoked with either attr_writer / attr_accessor or defining a setter method
# and if using a setter method name quantity, have to use `self` to disambiguate it from a local variable
# or just be explicit and call the local variable by its proper name `@quantity`


# Question 3

# Alan noticed that this will fail when update_quantity is called. Since quantity is an instance variable, it must be accessed with the @quantity notation when setting it. One way to fix this is to change attr_reader to attr_accessor and change quantity to self.quantity.

# Is there anything wrong with fixing it this way?

# A: No, and in fact may be the preferred way to solve it this way, because that way you are consistent with using a setter method throughout your code

# Solution's alternate answer: nay! Because you are circumventing the protective method of update_quantity by allowing a setter method to change @quantity directly. In which case, enabling the setter method changes the public interfaces of the class. (be aware of this! What part of the class are you making public? What knobs are you enabling on the dashboard of your car?)