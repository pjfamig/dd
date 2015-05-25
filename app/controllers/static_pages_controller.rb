class StaticPagesController < ApplicationController
  def about
  end

  def home
    if params[:tag]
      @feed_items = Post.tagged_with(params[:tag]).paginate(page: params[:page], 
                                                                :per_page => 15)
    else
      @feed_items = Post.paginate(page: params[:page], per_page: 15)
    end 
  end

  def rules
  end
  
  def jobs
    
  end
end
