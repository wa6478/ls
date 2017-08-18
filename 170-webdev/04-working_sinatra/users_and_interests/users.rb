require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

# - when a user loads the home page, redirect to page
#   - redirected page has all of the users' names
# - each of the users' names should be a link to a page for that user
#   - each user's page should have their email and comma delimited interests
#   - at bottom of page, links to all other uses, excluding current
# - at the bottom of every page, "There are n users with total of m interests"
# - use helper method count_interests to determine total number of interests
# - add a new user to the users.yaml file and verify that site updates accordingly

# need a landing page that has a list of all users (like a toc)
# need to have a user page
# use a common layout and yield for the differences only

def user_parser(file) # using YAML.load_file would have saved me a ton of effort here -- spend some time to better understand how it works and what it can do for you
  users_and_interests = file.split(/\s/)
  users_and_interests.delete("-")
  users_and_interests.delete("")
  users_and_interests.delete("---")

  users_output = []
  user_set = nil
  user = ""
  users_and_interests.each do |item|
    if item[0] == ':' && (item != ':email:' && item != ':interests:')
      users_output << user_set unless user_set == nil
      user = item[1..-1].chop.to_sym
      attributes = { email: '', interests: [] }
      user_set = { user => attributes }
      user_set[user][:email] = "bs@example.com"
    elsif item.include?("@")
      user_set[user][:email] = item
    elsif item[0] != ':'
      user_set[user][:interests] << item
    end
  end
  users_output << user_set
  users_output
end

before do
  @content = user_parser(File.read(YAML::load('users.yaml')))
end

helpers do
  def count_users
    @content.count
  end

  def count_interests
    counter = 0
    @content.each do |user_set|
      user_set.each do |user, attributes|
        counter += attributes[:interests].count
      end
    end

    counter
  end
end

get '/' do
  redirect '/all_user'
end

def avail_users(current_user = '')
  output = ''
  @content.each do |user_set|
    user_set.each_key do |user|
      output << "<li><a href='/user/#{user}'>#{user}</a></li>" unless current_user == user
    end
  end
  output
end

def interests(user)
  output = ''
  @content.each do |user_set|
    if user_set.key?(user)
      user_set[user][:interests].each do |interest|
        output << "<li>#{interest}</li>"
      end
    end
  end
  output
end

def email(user)
  output = ''
  @content.each do |user_set|
    if user_set.key?(user)
      output = user_set[user][:email]
    end
  end
  output
end

get '/all_user' do
  @title = "All Users"
  @users = avail_users

  erb :all_user
end

get '/user/:name' do
  name = params[:name].to_sym
  @title = "#{name}"
  @users = avail_users(name)
  @interests = interests(name)
  @email = email(name)

  erb :user
end