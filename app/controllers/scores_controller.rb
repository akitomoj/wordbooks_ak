class ScoresController < ApplicationController
  before_action :display_wday


  def index
    
  end

  def new
    @word = current_user.words
  end

  private
    def score_params
      params.require(:score).permit(:test_score)
    end

    def correct_user
      redirect_to new_user_session_path unless user_signed_in?
      # redirect_to root_path if user_signed_in? && @word.users.exists?(id: current_user.id)
    end


  def display_wday
    @week_day = ["日", "月", "火", "水", "木", "金", "土"][Time.new.wday]
  end
end
