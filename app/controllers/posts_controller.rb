class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def index
    @posts = Post.all   # change to a where method to isolate by date etc.
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render 'static_pages/about'
    end
  end

  def destroy
  end  
  
  private

    def post_params
      params.require(:post).permit(:headline, :url)
    end    
end
