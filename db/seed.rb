require 'active_record'

require_relative '../models/author.rb'
require_relative '../models/post.rb'
require_relative '../models/tag.rb'

ActiveRecord::Base.establish_connection({
	adapter: 'postgresql',
	database: 'microblog_db',
	host: 'localhost'
})

author_names = ["Barrack Obama", "Vladimir Putin", "Bruce Wayne"]
author_photo = [
	"http://upload.wikimedia.org/wikipedia/commons/8/87/Barack_Obama,_official_photo_portrait,_111th_Congress.jpg",
	"http://beforeitsnews.com/contributor/upload/238056/images/Vladimir-Putin_4(1).jpg",
	"http://1.bp.blogspot.com/-zouhKsiAAzg/T46XUdG5aVI/AAAAAAAANLU/MDoJNTBMnfE/s1600/Christian%2BBale%2Bas%2BBruce%2BWayne.jpg"
]
author_description = [
	"Barrack Obamaa is the President of the United States of America.",
	"Vladimir Putin is the President of Russia.",
	"Bruce Wayne by day, Batman by night."
]

post_titles = ["Barrack Obama's first post", "Vladimir Putins's first post", "Bruce Wayne's first post"]

post_content = ["Hello my name is Barrack Obama and this is my first post on the blog!",
								"Hello my name is Vladimir Putin and this is my first post on the blog!",
								"Hello my name is Bruce Wayne and this is my first post on the blog!"]


post_author = ["Barrack Obama", "Vladimir Putin", "Bruce Wayne"]


tag_name = [ "America", "Russia", "Gotham"]



obama = Author.create({
	name: author_names[0], 
	image_url: author_photo[0], 
	description: author_description[0],
})
putin = Author.create({
	name: author_names[1], 
	image_url: author_photo[1], 
	description: author_description[1],
})
wayne = Author.create({
	name: author_names[2], 
	image_url: author_photo[2], 
	description: author_description[2],
})

p1 = Post.create({
	title: post_titles[0],
	content: post_content[0],
	author: obama
})
p2 = Post.create({
	title: post_titles[1],
	content: post_content[1],
	author: putin
})
p3 = Post.create({
	title: post_titles[2],
	content: post_content[2],
	author: wayne
})


tag1 = Tag.create({
	name: tag_name[0]
})
tag2 = Tag.create({
	name: tag_name[1]
})
tag3 = Tag.create({
	name: tag_name[2]
})

tag1.posts.push(p1)
tag2.posts.push(p2)
tag3.posts.push(p3)

