contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# =begin
# probably want the empty hash to be filled out something like:
# email:
# address:
# phone:

# let's do it the super manual way before getting too overbuilt and fancy
# =end

# contacts["Joe Smith"] = {email: contact_data[0][0], address: contact_data[0][1], phone: contact_data[0][2]}
# contacts["Sally Johnson"] = {email: contact_data[1][0], address: contact_data[1][1], phone: contact_data[1][2]}

# p contacts

# #alternatively since contacts["Joe Smith"] returns a hash, we can go straight into defining the new set of key value pairs as so:

# # contacts["Joe Smith"][:email] = contact_data[0][0]

# p "-----"
# p contacts["Joe Smith"][:email]
# p contacts["Sally Johnson"][:phone]

# ok now time to get fancy with iteration
# first a hash of the symbols I want to use to map the contact data over

# details = [:email, :address, :phone]

# array_index = 0
# contacts.each_key do |key|
#   contact_details = {}
#   details.each_with_index do |detail, idx|
#     contact_details[detail] = contact_data[array_index][idx]
#   end
#   p contact_details
#   contacts[key] = contact_details
#   array_index += 1
# end

# p contacts

#alternate:
details = [:email, :address, :phone]

contacts.each_with_index do |(name,hash), idx|
  details.each do |detail|
    hash[detail] = contact_data[idx].shift
  end
end

p contacts

