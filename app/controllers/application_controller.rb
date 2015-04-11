class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  before_filter :post_builder

  def post_builder
    @post = current_user.posts.build if logged_in?
  end
  
  private
  
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please login."
      redirect_to login_url
    end
  end
end
