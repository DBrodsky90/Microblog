require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'


require_relative 'models/author.rb'
require_relative 'models/post.rb'
require_relative 'models/tag.rb'

require_relative 'controllers/home_controller.rb'
require_relative 'controllers/authors_controller.rb'
require_relative 'controllers/posts_controller.rb'
require_relative 'controllers/tags_controller.rb'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

after { ActiveRecord::Base.connection.close }

run Sinatra::Application