class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
    
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment created!"
      redirect_to post_path(@post)
    else
      flash[:danger] = "Comment cannot be blank!"
       #redirect_to post_path(@post)
       @comments = @post.comments
       render 'posts/show'
    end
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

end