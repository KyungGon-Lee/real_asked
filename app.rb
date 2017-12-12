require 'rubygems'
require 'sinatra'
require 'data_mapper' # metagem, requires common plugins too.
require "sinatra/reloader"

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :body, Text
  property :created_at, DateTime
end

DataMapper.finalize
Post.auto_upgrade!
set :bind, '0.0.0.0' # 이거 쓰면 ruby app.rb 뒤에 -o 0.0.0.0 안써도 됨

get '/' do
  @post = Post.all.reverse
  # Post.create(
  #   :title => params["title"],
  #   :body => params["content"]
  # )
  # redirect to '/'
  erb :index

end
get '/abap' do
  Post.create(
    :title => params["title"],
    :body => params["content"]
  )
    @asker = params["title"]
  redirect to '/ask'
end
get '/ask' do

  erb :ask
end
