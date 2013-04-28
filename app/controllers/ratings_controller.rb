class RatingsController < ApplicationController
  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(params[:rating])
    respond_to do |format|
      if @rating.save
        format.html  { redirect_to :back }

      end
    end
  end

end
