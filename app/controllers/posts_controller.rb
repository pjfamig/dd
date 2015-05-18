class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :admin_user,     only: :destroy

  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all   # change to a where method to isolate by date etc.
  end
  
  def create
    @feed_items = Post.all
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new 
  end
  
  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted"
    redirect_to root_url
  end
  
  private

    def post_params
      params.require(:post).permit(:headline, :url)
    end    
    
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
