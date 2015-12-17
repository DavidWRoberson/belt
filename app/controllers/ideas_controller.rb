class IdeasController < ApplicationController
  def index
  	@user = User.find(session[:user_id])
    all_ideas = Idea.all
    liked_ideas = Idea.joins(:likes).group(:idea_id).order("count(likes.idea_id) DESC")
  	@ideas = Idea.all
  	@likes = Like.all
  end

  def create
  	@idea = Idea.new(idea_params)
    if @idea.save
      flash[:success] = 'Idea is online for the world to see.' 
      redirect_to :back
    else
      flash[:errors] = @idea.errors.full_messages 
      redirect_to :back
    end
  end

  def show
  	@user = User.find(session[:user_id])
  	@idea = Idea.find(params[:id])
  	@likes = Like.all
  end

  def destroy
  	Idea.find(params[:id]).destroy
  	redirect_to :back
  end

  private 

  def idea_params
    params.require(:idea).permit(:idea, :user_id)
  end
end
