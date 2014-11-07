#INDEX
get '/posts' do 
	@posts = Post.all
	erb :'posts/index'
end

#SHOW
get '/posts/:id' do
	@post = Post.find(params[:id])
	erb :'posts/show'
end

#NEW


#EDIT


#CREATE


#UPDATE


#DELETE