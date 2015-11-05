ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup'
require 'bcrypt'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

	get '/links' do
		@links=Link.all
		erb(:'links/index')
	end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    params[:name].split(" ").each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb(:'links/new')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/sign_up' do
    erb(:'users/sign_up')
  end

  post '/welcome' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect 'links'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0




end

