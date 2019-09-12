require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do # I have called the spec for this route 'home_spec'
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :"bookmarks/index"
  end

  get '/bookmarks/add_new_bookmark' do
    erb :"bookmarks/add_new_bookmark"
  end

  post '/bookmarks/add_new_bookmark' do
    redirect 'bookmarks/index'
  end

  run! if app_file == $PROGRAM_NAME
end
