require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'redcarpet'
require 'yaml'
require 'bcrypt'

configure do
  enable :sessions
  set :session_secret, 'secret'
end

root = File.expand_path('..', __FILE__) # returns string of the absolute path of directory the current file is in

def data_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path('../test/data', __FILE__)
  else
    File.expand_path('../data', __FILE__)
  end
end

def credentials_path
  if ENV["RACK_ENV"] == "test"
    File.expand_path('../test/users.yml', __FILE__)
  else
    File.expand_path('../users.yml', __FILE__)
  end
end

def load_user_credentials
  YAML.load_file(credentials_path)
end

def save_user_credentials(credentials)
  File.write(credentials_path, credentials.to_yaml)
end

def valid_credentials?(username, password)
  credentials = load_user_credentials

  if credentials.key?(username)
    bcrypt_password = BCrypt::Password.new(credentials[username])
    bcrypt_password == password
  else
    false
  end
end

def filenames
  pattern = File.join(data_path, '*')
  files = Dir.glob(pattern) # Dir.glob returns all full paths that match the criteria
  files.map! { |file| File.basename(file) }
end

get '/' do
  @files = filenames
  @user = session[:user]

  erb :files
end

def file_error(file_path)
  File.file?(file_path) ? nil : 'File not found'
end

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_content(file_path)
  file_text = File.read(file_path)
  file_extension = File.extname(file_path)

  case file_extension
  when '.md'
    headers['Content-Type'] = 'text/html;charset=utf-8'
    @content = render_markdown(file_text)

    # erb :file # don't need to have a one line file, can just pass html directly to erb

    erb @content
  when '.txt'
    headers['Content-Type'] = 'text/plain' # setting headers hash provided by sinatra to specify HTTP response header
    file_text
  end
end

def active_session?
  session[:user] != nil
end

def signed_in
  unless active_session?
    session[:message] = "You must be signed in to do that"
    redirect '/'
  end
end

get '/signup' do
  erb :signup
end

def passwords_match?(pass1, pass2)
  pass1 == pass2
end

def signup_error(user, pass1, pass2)
  if passwords_match?(pass1, pass2) == false
    'Passwords must match'
  elsif user.size > 21 || user.size < 6
    'Username must be between 6 and 20 characters'
  end
end

post '/signup' do
  username = params[:user]
  password = params[:pass1]
  password_confirm = params[:pass2]

  error = signup_error(username, password, password_confirm)

  if error
    session[:message] = error
    status 422
    erb :signup
  else
    credentials = load_user_credentials
    hash_pass = BCrypt::Password.create(password)
    credentials[username] = hash_pass.to_s
    save_user_credentials(credentials)
    session[:message] = "Account '#{username}' has been created"
    redirect '/signin'
  end
end

get '/signin' do
  erb :signin
end

post '/signin' do
  user = params[:username]
  if valid_credentials?(user, params[:password])
    session[:user] = user
    session[:message] = 'Welcome!'
    redirect '/'
  else
    session[:message] = 'Invalid credentials'
    status 422
    erb :signin
  end
end

post '/signout' do
  session[:user] = nil
  session[:message] = 'You have been signed out'
  redirect '/'
end

get '/new' do
  signed_in

  erb :new
end

def filename_error(filename)
  valid_extensions = ['.txt','.md']
  if filename.size < 1
    "A name is required"
  elsif valid_extensions.include?(File.extname(filename)) == false
    "File extension must be .md or .txt"
  end
end

post '/new' do
  signed_in

  error = filename_error(params[:new_filename])

  if error
    session[:message] = error
    status 422
    erb :new
  else
    file_path = File.join(data_path, params[:new_filename])

    File.write(file_path, '')
    session[:message] = "#{params[:new_filename]} has been created."
    
    redirect '/'
  end
end

get '/:filename' do
  file_path = File.join(data_path, params[:filename]) # utilizing params hash provided by sinatra from HTTP GET request
  
  error = file_error(file_path)

  if error # favicon call seems to generate the file not found error - (fixed by adding favicon.ico to the public folder)
    session[:message] = error
    redirect '/'
  else
    load_file_content(file_path)
  end
end

get '/:filename/edit' do
  signed_in

  file_path = File.join(data_path, params[:filename])

  @filename = params[:filename]
  @content = File.read(file_path)

  erb :edit
end

post '/:filename' do
  signed_in

  file_path = File.join(data_path, params[:filename])

  File.write(file_path, params[:content])
  
  session[:message] = "Your changes to #{params[:filename]} have been saved."
  redirect '/'
end

post '/:filename/delete' do
  signed_in

  file_path = File.join(data_path, params[:filename])

  File.delete(file_path)

  session[:message] = "#{params[:filename]} has been deleted."
  redirect '/'
end

def name_finder(source_name)
  source_basename = File.basename(source_name, '.*')
  source_extension = File.extname(source_name)
  counter = 1
  files = filenames
  dup_name = "#{source_basename}(#{counter})#{source_extension}"
  while files.include?(dup_name)
    counter += 1
    dup_name = "#{source_basename}(#{counter})#{source_extension}"
  end
  dup_name
end

post '/:filename/duplicate' do
  signed_in

  source_name = params[:filename]
  source_path = File.join(data_path, source_name)
  source_content = File.read(source_path)
  dup_name = name_finder(source_name)
  dup_path = File.join(data_path, dup_name)

  File.write(dup_path, source_content)
  
  session[:message] = "#{source_name} has been duplicated and saved as #{dup_name}"
  redirect '/'
end
