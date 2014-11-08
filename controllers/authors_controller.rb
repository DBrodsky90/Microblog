#INDEX
get '/authors' do
	@authors = Author.all
	erb :'authors/index'
end

#NEW
get '/authors/new' do
	erb :'authors/new'
end

#SHOW
get '/authors/:id' do
	@author = Author.find(params[:id])
	erb :'authors/show'
end

#CREATE
post '/authors' do
	author = Author.create(params[:author])
	if author.save
		redirect "/authors"
	else
		redirect "authors/new"
	end
end

#EDIT
get '/authors/:id/edit' do
	@author = Author.find(params[:id])
	erb :'authors/edit'
end

#UPDATE
put '/authors/:id' do
	author = Author.find(params[:id])
	if author.update(params[:author])
		redirect "/authors/#{author.id}"
	else
		redirect "/authors/#{author.id}/edit"
	end
end

#DELETE
delete '/authors/:id' do
	author = Author.find(params[:id])
	if author.destroy
		redirect "/authors"
	else
		redirect "/authors/#{author.id}/edit"
	end
end

