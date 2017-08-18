ENV["RACK_ENV"] = "test"

require 'minitest/autorun'
require 'rack/test'
require 'fileutils'

require_relative "../cms.rb"

class AppTest < Minitest::Test
  include Rack::Test::Methods
  
  def setup
    FileUtils.mkdir_p(data_path)
  end

  def teardown
    FileUtils.rm_rf(data_path)
  end

  def app
    Sinatra::Application
  end

  def create_document(name, content = '')
    File.open(File.join(data_path, name), 'w') do |file|
      file.write(content)
    end
  end

  def session
    last_request.env['rack.session']
  end

  def admin_session
    { 'rack.session' => { user: 'admin' } } 
  end

  def test_index
    create_document 'about.md'
    create_document 'changes.txt'

    get '/'

    assert_equal 200, last_response.status
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']
    assert_includes last_response.body, 'about.md'
    assert_includes last_response.body, 'changes.txt'
  end

  def test_history_txt
    create_document 'history.txt', '2015 - Ruby 2.3 released'

    get '/history.txt'

    assert_equal 200, last_response.status
    assert_equal 'text/plain', last_response['Content-Type']
    assert_includes last_response.body, '2015 - Ruby 2.3 released'
  end

  def test_file_not_found
    get '/definitely_invalid_file_name.txt'

    assert_equal 302, last_response.status
    assert_includes 'File not found', session[:message]
  end

  def test_markdown
    create_document 'ruby.md', '#Markdown'

    get '/ruby.md'

    assert_equal 200, last_response.status
    assert_equal 'text/html;charset=utf-8', last_response['Content-Type']
    assert_includes last_response.body, '<h1>Markdown</h1>'
  end

  def test_edit
    create_document 'ruby.md', '#Markdown'

    get '/ruby.md/edit', {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, 'form method="post"'
    assert_includes last_response.body, %q(<textarea name="content")
  end

  def test_edit_signed_out
    get '/ruby.md/edit'

    assert_equal 302, last_response.status
    assert_equal 'You must be signed in to do that', session[:message]
  end

  def test_updating_document
    create_document 'changes.txt'
    
    post '/changes.txt', {content: 'new content'}, admin_session

    assert_equal 302, last_response.status
    assert_includes "Your changes to changes.txt have been saved.", session[:message]

    get '/changes.txt'
    assert_equal 200, last_response.status
    assert_includes last_response.body, 'new content'
  end

  def test_updating_document_signed_out
    post '/changes.txt', {content: 'new content'}

    assert_equal 302, last_response.status
    assert_equal 'You must be signed in to do that', session[:message]
  end

  def test_new_doc_page
    get '/new', {}, admin_session

    assert_equal 200, last_response.status
    assert_includes last_response.body, 'new document'
    assert_includes last_response.body, '<input'
    assert_includes last_response.body, %q(<button type=)
  end

  def test_new_doc_page_signed_out
    get '/new'

    assert_equal 302, last_response.status
    assert_equal 'You must be signed in to do that', session[:message]
  end

  def test_new_doc_creation
    post '/new', {new_filename: 'newfile.txt'}, admin_session
    assert_equal 302, last_response.status
    assert_includes 'newfile.txt has been created.', session[:message]

    get '/'
    assert_equal 200, last_response.status
    assert_includes last_response.body, 'newfile.txt'
  end

  def test_new_doc_creation_signed_out
    post '/new', {new_filename: 'newfile.txt'}

    assert_equal 302, last_response.status
    assert_equal 'You must be signed in to do that', session[:message]
  end

  def test_new_doc_blank_file_error
    post '/new', {new_filename: ''}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, 'name is required'
  end

  def test_new_doc_invalid_extension
    post '/new', {new_filename: 'test.html'}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, 'File extension must be .md or .txt'
  end

  def test_new_doc_invalid_extension_again
    post '/new', {new_filename: 'new.rb'}, admin_session
    assert_equal 422, last_response.status
    assert_includes last_response.body, 'File extension must be .md or .txt'
  end

  def test_delete
    create_document 'deleteme.txt'

    post '/deleteme.txt/delete', {}, admin_session
    assert_equal 302, last_response.status
    assert_equal "deleteme.txt has been deleted.", session[:message]
  
    get '/'
    refute_includes last_response.body, %q(href="/deleteme.txt)
  end

  def test_delete_signed_out
    create_document 'deleteme.txt'

    post '/deleteme.txt/delete'
    assert_equal 302, last_response.status
    assert_equal 'You must be signed in to do that', session[:message]
  end

  def test_duplicate
    create_document 'hello.txt', 'world'

    post '/hello.txt/duplicate', {}, admin_session
    assert_equal 302, last_response.status
    assert_equal "hello.txt has been duplicated and saved as hello(1).txt", session[:message]

    get '/hello(1).txt'
    assert_equal 200, last_response.status
    assert_includes last_response.body, 'world'
  end

  def test_duplicate_signed_out
    create_document 'hello.txt', 'world'

    post '/hello.txt/duplicate'
    assert_equal 302, last_response.status
    assert_equal 'You must be signed in to do that', session[:message]
  end

  def test_signin
    get '/signin'

    assert_equal 200, last_response.status
    assert_includes last_response.body, '<input type="text" name="user'
    assert_includes last_response.body, '<button type="submit">Sign In'
    assert_includes last_response.body, '<form method="post" action='
  end

  def test_signout
    get '/', {}, admin_session
    assert_includes last_response.body, 'admin'

    post '/signout'
    assert_equal 302, last_response.status
    assert_equal "You have been signed out", session[:message]
  end

  def test_invalid_credentials
    post '/signin', username: 'wrong', password: 'creds'

    assert_equal 422, last_response.status
    assert_includes last_response.body, 'Invalid credentials'
  end

  def test_correct_credentials
    post '/signin', username: 'admin', password: 'secret'

    assert_equal 302, last_response.status

    get last_response['Location']
    assert_equal 200, last_response.status
    assert_includes last_response.body, 'Welcome!'
    assert_includes last_response.body, 'Signed in as admin.'
  end

  def test_signup
    post '/signup', user: 'testuser', pass1: 'test', pass2: 'test'

    assert_equal 302, last_response.status
    assert_equal "Account 'testuser' has been created", session[:message]

    post '/signin', username: 'testuser', password: 'test'

    assert_equal 302, last_response.status

    get last_response['Location']
    assert_equal 200, last_response.status
    assert_includes last_response.body, 'Signed in as testuser.'
  end

  def test_signup_mismatched_password
    post '/signup', user: 'testuser', pass1: 'test', pass2: 'diff'

    assert_equal 422, last_response.status
    assert_includes last_response.body, 'Passwords must match'
  end

  def test_signup_short_username
    post '/signup', user: 'test', pass1: 'test', pass2: 'test'

    assert_equal 422, last_response.status
    assert_includes last_response.body, 'Username must be between 6 and 20 characters'
  end

  def test_signup_long_username
    post '/signup', user: 'test_test_test_test_test', pass1: 'test', pass2: 'test'

    assert_equal 422, last_response.status
    assert_includes last_response.body, 'Username must be between 6 and 20 characters'
  end
end
