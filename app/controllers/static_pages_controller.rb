class StaticPagesController < ApplicationController
  def about
    @post = current_user.posts.build if logged_in?
  end

  def rules
  end
  
  def jobs
  end
end
