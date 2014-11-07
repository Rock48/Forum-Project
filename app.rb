require 'sequel'
require 'sqlite3'
require 'sinatra'

database = Sequel.connect('sqlite://databases/blog.sqlite')


get '/' do
  @posts = database[:posts]
  erb :blog
end