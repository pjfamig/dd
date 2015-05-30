class OpinionsController < ApplicationController
  before_action :logged_in_user, only: :create
  
  def index
    @opinions = Opinion.all
  end

  def new
    @opinion = Opinion.new
  end

  def create
    @feed_items = Post.all
    @opinion = current_user.opinions.build(opinion_params)
    if @opinion.save
      flash[:success] = "Court decision added!"
      redirect_to @opinion
    else
      render 'static_pages/home'
    end
  end

  def show
    @opinion = Opinion.find(params[:id])
  end
  
  def edit
    @opinion = Opinion.find(params[:id])
  end
  
  def update
    @opinion = Opinion.find(params[:id])
    if @opinion.update_attributes(opinion_params)
      flash[:success] = "Court decision updated"
      redirect_to @opinion
    else
      render 'edit'
    end
  end
  
  private
  
    def opinion_params
      params.require(:opinion).permit(:name, :content)
    end
end
