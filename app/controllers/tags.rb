get '/tags/:tag' do
  @tag = params[:tag]
  @posts = Tag.find_by_name(@tag).posts

  erb :tagged

end

