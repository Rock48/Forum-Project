require 'sequel'
require 'sqlite3'
require 'sinatra'

# Connect to the database sqlite file
database = Sequel.connect('sqlite://databases/blog.sqlite')

get '/' do
    # Retrieve the table as a ruby object
    @posts = database[:posts]

    # Run and send the page
    erb :blog
end

post '/' do
    # Retrieve the table as a ruby object
    @posts = database[:posts]

    # Insert the user's data into the database.
    @posts.insert(:title => params[:title], :body => params[:content], :creator => params[:creator], :time => Time.now.to_i)
end