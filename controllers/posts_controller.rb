#INDEX
get '/posts' do 
	@posts = Post.all
	erb :'posts/index'
end

#NEW
get '/posts/new' do
	@tags = Tag.all
	@authors = Author.all
	erb :'posts/new'
end

#SHOW
get '/posts/:id' do
	@post = Post.find(params[:id])
	erb :'posts/show'
end

#EDIT
get '/posts/:id/edit' do
	@authors = Author.all
	@tags = Tag.all
	@post = Post.find(params[:id])
	erb :'posts/edit'  
end

#CREATE
post '/posts' do 
	post = Post.new(params[:post])
	post.save
	params[:tags].each do |tag_id|
		tag = Tag.find(tag_id)
		post.tags.push(tag)
	end
	redirect "/posts/#{post.id}"
end

#UPDATE
put '/posts/:id' do
	post = Post.find(params[:id])
	if post.update(params[:post])
		redirect "/posts/#{post.id}"
	else 
		redirect "/posts/#{post.id}/edit"
	end
end

#DELETE
delete '/posts/:id' do
	post = Post.find(params[:id])
	if post.destroy
		redirect "/posts"
	else
		redirect "/posts/#{post.id}/edit"
	end
end

