class WordsController < ApplicationController
  before_action :display_wday
  before_action :word_find, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @word = current_user.words
  end

  def new
    @word = Word.new
  end

  def create
    @word = current_user.words.create(word_params)
    if @word.save
      redirect_to '/words#index' 
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    @word.update(word_params)
    if @word.save
      redirect_to '/words#index' 
    else
      render :new
    end
  end

  def destroy
    if @word.users.exists?(id: current_user.id)
      @word.destroy
      redirect_to '/words#index' 
    else
      render :edit
    end
  end


  private
    def word_params
      params.require(:word).permit(:eng_word, :meaning)
    end

    def correct_user
      redirect_to new_user_session_path unless user_signed_in?
      redirect_to root_path if user_signed_in? && @word.users.exists?(id: current_user.id)
    end

    def word_find
      @word = Word.find(params[:id])
    end

    def display_wday
      @week_day = ["日", "月", "火", "水", "木", "金", "土"][Time.new.wday]
    end
end
