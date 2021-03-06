class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :books
  end

  get '/seasons' do
    erb :books
  end

  get '/members' do
    erb :members
  end

  get '/member_refresh' do
    erb :member_refresh
  end

  get '/book/:name' do
    bookfinder_client = BookFinder::Client.new
    @book = bookfinder_client.books(params["name"]).first

    erb :book
  end
end
