ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup'

class BookmarkManager < Sinatra::Base
enable :sessions

	get '/links' do
		@links=Link.all
		erb(:'links/index')
	end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    tag = Tag.create(tags: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb(:'links/new')
  end

  run! if app_file == $0

end