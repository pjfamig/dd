class StaticPagesController < ApplicationController
  def about
  end

  def home
    @feed_items = Post.all
  end

  def rules
  end
  
  def jobs
  end
end
