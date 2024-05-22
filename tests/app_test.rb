ENV["RACK_ENV"] = "test"

require 'minitest/autorun'
require 'rack/test'
require 'minitest/reporters'
MiniTest::Reporters.use!

require_relative '../bookshelf.rb'

class BookshelfTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_homepage
    get '/'
    assert_equal(200, last_response.status)
    assert_equal "text/html;charset=utf-8", last_response["Content-Type"]
    assert_includes(last_response.body, 'Bookshelves')
  end

  def test_invalid_route
    get '/invalid-route'
    assert_equal(302, last_response.status)
    assert_includes('not found', last_response.body)
  end

  def test_view_bookshelves
  end
end
