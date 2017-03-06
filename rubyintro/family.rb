family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
          
immediate = [:sisters, :brothers]
names = []

family.each do |k,v|
  names << v if immediate.include?(k)
end

p names.flatten

namesagain = family.select { |k,v| k == :brothers || k == :sisters }

p namesagain
p namesagain.values.flatten