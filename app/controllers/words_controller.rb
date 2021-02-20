class WordsController < ApplicationController

  # before_action :word_find, only: [:edit]

  def index
    @word = current_user.words
  end

  def new
    @word = Word.new
  end

  def create
    @word = current_user.words.create(word_params)
    if @word.save
      flash[:notice] = "グループ登録が完了しました"
      redirect_to '/words#index' 
    else
      render :new
    end
  end


  private
    def word_params
      params.require(:word).permit(:eng_word, :meaning)
    end

    def correct_user
      redirect_to new_user_session_path unless user_signed_in?
      # redirect_to root_path if user_signed_in? && (current_user.id != @item.user_id)
    end
end

# def item_params
#   params.require(:item).permit(:image, :name, :detail, :category_id, :condition_id, :fee_burdened_id, :prefecture_id, :shipping_date_id, :price, :tag_name).merge(user_id: current_user.id)
# end



# def word_find
#   @item = Item.find(params[:id])
# end