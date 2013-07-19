get '/posts' do
  @posts = Post.order('created_at DESC')
  erb :index
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :post
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :edit
end

post '/posts/:id' do
  p params
  @post = Post.find(params[:id])
  @post.update_attributes(title: params[:title], author: params[:author], content: params[:content])
  redirect to "/posts/#{@post.id}"
end

get '/delete/:id' do
  Post.delete(params[:id])
  redirect to "/"
end

get '/new' do
  erb :new
end

post '/new' do
  # @post = Post.create(title: params[:title], author: params[:author], content: params[:content])
  @post = Post.create(params[:post])
  params[:tag].split(", ").each do |tag|
    @post.tags << Tag.find_or_create_by_name(tag)
  end



  redirect to "/posts/#{@post.id}"
end
