get '/' do
  # Look in app/views/index.erb
  @posts = Post.order('created_at DESC').limit(5)
  erb :index
end

