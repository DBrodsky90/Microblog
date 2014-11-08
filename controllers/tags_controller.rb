#INDEX
get '/tags' do
	@tags = Tag.all
	erb :'tags/index'
end

#NEW
get '/tags/new' do
	erb :'tags/new'
end

#SHOW
get '/tags/:id' do
	@tag = Tag.find(params[:id])
	erb :'tags/show'
end

#CREATE
post '/tags' do
	tag = Tag.create(params[:tag])
	if tag.save
		redirect "/tags"
	else
		redirect "/tags/new"
	end
end

#EDIT
get '/tags/:id/edit' do
	@tag = Tag.find(params[:id])
	erb :'tags/edit'
end

#UPDATE
put '/tags/:id' do
	tag = Tag.find(params[:id])
	if tag.update(params[:tag])
		redirect "/tags/#{tag.id}"
	else
		redirect "/tags/#{tag.id}/edit"
	end
end

#DELETE
delete '/tags/:id' do
	tag = Tag.find(params[:id])
	if tag.destroy
		redirect "/tags"
	else
		redirect "/tags/#{tag.id}/edit"
	end
end

