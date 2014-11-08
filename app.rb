require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'
require 'better_errors'

#Models
require_relative 'models/author.rb'
require_relative 'models/post.rb'
require_relative 'models/tag.rb'

#Controllers
require_relative 'controllers/home_controller.rb'
require_relative 'controllers/authors_controller.rb'
require_relative 'controllers/posts_controller.rb'
require_relative 'controllers/tags_controller.rb'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	database: 'microblog_db',
	host: 'localhost'
})

after { ActiveRecord::Base.connection.close }

