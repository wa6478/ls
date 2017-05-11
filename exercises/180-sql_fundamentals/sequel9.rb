require 'sequel'

puts 'What database do you want to use?'
db = gets.chomp

puts 'What table do you want to access?'
table = gets.chomp.to_sym

DB = Sequel.connect("postgres://localhost/#{db}")

DB[table].columns.sort.each do |column|
  begin
    average = DB[table].avg(column)
    puts "#{column}: #{format '%f', average}" if average
  rescue Sequel::DatabaseError
    # ignore
  end
end

DB.disconnect

puts #every average of table column