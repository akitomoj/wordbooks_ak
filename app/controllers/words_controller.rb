class WordsController < ApplicationController

  def index
    @word = Word.all
  end

  def new
    @word = Word.new
  end
  
end
