require 'sinatra'
require 'sinatra/content_for'
require 'tilt/erubis'

require_relative 'lib/bookshelf_db'

configure(:development) do
  require 'sinatra/reloader'
  also_reload 'bookshelf_db.rb'
end

configure do
  enable :sessions
  set :session_secret, 'ac90c6e6d7c1248db12a9efaa704213d476401b98eb5b182175ee937e20b0274'
  set :erb, escape_html: true
end

before do
  @storage = BookshelfDatabase.new(logger)
end

after do
  @storage.disconnect
end

helpers do
  def load_list(id)
    shelf = @storage.lookup_shelf(id)
    return shelf if shelf
  
    session[:error] = 'This Bookshelf was not found.'
    redirect '/'
  end
end

get '/' do
  erb :bookshelves, layout: :layout
end

not_found do
  session[:error] = 'Invalid URL (not found).'
  redirect '/'
end