class ScoresController < ApplicationController
  
  def index
    @week_day = ["日", "月", "火", "水", "木", "金", "土"][Time.new.wday]
  end
end
