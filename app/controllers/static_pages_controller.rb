class StaticPagesController < ApplicationController
  def about
  end

  def home
    @feed_items = Post.all
  #  flash[:info] = "Welcome to dailydocket.org! 
  #  The most important and relevant news for the legal community."  
  end

  def rules
  end
  
  def jobs
  end
end
